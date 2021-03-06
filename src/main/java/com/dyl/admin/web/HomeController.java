package com.dyl.admin.web;

import com.dyl.admin.support.model.RespBody;
import com.dyl.admin.support.util.ImageUtil;
import com.dyl.admin.support.util.JacksonUtil;
import com.dyl.admin.web.guide.dto.SiteType;
import com.dyl.admin.web.guide.facade.SiteTypeJpa;
import com.dyl.admin.web.photo.dto.MemBody;
import com.dyl.admin.web.photo.dto.MemPhoto;
import com.dyl.admin.web.photo.dto.MemType;
import com.dyl.admin.web.photo.facade.MemBodyJpa;
import com.dyl.admin.web.photo.facade.MemPhotoJpa;
import com.dyl.admin.web.photo.facade.MemTypeJpa;
import com.dyl.admin.web.sys.dto.SysAsset;
import com.dyl.admin.web.sys.dto.SysUser;
import com.dyl.admin.web.sys.facade.SysAssetJpa;
import com.dyl.admin.web.sys.facade.SysUserJpa;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.core.env.Environment;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.persistence.criteria.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLConnection;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Description: HomeController
 * Author: DIYILIU
 * Update: 2018-08-26 16:45
 */

@Slf4j
@Controller
public class HomeController {

    @Resource
    private Environment environment;

    @Resource
    private SysAssetJpa sysAssetJpa;

    @Resource
    private SysUserJpa sysUserJpa;

    @Resource
    private SiteTypeJpa siteTypeJpa;

    @Resource
    private MemTypeJpa memTypeJpa;

    @Resource
    private MemPhotoJpa memPhotoJpa;

    @Resource
    private MemBodyJpa memBodyJpa;


    @GetMapping("/login")
    public String login() {

        return "login";
    }

