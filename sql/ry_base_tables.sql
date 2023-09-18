-- ==============================================
-- RuoYi系统数据库表结构
-- ==============================================

-- 1. 部门表 sys_dept
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- 2. 岗位表 sys_post
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位id',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位表';

-- 3. 角色表 sys_role
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` varchar(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：所有数据权限；2：自定义数据权限；3：本部门数据权限；4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- 4. 菜单权限表 sys_menu
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父菜单id',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- 5. 用户信息表 sys_user
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '用户头像',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `salt` varchar(100) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录ip',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- 6. 用户和岗位关联表 sys_user_post
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `post_id` bigint(20) NOT NULL COMMENT '岗位id',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和岗位关联表';

-- 7. 用户和角色关联表 sys_user_role
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- 8. 角色和菜单关联表 sys_role_menu
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- 9. 角色和部门关联表 sys_role_dept
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- 10. 通知公告表 sys_notice
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` text COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- 11. 字典类型表 sys_dict_type
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- 12. 字典数据表 sys_dict_data
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` bigint(20) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格字典样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- 13. 参数配置表 sys_config
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ==============================================
-- 测试数据
-- ==============================================

-- 部门测试数据
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', '0', 'admin', '15888888888', 'admin@ruoyi.com', '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', '1', 'admin', '15888888888', 'admin@ruoyi.com', '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', '2', 'admin', '15888888888', 'admin@ruoyi.com', '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', '1', 'admin', '15888888888', 'admin@ruoyi.com', '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', '2', 'admin', '15888888888', 'admin@ruoyi.com', '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', '3', 'admin', '15888888888', 'admin@ruoyi.com', '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '运维部门', '4', 'admin', '15888888888', 'admin@ruoyi.com', '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 102, '0,100,102', '市场部门', '1', 'admin', '15888888888', 'admin@ruoyi.com', '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '财务部门', '2', 'admin', '15888888888', 'admin@ruoyi.com', '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL);

-- 岗位测试数据
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'dev', '开发人员', '3', '0', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'test', '测试人员', '4', '0', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_post` VALUES (5, 'hr', '人事专员', '5', '0', 'admin', '2018-03-16 11:33:00', '', NULL, '');

-- 角色测试数据
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', '1', '1', 1, 1, '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', '2', '2', 1, 1, '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '部门经理', 'dept_manager', '3', '3', 1, 1, '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL, '部门经理');
INSERT INTO `sys_role` VALUES (4, '项目经理', 'project_manager', '4', '3', 1, 1, '0', '0', 'admin', '2018-03-16 11:33:00', '', NULL, '项目经理');

-- 菜单测试数据
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, '1', 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2018-03-16 11:33:00', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '若依官网', 0, '1', 'http://ruoyi.vip', NULL, 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2018-03-16 11:33:00', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, '1', 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, '2', 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, '3', 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, '4', 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, '5', 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'job', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, '6', 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, '7', 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, '8', 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, '9', 'log', 'system/log/index', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1000, '用户新增', 100, '1', '', NULL, 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户修改', 100, '2', '', NULL, 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户删除', 100, '3', '', NULL, 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '重置密码', 100, '4', '', NULL, 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '角色新增', 101, '1', '', NULL, 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '角色修改', 101, '2', '', NULL, 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '角色删除', 101, '3', '', NULL, 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '菜单新增', 102, '1', '', NULL, 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '菜单修改', 102, '2', '', NULL, 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '菜单删除', 102, '3', '', NULL, 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (200, '权限管理', 1, '10', 'permission', 'system/permission/index', 1, 0, 'C', '0', '0', 'system:permission:list', 'lock', 'admin', '2018-03-16 11:33:00', '', NULL, '');

