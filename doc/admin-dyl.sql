/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : admin-dyl

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-10-20 16:19:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dev_deploy
-- ----------------------------
DROP TABLE IF EXISTS `dev_deploy`;
CREATE TABLE `dev_deploy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL COMMENT '节点',
  `type` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `dir` varchar(200) DEFAULT NULL,
  `jar_file` varchar(100) DEFAULT NULL COMMENT '路径',
  `args` varchar(50) DEFAULT NULL COMMENT '参数',
  `status` varchar(255) DEFAULT NULL,
  `uptime` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='程序部署';

-- ----------------------------
-- Records of dev_deploy
-- ----------------------------

-- ----------------------------
-- Table structure for dev_manifest
-- ----------------------------
DROP TABLE IF EXISTS `dev_manifest`;
CREATE TABLE `dev_manifest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `os` varchar(20) DEFAULT NULL COMMENT '操作系统',
  `host` varchar(50) DEFAULT NULL COMMENT '主机',
  `net_no` varchar(5) DEFAULT NULL COMMENT '编号',
  `user` varchar(50) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `tag` varchar(200) DEFAULT NULL COMMENT '标签',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='清单';

-- ----------------------------
-- Records of dev_manifest
-- ----------------------------

-- ----------------------------
-- Table structure for dev_node
-- ----------------------------
DROP TABLE IF EXISTS `dev_node`;
CREATE TABLE `dev_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `os` varchar(20) DEFAULT NULL COMMENT '系统',
  `cpu_core` int(11) DEFAULT NULL COMMENT 'CPU核心数',
  `memory_size` int(11) DEFAULT NULL COMMENT '内存空间(GB)',
  `disk_size` int(11) DEFAULT NULL COMMENT '磁盘空间(GB',
  `host` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `port` int(11) DEFAULT NULL COMMENT '登录端口',
  `user` varchar(50) DEFAULT NULL COMMENT '登录用户',
  `pwd` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `path` varchar(200) DEFAULT NULL,
  `check_on` int(11) DEFAULT NULL COMMENT '开启监控',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='集群节点';

-- ----------------------------
-- Records of dev_node
-- ----------------------------

-- ----------------------------
-- Table structure for dev_node_status
-- ----------------------------
DROP TABLE IF EXISTS `dev_node_status`;
CREATE TABLE `dev_node_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(50) DEFAULT NULL,
  `cpu_usage` int(11) DEFAULT NULL,
  `memory_usage` int(11) DEFAULT NULL,
  `process_info` longtext,
  `disk_info` longtext,
  `status` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='节点实时状态信息';

-- ----------------------------
-- Records of dev_node_status
-- ----------------------------

-- ----------------------------
-- Table structure for guide_site
-- ----------------------------
DROP TABLE IF EXISTS `guide_site`;
CREATE TABLE `guide_site` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `IMAGE` varchar(200) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='网站地址';