    @PostMapping("/login")
    public String login(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");

        if (UnknownAccountException.class.getName().equals(exceptionClassName)
                || IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {

            redirectAttributes.addFlashAttribute("error", "用户名或密码错误");
            return "redirect:/login";
        } else if (ExcessiveAttemptsException.class.getName().equals(exceptionClassName)) {

            redirectAttributes.addFlashAttribute("error", "登录错误次数超限，请稍后再试！");
            return "redirect:/login";

        } else if (exceptionClassName != null) {
            redirectAttributes.addFlashAttribute("error", "登录异常：" + exceptionClassName);

            return "redirect:/login";
        }

        return "home";
    }

    @GetMapping("/logout")
    public String logout() {
        SecurityUtils.getSubject().logout();

        return "redirect:/login";
    }

    @GetMapping("/")
    public String index(Model model) {
        List<SiteType> siteTypes = siteTypeJpa.findAll(Sort.by("sort"));

        List<SiteType> typeList = siteTypes.stream().filter(t -> CollectionUtils.isNotEmpty(t.getSiteList())).collect(Collectors.toList());
        model.addAttribute("typeList", typeList);

        return "index";
    }


    @GetMapping("/console")
    public String index(HttpSession session) {
        SysAsset asset = sysAssetJpa.findByCode("index");
        session.setAttribute("active", asset);

        return "home";
    }

    @GetMapping("/console/{menu}")
    public String show(@PathVariable("menu") String menu, HttpServletRequest request,
                       @ModelAttribute("type") String type, @ModelAttribute("page") String page) {

        SysAsset asset = sysAssetJpa.findByController("console/" + menu);
        if (asset == null) {
            return "error/404";
        }
        String view = asset.getView();
        // 设置当前页
        request.getSession().setAttribute("active", asset);

        // 添加参数
        Map data = new HashMap();
        if (StringUtils.isNotEmpty(type)) {
            data.put("type", Integer.valueOf(type));
        }
        if (StringUtils.isNotEmpty(page)) {
            data.put("page", Integer.valueOf(page));
        }
        if (MapUtils.isNotEmpty(data)) {
            request.setAttribute("data", data);
        }

        return view;
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        session.removeAttribute("active");
        model.addAttribute("user", session.getAttribute("user"));

        return "profile";
    }

    @GetMapping("/image/{dir}/{name:.+}")
    public void showImage(@PathVariable("name") String name, @PathVariable("dir") String dir,
                          HttpServletResponse response) {
        String imagePath = "";
        if (dir.equalsIgnoreCase("user")) {
            imagePath = environment.getProperty("upload.user");
        } else if (dir.equalsIgnoreCase("photo")) {
            if (name.startsWith("full")) {
                imagePath = environment.getProperty("upload.photo");
            } else {
                imagePath = environment.getProperty("upload.photo") + "thumb" + File.separator;
            }
        } else if (dir.equalsIgnoreCase("guide")) {
            if ("unknown.png".equals(name)) {
                imagePath = environment.getProperty("upload.guide.unknown");
            } else {
                imagePath = environment.getProperty("upload.guide.icon");
            }
        }
        try {
            org.springframework.core.io.Resource imgRes = new UrlResource(imagePath + name);
            if (imgRes != null && imgRes.exists()) {
                response.setHeader("Content-Type", URLConnection.guessContentTypeFromName(imgRes.getFilename()));
                FileCopyUtils.copy(imgRes.getInputStream(), response.getOutputStream());
                response.flushBuffer();
            }
        } catch (IOException e) {
            log.info("Error writing file to output stream. Filename was '{}'", name, e);
            throw new RuntimeException("IOError writing file to output stream");
        }
    }

    @ResponseBody
    @PostMapping("/image/user")
    public Map userIcon(MultipartFile file, HttpServletRequest request) throws Exception {
        Map respMap = new HashMap();
        if (file.isEmpty()) {
            respMap.put("status", 0);

            return respMap;
        }

        String data = request.getParameter("data");
        Map dataMap = JacksonUtil.toObject(data, HashMap.class);
        String fileName = (String) dataMap.get("name");

        String picDir = environment.getProperty("upload.user");
        org.springframework.core.io.Resource resDir = new UrlResource(picDir);
        // 创建临时文件
        File tempFile = File.createTempFile("icon", fileName.substring(fileName.lastIndexOf(".")).toLowerCase(), resDir.getFile());
        FileCopyUtils.copy(file.getBytes(), tempFile);
        // 剪切图片
        cutPic(tempFile.getPath(), dataMap);

        String username = (String) SecurityUtils.getSubject().getPrincipal();
        SysUser user = sysUserJpa.findByUsername(username);
        // 历史图片
        String oldIcon = user.getUserIcon();

        user.setUserIcon(tempFile.getName());
        user = sysUserJpa.save(user);
        if (user == null) {
            respMap.put("status", 0);

            return respMap;
        }

        // 删除文件
        if (StringUtils.isNotEmpty(oldIcon)) {
            org.springframework.core.io.Resource localRes = new UrlResource(picDir + oldIcon);
            if (localRes.exists()) {
                if (!localRes.getFile().delete()) {
                    System.err.println("删除文件失败!");
                }
            }
        }

        // 更新session
        request.getSession().setAttribute("user", user);

        respMap.put("status", 1);
        respMap.put("path", user.getUserIcon());

        return respMap;
    }


    @PostMapping("/console/preview/{type}/{page}")
    public String preview(@PathVariable int type, @PathVariable int page,
                          RedirectAttributes redirectAttributes) {

        redirectAttributes.addFlashAttribute("type", type);
        redirectAttributes.addFlashAttribute("page", page);

        return "redirect:/console/preview";
    }


    @GetMapping("/guest")
    public String guest(Model model) {
        MemType memType = memTypeJpa.findByName("公开");

        List<MemBody> bodyPage = memBodyJpa.findAll(
                (Root<MemBody> root, CriteriaQuery<?> query, CriteriaBuilder cb) -> {
                    Path<String> photosExp = root.get("photos");
                    Path<MemType> typeExp = root.get("memType");

                    List<Predicate> list = new ArrayList();
                    Predicate predicate = cb.and(photosExp.isNotNull());
                    list.add(predicate);

                    predicate = cb.equal(typeExp, memType);
                    list.add(predicate);

                    Predicate[] predicates = list.toArray(new Predicate[]{});
                    return cb.and(predicates);
                }, Sort.by(Sort.Direction.DESC, new String[]{"day", "createTime"}));

        List<MemPhoto> photoList = new ArrayList();
        bodyPage.forEach(e -> {
            String children = e.getPhotos();
            String[] strArray = children.split(",");
            if (strArray.length > 0) {
                Long[] ids = (Long[]) ConvertUtils.convert(strArray, Long.class);
                List list = memPhotoJpa.findByIdIn(ids);
                if (CollectionUtils.isNotEmpty(list)) {
                    photoList.addAll(list);
                }
            }
        });

        int half = photoList.size() / 2;
        List<MemPhoto> photos1 = photoList.subList(0, half);
        List<MemPhoto> photos2 = photoList.subList(half, photoList.size());
        model.addAttribute("photos1", photos1);
        model.addAttribute("photos2", photos2);

        return "guest/picWall";
    }


    /**
     * 图片裁切, 缩放
     *
     * @param imagePath
     * @param data
     */
    private void cutPic(String imagePath, Map data) throws Exception {
        int x = new BigDecimal(String.valueOf(data.get("x"))).intValue();
        int y = new BigDecimal(String.valueOf(data.get("y"))).intValue();
        int w = new BigDecimal(String.valueOf(data.get("width"))).intValue();
        int h = new BigDecimal(String.valueOf(data.get("height"))).intValue();

        // 裁切
        ImageUtil.crop(imagePath, x, y, w, h, imagePath);
        // 缩放
        ImageUtil.scale(imagePath, 256, 256, imagePath);
    }

    @ResponseBody
    @PostMapping("/image/upload")
    public RespBody imgUpload(MultipartFile file, HttpSession session) throws Exception {
        RespBody respBody = new RespBody();

        String date = String.format("%1$tY%1$tm", new Date());
        String picDir = environment.getProperty("upload.pic") + date + "/";
        org.springframework.core.io.Resource resDir = new UrlResource(picDir);
        if (!resDir.getFile().exists()) {
            resDir.getFile().mkdir();
        }

        String fileName = file.getOriginalFilename();
        // 创建临时文件
        File tempFile = File.createTempFile("pic", fileName.substring(fileName.lastIndexOf(".")).toLowerCase(), resDir.getFile());
        FileCopyUtils.copy(file.getBytes(), tempFile);

        String picName = date + "/" + tempFile.getName();
        List<String> pictures = (List<String>) session.getAttribute("temp_pic");
        if (pictures == null) {
            pictures = new ArrayList();
            session.setAttribute("temp_pic", pictures);
        }
        pictures.add(picName);

        String picPath = "/image/pic/" + picName;
        respBody.setStatus(1);
        respBody.setMsg(picPath);

        return respBody;
    }

    @ResponseBody
    @GetMapping("/image/pic/{date}/{name:.+}")
    public ResponseEntity showPicture(@PathVariable("name") String name, @PathVariable("date") String date) throws Exception {
        String imagePath = environment.getProperty("upload.pic") + "/" + date + "/" + name;
        org.springframework.core.io.Resource imgRes = new UrlResource(imagePath);

        return ResponseEntity.ok(FileUtils.readFileToByteArray(imgRes.getFile()));
    }
}
