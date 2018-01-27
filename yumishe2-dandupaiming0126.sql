/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost:3306
 Source Schema         : yumishe2-dandupaiming

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : 65001

 Date: 26/01/2018 23:52:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cmf_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_admin_menu`;
CREATE TABLE `cmf_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float unsigned NOT NULL DEFAULT '10000' COMMENT '排序ID',
  `app` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parent_id`),
  KEY `model` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='后台菜单表';

-- ----------------------------
-- Records of cmf_admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `cmf_admin_menu` VALUES (1, 0, 0, 0, 20, 'admin', 'Plugin', 'default', '', '插件管理', 'cloud', '插件管理');
INSERT INTO `cmf_admin_menu` VALUES (2, 1, 1, 1, 10000, 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `cmf_admin_menu` VALUES (3, 2, 1, 0, 10000, 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `cmf_admin_menu` VALUES (4, 2, 2, 0, 10000, 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `cmf_admin_menu` VALUES (5, 0, 0, 1, 0, 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO `cmf_admin_menu` VALUES (6, 5, 1, 1, 50, 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `cmf_admin_menu` VALUES (7, 6, 1, 0, 10000, 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO `cmf_admin_menu` VALUES (8, 6, 2, 0, 10000, 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO `cmf_admin_menu` VALUES (9, 6, 1, 0, 10000, 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO `cmf_admin_menu` VALUES (10, 6, 2, 0, 10000, 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO `cmf_admin_menu` VALUES (11, 6, 2, 0, 10000, 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO `cmf_admin_menu` VALUES (12, 6, 2, 0, 10000, 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO `cmf_admin_menu` VALUES (13, 6, 2, 0, 10000, 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `cmf_admin_menu` VALUES (14, 5, 1, 0, 10, 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `cmf_admin_menu` VALUES (15, 14, 2, 0, 10000, 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO `cmf_admin_menu` VALUES (16, 14, 1, 0, 10000, 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO `cmf_admin_menu` VALUES (17, 14, 2, 0, 10000, 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO `cmf_admin_menu` VALUES (18, 14, 1, 0, 10000, 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO `cmf_admin_menu` VALUES (19, 5, 1, 0, 10000, 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `cmf_admin_menu` VALUES (20, 19, 1, 0, 10000, 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `cmf_admin_menu` VALUES (21, 19, 1, 0, 10000, 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `cmf_admin_menu` VALUES (22, 19, 2, 0, 10000, 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `cmf_admin_menu` VALUES (23, 19, 1, 0, 10000, 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `cmf_admin_menu` VALUES (24, 19, 2, 0, 10000, 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES (25, 19, 2, 0, 10000, 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `cmf_admin_menu` VALUES (26, 19, 2, 0, 10000, 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `cmf_admin_menu` VALUES (27, 19, 1, 0, 10000, 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `cmf_admin_menu` VALUES (28, 5, 1, 1, 30, 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理');
INSERT INTO `cmf_admin_menu` VALUES (29, 28, 1, 0, 10000, 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO `cmf_admin_menu` VALUES (30, 28, 2, 0, 10000, 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `cmf_admin_menu` VALUES (31, 28, 1, 0, 10000, 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `cmf_admin_menu` VALUES (32, 28, 2, 0, 10000, 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `cmf_admin_menu` VALUES (33, 28, 2, 0, 10000, 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `cmf_admin_menu` VALUES (34, 28, 1, 0, 10000, 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `cmf_admin_menu` VALUES (35, 34, 1, 0, 10000, 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `cmf_admin_menu` VALUES (36, 34, 2, 0, 10000, 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `cmf_admin_menu` VALUES (37, 34, 1, 0, 10000, 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `cmf_admin_menu` VALUES (38, 34, 2, 0, 10000, 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `cmf_admin_menu` VALUES (39, 34, 2, 0, 10000, 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `cmf_admin_menu` VALUES (40, 34, 2, 0, 10000, 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `cmf_admin_menu` VALUES (41, 1, 1, 1, 10000, 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `cmf_admin_menu` VALUES (42, 41, 2, 0, 10000, 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `cmf_admin_menu` VALUES (43, 41, 1, 0, 10000, 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `cmf_admin_menu` VALUES (44, 41, 2, 0, 10000, 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `cmf_admin_menu` VALUES (45, 41, 2, 0, 10000, 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO `cmf_admin_menu` VALUES (46, 41, 2, 0, 10000, 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `cmf_admin_menu` VALUES (47, 41, 2, 0, 10000, 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `cmf_admin_menu` VALUES (48, 108, 0, 1, 10000, 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO `cmf_admin_menu` VALUES (49, 48, 1, 1, 10000, 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO `cmf_admin_menu` VALUES (50, 49, 1, 0, 10000, 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `cmf_admin_menu` VALUES (51, 49, 2, 0, 10000, 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `cmf_admin_menu` VALUES (52, 49, 1, 0, 10000, 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `cmf_admin_menu` VALUES (53, 49, 2, 0, 10000, 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `cmf_admin_menu` VALUES (54, 49, 2, 0, 10000, 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `cmf_admin_menu` VALUES (55, 49, 1, 0, 10000, 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `cmf_admin_menu` VALUES (56, 49, 2, 0, 10000, 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `cmf_admin_menu` VALUES (57, 0, 1, 0, 10000, 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `cmf_admin_menu` VALUES (58, 57, 2, 0, 10000, 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `cmf_admin_menu` VALUES (59, 57, 2, 0, 10000, 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `cmf_admin_menu` VALUES (60, 5, 1, 0, 10000, 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `cmf_admin_menu` VALUES (61, 60, 1, 0, 10000, 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `cmf_admin_menu` VALUES (62, 60, 2, 0, 10000, 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `cmf_admin_menu` VALUES (63, 60, 1, 0, 10000, 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `cmf_admin_menu` VALUES (64, 60, 2, 0, 10000, 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `cmf_admin_menu` VALUES (65, 60, 2, 0, 10000, 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `cmf_admin_menu` VALUES (66, 60, 2, 0, 10000, 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `cmf_admin_menu` VALUES (67, 60, 2, 0, 10000, 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `cmf_admin_menu` VALUES (68, 60, 2, 0, 10000, 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `cmf_admin_menu` VALUES (69, 60, 1, 0, 10000, 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO `cmf_admin_menu` VALUES (70, 5, 1, 1, 0, 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `cmf_admin_menu` VALUES (71, 70, 2, 0, 10000, 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `cmf_admin_menu` VALUES (72, 5, 1, 0, 10000, 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `cmf_admin_menu` VALUES (73, 72, 2, 0, 10000, 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `cmf_admin_menu` VALUES (74, 5, 1, 0, 10000, 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `cmf_admin_menu` VALUES (75, 74, 2, 0, 10000, 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `cmf_admin_menu` VALUES (76, 5, 1, 0, 10000, 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `cmf_admin_menu` VALUES (77, 5, 1, 1, 40, 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO `cmf_admin_menu` VALUES (78, 77, 1, 0, 10000, 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `cmf_admin_menu` VALUES (79, 77, 2, 0, 10000, 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES (80, 77, 1, 0, 10000, 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `cmf_admin_menu` VALUES (81, 77, 2, 0, 10000, 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES (82, 77, 2, 0, 10000, 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `cmf_admin_menu` VALUES (83, 77, 1, 0, 10000, 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `cmf_admin_menu` VALUES (84, 83, 1, 0, 10000, 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `cmf_admin_menu` VALUES (85, 83, 2, 0, 10000, 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `cmf_admin_menu` VALUES (86, 83, 1, 0, 10000, 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `cmf_admin_menu` VALUES (87, 83, 2, 0, 10000, 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `cmf_admin_menu` VALUES (88, 83, 2, 0, 10000, 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `cmf_admin_menu` VALUES (89, 83, 2, 0, 10000, 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `cmf_admin_menu` VALUES (90, 83, 2, 0, 10000, 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `cmf_admin_menu` VALUES (91, 83, 2, 0, 10000, 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `cmf_admin_menu` VALUES (92, 5, 1, 0, 10000, 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `cmf_admin_menu` VALUES (93, 92, 2, 0, 10000, 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `cmf_admin_menu` VALUES (94, 5, 1, 1, 20, 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO `cmf_admin_menu` VALUES (95, 94, 1, 0, 10000, 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO `cmf_admin_menu` VALUES (96, 94, 2, 0, 10000, 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `cmf_admin_menu` VALUES (97, 94, 2, 0, 10000, 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `cmf_admin_menu` VALUES (98, 94, 2, 0, 10000, 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO `cmf_admin_menu` VALUES (99, 94, 2, 0, 10000, 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO `cmf_admin_menu` VALUES (100, 94, 1, 0, 10000, 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `cmf_admin_menu` VALUES (101, 94, 1, 0, 10000, 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `cmf_admin_menu` VALUES (102, 94, 1, 0, 10000, 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `cmf_admin_menu` VALUES (103, 94, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `cmf_admin_menu` VALUES (104, 94, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES (105, 94, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `cmf_admin_menu` VALUES (106, 94, 2, 0, 10000, 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES (107, 94, 1, 0, 10000, 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `cmf_admin_menu` VALUES (108, 0, 0, 1, 10, 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO `cmf_admin_menu` VALUES (109, 48, 1, 1, 10000, 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO `cmf_admin_menu` VALUES (110, 109, 1, 0, 10000, 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `cmf_admin_menu` VALUES (111, 109, 2, 0, 10000, 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `cmf_admin_menu` VALUES (112, 109, 1, 0, 10000, 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `cmf_admin_menu` VALUES (113, 109, 2, 0, 10000, 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `cmf_admin_menu` VALUES (114, 109, 1, 0, 10000, 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `cmf_admin_menu` VALUES (115, 109, 2, 0, 10000, 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `cmf_admin_menu` VALUES (116, 109, 2, 0, 10000, 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `cmf_admin_menu` VALUES (117, 109, 2, 0, 10000, 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `cmf_admin_menu` VALUES (118, 109, 2, 0, 10000, 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `cmf_admin_menu` VALUES (119, 0, 0, 0, 30, 'portal', 'AdminIndex', 'default', '', '文章管理', 'th', '门户管理');
INSERT INTO `cmf_admin_menu` VALUES (120, 119, 1, 1, 10000, 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表');
INSERT INTO `cmf_admin_menu` VALUES (121, 120, 1, 0, 10000, 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO `cmf_admin_menu` VALUES (122, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO `cmf_admin_menu` VALUES (123, 120, 1, 0, 10000, 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO `cmf_admin_menu` VALUES (124, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO `cmf_admin_menu` VALUES (125, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO `cmf_admin_menu` VALUES (126, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO `cmf_admin_menu` VALUES (127, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO `cmf_admin_menu` VALUES (128, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO `cmf_admin_menu` VALUES (129, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO `cmf_admin_menu` VALUES (130, 119, 1, 1, 10000, 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO `cmf_admin_menu` VALUES (131, 130, 1, 0, 10000, 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO `cmf_admin_menu` VALUES (132, 130, 2, 0, 10000, 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO `cmf_admin_menu` VALUES (133, 130, 1, 0, 10000, 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO `cmf_admin_menu` VALUES (134, 130, 2, 0, 10000, 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO `cmf_admin_menu` VALUES (135, 130, 1, 0, 10000, 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO `cmf_admin_menu` VALUES (136, 130, 2, 0, 10000, 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO `cmf_admin_menu` VALUES (137, 130, 2, 0, 10000, 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO `cmf_admin_menu` VALUES (138, 119, 1, 1, 10000, 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `cmf_admin_menu` VALUES (139, 138, 1, 0, 10000, 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `cmf_admin_menu` VALUES (140, 138, 2, 0, 10000, 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `cmf_admin_menu` VALUES (141, 138, 1, 0, 10000, 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `cmf_admin_menu` VALUES (142, 138, 2, 0, 10000, 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `cmf_admin_menu` VALUES (143, 138, 2, 0, 10000, 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `cmf_admin_menu` VALUES (144, 119, 1, 1, 10000, 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO `cmf_admin_menu` VALUES (145, 144, 1, 0, 10000, 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO `cmf_admin_menu` VALUES (146, 144, 2, 0, 10000, 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO `cmf_admin_menu` VALUES (147, 144, 2, 0, 10000, 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `cmf_admin_menu` VALUES (148, 144, 2, 0, 10000, 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO `cmf_admin_menu` VALUES (149, 0, 1, 0, 10000, 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `cmf_admin_menu` VALUES (150, 149, 2, 0, 10000, 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `cmf_admin_menu` VALUES (151, 108, 0, 1, 10000, 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO `cmf_admin_menu` VALUES (152, 151, 1, 1, 10000, 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO `cmf_admin_menu` VALUES (153, 152, 2, 0, 10000, 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `cmf_admin_menu` VALUES (154, 152, 2, 0, 10000, 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `cmf_admin_menu` VALUES (155, 151, 1, 0, 10000, 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO `cmf_admin_menu` VALUES (156, 155, 2, 0, 10000, 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `cmf_admin_menu` VALUES (157, 0, 1, 1, 10000, 'user', 'AdminMoney', 'index', '', '充值消费管理', 'rmb', '');
INSERT INTO `cmf_admin_menu` VALUES (164, 0, 1, 1, 40, 'guanjianci', 'AdminIndex', 'default', '', '关键词任务管理', 'rocket', '');
INSERT INTO `cmf_admin_menu` VALUES (167, 0, 1, 1, 10000, 'host', 'AdminIndex', 'index', '', 'ADSL-VPS管理', 'desktop', '');
INSERT INTO `cmf_admin_menu` VALUES (168, 164, 1, 1, 42, 'baiducookie', 'AdminIndex', 'index', '', '百度cookie', 'key', '');
INSERT INTO `cmf_admin_menu` VALUES (169, 164, 1, 1, 41, 'guanjianci', 'AdminIndex', 'index', '', '关键词任务', '', '');
INSERT INTO `cmf_admin_menu` VALUES (170, 164, 1, 1, 43, 'guanjianci', 'AdminRizhi', 'index', '', '任务执行日志', '', '');
INSERT INTO `cmf_admin_menu` VALUES (174, 151, 1, 0, 10000, 'user', 'AdminGroup', 'index', '', '会员等级', '', '');
COMMIT;

-- ----------------------------
-- Table structure for cmf_asset
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='资源表';

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------
BEGIN;
INSERT INTO `cmf_asset` VALUES (1, 1, 91925, 1503048064, 1, 0, '70b5004694c210848e6aa90e6b17f8cd89f72d83956897b7bc1f64d5bdb0c5aa', '微信.jpg', 'portal/20170818/2b5e9b78910be59ab3255da41bad5d1b.jpg', '70b5004694c210848e6aa90e6b17f8cd', '760ef6b08cc12bc059af95ed869a31ce8b9b010d', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (2, 1, 5, 1503048675, 1, 0, '5d41402abc4b2a76b9719d911017c592e69d7e620e82be5eb414d1f8d1d4b9d9', 'hello.txt', 'default/20170818/7dc1d8c5c9c8a0b0f88ebd2d01505624.txt', '5d41402abc4b2a76b9719d911017c592', 'aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d', 'txt', NULL);
INSERT INTO `cmf_asset` VALUES (3, 1, 676, 1503109290, 1, 0, 'b1d4a25bdf4a7784c7ae8a70eb7c522f4193d43567ada2dc574551977e0d0493', '阿里蜘蛛池升级计划.txt', 'default/20170819/8687608579dfb714f19be5b9aaf4a73b.txt', 'b1d4a25bdf4a7784c7ae8a70eb7c522f', 'abe8e8246c800dc16396a34d3698dd08ba4f5f5b', 'txt', NULL);
INSERT INTO `cmf_asset` VALUES (4, 1, 230020, 1503110432, 1, 0, 'cd130b91b3a88528a215d61f74fac78fc1e96b8e9bb930c8a3fecc63095ffeb2', '1.txt', 'default/20170819/7275e1bc3c07e20dfb50d110b162f95b.txt', 'cd130b91b3a88528a215d61f74fac78f', '49fdcc8b20508ef4226417ffbb6ee884e8c32372', 'txt', NULL);
INSERT INTO `cmf_asset` VALUES (5, 11, 52312, 1506759528, 1, 0, '2bdc6243b0598bc69db4fb53fc58c1734df99f663ad3d0606a9abddb1c595fca', '插件后台.jpg', 'default/20170930/e9e371edc7d3cc64b52f2ad252cff870.jpg', '2bdc6243b0598bc69db4fb53fc58c173', '1977dfa0078b89cb5c0e681f0737d282adf6ed06', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (6, 1, 79204, 1507694318, 1, 0, 'b60e2a59ff422316f90a12a0b91fe3b0ec507b04cc3cd0d6d47a634c6eb2486f', '微信图片_20170629133706.png', 'default/20171011/d1fac8987ed0367e1960ba86a1392f6e.png', 'b60e2a59ff422316f90a12a0b91fe3b0', '450569439470f8dc537462bd8460c0998fbadd3b', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (7, 1, 329221, 1507791321, 1, 0, '7b27cc56b89dbfc1c193b31a88762047a2484f01e4defb1ee944453e2e1688e5', '111.jpg', 'admin/20171012/1fc7eaf6d1c70d9de87d16a45be6f58c.jpg', '7b27cc56b89dbfc1c193b31a88762047', '2ed6becbd3cac9106426da55ac18c7c9c9e66094', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (8, 1, 99962, 1507791449, 1, 0, '1318f0e423bf6c2624644288e7870fa4bc6947812a7a31d3259aedca2b052a9d', '1494984990506843460.jpg', 'admin/20171012/8fa00f2b6752c6da68014086c7ad4dec.jpg', '1318f0e423bf6c2624644288e7870fa4', 'd45ffec754b38f7c6eb6a0db530bca908e6c2b8f', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (9, 1, 507, 1508231222, 1, 0, '9ea13348295fe12060c987061d15877d7b6f2591ed2c50d1b24beb6a0b873ef9', '奥玛尼.txt', 'default/20171017/b702e8f587eaf4f1c796cd2f44a8bb62.txt', '9ea13348295fe12060c987061d15877d', 'e8eba88fb700180d84071692243d3eb15911dc2d', 'txt', NULL);
INSERT INTO `cmf_asset` VALUES (10, 40, 42, 1508381581, 1, 0, '715c4bf19910655cc248e199f455bbc423fd4de00c9f1fbf031b1c8425a1a71a', 't恤定制-答案.txt', 'default/20171019/c6baed39be63d7945c9a6a2bdb3415f3.txt', '715c4bf19910655cc248e199f455bbc4', '91eb219765c66a6bfa1cfc1b83b067c5eceebd74', 'txt', NULL);
INSERT INTO `cmf_asset` VALUES (11, 1, 687635, 1509326890, 1, 0, 'd8838314f7a34892abe3978df7f4210d5c9665086451dd62987a54696c0b4c1e', 'banner.jpg', 'admin/20171030/7c8568f38d68f4a196d94827cbb0f6e3.jpg', 'd8838314f7a34892abe3978df7f4210d', '529c2e722236f770ace1bf454500f574815520b8', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (12, 1, 668706, 1509327096, 1, 0, '5dbeea1537ac0b87d421122308d49046ab817cf762224667ebb055969adc88d5', 'banner.jpg', 'admin/20171030/ae328af8a4ef9925a9c9d1eaf54abf7b.jpg', '5dbeea1537ac0b87d421122308d49046', '8a488ace245cc0fe3446c7d7670b3229ac68be54', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (13, 11, 48723, 1515468463, 1, 0, '2f93513902eaf290e6f2a70b39a18e82e58450423711097bcedda6eae2fd399a', 'alishouquan.png', 'default/20180109/96291da980dfcffbb792ae4d2da0bc00.png', '2f93513902eaf290e6f2a70b39a18e82', 'e1734a88e5e3aad633f1822c24a9b29b4027c64c', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (14, 11, 91925, 1515469645, 1, 0, '70b5004694c210848e6aa90e6b17f8cd89f72d83956897b7bc1f64d5bdb0c5aa', '微信.jpg', 'default/20180109/b94cdf53ca308e01b4877bd6ec5439f7.jpg', '70b5004694c210848e6aa90e6b17f8cd', '760ef6b08cc12bc059af95ed869a31ce8b9b010d', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (15, 147, 616407, 1515479820, 1, 0, '6e71415a590d428de54365242492d47fbd9236a8929ec14b72043151741a35e3', '最新营业执照.jpg', 'default/20180109/4be9044a60425845ec1bd860705a4697.jpg', '6e71415a590d428de54365242492d47f', 'af751e8be435aae1c92d38d3bca6faef2febd208', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (16, 1, 48723, 1515480029, 1, 0, '2f93513902eaf290e6f2a70b39a18e82e58450423711097bcedda6eae2fd399a', 'alishouquan.png', 'user/20180109/b08717b119184b5bc9dbc30432bb50c7.png', '2f93513902eaf290e6f2a70b39a18e82', 'e1734a88e5e3aad633f1822c24a9b29b4027c64c', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (17, 1, 29353, 1515935262, 1, 0, '49275b98129855c0dbde3a2971334798b57b49c47f31a953b038208d7a04cb5f', 'QQ截图20171019203901.jpg', 'default/20180114/d7d11779cb52684e1dc8f2ce04ef5c11.jpg', '49275b98129855c0dbde3a2971334798', 'ec682dd2e9ad5f368d79a3890125349f1ba1bcaf', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (18, 171, 1941312, 1516013516, 1, 0, '4da31ee206101aab7ca33aafd5d39a64588e67c7c114b62869c0fb45a4afb5e3', 'D7B72271-662B-4FAF-BE1E-46B10F97CFCC.jpeg', 'default/20180115/2f1c17e359d6d0a743855c38797f3c49.jpeg', '4da31ee206101aab7ca33aafd5d39a64', 'ae7c3c91a91910a7c53bf87c643170b369577b5b', 'jpeg', NULL);
INSERT INTO `cmf_asset` VALUES (19, 1, 93765, 1516091871, 1, 0, '8ae1c8f099d277d2ecfda88f17ffa727a1966fc6bf046be1f904d41899c1e76f', '微信图片_20171113100308.png', 'user/20180116/95d34952b74a1d78d7dc19ed9009334e.png', '8ae1c8f099d277d2ecfda88f17ffa727', '96bd21712993e57419f3b86654cf2e30ed3b47db', 'png', NULL);
INSERT INTO `cmf_asset` VALUES (20, 177, 176190, 1516441421, 1, 0, '3119213a5cf601eaa37fcaea1855ba3a40d9217ac37ee29884010180131cf367', '营业执照副本.jpg', 'default/20180120/9efa8d5cc94641aade2d3647bbce77b6.jpg', '3119213a5cf601eaa37fcaea1855ba3a', '661b9591e14a18c39b93afd674c2d26a9646101f', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (21, 179, 219884, 1516692985, 1, 0, '50681575df2955cb786c2b89e8758a4f67dd05ca378ab25f2540778ef78bd9c4', '0%POC$G]0MXROAZBIQ}7Q)A.jpg', 'default/20180123/b246fdb5a51f25dcc3983ddc8b3a5271.jpg', '50681575df2955cb786c2b89e8758a4f', '73c4dd9af0782ec3706bedf7ff8acd06a598a5fa', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (22, 1, 120814, 1516790429, 1, 0, 'df719517a914fd3c0f72f91abb936775e5941ed67d9e00dd1d3db6f224e5fea6', '132606213105259236.jpg', 'user/20180124/99510aec8c75c96893ab0b497d475703.jpg', 'df719517a914fd3c0f72f91abb936775', '2bf9a6e6cfca19eb3a203ad1a86758cac1016b40', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (23, 27, 54128, 1516858885, 1, 0, '4cf13d7fbe48d767abec5abf14ef49fc31297b6b9034661c84587da6962c3058', '23400907478566304.jpg', 'default/20180125/e3acee7a2efa0fb81aca808c8c5ed6fd.jpg', '4cf13d7fbe48d767abec5abf14ef49fc', 'd76c5c02427507aa3691a57c5a9f617084ce0721', 'jpg', NULL);
INSERT INTO `cmf_asset` VALUES (24, 40, 558373, 1516935002, 1, 0, 'eaf4ac3c31da1723826600a42a216add46c812945b6f3c5299737249326215c2', '营业执照.jpg', 'default/20180126/3ef8c386fdbbd39ef02d63e1ee788e2a.jpg', 'eaf4ac3c31da1723826600a42a216add', 'd629bdb49043de0488215610b269f8dce25e8e7a', 'jpg', NULL);
COMMIT;

-- ----------------------------
-- Table structure for cmf_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限授权表';

-- ----------------------------
-- Records of cmf_auth_access
-- ----------------------------
BEGIN;
INSERT INTO `cmf_auth_access` VALUES (1, 2, 'admin/setting/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (2, 2, 'admin/setting/site', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (3, 2, 'admin/setting/sitepost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (4, 2, 'admin/mailer/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (5, 2, 'admin/mailer/indexpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (6, 2, 'admin/mailer/template', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (7, 2, 'admin/mailer/templatepost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (8, 2, 'admin/mailer/test', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (9, 2, 'admin/theme/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (10, 2, 'admin/theme/install', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (11, 2, 'admin/theme/uninstall', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (12, 2, 'admin/theme/installtheme', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (13, 2, 'admin/theme/update', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (14, 2, 'admin/theme/active', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (15, 2, 'admin/theme/files', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (16, 2, 'admin/theme/filesetting', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (17, 2, 'admin/theme/filearraydata', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (18, 2, 'admin/theme/filearraydataedit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (19, 2, 'admin/theme/filearraydataeditpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (20, 2, 'admin/theme/filearraydatadelete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (21, 2, 'admin/theme/settingpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (22, 2, 'admin/theme/datasource', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (23, 2, 'admin/nav/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (24, 2, 'admin/nav/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (25, 2, 'admin/nav/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (26, 2, 'admin/nav/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (27, 2, 'admin/nav/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (28, 2, 'admin/nav/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (29, 2, 'admin/navmenu/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (30, 2, 'admin/navmenu/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (31, 2, 'admin/navmenu/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (32, 2, 'admin/navmenu/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (33, 2, 'admin/navmenu/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (34, 2, 'admin/navmenu/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (35, 2, 'admin/navmenu/listorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (36, 2, 'admin/slide/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (37, 2, 'admin/slide/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (38, 2, 'admin/slide/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (39, 2, 'admin/slide/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (40, 2, 'admin/slide/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (41, 2, 'admin/slide/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (42, 2, 'admin/slideitem/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (43, 2, 'admin/slideitem/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (44, 2, 'admin/slideitem/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (45, 2, 'admin/slideitem/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (46, 2, 'admin/slideitem/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (47, 2, 'admin/slideitem/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (48, 2, 'admin/slideitem/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (49, 2, 'admin/slideitem/cancelban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (50, 2, 'admin/slideitem/listorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (51, 2, 'admin/link/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (52, 2, 'admin/link/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (53, 2, 'admin/link/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (54, 2, 'admin/link/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (55, 2, 'admin/link/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (56, 2, 'admin/link/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (57, 2, 'admin/link/listorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (58, 2, 'admin/link/toggle', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (59, 2, 'admin/menu/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (60, 2, 'admin/menu/lists', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (61, 2, 'admin/menu/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (62, 2, 'admin/menu/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (63, 2, 'admin/menu/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (64, 2, 'admin/menu/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (65, 2, 'admin/menu/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (66, 2, 'admin/menu/listorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (67, 2, 'admin/menu/getactions', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (68, 2, 'admin/route/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (69, 2, 'admin/route/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (70, 2, 'admin/route/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (71, 2, 'admin/route/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (72, 2, 'admin/route/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (73, 2, 'admin/route/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (74, 2, 'admin/route/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (75, 2, 'admin/route/open', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (76, 2, 'admin/route/listorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (77, 2, 'admin/route/select', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (78, 2, 'admin/setting/password', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (79, 2, 'admin/setting/passwordpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (80, 2, 'admin/setting/upload', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (81, 2, 'admin/setting/uploadpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (82, 2, 'admin/setting/clearcache', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (83, 2, 'admin/storage/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (84, 2, 'admin/storage/settingpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (85, 2, 'user/adminindex/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (86, 2, 'admin/user/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (87, 2, 'admin/rbac/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (88, 2, 'admin/rbac/roleadd', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (89, 2, 'admin/rbac/roleaddpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (90, 2, 'admin/rbac/roleedit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (91, 2, 'admin/rbac/roleeditpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (92, 2, 'admin/rbac/roledelete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (93, 2, 'admin/rbac/authorize', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (94, 2, 'admin/rbac/authorizepost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (95, 2, 'admin/user/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (96, 2, 'admin/user/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (97, 2, 'admin/user/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (98, 2, 'admin/user/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (99, 2, 'admin/user/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (100, 2, 'admin/user/userinfo', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (101, 2, 'admin/user/userinfopost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (102, 2, 'admin/user/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (103, 2, 'admin/user/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (104, 2, 'admin/user/cancelban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (105, 2, 'user/adminindex/default1', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (106, 2, 'user/adminindex/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (107, 2, 'user/adminindex/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (108, 2, 'user/adminindex/cancelban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (109, 2, 'user/adminoauth/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (110, 2, 'user/adminoauth/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (111, 2, 'user/admingroup/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (112, 2, 'admin/plugin/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (113, 2, 'admin/hook/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (114, 2, 'admin/hook/plugins', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (115, 2, 'admin/hook/pluginlistorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (116, 2, 'admin/plugin/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (117, 2, 'admin/plugin/toggle', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (118, 2, 'admin/plugin/setting', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (119, 2, 'admin/plugin/settingpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (120, 2, 'admin/plugin/install', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (121, 2, 'admin/plugin/update', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (122, 2, 'admin/plugin/uninstall', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (123, 2, 'portal/adminindex/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (124, 2, 'portal/adminarticle/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (125, 2, 'portal/adminarticle/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (126, 2, 'portal/adminarticle/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (127, 2, 'portal/adminarticle/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (128, 2, 'portal/adminarticle/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (129, 2, 'portal/adminarticle/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (130, 2, 'portal/adminarticle/publish', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (131, 2, 'portal/adminarticle/top', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (132, 2, 'portal/adminarticle/recommend', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (133, 2, 'portal/adminarticle/listorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (134, 2, 'portal/admincategory/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (135, 2, 'portal/admincategory/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (136, 2, 'portal/admincategory/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (137, 2, 'portal/admincategory/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (138, 2, 'portal/admincategory/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (139, 2, 'portal/admincategory/select', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (140, 2, 'portal/admincategory/listorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (141, 2, 'portal/admincategory/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (142, 2, 'portal/adminpage/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (143, 2, 'portal/adminpage/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (144, 2, 'portal/adminpage/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (145, 2, 'portal/adminpage/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (146, 2, 'portal/adminpage/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (147, 2, 'portal/adminpage/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (148, 2, 'portal/admintag/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (149, 2, 'portal/admintag/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (150, 2, 'portal/admintag/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (151, 2, 'portal/admintag/upstatus', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (152, 2, 'portal/admintag/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (153, 2, 'guanjianci/adminindex/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (154, 2, 'guanjianci/adminindex/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (155, 2, 'baiducookie/adminindex/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (156, 2, 'guanjianci/adminrizhi/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (157, 2, 'pinglun/adminindex/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (158, 2, 'pinglun/admintiwen/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (159, 2, 'pinglun/adminindex/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (160, 2, 'pinglun/adminjinci/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (161, 2, 'zhidaobaiducookie/adminindex/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (162, 2, 'pinglun/adminrizhi/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (163, 2, 'zhizhuchi/adminindex/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (164, 2, 'admin/recyclebin/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (165, 2, 'admin/recyclebin/restore', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (166, 2, 'admin/recyclebin/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (167, 2, 'user/adminasset/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (168, 2, 'user/adminasset/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (169, 2, 'user/adminmoney/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (170, 2, 'baiduzhanghao/adminindex/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (171, 2, 'tixian/adminindex/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (172, 2, 'user/adminjiangjin/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (173, 2, 'user/adminfapiao/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES (174, 2, 'host/adminindex/index', 'admin_url');
COMMIT;

-- ----------------------------
-- Table structure for cmf_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='权限规则表';

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
BEGIN;
INSERT INTO `cmf_auth_rule` VALUES (1, 1, 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `cmf_auth_rule` VALUES (2, 1, 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `cmf_auth_rule` VALUES (3, 1, 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `cmf_auth_rule` VALUES (4, 1, 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES (5, 1, 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES (6, 1, 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (7, 1, 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES (8, 1, 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (9, 1, 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES (10, 1, 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `cmf_auth_rule` VALUES (11, 1, 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES (12, 1, 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `cmf_auth_rule` VALUES (13, 1, 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (14, 1, 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `cmf_auth_rule` VALUES (15, 1, 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `cmf_auth_rule` VALUES (16, 1, 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `cmf_auth_rule` VALUES (17, 1, 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (18, 1, 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (19, 1, 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `cmf_auth_rule` VALUES (20, 1, 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (21, 1, 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `cmf_auth_rule` VALUES (22, 1, 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (23, 1, 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `cmf_auth_rule` VALUES (24, 1, 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES (25, 1, 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (26, 1, 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `cmf_auth_rule` VALUES (27, 1, 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `cmf_auth_rule` VALUES (28, 1, 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (29, 1, 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `cmf_auth_rule` VALUES (30, 1, 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (31, 1, 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `cmf_auth_rule` VALUES (32, 1, 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (33, 1, 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (34, 1, 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (35, 1, 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (36, 1, 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (37, 1, 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES (38, 1, 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES (39, 1, 'admin', 'admin_url', 'admin/Plugin/default', '', '插件管理', '');
INSERT INTO `cmf_auth_rule` VALUES (40, 1, 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `cmf_auth_rule` VALUES (41, 1, 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `cmf_auth_rule` VALUES (42, 1, 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `cmf_auth_rule` VALUES (43, 1, 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES (44, 1, 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `cmf_auth_rule` VALUES (45, 1, 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `cmf_auth_rule` VALUES (46, 1, 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `cmf_auth_rule` VALUES (47, 1, 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `cmf_auth_rule` VALUES (48, 1, 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `cmf_auth_rule` VALUES (49, 1, 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES (50, 1, 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `cmf_auth_rule` VALUES (51, 1, 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES (52, 1, 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `cmf_auth_rule` VALUES (53, 1, 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `cmf_auth_rule` VALUES (54, 1, 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `cmf_auth_rule` VALUES (55, 1, 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `cmf_auth_rule` VALUES (56, 1, 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `cmf_auth_rule` VALUES (57, 1, 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `cmf_auth_rule` VALUES (58, 1, 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `cmf_auth_rule` VALUES (59, 1, 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `cmf_auth_rule` VALUES (60, 1, 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `cmf_auth_rule` VALUES (61, 1, 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `cmf_auth_rule` VALUES (62, 1, 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES (63, 1, 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `cmf_auth_rule` VALUES (64, 1, 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `cmf_auth_rule` VALUES (65, 1, 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `cmf_auth_rule` VALUES (66, 1, 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `cmf_auth_rule` VALUES (67, 1, 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `cmf_auth_rule` VALUES (68, 1, 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO `cmf_auth_rule` VALUES (69, 1, 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `cmf_auth_rule` VALUES (70, 1, 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES (71, 1, 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `cmf_auth_rule` VALUES (72, 1, 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES (73, 1, 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `cmf_auth_rule` VALUES (74, 1, 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES (75, 1, 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `cmf_auth_rule` VALUES (76, 1, 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO `cmf_auth_rule` VALUES (77, 1, 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES (78, 1, 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES (79, 1, 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES (80, 1, 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES (81, 1, 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES (82, 1, 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `cmf_auth_rule` VALUES (83, 1, 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `cmf_auth_rule` VALUES (84, 1, 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES (85, 1, 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `cmf_auth_rule` VALUES (86, 1, 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES (87, 1, 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `cmf_auth_rule` VALUES (88, 1, 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES (89, 1, 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `cmf_auth_rule` VALUES (90, 1, 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `cmf_auth_rule` VALUES (91, 1, 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `cmf_auth_rule` VALUES (92, 1, 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES (93, 1, 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `cmf_auth_rule` VALUES (94, 1, 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `cmf_auth_rule` VALUES (95, 1, 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `cmf_auth_rule` VALUES (96, 1, 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `cmf_auth_rule` VALUES (97, 1, 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `cmf_auth_rule` VALUES (98, 1, 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `cmf_auth_rule` VALUES (99, 1, 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `cmf_auth_rule` VALUES (100, 1, 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `cmf_auth_rule` VALUES (101, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `cmf_auth_rule` VALUES (102, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `cmf_auth_rule` VALUES (103, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (104, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `cmf_auth_rule` VALUES (105, 1, 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES (106, 1, 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `cmf_auth_rule` VALUES (107, 1, 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO `cmf_auth_rule` VALUES (108, 1, 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO `cmf_auth_rule` VALUES (109, 1, 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `cmf_auth_rule` VALUES (110, 1, 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES (111, 1, 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `cmf_auth_rule` VALUES (112, 1, 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES (113, 1, 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `cmf_auth_rule` VALUES (114, 1, 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES (115, 1, 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `cmf_auth_rule` VALUES (116, 1, 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES (117, 1, 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES (118, 1, 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', '');
INSERT INTO `cmf_auth_rule` VALUES (119, 1, 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO `cmf_auth_rule` VALUES (120, 1, 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO `cmf_auth_rule` VALUES (121, 1, 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO `cmf_auth_rule` VALUES (122, 1, 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO `cmf_auth_rule` VALUES (123, 1, 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO `cmf_auth_rule` VALUES (124, 1, 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO `cmf_auth_rule` VALUES (125, 1, 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO `cmf_auth_rule` VALUES (126, 1, 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO `cmf_auth_rule` VALUES (127, 1, 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO `cmf_auth_rule` VALUES (128, 1, 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO `cmf_auth_rule` VALUES (129, 1, 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES (130, 1, 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO `cmf_auth_rule` VALUES (131, 1, 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES (132, 1, 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO `cmf_auth_rule` VALUES (133, 1, 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES (134, 1, 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO `cmf_auth_rule` VALUES (135, 1, 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES (136, 1, 'portal', 'admin_url', 'portal/AdminIndex/default', '', '文章管理', '');
INSERT INTO `cmf_auth_rule` VALUES (137, 1, 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `cmf_auth_rule` VALUES (138, 1, 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO `cmf_auth_rule` VALUES (139, 1, 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES (140, 1, 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `cmf_auth_rule` VALUES (141, 1, 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES (142, 1, 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO `cmf_auth_rule` VALUES (143, 1, 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES (144, 1, 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES (145, 1, 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO `cmf_auth_rule` VALUES (146, 1, 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `cmf_auth_rule` VALUES (147, 1, 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES (148, 1, 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `cmf_auth_rule` VALUES (149, 1, 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `cmf_auth_rule` VALUES (150, 1, 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO `cmf_auth_rule` VALUES (151, 1, 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `cmf_auth_rule` VALUES (152, 1, 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO `cmf_auth_rule` VALUES (153, 1, 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `cmf_auth_rule` VALUES (154, 1, 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `cmf_auth_rule` VALUES (155, 1, 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `cmf_auth_rule` VALUES (156, 1, 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `cmf_auth_rule` VALUES (157, 1, 'user', 'admin_url', 'user/AdminMoney/index', '', '充值消费管理', '');
INSERT INTO `cmf_auth_rule` VALUES (158, 1, 'baiduzhanghao', 'admin_url', 'baiduzhanghao/AdminIndex/index', '', '百度帐号管理', '');
INSERT INTO `cmf_auth_rule` VALUES (159, 1, 'pinglun', 'admin_url', 'pinglun/AdminIndex/default', '', '知道任务管理', '');
INSERT INTO `cmf_auth_rule` VALUES (160, 1, 'tixian', 'admin_url', 'tixian/AdminIndex/index', '', '提现管理', '');
INSERT INTO `cmf_auth_rule` VALUES (161, 1, 'pinglun', 'admin_url', 'pinglun/AdminIndex/index', '', '评论任务', '');
INSERT INTO `cmf_auth_rule` VALUES (162, 1, 'pinglun', 'admin_url', 'pinglun/AdminJinCi/index', '', '禁词', '');
INSERT INTO `cmf_auth_rule` VALUES (163, 1, 'user', 'admin_url', 'user/AdminJiangjin/index', '', '团队奖金管理', '');
INSERT INTO `cmf_auth_rule` VALUES (164, 1, 'guanjianci', 'admin_url', 'guanjianci/AdminIndex/default', '', '关键词任务管理', '');
INSERT INTO `cmf_auth_rule` VALUES (165, 1, 'guanjianci', 'admin_url', 'guanjianci/AdminIndex/index', '', '关键词任务管理', '');
INSERT INTO `cmf_auth_rule` VALUES (166, 1, 'user', 'admin_url', 'user/AdminFapiao/index', '', '发票管理', '');
INSERT INTO `cmf_auth_rule` VALUES (167, 1, 'host', 'admin_url', 'host/AdminIndex/index', '', 'ADSL-VPS管理', '');
INSERT INTO `cmf_auth_rule` VALUES (168, 1, 'baiducookie', 'admin_url', 'baiducookie/AdminIndex/index', '', '百度cookie', '');
INSERT INTO `cmf_auth_rule` VALUES (169, 1, 'guanjianci', 'admin_url', 'guanjianci/AdminRizhi/index', '', '任务执行日志', '');
INSERT INTO `cmf_auth_rule` VALUES (170, 1, 'pinglun', 'admin_url', 'pinglun/AdminRizhi/index', '', '任务执行日志', '');
INSERT INTO `cmf_auth_rule` VALUES (171, 1, 'pinglun', 'admin_url', 'pinglun/AdminTiwen/index', '', '提问任务', '');
INSERT INTO `cmf_auth_rule` VALUES (172, 1, 'user', 'admin_url', 'user/AdminGroup/index', '', '会员等级', '');
INSERT INTO `cmf_auth_rule` VALUES (173, 1, 'zhizhuchi', 'admin_url', 'zhizhuchi/AdminIndex/index', '', '蜘蛛池任务管理', '');
INSERT INTO `cmf_auth_rule` VALUES (174, 1, 'user', 'admin_url', 'user/AdminJiage/index', '', '消费价格', '');
INSERT INTO `cmf_auth_rule` VALUES (175, 1, 'guanjianci', 'admin_url', 'guanjianci/AdminJinCi/index', '', '禁词', '');
COMMIT;

-- ----------------------------
-- Table structure for cmf_baiducookie
-- ----------------------------
DROP TABLE IF EXISTS `cmf_baiducookie`;
CREATE TABLE `cmf_baiducookie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `baidu_cookie` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `cookie_md5` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `cookie_fail` int(100) unsigned zerofill NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cmf_baiducookie
-- ----------------------------
BEGIN;
INSERT INTO `cmf_baiducookie` VALUES (4, 'RUY1YVZOWlpEVm1NR3BzVkZRek5XMWtZV1pOTnpsUmRrRkJUR0V5YkZKT09XeFhOekpEZGxob1UyNVNNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFCbDZUVzRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBS2U2TDFtbnVpOVpk', 'a7d3c899a12153d22eac865cc014b77e', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 1504687033, 0);
INSERT INTO `cmf_baiducookie` VALUES (5, 'OU1kMlpoZm10RlRVRm5XRll3WVVWcmMwdFZXR3hCV0hoTFMzWTBUMzVuTkhVeVNrRlpPRGhOU0c1U01XUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUFEU2phNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFPZTZMMW5udWk5WmRX', '2588fd1412591b2a2336d3b8c748ab1d', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000087, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (6, 'emRvYlRaRlpuQTNlV2g2TUZJdFdUZDNXbk0yWTB4Sk5qaHBORlZ4WldkNE1WVnRNblJGWjJaeVJITlNNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDeDF6VzRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT3k2TDFuc3VpOVpN', '7737eff667d3e0ab6c3ee664a2a3af6d', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000091, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (7, 'QXRVaTF4VjNZdE0yZG5WalZxWlhwbFJHbEZaSG8wVURoQk1GWm9VVXR2WWtORloxWm1mbkZsT0ROVFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUFZN1RXNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFEZTdMMWszdXk5WmJW', '2649db302d12e7f73e83fce8a5e78c82', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (8, 'TmtZM0pWZUVWVVFYTTBPRTV5UVV0NWVIWm9OVE5aZVV0WlJVWmtNMmhZTXpCR1RYUm1WMnQ0U1RSVFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUNuMlRXNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFEaTdMMWs0dXk5WlR6', '0abdaa3e087af8f82fee9c2df6ab9296', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (9, 'ZDJNazl2WWxGemNVNTRlVXR0WVhVd2ZrTk9jalE1WXpReVUzUlNZbmhLYVdsdmEySkZWeTFxY3poVFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUFHVGphNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFEeTdMMWs4dXk5WmFX', '30a09f7b4b72df70ed7833b677532461', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000078, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (10, 'RWh0UXpGYWNsaEJTbUpYV1RWV00zaDNOMHN4Um14c1pITkpXbTR3TkRjd2JuZFFOMjFRUkc1LVp6UlRSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBaDdUVzRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRGk3TDFrNHV5OVpi', 'b6ebed63e0ea26c69e0a0e56cddcbc5d', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000071, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (11, 'a3hVT0hKblYyZHZVbEpaYW14SU5tRk9jVkp0YTJoTGVFbFFWSFJVZGpReWVscE1RelJzTjBKTU5EUlRSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBaTdUVzRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRGk3TDFrNHV5OVpU', '83103f157785d79b1ffb417bc45db2a6', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000088, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (12, 'VlpsWVhkTWNqY3RhRzEwWmpCdFVtUjZmazlKZGxSbk0ydHhUVEJRTVg1R2VYWi1ja3BpUWxrMVpEbFRSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFEeFVEYTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSDI3TDFsOXV5OVpR', 'ed3f4b81005b51d70766da6f88747bef', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000079, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (13, 'QTRXbGMwWTJwTlFWRk9XazVoWmtocU5FcFRkbFIzVnpSalVEQnRWMmxxYkhKNWFIZEdla3BtUmpoVFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUR1VURhNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIeTdMMWw4dXk5Wk56', 'dc8d43632ba9c131df918966a5f3e524', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000089, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (19, 'V2QzVDNKaGExQmhSWHBTTmtSbGRXbFdXRUZDVlRsa2IxUjNmbkF0VWpadWEycDBaSGQyV0dabk4wWldNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBcFd6aTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBTVhLTDFuRnlpOVpR', '9cbe9048241549f77441edabdd5e10ff', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000067, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (20, 'ak50YjA0d1kyMUNPRTFCT0ZOUmJUSnhUSGN3Y1RSRFdVOUJaVnBQZFVRM1NEbDBaRzFrWmxaeU4wWldNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBdFd6aTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBTVhLTDFuRnlpOVpW', '14026657c21e62966559ec250eb87520', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000069, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (21, 'WkxZa0puVjNod2J6ZzNkM2hLWVRVeVoxcElZWFkyZFRrM1VUZzJUa0pqTTJaWVZHbFlNVmhUYTBoWFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUQxSFRpNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBZkxMMWtIeXk5WlFr', '0ed346b7581319a388c977415741bb2e', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (22, 'RjRRWFo0ZW1oWlIzRlJNR053VEhob2JraEhiRVp2VkdsT2FtOXVPR0pIZDI5TGNWaHNOVWxQYzBwWFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUFNWGppNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBbkxMMWtKeXk5Wlkz', 'e5ad78ad1b85cd12009d481741c58e6d', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000063, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (23, 'VkZQTFdwcldtVjZXRTlPTm41UlIwWm1kVmhCTW00MWMwUjVhRFkwVDJvemR6QXlXWGxKYnpKclRVWlhSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFEdEhUaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVhMTDFrRnl5OVpT', '563f977bfd34282bc189638ebfe3b21a', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (24, 'RTBWVXBQWmpoVWRUZHJXRVpDY0U1MVNsTk9NRm90YVRaTFNFVllPVll5VlVWUmVraHpPRGxRT1UxWFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUNRSHppNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFekxMMWxNeXk5Wlp6', 'faee48afba18fd320b11e1e27b1fd7ab', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000079, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (25, 'R2RRUjBadFoyeGxVMjFCV1dONlVFdENiMWN0T0dSdVZFbE5NMEZoUjNScGNUaDVmbk5KYzBFeGFWaFhSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBS0tUaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSmZMTDFtWHl5OVpi', '17da9c513a5db76e042deabaa4dcbe81', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (26, 'dzVSRUpaV25Ga1owOS1WRzFEYkRSek5Ib3hjVUUxWlhoaVlucFVUbTF2TkhCaFlsVnNUekpOYVZsWFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQURERFRpNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFKakxMMW1ZeXk5Wlpt', '5fa810361f3b28001fe837e3b95b4719', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (27, 'RnlXSFp5TkZCbFVqWlRaWEJVVG1sNlQwdFhmbWwxY2psalNsRk9ObTQ1YjJOUFZ6RkZieTF3YVZsWFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUE2WkRpNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFKakxMMW1ZeXk5WlVu', '57e0adc3711ed4554da0bf0c006ac908', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000071, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (28, 'ZExjVEUyZVV0eVRHZFBhVEJ6Um10SVdXUnBUamxRY2pCdFZWUi1SMHgwTXpCUFZrUk5SM1YtUzFsWFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUFOS1RpNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFKakxMMW1ZeXk5WmRt', 'b265bea0cfeffc0d0acaa453cad0ce1c', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000075, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (29, 'SnFabFJTY0RBMlZteEpVSGxwWWpNMVNXaDNkaTExYkdWNGIwa3pXRmhoTFUxcWJreEJNemhhVjFsWFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUFQS1RpNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFKakxMMW1ZeXk5Wk5W', 'a7aa3a980e53190738b4bfd924191351', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000069, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (30, 'SHA1TWxOLU1qaGpZVzFXWmtzeVlscFVlSGhGVXpab2RFVkJNMEZpYkhaRFNIUmtaek5pYjNod1dHZFhSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDa0tqaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT0RMTDFuZ3l5OVpT', '7f6524b984f874b5a43b6dc307fc5dea', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000068, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (31, 'YzFkbWgxZHpScGZrVTNaQzFKUjFoQ1ZqRjNPREpVV25wbE1qQi1VR3hSTUhwa1dtVkdkbU5sTTJkWFJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUNuS2ppNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFPRExMMW5neXk5WlF6', 'd56142ee280c6d7d32f575893a7ff62d', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000078, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (32, 'a3BwTmt4RVFVODRaMjlvUVdONGJVdG9lbFZEWnpOS1ZuQTBWbGRNVUhoa1VIZHFiM0ZLZWxaUlkyUlhWbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDNEVEaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQjNNTDFrZHpDOVpX', 'be71ec2c200b3d11a321a4e1fe9aab29', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000082, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (33, 'a3BVVFU1amNFOUxWWE5yVkdsaWExQlljVUZ0VG1aU2QxaE9OaTE1YWxCRFFraEtTemhSTVUwMmVIcFhWbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBSHhEaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSFBNTDFsenpDOVpO', '16187e697588432e11da6b586e4e4fcd', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000073, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (34, 'RE5ET1VWVlUweFhUVzVVVEhFdE9IZElSbmhDZmtsTFpXaC1SMUZzY0dOeFpqaG1hM0Z4VmpaaWJEQlhWbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDeUVqaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSFRNTDFsMHpDOVpS', 'bbd123c9892a36643b4b4becb2af04da', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000069, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (35, 'MGxITUhFNGNuaHZWWFJNYUV4WVYyYzJhMVExZEdWdVJVRnNkMHgzZUdScVFUTnVPRkl0ZDJoTk9UQlhWbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDekVqaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSFRNTDFsMHpDOVpj', '984782551c7afcb38f3cd2026ad971dd', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000087, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (36, 'RXN0T1RGM2FGUi1NVU5NZUU1RVJEWkdaVE5FTTBKelpFTjFiSGxKYkdZd2JWaE1jbFpoTnpoTFQzRlhWbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDTHhqaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBS3JNTDFtcXpDOVpW', 'fc30837b57bb0291cc487ea4447fdd31', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000084, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (37, 'ZDVUaTB0UkZSak4zbDZiV1JIWlRGaWZreFJSREJJVmxsMFRGVTBVbW8zYlZsWlN6SlVhV1JtUTNCWFZtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUI5eGppNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFLbk1MMW1wekM5WmFU', 'fc517cdd177d4e4553baa9df46c81448', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (38, 'bjV5ZFZVM2ZqVmhOSFo2TmtaTlJqTmhXWFpIYzBoTFoxaHBNMVJqUzBScVYxTldSMGx1VEc1a1EzRlhWbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBeUx6aTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBS3JNTDFtcXpDOVpV', '55fc522bfa042d35e6c144b0e81f0c2f', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000072, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (39, 'eG5OVWRGZVRaSU4xRkNkVlprVkVnMGJYZ3pSbmxXWTJsWk1HcFJXSGRGYW5oMGRIUnNRWFl3U0haWFZtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUNQeVRpNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFPfk1MMW52ekM5WllV', 'adf05d491424aab65cf46156127acaf8', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (40, 'Rm8wTTI1NmMwWlNSMHcyV1hWaFVHVjVVbEpYYjBNd2ZpMXJiSGgyVUVkLWNHODNRVkU1WVVaR2R6RlhiR1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDa3pEaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRFhOTDFrMXpTOVpW', '0e92cfdeb28c327f185b41b16bb25c2b', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000081, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (41, 'VXMzYVU1UWRVZFhhVlJ3TFVwTVFXOVNlV2hCY2s5a1ZsY3dSbEExVW41emFFMTFlSGxWVG5CSlZVUlhNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDcjFUaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVBPTDFrRHppOVpX', '5025688d31a9962cbc2178da8576ba94', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (42, 'QXdUMFo2UTB0eFZtTjZPSFZDUXpsNmNucHBOSGRUYTNKcVYybElXalozZWtKNVUwNXVlSGxwU1VOWE1XUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQURuTmppNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBTE9MMWtDemk5WlUx', 'b7c5efea4c27c9712b42be4ba0ba3580', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000078, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (43, 'V3d5VVVoUk5FaFZTVE5VY1ZZM2RIaEtaV1J1ZG1obFFtRlpUWGRuWjBwWlVVWlRMWDVHZVRkRVVVUlhNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDdTFUaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVBPTDFrRHppOVpV', 'a85a45ecfd45fb8043ecee82e6fcb032', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000069, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (44, 'VUpCWWtweGEwNVBTVWcyWms1VlJrOUNiRkZTVGxocGR6UlhkblZqV2pFelpqSnBkbnB1Y0U1alNrUlhNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFCNzJEaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRVBPTDFsRHppOVph', '4f0a324df27e908239de6ce06c3e4b8a', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (45, 'VktOek5QVVhOTFJHcEtla1pWVjIxRWVUZzNlV0ZQV1U4eWQyTTNXbVZwUmxwRWIyTTBORlJVVWtWWE1XUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUJ6aWppNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFVE9MMWxFemk5Wldt', '4279f5056328be4ce3c8439ba49d8cce', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000082, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (46, 'WHBNVEVONWQzQkJVazkzT1dNeFlrSllSRU5VYWtFdE1VOVJXVzltV2xOME1uSjBaa3hPVGtjeExVbFhNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBbXB6aTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSWpPTDFtSXppOVpj', 'eedc49058cd3272572c28a836377a633', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (47, 'R3BOUlVwd2VXcENibTlPYlRCeFlsWnVOa2cxWW5sNU1IZFpZekV0Uld0WlNqRm1hVlZPWTNOcVdGRlhNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDMTNqaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBTkRPTDFuUXppOVpP', 'e3dbb03c56e06a292a713d1cb72b7fb7', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000072, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (48, 'RGRCTXpOU1VGVklUbkZGV1ZwLVNFWlBibFJWWTJ0amQwOUJNWDVJYlRneFEwNXBVRmhMWkhkWFlsSlhNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFERTNqaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBTkhPTDFuUnppOVpP', 'b6ceb823878950f328b699265c486472', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000067, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (49, 'SFJrUWxSdVdIaGhiVE01TUhJeGJUZGFZMlZMVm5kUVdHeGlWbXB6U25CS2RHVktSMXB2T1d0VlNGTlhNV1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFEWXFEaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBTkxPTDFuU3ppOVpj', '30a93fb60954e60f5f029f70c98bfc08', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000088, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (50, 'MVVZa0pzZWxFelVUbFJOV1pDVjJoT1dHdDJZME5WTkZCMGJHNHdmbVZOVWtaek5XVklkUzB6V0ZKWE1XUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQURDM2ppNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFOSE9MMW5Semk5WmJF', 'dcf8a83b77db8c9ccb07d1a959643381', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000081, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (51, 'a2MwTlVwVFRHdzRhRU5LY0ZSd2NVVXpaVzVyTjBvd2RVSlNmbkF0TjBSWGRuSmxjRnBHYlRBeE5GaFlSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBWmp6aTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQmZQTDFrWHp5OVpl', '286a37bbb6c9552f4d9041102d368c37', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000067, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (52, 'R3hXVjAwMmNrTm5WM1ZxYmtsQ1ZXRllja1JMT1RWUFFUSXhVR1pHVTA5MmFGVnhSblJuZVVkNlkxaFlSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFESzRUaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQmZQTDFrWHp5OVpX', '4728da485726406258dec78dfe58692b', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (53, 'MXFha3BVZEhCUE1ISldhbVIyUVV4RFdFaE5lVVV5VmxFM1pEUTBRbTFxVURKVlowUm1ZVU0wTUZoWVJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQURJNFRpNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCZlBMMWtYenk5WlZt', '57f2c39805dfe430a75dc55ba3125eda', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (54, 'RUp0YlVkV0xXVjNhRXRMYmpsTFpqWlRjMDU2U1VReE1uTnVSSE5QUzFvNFZtdEpUM0Y0TFdwWFJtNVlSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFCRXJEaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBR2ZQTDFsbnp5OVpk', '59d23ea4a96849fa356a75e06d8d20a2', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000063, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (55, 'REYzYkU5RVNXRjNOMG96UzFKWlVEaENaazVIYkhKalZHbHdWekUzVjJKSmVINTFXV3RpVFdGTFdtNVlSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFELWtEaTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBR2ZQTDFsbnp5OVpX', 'd88466a243b2d6b407b91c97e08ae9d8', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (56, 'aHFSbVJhVlRGS1lXbzVaVFJYWTI0emJWQkVUMVZYU2xGcVlqSklTM0ZFTm41R1MyODNVMmhwVG01WVJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUQ2QkRtNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFHZlBMMWxuenk5WmJF', '2e5cf4febf2f195435d1528373492261', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000083, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (57, 'VFpXYWxGYU1HNURUVEozTVVaS2ZuQmpURlZRVW1sT2VUTlZRVXB1VGtSTE9HRTRVRzV6ZDFkV1RtMVlSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFEeEJEbTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBR2JQTDFsbXp5OVpN', '19c040d0480147e2c35daa5ab38c816e', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000331, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (58, 'ZGhTRVF4ZHpaeVNFTndVbXhXY0c0MldWQk5jekUxUVRKTFdubGFVR0ZJWVZKdVYyUlpjREp2Um0xWVJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUF+ckRpNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFHYlBMMWxtenk5WmNU', '42de2ef191d5594e139a182b9a38d747', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000083, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (59, 'SG95VWtaS2VGcFNTSGxEVFRCQ1V6a3hkMUE1WTFac1FrUXphVFZUZUdKVVUwTmFlWGh0YldGRmJHNVlSbVJhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBQkJUbTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBR2ZQTDFsbnp5OVpU', '2fe805bb7ca61cc5a3b364c25f65ee4b', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000310, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (60, 'ZFpOVU40T0VnNU9UbFdiazVVYTJGNWFtMVJha3h6UWtKUVRYTXlaMVkwWkhWbmN6ZEJaRWRHZVhKWVJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUFIQ0RtNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFLdlBMMW1yenk5WmNU', '29d4c26691c7a90d128fc1ad4cc3b707', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000078, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (61, 'UnFXR0ZpVlhOQk5IbHBhWFJZYUdKWVJVTlllWGxYWVRSWWMxUkhRV3hHVGtKQ2JHSk1VWDV5ZmpkWVJtUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUFlUWptNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFQdlBMMW43enk5WlJH', '325ca63c8cc8afdfe8363d385488d754', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000081, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (62, 'ZFlhMHhPY1V4UWN6WlhXbXh2TkZSQ1JGZFVUbTUtU3prM2RrWkNVekpWZUZoMGVUUlBVRzVzV1dwWWJHUmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUN0VHptNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFDUFJMMWtqMFM5Wk1H', 'f9fc7bc2e89248e9e4dff4a844147540', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000071, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (63, 'V00zUzBaeldFcG9XbVp0ZmtSMVlXdERORGwzT0hWV0xUTktTalp3V25aelIycHJTbG96TFRZeVdsRlliR1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBcHR6aTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRkRSTDFsUTBTOVpl', 'dcd9ee3c7797b76f1c01709db832b99e', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000065, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (64, 'SEkxV1hsamFUTmlZMVZpTUdWdWVrd3lhRFZtTTJWT1QzRllObTVoUm14dGFGWkpWRkppTkZCWFZsRlliR1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFEdlVUbTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRkRSTDFsUTBTOVpW', 'ce29b1fcfd605f3b003a817ab2069fad', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000075, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (65, 'M2cwYW1OR1FYSm5kblE1WldKUVJXaFNkRUkwU0ZsWGFtRjZkbEYxVmxsRk1tMVBXbEZrWWxSQ1QxbFliR1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBUlZUbTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSmpSTDFtWTBTOVpR', 'a4b36527b03d0a7148d7871a54e2090c', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (66, 'a2sxTVVoWVVIVk5hVXBwTm5sMVJrRTFSbEpTVkRKdGZtaFVaaTFhZW10aFJYUmhWbWhZYjJkUFMxaFliR1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFERENqbTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSmZSTDFtWDBTOVpl', 'b6e53d4b0a1c437a8f9bbb25db6bcb9c', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000086, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (67, 'V3BVYlVwRFIxY3lPVE5KY0dKVU9VUTRRbGh1U0haSVNuaEthbkJxVEU1U1MyOUNVMHBpWWsxUlExcFliR1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFET0NqbTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSm5STDFtWjBTOVpZ', '7c0c0b1350047612c0650422b95fe174', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000079, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (68, 'SHBJZFVVMVJYcGFlV0p1ZmtveFV6RTFVRUYzYlRsNVJXUndZWDV6ZEVWdGJYcGhjSHBCZDFkUWFWcFliR1JhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBVVZUbTRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSm5STDFtWjBTOVpl', '0f26eb26d77a6649b33797d4f428b27c', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000071, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (69, 'a1J0VWkxUVNqTnJSMWxHTW1NNU5FRm5ZbXhLTVcxSFpqZEVaWE5tU21kVE4yaHdZbGhST1VoTVp6RnVMVEZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBVzA1bkV0OERIdnJ2UXNNOEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRFVTeGxrMUVzWlpV', '226356fcd5dfb2f8c8af3c384b0311d2', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (70, 'bFRTbEJXVkRoVFJGSkxTMU4wZFVsSVEzUldNMUowYTFvelZXUkVZMHRwTkRocE9FaE1OMGd0WXpGdUxURmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUNlQkpyRXk5SEoyTkRheXJRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFEVVN4bGsxRXNaWlpF', '1acdd9e4fe2af364dae2b29756515b85', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (71, 'VmMxU0hWLVdIbDRVV1p4YUhndFUwazFVelowYlRkWVIyMDVWRXBUWmpoQmNqQnlWVWxFV1hWTVJUQnVMVEZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFBTTA1bkUyc1hFeXJUTnRjTUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRFFTeGxrMEVzWlpU', 'c32b3929240dc15426acc2f987d2c573', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (72, 'VmREVVhrNFEyUjFaVVZzVEVsbVVVWXRTeTF4YVRJMlprOVFmbkZhV1dwRVFVYzVaekpUVWtoT05WUnZUekZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFCRjY1bkUyZERKek5PLTJMZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRk1UeGxsVEU4Wlpa', '58f9b006a1efd067156730e71fd8779b', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (73, 'QjJNbG80YURsSGExRkdiWFIyYzFoSmNscDBjVzF1YTB3d1JqSTFXVkpHUnpZM1Vra3lhMUJhVmxkdlR6RmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUJwNjVuRXg3akp0OE94MGNnQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFGWVR4bGxXRThaWlEx', '4849a92ed0ccabeb0b3ff747b7ca48b1', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (74, 'VkVaVlpLVFUxQ1RWZG5Xa1ZLTWxKTWVrRTNaRmRoTkZaT1QwZzJjbWRKZVdOaVlVMDRjVmxUVGxadlR6RmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUNhTEpyRTJMUFJ5Y2ZTeWRVQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFGVVR4bGxWRThaWlZU', '8142145056c759253c3bf998b12b90e1', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (75, 'WFl6WTNsTFEzWlFhVzQwVFdGd2IyVlVSMlpuT0Mxa01FUnFaSFF3UmxCTFJGQk5mblI0Vlc4eVpGaHZUekZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFCMjY1bkV1dEhSejlmWjBNVUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRmNUeGxsWEU4Wlph', '520d5bf99b16ac6591bf5be5d2f5fdb3', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (76, 'cFVRbmxIUTNKR2RUbDZXVGRHUXkwNE5VTlJjUzE1V2t4NGIxSndaalp3UjNOTmZsbzBhRlZpZEZkdlR6RmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUM0RjVyRXRjelp4TExTME1VQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFGWVR4bGxXRThaWlNG', '43352ddad7e6c19fcd65d32ed0b2df69', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (77, 'UTJkR1IzZEdkR2Nua3RRVlZKU2xGSWQwNXdTamRMYm1sRFpGSm5OVnBDUzJKcFRHTnVPRVZGZUdSdlR6RmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUNwNjVuRXpNLTN2Yy05MUxRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFGMFR4bGxkRThaWlp6', '76c3059b5d196360a131b0f742eedc31', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (78, 'SGhOVTAxT1R6RjRVbWRVTTBoMVUyTmxORVpGTkZCTFNVd3plWDVUTTJGRFIyUjJWRmRwTFhCVE9WZHZUekZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFCdDY1bkV5YjdWdGREUTA4c0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRllUeGxsV0U4Wlpl', '36bdfa74a9244157477883253ef3d109', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (79, 'M0pwWVg1TGIwdzFNSDR5YjFRdGVtbEpaRlkwVVc1T1RtdDJWV1ExUlhWTk1UaHlNbUUxUkdWa2FEbHZaVEZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFESlJKckVzZEc0dk5QV3g5UUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSDBVeGxsOUZNWlpT', 'abe030687f6e2663878c3d369a215f0c', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (80, 'V2xGTTFkWFVraE5UM1ZSYlZwd2FINDBSRTV6VEUxelIyaHRSRWw0VG1FMVZYcGhWbFk1ZEg1V1dqbHZkVEZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFEc1RKckV0c0xLd3RYTnZjZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSDBWeGxsOUZjWlpP', '7fec747262297b69eef3b6028990d3ab', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (81, 'bDBVMVJtTVhwRE5VcGxZVGgyYUd0eVVYUXhha1JOUkMxNldVeDBRMWRMTUU1clNrRkJNbVppVWpWdmRURmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUFxY1pyRXc5YkR3TXEteGNNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIa1Z4bGw1RmNaWmRF', 'dcebe6b82733f9aa60465cdabf619995', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (82, 'RkZGZVdJM1ZUUk1lbHA1YlhKTlIxaE1UVk0zTTFSNVJHZHFWMnRFYUdoVlFsZEpZM0JQY2pNdFJpMXZkVEZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFCWmNackV5YzNBdmJmQ3pNRUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSDRWeGxsLUZjWlpW', '868fac0b9edd599b0a1d46cc5a382cb1', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (83, 'aElSVkEwVGxJeVowMW9kMG8yVW5WcmFEVkZVMVp4VG1FMGFqZDJSVkJQVTJWMVZGSkhRMmxKTVRodmRURmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUJNY1pyRXRibXgwYkRRdmI4QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFId1Z4bGw4RmNaWlo=', '3cb028fd0e06bdd27380e3d3adb37bab', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (84, 'dE9VMXAwU1VNNWNFbDFSRlU0ZHpCdmRXNXNkbkpFUld0aU9UQk1ObXhaVjJOU1NsZHhkMFZuTVRWdmRURmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUFwY1pyRXo3dk53TDJ+MGJRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIa1Z4bGw1RmNaWmIy', '2fdafd72496dc04d871e576dd0ae4a98', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (85, 'RzFJTFVvNE1IUk9jbE5PZWxseGF5MDVkak5ZT1c0d05YVnVZVVJNT1hCck1WaHRkSEV0WVdOVFduNXZkVEZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFCbWNackV1c2ZaeXJURjFiRUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSDhWeGxsfkZjWlpa', '78260286b8945f1cf12bb47ac70e4b61', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (86, 'REpPTFdJNVlqZG5hWGRVVDB0c2EwSjNNVVIxUkhWU1kzZHVjRlpNUlV0elUwZHdSMUZPU1hVM2NETnZkVEZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDaFlwckV0c3ZUek5XMXdMTUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSGNWeGxsM0ZjWlpk', '0fe0fb48da8e0ae2979c7ccc84bc8553', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (87, 'MHRuZmtneFZXaDRZMHBhWm5CMlQwMTVUVFZ1Tmtwa1l6bHZObTluWTBoallteDRjRFE0U0cxbFpXVnZMVEZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFCOWZKckUwcjIxc3JHOXpOZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSjRXeGxtZUZzWlpW', '1c5c14fa7ac99bf9acd7ac7bcf8c4aeb', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (88, 'TkZWM0V5WWsxUlkwSlZja2wxUkcxTE5GVkhTelV6WTJoaGRXVkJTM0oyVTNKaVNERlRVbVJETFdadkxURmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUNJZkpyRXNMYkcwY3JYeEx3QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFKOFd4bG1mRnNaWk1q', '4828832f9d3fa0055842a4afae46b679', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (89, 'VjJNalZ2VVdSaFNUVXhWR3BwUmxWRlpUSk5Va05WUVZCRlFYaEJObUpPTVdwb01qRkxXVVYtTm1sdkxURmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUJ4cHByRXdNMjV1cm14MmRvQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFLSVd4bG1pRnNaWmNU', '7c2cafd690b87770b37a2d3cd0778bc0', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (90, 'SjFkVWRSUjFOaVZHdFZNRXRKWVZweU1rdHFaa2hxY1g1d09FbFVRalEyUzFOaFNVWnRaRWRKWVdkdkxURmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUNXZkpyRXp0YlAyc0c5MXJJQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFLQVd4bG1nRnNaWlRF', 'a2ab00b503d51bc878d7d3f9bba66acd', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (91, 'aHpkVVpUUWtFd2VVaG9XV3g0Vm1aYVJETnJjbGxZYlRsT1NIaGxXbkp2WjBKcU4xSjZOMnBFTW1kdkxURmFTVkZCUVVGQkpDUUFBQUFBQUFBQUFBRUFBQUNZZkpyRXp0VEdzYmpFeXRVQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFLQVd4bG1nRnNaWlNV', '386085c11ba4dd2cd162b42d676ba766', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (92, 'RVE1VEdKb1dVVjZaRlZ1WTA5LVpVOVpmbm81YW1oU1FqZG1kMU5MWVRsV1NqTjRNVk5sUm5GamVXdHZMVEZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFDbG1ackV6c204c2Iteng5TUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBS1FXeGxta0ZzWlpj', '9aee31435431a408a73cdb6cfa070248', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
INSERT INTO `cmf_baiducookie` VALUES (93, 'MVZsUVdsV05uSTFWRXhsVVhoNFpFNVVTRU4xYjNSTFpFSjJRVWw0UjAxb1NXRmhhMjB6YTFkUkxXVnZMVEZhU1ZGQlFVRkJKQ1FBQUFBQUFBQUFBQUVBQUFCUnBwckV4OGJUdWJuWHZyRUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSjRXeGxtZUZzWlpi', '5e208be68af7ebd0d646b32c566bd210', 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for cmf_baiduzhanghao_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_baiduzhanghao_post`;
CREATE TABLE `cmf_baiduzhanghao_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_zhanghao` varchar(255) NOT NULL COMMENT '类型：充值1 消费2',
  `post_mima` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '标题',
  `create_time` int(11) NOT NULL COMMENT '建立时间',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cmf_baiduzhanghao_post
-- ----------------------------
BEGIN;
INSERT INTO `cmf_baiduzhanghao_post` VALUES (6, '2', '标题', 1500402854, NULL, 1500631532);
INSERT INTO `cmf_baiduzhanghao_post` VALUES (7, '1', '1111', 1500434234, NULL, 0);
INSERT INTO `cmf_baiduzhanghao_post` VALUES (8, '1', '11111', 1500619427, NULL, 0);
INSERT INTO `cmf_baiduzhanghao_post` VALUES (9, 'zhanghao', 'mima', 1500630426, NULL, 0);
INSERT INTO `cmf_baiduzhanghao_post` VALUES (10, 'zhanghao', 'mima', 1500631186, 'beizhu', 0);
COMMIT;

-- ----------------------------
-- Table structure for cmf_chongzhixiaofei_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_chongzhixiaofei_post`;
CREATE TABLE `cmf_chongzhixiaofei_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` int(2) NOT NULL COMMENT '类型：充值1 消费2',
  `post_title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '标题',
  `post_jine` int(10) NOT NULL COMMENT '金额',
  `create_time` int(11) NOT NULL COMMENT '建立时间',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for cmf_comment
-- ----------------------------
DROP TABLE IF EXISTS `cmf_comment`;
CREATE TABLE `cmf_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text COMMENT '评论内容',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`object_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parent_id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='评论表';

-- ----------------------------
-- Table structure for cmf_guanjianci_cache
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guanjianci_cache`;
CREATE TABLE `cmf_guanjianci_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) CHARACTER SET utf8 NOT NULL,
  `s_data` longtext CHARACTER SET utf8 NOT NULL,
  `s_time` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_guanjianci_cache
-- ----------------------------
BEGIN;
INSERT INTO `cmf_guanjianci_cache` VALUES (1, 'www.alizhizhuchi.com', '{\"errcode\":\"0\",\"errmsg\":\"\",\"data\":{\"total\":7,\"page_count\":1,\"page_index\":1,\"page_size\":1000,\"baidupc\":[{\"keyword\":\"阿里蜘蛛\",\"rank\":2,\"baidu_index\":45,\"page_title\":\"能做排名的云蜘蛛池_阿里蜘蛛池官方网站\",\"baidu_url\":\"http://www.baidu.com/link?url=B2Da8YdqxpJYvPT2pXUwLeHVUPNpMR5nXJ5c6x-BFIMQZLD9DyzFJGX6_kXSzZui\",\"bidword_companycount\":0,\"bidword_kwc\":0,\"bidword_pcpv\":20,\"bidword_wisepv\":0},{\"keyword\":\"蜘蛛池\",\"rank\":5,\"baidu_index\":0,\"page_title\":\"能做排名的云蜘蛛池_阿里蜘蛛池官方网站\",\"baidu_url\":\"http://www.baidu.com/link?url=1wrFcpfzNZ2S7xqZyLZ7LptRlgsXiyM34P0TPAXi3BC96k1ADpfWWsp-7tVKMgPH\",\"bidword_companycount\":0,\"bidword_kwc\":0,\"bidword_pcpv\":0,\"bidword_wisepv\":0},{\"keyword\":\"云排名平台\",\"rank\":49,\"baidu_index\":-1,\"page_title\":\"能做排名的云蜘蛛池_阿里蜘蛛池官方网站\",\"baidu_url\":\"http://www.baidu.com/link?url=mWs6oEJ7WUsvm50UrISX4-e5VJgfunbVxBMyDEa-wNYEPnQieHAgx4PNF049_28-\",\"bidword_companycount\":2,\"bidword_kwc\":3,\"bidword_pcpv\":1,\"bidword_wisepv\":0},{\"keyword\":\"阿里学院首页\",\"rank\":78,\"baidu_index\":34,\"page_title\":\"能做排名的云蜘蛛池_阿里蜘蛛池官方网站\",\"baidu_url\":\"http://www.baidu.com/link?url=SrvDNUtx79iQJ7i5U3Fc8xGT1TUcLFrq1ViK0k8wSnBuDPY5w0FgIs2wt7lfhf_V\",\"bidword_companycount\":0,\"bidword_kwc\":0,\"bidword_pcpv\":10,\"bidword_wisepv\":2},{\"keyword\":\"蜘蛛\",\"rank\":101,\"baidu_index\":3088,\"page_title\":\"\",\"baidu_url\":\"\",\"bidword_companycount\":0,\"bidword_kwc\":0,\"bidword_pcpv\":940,\"bidword_wisepv\":4100},{\"keyword\":\"阿里巴巴排名查询\",\"rank\":101,\"baidu_index\":-1,\"page_title\":\"\",\"baidu_url\":\"\",\"bidword_companycount\":1,\"bidword_kwc\":15,\"bidword_pcpv\":3,\"bidword_wisepv\":0},{\"keyword\":\"蜘蛛蜘网之前的困难\",\"rank\":101,\"baidu_index\":-1,\"page_title\":\"\",\"baidu_url\":\"\",\"bidword_companycount\":0,\"bidword_kwc\":0,\"bidword_pcpv\":0,\"bidword_wisepv\":0}]}}', 1516678658, 1516072473);
COMMIT;

-- ----------------------------
-- Table structure for cmf_guanjianci_jinci_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guanjianci_jinci_post`;
CREATE TABLE `cmf_guanjianci_jinci_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL COMMENT '类型：充值1 消费2',
  `create_time` int(11) NOT NULL COMMENT '建立时间',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cmf_guanjianci_jinci_post
-- ----------------------------
BEGIN;
INSERT INTO `cmf_guanjianci_jinci_post` VALUES (1, '禁词', 1503907846, '', 0);
INSERT INTO `cmf_guanjianci_jinci_post` VALUES (2, '玉米社', 1504676909, '', 1504677561);
INSERT INTO `cmf_guanjianci_jinci_post` VALUES (3, '玉米社', 1504876515, '', 1504876560);
INSERT INTO `cmf_guanjianci_jinci_post` VALUES (4, '蜘蛛', 1516867360, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for cmf_guanjianci_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guanjianci_post`;
CREATE TABLE `cmf_guanjianci_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL COMMENT '关键词',
  `post_url` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'url',
  `post_chushipaiming` int(11) NOT NULL COMMENT '初始排名',
  `shishipaiming` int(11) NOT NULL COMMENT '24小时排名',
  `post_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '搜索引擎 1：百度 2：搜狗 3：360',
  `is_ok` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态：0：已停止 1：运行中',
  `post_biaoti` varchar(255) NOT NULL DEFAULT '',
  `post_tianshu` int(11) NOT NULL,
  `post_zhishu` int(11) NOT NULL DEFAULT '0',
  `post_dianjicishu` varchar(10) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '建立时间',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `staus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0：暂停 1：运行',
  `txt_time0` int(11) NOT NULL DEFAULT '0',
  `txt_time1` int(11) NOT NULL DEFAULT '0',
  `txt_time2` int(11) NOT NULL DEFAULT '0',
  `txt_time3` int(11) NOT NULL DEFAULT '0',
  `txt_time4` int(11) NOT NULL DEFAULT '0',
  `txt_time5` int(11) NOT NULL DEFAULT '0',
  `txt_time6` int(11) NOT NULL DEFAULT '0',
  `txt_time7` int(11) NOT NULL DEFAULT '0',
  `txt_time8` int(11) NOT NULL DEFAULT '0',
  `txt_time9` int(11) NOT NULL DEFAULT '0',
  `txt_time10` int(11) NOT NULL DEFAULT '0',
  `txt_time11` int(11) NOT NULL DEFAULT '0',
  `txt_time12` int(11) NOT NULL DEFAULT '0',
  `txt_time13` int(11) NOT NULL DEFAULT '0',
  `txt_time14` int(11) NOT NULL DEFAULT '0',
  `txt_time15` int(11) NOT NULL DEFAULT '0',
  `txt_time16` int(11) NOT NULL DEFAULT '0',
  `txt_time17` int(11) NOT NULL DEFAULT '0',
  `txt_time18` int(11) NOT NULL DEFAULT '0',
  `txt_time19` int(11) NOT NULL DEFAULT '0',
  `txt_time20` int(11) NOT NULL DEFAULT '0',
  `txt_time21` int(11) NOT NULL DEFAULT '0',
  `txt_time22` int(11) NOT NULL DEFAULT '0',
  `txt_time23` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for cmf_guanjianci_xiangguanci_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guanjianci_xiangguanci_post`;
CREATE TABLE `cmf_guanjianci_xiangguanci_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL COMMENT '相关关键词',
  `guanjianci_id` int(11) NOT NULL COMMENT '关键词id',
  `create_time` int(11) NOT NULL COMMENT '建立时间',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for cmf_hook
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook`;
CREATE TABLE `cmf_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统钩子表';

-- ----------------------------
-- Records of cmf_hook
-- ----------------------------
BEGIN;
INSERT INTO `cmf_hook` VALUES (1, 1, 0, '应用初始化', 'app_init', 'cmf', '应用初始化');
INSERT INTO `cmf_hook` VALUES (2, 1, 0, '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `cmf_hook` VALUES (3, 1, 0, '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `cmf_hook` VALUES (4, 1, 0, '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `cmf_hook` VALUES (5, 1, 0, '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `cmf_hook` VALUES (6, 1, 0, '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `cmf_hook` VALUES (7, 1, 0, '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `cmf_hook` VALUES (8, 1, 0, '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `cmf_hook` VALUES (9, 1, 0, '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `cmf_hook` VALUES (10, 1, 0, '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `cmf_hook` VALUES (11, 1, 1, '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `cmf_hook` VALUES (12, 3, 0, '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `cmf_hook` VALUES (13, 3, 0, '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES (14, 3, 0, '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `cmf_hook` VALUES (15, 3, 0, '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `cmf_hook` VALUES (16, 3, 0, '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `cmf_hook` VALUES (17, 3, 0, '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES (18, 3, 0, '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `cmf_hook` VALUES (19, 3, 0, '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `cmf_hook` VALUES (20, 3, 0, '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `cmf_hook` VALUES (21, 3, 0, '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `cmf_hook` VALUES (22, 3, 1, '评论区', 'comment', '', '评论区');
INSERT INTO `cmf_hook` VALUES (23, 3, 1, '留言区', 'guestbook', '', '留言区');
INSERT INTO `cmf_hook` VALUES (24, 2, 0, '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `cmf_hook` VALUES (25, 4, 0, '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES (26, 4, 0, '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES (27, 2, 0, '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `cmf_hook` VALUES (28, 1, 1, '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `cmf_hook` VALUES (29, 1, 1, '登录逻辑开始之前', 'user_login_start', 'cmf', '登录逻辑开始之前');
COMMIT;

-- ----------------------------
-- Table structure for cmf_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook_plugin`;
CREATE TABLE `cmf_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(30) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of cmf_hook_plugin
-- ----------------------------
BEGIN;
INSERT INTO `cmf_hook_plugin` VALUES (2, 10000, 1, 'send_mobile_verification_code', 'AliyunMobileCode');
INSERT INTO `cmf_hook_plugin` VALUES (4, 10000, 1, 'sousuoyinqing', 'QueryList');
COMMIT;

-- ----------------------------
-- Table structure for cmf_host
-- ----------------------------
DROP TABLE IF EXISTS `cmf_host`;
CREATE TABLE `cmf_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `out_time` int(200) NOT NULL DEFAULT '0',
  `client_ip` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23673 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cmf_host
-- ----------------------------
BEGIN;
INSERT INTO `cmf_host` VALUES (1, 'ss2', 1513049402, '61.156.151.215', 0, 0, '');
INSERT INTO `cmf_host` VALUES (86, 'a2', 1516657758, '49.86.73.100', 0, 1505978642, '');
INSERT INTO `cmf_host` VALUES (14465, 'adsl1', 1506041463, '113.222.40.85', 0, 0, '');
INSERT INTO `cmf_host` VALUES (17450, 'ss1', 1506041730, '124.134.113.239', 0, 0, '');
INSERT INTO `cmf_host` VALUES (17453, 'a12', 1511622762, '115.50.173.186', 0, 1512020809, '');
INSERT INTO `cmf_host` VALUES (17471, 'a5', 1516935409, '121.225.244.127', 0, 0, '');
INSERT INTO `cmf_host` VALUES (17472, 'a6', 1516892536, '36.26.150.182', 0, 0, '');
INSERT INTO `cmf_host` VALUES (17473, 'a7', 1516935452, '106.6.115.73', 0, 0, '');
INSERT INTO `cmf_host` VALUES (23666, 'a3', 1515476597, '220.163.246.11', 0, 0, '');
INSERT INTO `cmf_host` VALUES (23672, 'z1', 1513321297, '115.215.120.214', 0, 0, '');
COMMIT;

-- ----------------------------
-- Table structure for cmf_link
-- ----------------------------
DROP TABLE IF EXISTS `cmf_link`;
CREATE TABLE `cmf_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `link_visible` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='友情链接表';

-- ----------------------------
-- Table structure for cmf_nav
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='前台导航位置表';

-- ----------------------------
-- Records of cmf_nav
-- ----------------------------
BEGIN;
INSERT INTO `cmf_nav` VALUES (1, 1, '主导航', '主导航');
INSERT INTO `cmf_nav` VALUES (2, 0, '底部导航', '');
COMMIT;

-- ----------------------------
-- Table structure for cmf_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav_menu`;
CREATE TABLE `cmf_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of cmf_nav_menu
-- ----------------------------
BEGIN;
INSERT INTO `cmf_nav_menu` VALUES (1, 1, 0, 1, 0, '首页', '', 'home', '', '0-1');
COMMIT;

-- ----------------------------
-- Table structure for cmf_option
-- ----------------------------
DROP TABLE IF EXISTS `cmf_option`;
CREATE TABLE `cmf_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of cmf_option
-- ----------------------------
BEGIN;
INSERT INTO `cmf_option` VALUES (7, 1, 'site_info', '{\"site_name\":\"\\u81ea\\u52a8\\u63a8\\u5e7f\\u7cfb\\u7edf\",\"site_seo_title\":\"\\u81ea\\u52a8\\u63a8\\u5e7f\\u7cfb\\u7edf\",\"site_seo_keywords\":\"\",\"site_seo_description\":\"\",\"site_icp\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\",\"urlmode\":\"1\",\"html_suffix\":\"\"}');
INSERT INTO `cmf_option` VALUES (8, 1, 'admin_dashboard_widgets', '[{\"name\":\"MainContributors\",\"is_system\":1},{\"name\":\"Contributors\",\"is_system\":1},{\"name\":\"CmfHub\",\"is_system\":1}]');
INSERT INTO `cmf_option` VALUES (9, 1, 'smtp_setting', '{\"from_name\":\"godwu2846\",\"from\":\"godwu2846@163.com\",\"host\":\"smtp.163.com\",\"smtp_secure\":\"\",\"port\":\"25\",\"username\":\"godwu2846@163.com\",\"password\":\"liyunpeng198520\"}');
INSERT INTO `cmf_option` VALUES (10, 1, 'email_template_verification_code', '{\"subject\":\"\\u9a8c\\u8bc1\\u7801\",\"template\":\"&lt;p&gt;&lt;span style=&quot;color: #ffb752;&quot;&gt;{$code}&lt;\\/span&gt;&lt;\\/p&gt;\"}');
INSERT INTO `cmf_option` VALUES (11, 1, 'cmf_settings', '{\"open_registration\":\"0\",\"banned_usernames\":\"\"}');
INSERT INTO `cmf_option` VALUES (12, 1, 'cdn_settings', '{\"cdn_static_root\":\"\"}');
INSERT INTO `cmf_option` VALUES (13, 1, 'admin_settings', '{\"admin_password\":\"\",\"admin_style\":\"flatadmin\"}');
INSERT INTO `cmf_option` VALUES (14, 1, 'upload_setting', '{\"max_files\":\"20\",\"chunk_size\":\"2048\",\"file_types\":{\"image\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"jpg,jpeg,png,gif,bmp4\"},\"video\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"mp4,avi,wmv,rm,rmvb,mkv\"},\"audio\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"mp3,wma,wav\"},\"file\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"txt\"}}}');
COMMIT;

-- ----------------------------
-- Table structure for cmf_pinglun_content_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_pinglun_content_post`;
CREATE TABLE `cmf_pinglun_content_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` text NOT NULL COMMENT '评论内容',
  `pinglun_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '建立时间',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for cmf_pinglun_jinci_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_pinglun_jinci_post`;
CREATE TABLE `cmf_pinglun_jinci_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL COMMENT '类型：充值1 消费2',
  `create_time` int(11) NOT NULL COMMENT '建立时间',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cmf_pinglun_jinci_post
-- ----------------------------
BEGIN;
INSERT INTO `cmf_pinglun_jinci_post` VALUES (1, '禁词', 1503907846, '', 0);
INSERT INTO `cmf_pinglun_jinci_post` VALUES (2, '玉米社', 1504676909, '', 1504677561);
INSERT INTO `cmf_pinglun_jinci_post` VALUES (3, '玉米社', 1504876515, '', 1504876560);
COMMIT;

-- ----------------------------
-- Table structure for cmf_pinglun_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_pinglun_post`;
CREATE TABLE `cmf_pinglun_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:评论 2：提问',
  `post_title` varchar(255) NOT NULL DEFAULT '',
  `post_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标题',
  `post_content` text NOT NULL COMMENT '提问内容',
  `post_content_num` int(11) NOT NULL DEFAULT '0',
  `post_fabuzhe` varchar(10) NOT NULL DEFAULT '',
  `is_dianzan` tinyint(3) NOT NULL DEFAULT '0',
  `cookie_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1：新号  2：老号',
  `post_cookie` varchar(255) NOT NULL DEFAULT '' COMMENT '提问cookie',
  `post_huidazhe` varchar(10) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '建立时间',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for cmf_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugin`;
CREATE TABLE `cmf_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='插件表';

-- ----------------------------
-- Records of cmf_plugin
-- ----------------------------
BEGIN;
INSERT INTO `cmf_plugin` VALUES (2, 1, 0, 1, 0, 'AliyunMobileCode', '阿里云云通讯短信验证码', '', '', '云鹏', '', '1.0', '阿里云云通讯短信验证码', '{\"AccessKeyId\":\"\",\"AccessKeySecret\":\"\",\"SignName\":\"\",\"TemplateCode\":\"\",\"expire_minute\":\"30\"}');
INSERT INTO `cmf_plugin` VALUES (3, 1, 0, 1, 0, 'QueryList', '必须开启', '', '', '云鹏', '', '1.0', '必须开启', '[]');
COMMIT;

-- ----------------------------
-- Table structure for cmf_portal_category
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category`;
CREATE TABLE `cmf_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章分类表';

-- ----------------------------
-- Records of cmf_portal_category
-- ----------------------------
BEGIN;
INSERT INTO `cmf_portal_category` VALUES (8, 0, 0, 1, 0, 10000, 'haha', '', '', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');
COMMIT;

-- ----------------------------
-- Table structure for cmf_portal_category_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category_post`;
CREATE TABLE `cmf_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of cmf_portal_category_post
-- ----------------------------
BEGIN;
INSERT INTO `cmf_portal_category_post` VALUES (117, 32, 8, 10000, 1);
INSERT INTO `cmf_portal_category_post` VALUES (118, 33, 8, 10000, 1);
COMMIT;

-- ----------------------------
-- Table structure for cmf_portal_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_post`;
CREATE TABLE `cmf_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `post_parent` (`parent_id`),
  KEY `post_author` (`user_id`),
  KEY `post_date` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of cmf_portal_post
-- ----------------------------
BEGIN;
INSERT INTO `cmf_portal_post` VALUES (32, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1500360354, 1500360354, 1500360340, 0, 'hahahahah', '', '', '', '&lt;p&gt;asdfsadfas&lt;br&gt;&lt;/p&gt;', NULL, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES (33, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1500401457, 1500401457, 1500401445, 1500457233, '11111', '', '', '', '&lt;p&gt;22222&lt;br&gt;&lt;/p&gt;', NULL, '{\"thumbnail\":\"\",\"template\":\"\"}');
COMMIT;

-- ----------------------------
-- Table structure for cmf_portal_tag
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag`;
CREATE TABLE `cmf_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Table structure for cmf_portal_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag_post`;
CREATE TABLE `cmf_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Table structure for cmf_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_recycle_bin`;
CREATE TABLE `cmf_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT=' 回收站';

-- ----------------------------
-- Table structure for cmf_role
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
BEGIN;
INSERT INTO `cmf_role` VALUES (1, 0, 1, 1329633709, 1329633709, 0, '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `cmf_role` VALUES (2, 0, 1, 1329633709, 1329633709, 0, '普通管理员', '权限由最高管理员分配！');
COMMIT;

-- ----------------------------
-- Table structure for cmf_role_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色对应表';

-- ----------------------------
-- Table structure for cmf_route
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='url路由表';

-- ----------------------------
-- Table structure for cmf_slide
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='幻灯片表';

-- ----------------------------
-- Records of cmf_slide
-- ----------------------------
BEGIN;
INSERT INTO `cmf_slide` VALUES (1, 1, 0, '幻灯片01', '幻灯片01');
COMMIT;

-- ----------------------------
-- Table structure for cmf_slide_item
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_item`;
CREATE TABLE `cmf_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_cid` (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of cmf_slide_item
-- ----------------------------
BEGIN;
INSERT INTO `cmf_slide_item` VALUES (1, 1, 1, 10000, '米神自动推广系统', 'admin/20171030/ae328af8a4ef9925a9c9d1eaf54abf7b.jpg', 'http://ys.itmba.cc/user/login/index.html', '', '', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for cmf_taskdjdata
-- ----------------------------
DROP TABLE IF EXISTS `cmf_taskdjdata`;
CREATE TABLE `cmf_taskdjdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `renwu_id` int(11) NOT NULL DEFAULT '0',
  `task_time` int(11) NOT NULL DEFAULT '0' COMMENT '任务时间',
  `sou` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'sogou  baidu  so',
  `key` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '搜索关键字',
  `title` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '网站标题',
  `top` int(11) NOT NULL DEFAULT '10' COMMENT '搜索前几页',
  `baidu_cookie` varchar(800) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '百度cookie',
  `create_time` int(40) NOT NULL DEFAULT '0' COMMENT '任务创建时间',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `get_host` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '任务主机名称',
  `get_host_ip` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '任务主机IP',
  `get_time` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '任务获取时间',
  `return_ip` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '点击IP',
  `return_click` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '点击是否成功 1：成功 2：失败',
  `return_time` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '点击时间',
  `return_top` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '点击第几页',
  `return_title` varchar(400) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '点击标题',
  `return_www` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for cmf_theme
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme`;
CREATE TABLE `cmf_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_theme
-- ----------------------------
BEGIN;
INSERT INTO `cmf_theme` VALUES (19, 0, 0, 0, 0, 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');
COMMIT;

-- ----------------------------
-- Table structure for cmf_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme_file`;
CREATE TABLE `cmf_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_theme_file
-- ----------------------------
BEGIN;
INSERT INTO `cmf_theme_file` VALUES (105, 0, 10, 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"name\":\"hot_articles_category_id\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"name\":\"hot_articles_category_id\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (106, 0, 10, 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (107, 0, 5, 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":0,\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":0,\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (108, 0, 10, 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (109, 0, 10, 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (110, 0, 10, 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (111, 1, 0, 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"type\":\"select\",\"value\":1,\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"type\":\"select\",\"value\":1,\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', NULL);
INSERT INTO `cmf_theme_file` VALUES (112, 1, 1, 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"\\u81ea\\u52a8\\u63a8\\u5e7f\\u7cfb\\u7edf\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"\\u63a8\\u5e7f\\u7cfb\\u7edf\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', NULL);
COMMIT;

-- ----------------------------
-- Table structure for cmf_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_third_party_user`;
CREATE TABLE `cmf_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='第三方用户表';

-- ----------------------------
-- Table structure for cmf_tixian_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_tixian_post`;
CREATE TABLE `cmf_tixian_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` int(2) NOT NULL COMMENT '类型：微信1 支付宝2 银行卡3',
  `post_jine` int(255) NOT NULL COMMENT '金额',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '建立时间',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `zhanghao` varchar(255) NOT NULL DEFAULT '' COMMENT '帐号',
  `yinhang` varchar(255) NOT NULL DEFAULT '',
  `xingming` varchar(255) NOT NULL DEFAULT '',
  `erweima` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cmf_tixian_post
-- ----------------------------
BEGIN;
INSERT INTO `cmf_tixian_post` VALUES (1, 1, 11, 0, 0, 1506757480, '', 0, 11, 'adsasd', '', '', '');
INSERT INTO `cmf_tixian_post` VALUES (2, 1, 79, 0, 0, 1506759629, '', 0, 11, '111', '', '222', 'default/20170930/e9e371edc7d3cc64b52f2ad252cff870.jpg');
INSERT INTO `cmf_tixian_post` VALUES (3, 2, 11, 0, 0, 1506760220, '', 0, 11, '22', '', '123', '');
INSERT INTO `cmf_tixian_post` VALUES (4, 1, 660, 1, 1511348468, 1507694331, '', 0, 27, '121s', '', '张青', 'default/20171011/d1fac8987ed0367e1960ba86a1392f6e.png');
COMMIT;

-- ----------------------------
-- Table structure for cmf_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user`;
CREATE TABLE `cmf_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_group` int(11) NOT NULL DEFAULT '0' COMMENT '用户级别：0：未开户 1：体验者 2：消费者 3：合伙人 4：运营中心',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `is_duizhang` tinyint(3) NOT NULL DEFAULT '0' COMMENT '队长',
  `gongsimingcheng` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `lianxiren` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `dizhi` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `wangzhi` varchar(255) NOT NULL DEFAULT '' COMMENT '网址',
  `dianhua` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `yingyezhizhaohaoma` varchar(255) NOT NULL COMMENT '营业执照号码',
  `yingyezhizhao` varchar(255) NOT NULL COMMENT '营业执照',
  `faren` varchar(255) NOT NULL COMMENT '法人',
  `lianxidianhua` varchar(255) NOT NULL COMMENT '联系电话',
  `dianziyouxiang` varchar(255) NOT NULL COMMENT '电子邮箱',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `gangwei` varchar(255) NOT NULL COMMENT '岗位',
  `qq` varchar(255) NOT NULL COMMENT 'QQ',
  `youxiang` varchar(255) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of cmf_user
-- ----------------------------
BEGIN;
INSERT INTO `cmf_user` VALUES (1, '', 1, 0, 0, 1516954249, 0, 0, 1500194836, 2, 1, 'admin', '###b1be1a3bc1f893da51a9c18a2cabf464', 'admin', '276906866@qq.com', '', '', '', '0.0.0.0', '', 0, 0, '11111', '11111111111111', 'safsafsdfdsf', 'www.baidu.com', '15888888888', '', '', '', '', '', '', '', '', '');
INSERT INTO `cmf_user` VALUES (11, '2018', 2, 0, 0, 1516981603, 1400, 41201, 1501637645, 1, 1, '2018', '###b1be1a3bc1f893da51a9c18a2cabf464', 'sssss', '', '', 'avatar/20170907/882db047d20e8bfdedfa574c1836f613.jpg', '', '0.0.0.0', '', 0, 1, '企业名称', '姓名', '地址', 'www.alizhizhuchi.com', '13013251231', '22222', 'default/20180109/96291da980dfcffbb792ae4d2da0bc00.png', '法人', '13013212354', 'afa@qq.com', '性别', '岗位', '999888', '邮箱');
COMMIT;

-- ----------------------------
-- Table structure for cmf_user_action
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_action`;
CREATE TABLE `cmf_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

-- ----------------------------
-- Table structure for cmf_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_action_log`;
CREATE TABLE `cmf_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='访问记录表';

-- ----------------------------
-- Table structure for cmf_user_fapiao_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_fapiao_post`;
CREATE TABLE `cmf_user_fapiao_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `type` int(11) NOT NULL COMMENT '发票类型：1、增值税普通发票  2、增值税专用发票',
  `jine` int(11) NOT NULL COMMENT '发票金额',
  `fapiaoname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '发票抬头',
  `lianxiren` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '发票邮寄联系人',
  `dianhua` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '发票邮寄电话',
  `youbian` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT '邮编',
  `dizhi` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '发票邮寄地址',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0：未寄出 1：已寄出',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `kuaidihao` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '快递号',
  `kuaiditype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '快递类型：手打',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cmf_user_fapiao_post
-- ----------------------------
BEGIN;
INSERT INTO `cmf_user_fapiao_post` VALUES (1, 27, 1, 121800, '玉米社', '张青', '13713577394', '518000', '深圳市龙华新区大浪街道高峰社区鹊山路口忠信路9号汇亿财富中心504、505', 1504681841, '', 0, 1, 1504681875, '51148852', '顺丰');
INSERT INTO `cmf_user_fapiao_post` VALUES (2, 27, 1, 12, '12', '12', '12', '12', '12', 1504681902, '', 0, 0, 0, '', '');
COMMIT;

-- ----------------------------
-- Table structure for cmf_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_favorite`;
CREATE TABLE `cmf_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的描述',
  `table_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户收藏表';

-- ----------------------------
-- Table structure for cmf_user_group
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_group`;
CREATE TABLE `cmf_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '会员级别名称',
  `post_jine` int(11) NOT NULL DEFAULT '0' COMMENT '所需充值金额',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `fenchengbili` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_group
-- ----------------------------
BEGIN;
INSERT INTO `cmf_user_group` VALUES (1, '体验者', 0, 1503537747, 0, '', 0);
INSERT INTO `cmf_user_group` VALUES (2, '消费者', 500000, 1503537766, 0, '', 0);
INSERT INTO `cmf_user_group` VALUES (3, '合伙人', 2000000, 1503537780, 0, '', 0);
INSERT INTO `cmf_user_group` VALUES (4, '运营中心', 50000000, 1503537794, 0, '1', 0);
INSERT INTO `cmf_user_group` VALUES (5, '管理组', 0, 1516784513, 0, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for cmf_user_jiage
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_jiage`;
CREATE TABLE `cmf_user_jiage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guanjianci` int(11) unsigned NOT NULL DEFAULT '1',
  `tiwen` int(11) unsigned NOT NULL DEFAULT '1',
  `tiwen2` int(10) unsigned NOT NULL DEFAULT '1',
  `huida` int(11) unsigned NOT NULL DEFAULT '1',
  `huida2` int(10) unsigned NOT NULL DEFAULT '1',
  `dianzan` int(11) unsigned NOT NULL DEFAULT '1',
  `dianzan2` int(10) unsigned NOT NULL DEFAULT '1',
  `shoulu` int(11) unsigned NOT NULL DEFAULT '1',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_jiage
-- ----------------------------
BEGIN;
INSERT INTO `cmf_user_jiage` VALUES (1, 1, 1, 2, 1, 2, 1, 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for cmf_user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_login_attempt`;
CREATE TABLE `cmf_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- ----------------------------
-- Table structure for cmf_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_money_log`;
CREATE TABLE `cmf_user_money_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:充值  2：消费 3：提现',
  `post_title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '标题',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `jine` int(11) NOT NULL DEFAULT '0' COMMENT '金额',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '事由',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for cmf_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_score_log`;
CREATE TABLE `cmf_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';

-- ----------------------------
-- Table structure for cmf_user_token
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_token`;
CREATE TABLE `cmf_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of cmf_user_token
-- ----------------------------
BEGIN;
INSERT INTO `cmf_user_token` VALUES (3, 1, 1532506249, 1516954249, 'acc3ab407ac591864eae94e6c46c1b8900e10ffba753e7980fe9a7b25ab5b777', 'web');
COMMIT;

-- ----------------------------
-- Table structure for cmf_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `cmf_verification_code`;
CREATE TABLE `cmf_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of cmf_verification_code
-- ----------------------------
BEGIN;
INSERT INTO `cmf_verification_code` VALUES (1, 5, 1507905086, 1507906886, '182507', '13070682430');
INSERT INTO `cmf_verification_code` VALUES (2, 2, 1507905291, 1507907091, '458813', '13792166828');
INSERT INTO `cmf_verification_code` VALUES (3, 1, 1504254051, 1504255851, '593725', '17631994252');
INSERT INTO `cmf_verification_code` VALUES (4, 1, 1504319772, 1504321572, '886428', '15153322522');
INSERT INTO `cmf_verification_code` VALUES (5, 1, 1504666077, 1504667877, '173526', '13424242635');
INSERT INTO `cmf_verification_code` VALUES (6, 1, 1504504509, 1504506309, '679611', '15111465660');
INSERT INTO `cmf_verification_code` VALUES (7, 1, 1504504788, 1504506588, '656265', '18785107274');
INSERT INTO `cmf_verification_code` VALUES (8, 1, 1505994093, 1505995893, '167401', '13098719520');
INSERT INTO `cmf_verification_code` VALUES (9, 1, 1504506403, 1504508203, '531021', '15119980666');
INSERT INTO `cmf_verification_code` VALUES (10, 2, 1504507122, 1504508922, '980499', '13365368616');
INSERT INTO `cmf_verification_code` VALUES (11, 1, 1504510437, 1504512237, '414511', '17605981636');
INSERT INTO `cmf_verification_code` VALUES (12, 1, 1504516784, 1504518584, '457000', '18148736526');
INSERT INTO `cmf_verification_code` VALUES (13, 1, 1504852768, 1504854568, '258999', '18610477433');
INSERT INTO `cmf_verification_code` VALUES (14, 1, 1504588793, 1504590593, '541458', '13770097207');
INSERT INTO `cmf_verification_code` VALUES (15, 1, 1512546805, 1512548605, '124581', '13713577394');
INSERT INTO `cmf_verification_code` VALUES (16, 2, 1511253969, 1511255769, '227935', '18148517277');
INSERT INTO `cmf_verification_code` VALUES (17, 1, 1504679822, 1504681622, '389956', '15083532570');
INSERT INTO `cmf_verification_code` VALUES (18, 1, 1504679917, 1504681717, '115133', '15775979058');
INSERT INTO `cmf_verification_code` VALUES (19, 1, 1504833770, 1504835570, '271469', '18758065423');
INSERT INTO `cmf_verification_code` VALUES (20, 1, 1505133365, 1505135165, '240048', '17374688432');
INSERT INTO `cmf_verification_code` VALUES (21, 1, 1505913675, 1505915475, '785382', '13761159311');
INSERT INTO `cmf_verification_code` VALUES (22, 1, 1506086565, 1506088365, '876953', '13626194906');
INSERT INTO `cmf_verification_code` VALUES (23, 1, 1507885792, 1507887592, '391247', '13076901443');
INSERT INTO `cmf_verification_code` VALUES (24, 1, 1511249908, 1511251708, '435192', '13510135913');
INSERT INTO `cmf_verification_code` VALUES (25, 1, 1507885821, 1507887621, '304922', '13049482968');
INSERT INTO `cmf_verification_code` VALUES (26, 1, 1507896673, 1507898473, '131365', '13662658996');
INSERT INTO `cmf_verification_code` VALUES (27, 1, 1508056483, 1508058283, '217498', '17620480099');
INSERT INTO `cmf_verification_code` VALUES (28, 1, 1512454874, 1512456674, '715756', '13590231598');
INSERT INTO `cmf_verification_code` VALUES (29, 1, 1508124953, 1508126753, '131256', '13570801057');
INSERT INTO `cmf_verification_code` VALUES (30, 2, 1508056577, 1508058377, '832238', '18565686987');
INSERT INTO `cmf_verification_code` VALUES (31, 1, 1508062287, 1508064087, '696145', '13534249833');
INSERT INTO `cmf_verification_code` VALUES (32, 2, 1508065777, 1508067577, '702188', '13316933098');
INSERT INTO `cmf_verification_code` VALUES (33, 1, 1508120021, 1508121821, '537228', '18926540096');
INSERT INTO `cmf_verification_code` VALUES (34, 1, 1508121987, 1508123787, '371774', '18682026561');
INSERT INTO `cmf_verification_code` VALUES (35, 1, 1508147958, 1508149758, '438928', '13713939588');
INSERT INTO `cmf_verification_code` VALUES (36, 4, 1508206543, 1508208343, '778213', '13428755095');
INSERT INTO `cmf_verification_code` VALUES (37, 1, 1508206118, 1508207918, '417724', '13923766484');
INSERT INTO `cmf_verification_code` VALUES (38, 1, 1508298038, 1508299838, '803317', '18476654586');
INSERT INTO `cmf_verification_code` VALUES (39, 1, 1509184328, 1509186128, '951193', '13437847537');
INSERT INTO `cmf_verification_code` VALUES (40, 3, 1511242515, 1511244315, '316265', '13535035395');
INSERT INTO `cmf_verification_code` VALUES (41, 1, 1512270840, 1512272640, '215850', '13676295862');
INSERT INTO `cmf_verification_code` VALUES (42, 1, 1509332945, 1509334745, '723803', '18822891905');
INSERT INTO `cmf_verification_code` VALUES (43, 1, 1509333079, 1509334879, '427502', '13244885014');
INSERT INTO `cmf_verification_code` VALUES (44, 1, 1509358458, 1509360258, '900024', '18874898886');
INSERT INTO `cmf_verification_code` VALUES (45, 1, 1509371776, 1509373576, '511959', '13168766895');
INSERT INTO `cmf_verification_code` VALUES (46, 1, 1509422300, 1509424100, '135623', '18622312015');
INSERT INTO `cmf_verification_code` VALUES (47, 1, 1509789978, 1509791778, '599191', '18664550396');
INSERT INTO `cmf_verification_code` VALUES (48, 1, 1509789998, 1509791798, '917877', '13824321599');
INSERT INTO `cmf_verification_code` VALUES (49, 1, 1510020662, 1510022462, '785272', '18260153604');
INSERT INTO `cmf_verification_code` VALUES (50, 1, 1511338773, 1511340573, '495837', '18607310466');
INSERT INTO `cmf_verification_code` VALUES (51, 1, 1516775153, 1516776953, '254193', '13518186377');
INSERT INTO `cmf_verification_code` VALUES (52, 1, 1510463726, 1510465526, '254083', '18054444444');
INSERT INTO `cmf_verification_code` VALUES (53, 1, 1511430420, 1511432220, '371554', '18588820355');
INSERT INTO `cmf_verification_code` VALUES (54, 1, 1510470418, 1510472218, '448678', '17773258555');
INSERT INTO `cmf_verification_code` VALUES (55, 1, 1510470614, 1510472414, '751351', '13037322998');
INSERT INTO `cmf_verification_code` VALUES (56, 1, 1510470741, 1510472541, '591555', '13278862288');
INSERT INTO `cmf_verification_code` VALUES (57, 1, 1510479338, 1510481138, '563540', '15580010999');
INSERT INTO `cmf_verification_code` VALUES (58, 1, 1510483849, 1510485649, '182672', '18992868256');
INSERT INTO `cmf_verification_code` VALUES (59, 1, 1511969743, 1511971543, '222827', '15818680257');
INSERT INTO `cmf_verification_code` VALUES (60, 1, 1510553071, 1510554871, '103268', '18621198090');
INSERT INTO `cmf_verification_code` VALUES (61, 1, 1510561601, 1510563401, '934136', '18604356250');
INSERT INTO `cmf_verification_code` VALUES (62, 1, 1510674821, 1510676621, '908483', '13600241756');
INSERT INTO `cmf_verification_code` VALUES (63, 1, 1510711703, 1510713503, '504022', '13264958695');
INSERT INTO `cmf_verification_code` VALUES (64, 1, 1510717902, 1510719702, '470596', '15820772225');
INSERT INTO `cmf_verification_code` VALUES (65, 1, 1511677458, 1511679258, '536431', '18948289700');
INSERT INTO `cmf_verification_code` VALUES (66, 1, 1510809797, 1510811597, '544699', '13718150665');
INSERT INTO `cmf_verification_code` VALUES (67, 1, 1511191052, 1511192852, '326373', '13288880528');
INSERT INTO `cmf_verification_code` VALUES (68, 1, 1510845501, 1510847301, '936196', '15717922717');
INSERT INTO `cmf_verification_code` VALUES (69, 1, 1510845585, 1510847385, '452276', '15617922717');
INSERT INTO `cmf_verification_code` VALUES (70, 1, 1510883431, 1510885231, '400064', '17665191371');
INSERT INTO `cmf_verification_code` VALUES (71, 1, 1510894470, 1510896270, '222827', '15555551143');
INSERT INTO `cmf_verification_code` VALUES (72, 1, 1510907498, 1510909298, '894174', '18722592661');
INSERT INTO `cmf_verification_code` VALUES (73, 1, 1511021020, 1511022820, '262872', '15712029553');
INSERT INTO `cmf_verification_code` VALUES (74, 1, 1511154920, 1511156720, '137628', '13662266667');
INSERT INTO `cmf_verification_code` VALUES (75, 1, 1511156655, 1511158455, '259411', '18520111606');
INSERT INTO `cmf_verification_code` VALUES (76, 1, 1511160648, 1511162448, '576751', '13902476716');
INSERT INTO `cmf_verification_code` VALUES (77, 1, 1511170761, 1511172561, '776620', '13602585716');
INSERT INTO `cmf_verification_code` VALUES (78, 1, 1511173370, 1511175170, '445904', '13434106253');
INSERT INTO `cmf_verification_code` VALUES (79, 1, 1511187949, 1511189749, '567605', '15116290001');
INSERT INTO `cmf_verification_code` VALUES (80, 1, 1511419299, 1511421099, '439230', '13265084418');
INSERT INTO `cmf_verification_code` VALUES (81, 1, 1511188000, 1511189800, '946221', '13611441554');
INSERT INTO `cmf_verification_code` VALUES (82, 2, 1511188289, 1511190089, '943887', '13650746134');
INSERT INTO `cmf_verification_code` VALUES (83, 1, 1511189490, 1511191290, '888543', '15807412888');
INSERT INTO `cmf_verification_code` VALUES (84, 1, 1511189664, 1511191464, '883682', '15675879555');
INSERT INTO `cmf_verification_code` VALUES (85, 2, 1511242259, 1511244059, '769644', '18664532656');
INSERT INTO `cmf_verification_code` VALUES (86, 1, 1511242141, 1511243941, '966574', '13608008191');
INSERT INTO `cmf_verification_code` VALUES (87, 1, 1511250158, 1511251958, '344775', '18603040072');
INSERT INTO `cmf_verification_code` VALUES (88, 1, 1511252662, 1511254462, '429452', '13670663896');
INSERT INTO `cmf_verification_code` VALUES (89, 1, 1511274136, 1511275936, '727731', '18917748080');
INSERT INTO `cmf_verification_code` VALUES (90, 2, 1511348335, 1511350135, '947897', '13692167071');
INSERT INTO `cmf_verification_code` VALUES (91, 1, 1511425666, 1511427466, '718667', '13265550289');
INSERT INTO `cmf_verification_code` VALUES (92, 1, 1511426040, 1511427840, '941058', '18680331568');
INSERT INTO `cmf_verification_code` VALUES (93, 1, 1511426659, 1511428459, '879040', '18301736686');
INSERT INTO `cmf_verification_code` VALUES (94, 1, 1511427555, 1511429355, '465927', '13424245794');
INSERT INTO `cmf_verification_code` VALUES (95, 1, 1511434527, 1511436327, '523358', '15559987863');
INSERT INTO `cmf_verification_code` VALUES (96, 1, 1511435831, 1511437631, '787963', '17761611108');
INSERT INTO `cmf_verification_code` VALUES (97, 1, 1511435862, 1511437662, '486608', '15799078818');
INSERT INTO `cmf_verification_code` VALUES (98, 1, 1511451054, 1511452854, '361364', '15813830598');
INSERT INTO `cmf_verification_code` VALUES (99, 1, 1511493429, 1511495229, '395806', '13025562483');
INSERT INTO `cmf_verification_code` VALUES (100, 1, 1515640694, 1515642494, '469909', '18025376526');
INSERT INTO `cmf_verification_code` VALUES (101, 1, 1511592520, 1511594320, '369906', '13714675953');
INSERT INTO `cmf_verification_code` VALUES (102, 1, 1511593073, 1511594873, '607266', '13316569998');
INSERT INTO `cmf_verification_code` VALUES (103, 1, 1511600836, 1511602636, '322692', '13713779399');
INSERT INTO `cmf_verification_code` VALUES (104, 2, 1514855722, 1514857522, '614242', '18038118510');
INSERT INTO `cmf_verification_code` VALUES (105, 1, 1511795853, 1511797653, '720562', '17722698796');
INSERT INTO `cmf_verification_code` VALUES (106, 1, 1511919676, 1511921476, '665109', '15972282037');
INSERT INTO `cmf_verification_code` VALUES (107, 1, 1511926560, 1511928360, '933258', '13790670429');
INSERT INTO `cmf_verification_code` VALUES (108, 1, 1512025465, 1512027265, '164160', '18664435927');
INSERT INTO `cmf_verification_code` VALUES (109, 2, 1512032094, 1512033894, '110574', '18825416213');
INSERT INTO `cmf_verification_code` VALUES (110, 1, 1512029076, 1512030876, '768435', '15902293838');
INSERT INTO `cmf_verification_code` VALUES (111, 3, 1512124526, 1512126326, '833062', '18927498754');
INSERT INTO `cmf_verification_code` VALUES (112, 1, 1512731123, 1512732923, '625421', '13244759068');
INSERT INTO `cmf_verification_code` VALUES (113, 1, 1512124376, 1512126176, '639044', '13576901443');
INSERT INTO `cmf_verification_code` VALUES (114, 1, 1512301970, 1512303770, '108102', '13725515827');
INSERT INTO `cmf_verification_code` VALUES (115, 1, 1512415156, 1512416956, '620806', '17776670310');
INSERT INTO `cmf_verification_code` VALUES (116, 1, 1512451913, 1512453713, '243701', '18819389998');
INSERT INTO `cmf_verification_code` VALUES (117, 2, 1512455439, 1512457239, '280477', '13689504943');
INSERT INTO `cmf_verification_code` VALUES (118, 1, 1512466728, 1512468528, '449172', '13798465654');
INSERT INTO `cmf_verification_code` VALUES (119, 1, 1512474735, 1512476535, '453842', '15017900366');
INSERT INTO `cmf_verification_code` VALUES (120, 1, 1512535139, 1512536939, '817874', '13560785558');
INSERT INTO `cmf_verification_code` VALUES (121, 2, 1513133748, 1513135548, '595675', '13510000555');
INSERT INTO `cmf_verification_code` VALUES (122, 1, 1512702956, 1512704756, '697546', '15011888890');
INSERT INTO `cmf_verification_code` VALUES (123, 1, 1513059632, 1513061432, '867834', '15818638093');
INSERT INTO `cmf_verification_code` VALUES (124, 1, 1513059728, 1513061528, '686038', '13510135861');
INSERT INTO `cmf_verification_code` VALUES (125, 1, 1513079623, 1513081423, '379711', '13169060005');
INSERT INTO `cmf_verification_code` VALUES (126, 1, 1513128321, 1513130121, '538629', '13580467687');
INSERT INTO `cmf_verification_code` VALUES (127, 1, 1513144885, 1513146685, '924166', '13689551070');
INSERT INTO `cmf_verification_code` VALUES (128, 1, 1513152949, 1513154749, '292864', '13726276008');
INSERT INTO `cmf_verification_code` VALUES (129, 1, 1513173233, 1513175033, '552581', '18022359447');
INSERT INTO `cmf_verification_code` VALUES (130, 1, 1513215448, 1513217248, '903347', '13902459472');
INSERT INTO `cmf_verification_code` VALUES (131, 1, 1513221987, 1513223787, '810787', '18998934152');
INSERT INTO `cmf_verification_code` VALUES (132, 2, 1513224281, 1513226081, '261718', '18566236460');
INSERT INTO `cmf_verification_code` VALUES (133, 1, 1513348034, 1513349834, '751873', '18763973777');
INSERT INTO `cmf_verification_code` VALUES (134, 1, 1513654482, 1513656282, '922491', '15012617341');
INSERT INTO `cmf_verification_code` VALUES (135, 1, 1513731609, 1513733409, '346505', '18373366111');
INSERT INTO `cmf_verification_code` VALUES (136, 1, 1514167062, 1514168862, '656759', '18156768781');
INSERT INTO `cmf_verification_code` VALUES (137, 1, 1513830650, 1513832450, '842648', '18038021697');
INSERT INTO `cmf_verification_code` VALUES (138, 1, 1513830655, 1513832455, '292041', '13316920975');
INSERT INTO `cmf_verification_code` VALUES (139, 1, 1513830672, 1513832472, '863000', '18902469097');
INSERT INTO `cmf_verification_code` VALUES (140, 1, 1513830679, 1513832479, '884753', '13537623461');
INSERT INTO `cmf_verification_code` VALUES (141, 1, 1513830682, 1513832482, '175009', '13630533142');
INSERT INTO `cmf_verification_code` VALUES (142, 1, 1513830726, 1513832526, '142160', '13923091269');
INSERT INTO `cmf_verification_code` VALUES (143, 1, 1513830746, 1513832546, '687603', '18664828832');
INSERT INTO `cmf_verification_code` VALUES (144, 1, 1513830747, 1513832547, '736904', '13530533142');
INSERT INTO `cmf_verification_code` VALUES (145, 3, 1513851183, 1513852983, '337854', '13940067469');
INSERT INTO `cmf_verification_code` VALUES (146, 1, 1513934257, 1513936057, '858743', '18284050995');
INSERT INTO `cmf_verification_code` VALUES (147, 1, 1514085508, 1514087308, '692904', '15119247696');
INSERT INTO `cmf_verification_code` VALUES (148, 2, 1514164618, 1514166418, '165478', '13826532532');
INSERT INTO `cmf_verification_code` VALUES (149, 1, 1514259718, 1514261518, '347961', '17051127104');
INSERT INTO `cmf_verification_code` VALUES (150, 2, 1514260426, 1514262226, '152789', '17600444407');
INSERT INTO `cmf_verification_code` VALUES (151, 3, 1514473126, 1514474926, '587957', '17666661985');
INSERT INTO `cmf_verification_code` VALUES (152, 1, 1514526260, 1514528060, '124636', '13824311391');
INSERT INTO `cmf_verification_code` VALUES (153, 2, 1514541910, 1514543710, '536459', '18038086821');
INSERT INTO `cmf_verification_code` VALUES (154, 2, 1514549419, 1514551219, '449200', '13555836383');
INSERT INTO `cmf_verification_code` VALUES (155, 1, 1514549514, 1514551314, '280752', '13555836283');
INSERT INTO `cmf_verification_code` VALUES (156, 1, 1514688644, 1514690444, '307394', '18665925501');
INSERT INTO `cmf_verification_code` VALUES (157, 1, 1514864466, 1514866266, '596939', '13603082758');
INSERT INTO `cmf_verification_code` VALUES (158, 1, 1514946447, 1514948247, '111563', '13510946601');
INSERT INTO `cmf_verification_code` VALUES (159, 1, 1516587739, 1516589539, '109613', '13717093069');
INSERT INTO `cmf_verification_code` VALUES (160, 1, 1514877160, 1514878960, '244442', '18065268989');
INSERT INTO `cmf_verification_code` VALUES (161, 1, 1514880218, 1514882018, '627316', '18122359994');
INSERT INTO `cmf_verification_code` VALUES (162, 1, 1516587835, 1516589635, '252407', '13078683309');
INSERT INTO `cmf_verification_code` VALUES (163, 1, 1514963913, 1514965713, '354800', '15766022030');
INSERT INTO `cmf_verification_code` VALUES (164, 2, 1514964901, 1514966701, '534564', '13823220819');
INSERT INTO `cmf_verification_code` VALUES (165, 1, 1514988638, 1514990438, '490206', '13104756268');
INSERT INTO `cmf_verification_code` VALUES (166, 1, 1515048908, 1515050708, '291052', '18156768780');
INSERT INTO `cmf_verification_code` VALUES (167, 1, 1515057058, 1515058858, '111837', '13714378895');
INSERT INTO `cmf_verification_code` VALUES (168, 1, 1515118400, 1515120200, '842868', '18867174677');
INSERT INTO `cmf_verification_code` VALUES (169, 1, 1515126250, 1515128050, '463784', '13510080340');
INSERT INTO `cmf_verification_code` VALUES (170, 1, 1515502150, 1515503950, '341122', '18196361709');
COMMIT;

-- ----------------------------
-- Table structure for cmf_zhidaobaiducook
-- ----------------------------
DROP TABLE IF EXISTS `cmf_zhidaobaiducook`;
CREATE TABLE `cmf_zhidaobaiducook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '账号类型',
  `baidu_cookie` varchar(500) CHARACTER SET utf8 NOT NULL,
  `cookie_md5` varchar(100) CHARACTER SET utf8 NOT NULL,
  `cookie_fail` int(100) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for cmf_zhidaotaskdata
-- ----------------------------
DROP TABLE IF EXISTS `cmf_zhidaotaskdata`;
CREATE TABLE `cmf_zhidaotaskdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `pinglun_id` int(11) NOT NULL DEFAULT '0',
  `content_id` int(11) NOT NULL DEFAULT '0',
  `is_ok` tinyint(4) NOT NULL DEFAULT '0',
  `zhidao` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'tw:提问  hd:回答',
  `title` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '提问标题',
  `get_url` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '回答url',
  `content` varchar(1000) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '回答内容',
  `baidu_cookie` varchar(1000) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '评论cookie',
  `get_host` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `get_host_ip` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `get_host_time` int(100) NOT NULL DEFAULT '0',
  `return_code` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '状态',
  `return_err` text NOT NULL COMMENT '原因',
  `return_url` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'url地址',
  `return_img` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '回答图片地址   /get_task/',
  `return_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '任务建立时间',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for cmf_zhizhuchi_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_zhizhuchi_post`;
CREATE TABLE `cmf_zhizhuchi_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL DEFAULT '',
  `post_url_num` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `post_tianshu` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmf_zhizhuchi_url
-- ----------------------------
DROP TABLE IF EXISTS `cmf_zhizhuchi_url`;
CREATE TABLE `cmf_zhizhuchi_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL DEFAULT '',
  `renwu_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
