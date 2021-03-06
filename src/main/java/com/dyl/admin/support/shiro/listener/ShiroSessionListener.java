package com.dyl.admin.support.shiro.listener;

import com.dyl.admin.web.photo.dto.MemPhoto;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;
import org.springframework.core.env.Environment;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Description: ShiroSessionListener
 * Author: DIYILIU
 * Update: 2018-09-20 09:42
 */

@Slf4j
@Component
public class ShiroSessionListener implements SessionListener {

    @Resource
    private Environment environment;


    @Override
    public void onStart(Session session) {

        //log.info("会话创建 ... ");
    }

    @Override
    public void onStop(Session session) {
        //log.info("会话退出 ... ");

        try {
            clearTemp(session);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onExpiration(Session session) {
        //log.info("会话过期 ... ");

        try {
            clearTemp(session);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void clearTemp(Session session) throws Exception {
        List<MemPhoto> photos = (List<MemPhoto>) session.getAttribute("temp_photo");

        if (CollectionUtils.isNotEmpty(photos)) {
            for (MemPhoto photo : photos) {
                String fullDir = environment.getProperty("upload.photo");
                String path = fullDir + photo.getFull();
                org.springframework.core.io.Resource res = new UrlResource(path);
                if (res.exists()) {
                    res.getFile().delete();
                    log.info("删除临时文件: [{}]", path);
                }
            }
        }

        List<String> pictures = (List<String>) session.getAttribute("temp_pic");
        if (CollectionUtils.isNotEmpty(pictures)) {
            for (String pic : pictures) {
                String picDir = environment.getProperty("upload.pic");
                String path = picDir + pic;
                org.springframework.core.io.Resource res = new UrlResource(path);
                if (res.exists()) {
                    res.getFile().delete();
                    log.info("删除临时文件: [{}]", path);
                }
            }
        }
    }
}