-- 用户测试数据 (密码: admin123，使用MD5+salt加密)
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'admin', '00', 'admin@ruoyi.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE/sW/ddyQV7YW', 'a2a7a9', '0', '0', '127.0.0.1', '2024-01-01 10:00:00', 'admin', '2024-01-01 10:00:00', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 104, 'ry', '若依', '00', 'ry@163.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE/sW/ddyQV7YW', 'a2a7a9', '0', '0', '127.0.0.1', '2024-01-01 10:00:00', 'admin', '2024-01-01 10:00:00', '', NULL, '测试用户');
INSERT INTO `sys_user` VALUES (3, 105, 'test', '测试员', '00', 'test@ruoyi.com', '15788888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE/sW/ddyQV7YW', 'a2a7a9', '0', '0', '127.0.0.1', '2024-01-01 10:00:00', 'admin', '2024-01-01 10:00:00', '', NULL, '测试用户');
INSERT INTO `sys_user` VALUES (4, 106, 'dev', '开发者', '00', 'dev@ruoyi.com', '15800000000', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE/sW/ddyQV7YW', 'a2a7a9', '0', '0', '127.0.0.1', '2024-01-01 10:00:00', 'admin', '2024-01-01 10:00:00', '', NULL, '开发人员');

-- 用户和岗位关联
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (1, 2);
INSERT INTO `sys_user_post` VALUES (2, 3);
INSERT INTO `sys_user_post` VALUES (3, 4);
INSERT INTO `sys_user_post` VALUES (4, 3);

-- 用户和角色关联
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 3);

-- 角色和菜单关联
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104);
INSERT INTO `sys_role_menu` VALUES (1, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 107);
INSERT INTO `sys_role_menu` VALUES (1, 108);
INSERT INTO `sys_role_menu` VALUES (1, 200);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 100);
INSERT INTO `sys_role_menu` VALUES (4, 1000);
INSERT INTO `sys_role_menu` VALUES (4, 1001);
INSERT INTO `sys_role_menu` VALUES (4, 1002);
INSERT INTO `sys_role_menu` VALUES (4, 1003);

-- 角色和部门关联
INSERT INTO `sys_role_dept` VALUES (1, 100);
INSERT INTO `sys_role_dept` VALUES (1, 101);
INSERT INTO `sys_role_dept` VALUES (1, 102);
INSERT INTO `sys_role_dept` VALUES (1, 103);
INSERT INTO `sys_role_dept` VALUES (1, 104);
INSERT INTO `sys_role_dept` VALUES (1, 105);
INSERT INTO `sys_role_dept` VALUES (1, 106);
INSERT INTO `sys_role_dept` VALUES (1, 107);
INSERT INTO `sys_role_dept` VALUES (1, 108);
INSERT INTO `sys_role_dept` VALUES (2, 103);
INSERT INTO `sys_role_dept` VALUES (3, 103);
INSERT INTO `sys_role_dept` VALUES (3, 104);
INSERT INTO `sys_role_dept` VALUES (4, 105);

-- 通知公告测试数据
INSERT INTO `sys_notice` VALUES (1, '欢迎使用若依管理系统', '1', '若依管理系统是一套基于SpringBoot+Bootstrap的快速开发平台，欢迎使用！', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '欢迎公告');
INSERT INTO `sys_notice` VALUES (2, '系统更新通知', '1', '系统将于今晚22:00进行更新维护，届时系统将暂停服务2小时，请提前做好准备工作。', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '维护通知');
INSERT INTO `sys_notice` VALUES (3, '元旦放假通知', '2', '根据国家法定节假日规定，2024年元旦放假安排如下：2024年1月1日放假，共1天。', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '放假公告');
INSERT INTO `sys_notice` VALUES (4, '安全审计通知', '1', '为保障系统安全，我们将定期进行安全审计，请各位用户不要在系统中存储敏感信息。', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '安全提醒');

-- 字典类型测试数据
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '系统是否列表');

-- 字典数据测试数据
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '男性');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '女性');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '是');
INSERT INTO `sys_dict_data` VALUES (9, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-01-01 10:00:00', '', NULL, '否');

-- 参数配置测试数据
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-01-01 10:00:00', '', NULL, '默认皮肤：蓝色、天蓝、绿色、紫色、红色、花花公子');
INSERT INTO `sys_config` VALUES (2, '用户管理-初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-01-01 10:00:00', '', NULL, '初始化默认密码');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-01-01 10:00:00', '', NULL, '默认侧边栏主题：深色、浅色');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启', 'sys.account.isRegister', 'true', 'Y', 'admin', '2024-01-01 10:00:00', '', NULL, '是否开启注册账号功能');
INSERT INTO `sys_config` VALUES (5, '主框架页-居中设置', 'sys.index.isTabNav', 'false', 'Y', 'admin', '2024-01-01 10:00:00', '', NULL, '默认开启标签页');