-- ----------------------------
-- Records of guide_site
-- ----------------------------
INSERT INTO `guide_site` VALUES ('98', '网易课堂', 'study.163.com', 'icon6913048374137169941.png', '4', '网易在线课程', '1', '2018-05-16 22:10:35');
INSERT INTO `guide_site` VALUES ('101', '网络电子课程', 'yeybk.xzkfq.cn', 'unknown.png', '34', '在线备课(宋老师)', '2', '2018-05-16 22:42:43');
INSERT INTO `guide_site` VALUES ('102', '百度', 'www.baidu.com', 'icon4847216020769285621.png', '29', '百度一下', '1', '2018-05-17 20:47:31');
INSERT INTO `guide_site` VALUES ('103', '淘宝', 'www.taobao.com', 'icon6961302624607474104.png', '30', '淘宝购物', '1', '2018-05-17 20:48:31');
INSERT INTO `guide_site` VALUES ('104', '京东', 'www.jd.com', 'icon2478977191638425815.png', '30', '京东商城', '2', '2018-05-18 15:42:47');
INSERT INTO `guide_site` VALUES ('105', '开源中国', 'www.oschina.net', 'icon1277877172443504134.png', '33', '开源中国社区', '1', '2018-05-19 22:19:59');
INSERT INTO `guide_site` VALUES ('108', 'GitHub', 'github.com', 'icon1980162427419300092.png', '33', '代码托管中心', '2', '2018-05-19 23:53:56');
INSERT INTO `guide_site` VALUES ('109', 'Collect UI', 'www.collectui.com', 'icon8758936578823090736.png', '31', 'Collect UI', '4', '2018-05-19 23:54:32');
INSERT INTO `guide_site` VALUES ('110', '优设', 'www.uisdc.com', 'unknown.png', '31', '优设', '2', '2018-05-19 23:55:54');
INSERT INTO `guide_site` VALUES ('112', '追波', 'dribbble.com', 'icon4758864900014274635.png', '31', '设计师创意作品', '3', '2018-05-19 23:57:38');
INSERT INTO `guide_site` VALUES ('113', '站酷', 'www.zcool.com.cn', 'icon2335670426781082746.png', '31', '设计师互动平台', '1', '2018-05-21 09:01:50');
INSERT INTO `guide_site` VALUES ('114', '用友OA', '218.94.153.148:8888/seeyon/index.jsp', 'unknown.png', '34', '天泽OA', '3', '2018-05-21 10:52:31');
INSERT INTO `guide_site` VALUES ('115', 'MVN仓库', 'mvnrepository.com', 'unknown.png', '35', 'Maven Repository', '1', '2018-05-23 14:05:17');
INSERT INTO `guide_site` VALUES ('116', 'html模板', 'templated.co', 'icon4937138979905354104.png', '36', '', '3', '2018-05-28 23:33:45');
INSERT INTO `guide_site` VALUES ('117', 'one page', 'onepagelove.com', 'unknown.png', '36', '单页模版', '2', '2018-05-28 23:34:14');
INSERT INTO `guide_site` VALUES ('118', '禅道', '192.168.1.52:9999/zentao', 'unknown.png', '34', '内网项目管理', '4', '2018-05-30 15:29:15');
INSERT INTO `guide_site` VALUES ('119', '用友NC', '218.94.153.148:666/hrss/login.jsp', 'unknown.png', '34', '薪资管理', '5', '2018-06-04 09:09:32');
INSERT INTO `guide_site` VALUES ('120', 'Colorlib', 'colorlib.com', 'unknown.png', '36', '免费网站模板', '1', '2018-06-13 10:02:54');
INSERT INTO `guide_site` VALUES ('121', '悬笔e绝', 'www.xuanbiyijue.com', 'icon6470490984486409721.png', '37', '悬笔e绝 个人博客', '1', '2018-06-14 15:51:35');
INSERT INTO `guide_site` VALUES ('122', '绩效', '218.94.153.148:100', 'unknown.png', '34', '天泽绩效', '6', '2018-06-20 16:35:43');
INSERT INTO `guide_site` VALUES ('123', '基站定位接口', 'www.cellocation.com/interfac', 'unknown.png', '35', 'LBS数据仓库', '3', '2018-07-06 16:57:43');
INSERT INTO `guide_site` VALUES ('124', 'thinkrace', 'www.thinkrace.com', 'unknown.png', '35', '智能设备', '5', '2018-07-09 23:12:50');
INSERT INTO `guide_site` VALUES ('125', '哈哈max', 'www.haha.mx', 'icon3924112112093172094.png', '33', '搞笑那点儿事', '4', '2018-07-11 08:58:49');
INSERT INTO `guide_site` VALUES ('126', '经纬度查询', 'www.gpsspg.com/maps.htm', 'icon7781571856844894725.png', '35', '经纬度地图', '4', '2018-07-16 17:04:55');
INSERT INTO `guide_site` VALUES ('127', 'icons8', 'icons8.com', 'unknown.png', '31', 'Free Flat Icons免费图标', '5', '2018-07-21 21:48:39');
INSERT INTO `guide_site` VALUES ('129', ' SVG icons', 'www.iconfinder.com', 'icon5566927916572449782.png', '31', '图标库', '6', '2018-07-21 21:50:58');
INSERT INTO `guide_site` VALUES ('130', 'html5', 'html5up.net', 'unknown.png', '36', 'html5响应式模版', '5', '2018-07-24 14:51:02');
INSERT INTO `guide_site` VALUES ('131', 'CSDN', 'www.csdn.net', 'icon1538902782487695558.png', '33', 'IT技术社区', '3', '2018-07-25 14:27:29');
INSERT INTO `guide_site` VALUES ('132', 'CSS Winner', 'www.csswinner.com', 'icon3704146882469737955.png', '36', '样板网站', '6', '2018-07-25 15:47:19');
INSERT INTO `guide_site` VALUES ('134', 'WrapPixel', 'wrappixel.com', 'unknown.png', '36', 'Bootstrap Admin ', '4', '2018-08-22 09:19:54');
INSERT INTO `guide_site` VALUES ('135', '格式转换', 'cn.office-converter.com', 'unknown.png', '35', '在线格式转换', '2', '2018-09-26 16:06:46');
INSERT INTO `guide_site` VALUES ('137', '恒源监控平台', '58.218.48.238:2680', 'unknown.png', '34', '', '1', '2018-10-18 20:02:24');
INSERT INTO `guide_site` VALUES ('138', '网赚兼职', 'wzjzapp.com', 'icon228655990908525230.png', '38', '从月入3000到月入10万', '20', '2018-10-19 23:25:38');
INSERT INTO `guide_site` VALUES ('139', '爱站', 'www.aizhan.com', 'icon4143416595776024217.png', '38', '爱站网,  站长工具', '10', '2018-10-19 23:27:36');
INSERT INTO `guide_site` VALUES ('140', '站长之家', 'tool.chinaz.com', 'icon216806728306154776.png', '38', '站长工具，站长之家', '5', '2018-10-19 23:28:34');

-- ----------------------------
-- Table structure for guide_type
-- ----------------------------
DROP TABLE IF EXISTS `guide_type`;
CREATE TABLE `guide_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(5) DEFAULT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='网址类型';

-- ----------------------------
-- Records of guide_type
-- ----------------------------
INSERT INTO `guide_type` VALUES ('4', null, '教程', '6');
INSERT INTO `guide_type` VALUES ('29', null, '综合', '1');
INSERT INTO `guide_type` VALUES ('30', null, '购物', '9');
INSERT INTO `guide_type` VALUES ('31', null, '设计', '7');
INSERT INTO `guide_type` VALUES ('33', null, '社区', '2');
INSERT INTO `guide_type` VALUES ('34', null, '办公', '10');
INSERT INTO `guide_type` VALUES ('35', null, 'IT', '3');
INSERT INTO `guide_type` VALUES ('36', null, 'HTML', '5');
INSERT INTO `guide_type` VALUES ('37', null, '博客', '8');
INSERT INTO `guide_type` VALUES ('38', null, 'SEO', '4');

-- ----------------------------
-- Table structure for mem_body
-- ----------------------------
DROP TABLE IF EXISTS `mem_body`;
CREATE TABLE `mem_body` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `day` date DEFAULT NULL COMMENT '时间',
  `subject` varchar(300) DEFAULT NULL COMMENT '主题',
  `content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `photos` varchar(1000) DEFAULT NULL COMMENT '照片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='概要';

-- ----------------------------
-- Records of mem_body
-- ----------------------------
INSERT INTO `mem_body` VALUES ('91', '1', '2018-10-20', '睡着了', '', null, '2018-10-20 11:47:35', 'admin');
INSERT INTO `mem_body` VALUES ('92', '1', '2018-10-20', '', '', null, '2018-10-20 11:58:33', 'admin');

-- ----------------------------
-- Table structure for mem_photo
-- ----------------------------
DROP TABLE IF EXISTS `mem_photo`;
CREATE TABLE `mem_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `full` varchar(100) DEFAULT NULL COMMENT '路径',
  `thumb` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COMMENT='照片';

-- ----------------------------
-- Records of mem_photo
-- ----------------------------

-- ----------------------------
-- Table structure for mem_type
-- ----------------------------
DROP TABLE IF EXISTS `mem_type`;
CREATE TABLE `mem_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `note` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='类型';

-- ----------------------------
-- Records of mem_type
-- ----------------------------
INSERT INTO `mem_type` VALUES ('1', '亲子', '', '1');
INSERT INTO `mem_type` VALUES ('2', '旅行', '', '2');
INSERT INTO `mem_type` VALUES ('3', '公开', '', '3');

-- ----------------------------
-- Table structure for rel_user_role
-- ----------------------------
DROP TABLE IF EXISTS `rel_user_role`;
CREATE TABLE `rel_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_user_role
-- ----------------------------
INSERT INTO `rel_user_role` VALUES ('35', '1', '1');
INSERT INTO `rel_user_role` VALUES ('42', '27', '17');
INSERT INTO `rel_user_role` VALUES ('39', '27', '16');
INSERT INTO `rel_user_role` VALUES ('27', '25', '15');

-- ----------------------------
-- Table structure for sys_asset
-- ----------------------------
DROP TABLE IF EXISTS `sys_asset`;
CREATE TABLE `sys_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `code` varchar(50) DEFAULT NULL COMMENT '资源代码',
  `pid` int(11) DEFAULT NULL COMMENT '父ID',
  `pids` varchar(80) DEFAULT NULL COMMENT '父节组ID',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `controller` varchar(100) DEFAULT NULL COMMENT '控制器',
  `view` varchar(100) DEFAULT NULL COMMENT '视图',
  `icon_css` varchar(100) DEFAULT NULL COMMENT '图标css',
  `is_menu` int(11) DEFAULT NULL COMMENT '是否菜单',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='系统资源';

-- ----------------------------
-- Records of sys_asset
-- ----------------------------
INSERT INTO `sys_asset` VALUES ('1', '首页', 'index', '0', '0', 'menu', '', '', 'mdi-home', '1', '1');
INSERT INTO `sys_asset` VALUES ('34', '程序清单', 'manifest', '39', '0/39', 'menu', 'console/manifest', 'devops/manifest', '', '1', '30');
INSERT INTO `sys_asset` VALUES ('5', '系统管理', 'sys', '0', '0', 'node', '', '', 'mdi-settings', '1', '100');
INSERT INTO `sys_asset` VALUES ('6', '用户管理', 'user', '5', '0/5', 'menu', 'console/user', 'sys/user', null, '1', '5');
INSERT INTO `sys_asset` VALUES ('7', '角色管理', 'role', '5', '0/5', 'menu', 'console/role', 'sys/role', null, '1', '10');
INSERT INTO `sys_asset` VALUES ('8', '菜单管理', 'menu', '5', '0/5', 'menu', 'console/menu', 'sys/menu', null, '1', '15');
INSERT INTO `sys_asset` VALUES ('39', '运维管理', 'devops', '0', '0', 'node', '', '', 'mdi-lan-connect', '1', '50');
INSERT INTO `sys_asset` VALUES ('43', '集群管理', 'cluster', '0', '0', 'node', '', '', 'mdi-sitemap', '1', '30');
INSERT INTO `sys_asset` VALUES ('44', '节点管理', 'node', '43', '0/43', 'menu', 'console/node', 'devops/node', '', '1', '10');
INSERT INTO `sys_asset` VALUES ('45', '节点状态', 'monitor', '43', '0/43', 'menu', 'console/monitor', 'devops/monitor', '', '1', '20');
INSERT INTO `sys_asset` VALUES ('46', '接入管理', 'deploy', '0', '0', 'node', '', '', 'mdi-power-plug', '1', '20');
INSERT INTO `sys_asset` VALUES ('47', '常规任务', 'normal', '46', '0/46', 'menu', 'console/deploy.1', 'deploy/normal', '', '1', '5');
INSERT INTO `sys_asset` VALUES ('36', '相册管理', 'photo', '0', '0', 'node', '', '', 'mdi-image-album', '1', '80');
INSERT INTO `sys_asset` VALUES ('37', '图片上传', 'upload', '36', '0/36', 'menu', 'console/upload', 'photo/upload', '', '1', '5');
INSERT INTO `sys_asset` VALUES ('38', '图库预览', 'preview', '36', '0/36', 'menu', 'console/preview', 'photo/preview', '', '1', '10');
INSERT INTO `sys_asset` VALUES ('40', '导航管理', 'guide', '0', '0', 'node', '', '', 'mdi-navigation', '1', '70');
INSERT INTO `sys_asset` VALUES ('41', '网址排序', 'sort', '40', '0/40', 'menu', 'console/guide.2', 'guide/sort', '', '1', '30');
INSERT INTO `sys_asset` VALUES ('42', '网址导航', 'site', '40', '0/40', 'menu', 'console/guide.1', 'guide/site', '', '1', '5');

-- ----------------------------
-- Table structure for sys_privilege
-- ----------------------------
DROP TABLE IF EXISTS `sys_privilege`;
CREATE TABLE `sys_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `master` varchar(50) DEFAULT NULL,
  `master_value` varchar(100) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `access_value` varchar(200) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=340 DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Records of sys_privilege
-- ----------------------------
INSERT INTO `sys_privilege` VALUES ('252', 'role', '17', 'menu', '33', 'home:deploy', null);
INSERT INTO `sys_privilege` VALUES ('335', 'role', '1', 'menu', '41', 'guide:sort', null);
INSERT INTO `sys_privilege` VALUES ('253', 'role', '17', 'menu', '34', 'home:manifest', null);
INSERT INTO `sys_privilege` VALUES ('336', 'role', '1', 'menu', '42', 'guide:site', null);
INSERT INTO `sys_privilege` VALUES ('334', 'role', '1', 'menu', '34', 'devops:manifest', null);
INSERT INTO `sys_privilege` VALUES ('333', 'role', '1', 'menu', '38', 'photo:preview', null);
INSERT INTO `sys_privilege` VALUES ('332', 'role', '1', 'menu', '37', 'photo:upload', null);
INSERT INTO `sys_privilege` VALUES ('251', 'role', '17', 'menu', '1', 'home:index', null);
INSERT INTO `sys_privilege` VALUES ('331', 'role', '1', 'menu', '8', 'sys:menu', null);
INSERT INTO `sys_privilege` VALUES ('330', 'role', '1', 'menu', '7', 'sys:role', null);
INSERT INTO `sys_privilege` VALUES ('329', 'role', '1', 'menu', '6', 'sys:user', null);
INSERT INTO `sys_privilege` VALUES ('328', 'role', '1', 'menu', '1', 'home:index', null);
INSERT INTO `sys_privilege` VALUES ('337', 'role', '1', 'menu', '44', 'cluster:node', null);
INSERT INTO `sys_privilege` VALUES ('338', 'role', '1', 'menu', '45', 'cluster:monitor', null);
INSERT INTO `sys_privilege` VALUES ('339', 'role', '1', 'menu', '47', 'deploy:normal', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `code` varchar(30) DEFAULT NULL COMMENT '角色代码',
  `comment` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', null, '管理员角色', 'admin', '管理员角色', 'admin', '2018-09-16 00:24:55');
INSERT INTO `sys_role` VALUES ('17', null, '测试角色', 'test', '测试角色', 'admin', '2018-09-16 13:39:58');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(80) DEFAULT NULL COMMENT '登录密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '盐',
  `name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `org_id` int(11) DEFAULT NULL COMMENT '用户所属机构',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `status` int(11) DEFAULT NULL COMMENT '用户状态',
  `user_icon` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `login_count` int(11) DEFAULT NULL COMMENT '登陆次数',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'b722097ee08ea4c20eae7958639c839e', 'b9f1d5d2b65231cd016e6d84979f7078', '管理员', '87166669@dyl.com', '18086776731', null, null, null, null, 'icon2968025534378140610.jpg', '积极进取，持之以恒。', '2020-05-20 00:00:00', '1176', '0:0:0:0:0:0:0:1', '2018-10-20 12:15:01');
INSERT INTO `sys_user` VALUES ('27', 'test', '8d1e533914f577ec50f478973fcd7245', 'dd06bb22476ddb60057daf36ba5ffe58', '测试', '88776699@qq.com', '88776699', null, '2018-09-13 14:11:29', 'admin', '1', 'icon8735320946401041351.jpg', null, '2019-09-12 14:11:19', '3', '0:0:0:0:0:0:0:1', '2018-10-18 13:30:10');
