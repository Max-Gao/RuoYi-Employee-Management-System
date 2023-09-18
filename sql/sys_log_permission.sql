-- ==============================================
-- 日志管理和权限管理表结构
-- ==============================================

-- 操作日志表 sys_oper_log
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT 0 COMMENT '业务类型（0=其他 1=新增 2=修改 3=删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT 0 COMMENT '操作类别（0=其它 1=后台用户 2=手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志表';

-- 登录日志表 sys_login_log
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问id',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- 权限表 sys_permission
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_name` varchar(50) NOT NULL COMMENT '权限名称',
  `permission_code` varchar(100) NOT NULL COMMENT '权限标识',
  `permission_type` char(1) DEFAULT '1' COMMENT '权限类型（1=菜单 2=按钮 3=接口）',
  `module_name` varchar(50) DEFAULT '' COMMENT '所属模块',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父权限ID',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

-- 权限关联角色表 sys_permission_role
DROP TABLE IF EXISTS `sys_permission_role`;
CREATE TABLE `sys_permission_role` (
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`permission_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限和角色关联表';

-- ==============================================
-- 测试数据
-- ==============================================

-- 操作日志测试数据
INSERT INTO `sys_oper_log` VALUES (1, '用户管理', 1, 'addUser', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"userName\":\"test\",\"nickName\":\"测试用户\"}', '{\"userId\":100}', 0, '', '2024-01-15 09:30:00', 125);
INSERT INTO `sys_oper_log` VALUES (2, '用户管理', 2, 'updateUser', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"userId\":2,\"nickName\":\"修改后的昵称\"}', '{\"userId\":2}', 0, '', '2024-01-15 10:15:00', 89);
INSERT INTO `sys_oper_log` VALUES (3, '用户管理', 3, 'deleteUser', 'DELETE', 1, 'admin', '研发部门', '/system/user/3', '127.0.0.1', '内网IP', '{\"userIds\":[3]}', '{\"code\":200}', 0, '', '2024-01-15 11:20:00', 156);
INSERT INTO `sys_oper_log` VALUES (4, '角色管理', 1, 'addRole', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"roleName\":\"测试角色\",\"roleKey\":\"test\"}', '{\"roleId\":10}', 0, '', '2024-01-15 14:00:00', 78);
INSERT INTO `sys_oper_log` VALUES (5, '角色管理', 2, 'updateRole', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"roleId\":2,\"roleName\":\"修改角色\"}', '{\"code\":200}', 0, '', '2024-01-15 15:30:00', 95);
INSERT INTO `sys_oper_log` VALUES (6, '部门管理', 1, 'addDept', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"新部门\"}', '{\"deptId\":110}', 0, '', '2024-01-16 09:00:00', 110);
INSERT INTO `sys_oper_log` VALUES (7, '菜单管理', 2, 'updateMenu', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"menuId\":100,\"menuName\":\"用户管理\"}', '{\"code\":200}', 0, '', '2024-01-16 10:30:00', 68);
INSERT INTO `sys_oper_log` VALUES (8, '系统配置', 2, 'updateConfig', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"sys.index.skinName\",\"configValue\":\"skin-green\"}', '{\"code\":200}', 0, '', '2024-01-16 14:20:00', 45);
INSERT INTO `sys_oper_log` VALUES (9, '字典管理', 1, 'addDict', 'POST', 1, 'admin', '研发部门', '/system/dict', '127.0.0.1', '内网IP', '{\"dictName\":\"测试字典\"}', '{\"dictId\":20}', 0, '', '2024-01-17 09:15:00', 130);
INSERT INTO `sys_oper_log` VALUES (10, '公告管理', 3, 'deleteNotice', 'DELETE', 1, 'admin', '研发部门', '/system/notice/5', '127.0.0.1', '内网IP', '{\"noticeId\":5}', '{\"code\":200}', 0, '', '2024-01-17 11:00:00', 88);
INSERT INTO `sys_oper_log` VALUES (11, '用户管理', 4, 'listUser', 'GET', 1, 'admin', '研发部门', '/system/user/list', '127.0.0.1', '内网IP', '{\"pageNum\":1,\"pageSize\":10}', '{\"rows\":[],\"total\":0}', 0, '', '2024-01-17 14:30:00', 230);
INSERT INTO `sys_oper_log` VALUES (12, '角色管理', 4, 'listRole', 'GET', 1, 'admin', '研发部门', '/system/role/list', '127.0.0.1', '内网IP', '{\"pageNum\":1,\"pageSize\":10}', '{\"rows\":[],\"total\":0}', 0, '', '2024-01-17 15:00:00', 180);
INSERT INTO `sys_oper_log` VALUES (13, '系统监控', 4, 'getServerInfo', 'GET', 1, 'admin', '研发部门', '/monitor/server', '127.0.0.1', '内网IP', '{}', '{\"cpu\":{\"usage\":45}}', 0, '', '2024-01-18 09:00:00', 320);
INSERT INTO `sys_oper_log` VALUES (14, '用户管理', 1, 'exportUser', 'GET', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"ids\":[]}', '{\"msg\":\"导出成功\"}', 0, '', '2024-01-18 10:30:00', 520);
INSERT INTO `sys_oper_log` VALUES (15, '数据导出', 1, 'exportData', 'POST', 1, 'admin', '研发部门', '/system/export', '127.0.0.1', '内网IP', '{\"type\":\"excel\"}', '{\"fileName\":\"export.xlsx\"}', 0, '', '2024-01-18 14:00:00', 1250);

-- 登录日志测试数据
INSERT INTO `sys_login_log` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 120', 'Windows 11', '0', '登录成功', '2024-01-15 08:30:00');
INSERT INTO `sys_login_log` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 120', 'Windows 11', '0', '登录成功', '2024-01-15 13:20:00');
INSERT INTO `sys_login_log` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Firefox 121', 'Windows 10', '0', '登录成功', '2024-01-15 16:45:00');
INSERT INTO `sys_login_log` VALUES (4, 'ry', '192.168.1.100', '北京市', 'Safari 17', 'macOS', '0', '登录成功', '2024-01-16 09:00:00');
INSERT INTO `sys_login_log` VALUES (5, 'test', '192.168.1.101', '上海市', 'Edge 120', 'Windows 11', '0', '登录成功', '2024-01-16 10:15:00');
INSERT INTO `sys_login_log` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 120', 'Windows 11', '0', '登录成功', '2024-01-16 14:30:00');
INSERT INTO `sys_login_log` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 120', 'Windows 11', '0', '登录成功', '2024-01-17 08:00:00');
INSERT INTO `sys_login_log` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 120', 'Windows 11', '0', '登录成功', '2024-01-17 13:45:00');
INSERT INTO `sys_login_log` VALUES (9, 'wronguser', '192.168.1.105', '广州市', 'Chrome 120', 'Windows 11', '1', '用户不存在', '2024-01-17 15:30:00');
INSERT INTO `sys_login_log` VALUES (10, 'admin', '192.168.1.106', '深圳市', 'Chrome 120', 'Windows 11', '1', '密码错误', '2024-01-17 16:00:00');
INSERT INTO `sys_login_log` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 120', 'Windows 11', '0', '登录成功', '2024-01-18 08:30:00');
INSERT INTO `sys_login_log` VALUES (12, 'ry', '192.168.1.110', '杭州市', 'Safari 17', 'macOS', '0', '登录成功', '2024-01-18 09:30:00');
INSERT INTO `sys_login_log` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome 120', 'Windows 11', '0', '登录成功', '2024-01-18 10:00:00');
INSERT INTO `sys_login_log` VALUES (14, 'dev', '192.168.1.115', '成都市', 'Firefox 121', 'Ubuntu', '0', '登录成功', '2024-01-18 11:20:00');
INSERT INTO `sys_login_log` VALUES (15, 'test', '192.168.1.120', '南京市', 'Edge 120', 'Windows 11', '0', '登录成功', '2024-01-18 14:00:00');

-- 权限测试数据
INSERT INTO `sys_permission` VALUES (1, '用户管理', 'system:user:list', 2, '系统管理', 0, 1, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '用户列表权限');
INSERT INTO `sys_permission` VALUES (2, '用户新增', 'system:user:add', 2, '系统管理', 0, 2, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '新增用户权限');
INSERT INTO `sys_permission` VALUES (3, '用户修改', 'system:user:edit', 2, '系统管理', 0, 3, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '修改用户权限');
INSERT INTO `sys_permission` VALUES (4, '用户删除', 'system:user:remove', 2, '系统管理', 0, 4, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '删除用户权限');
INSERT INTO `sys_permission` VALUES (5, '重置密码', 'system:user:resetPwd', 2, '系统管理', 0, 5, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '重置密码权限');
INSERT INTO `sys_permission` VALUES (6, '角色管理', 'system:role:list', 2, '系统管理', 0, 6, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '角色列表权限');
INSERT INTO `sys_permission` VALUES (7, '角色新增', 'system:role:add', 2, '系统管理', 0, 7, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '新增角色权限');
INSERT INTO `sys_permission` VALUES (8, '角色修改', 'system:role:edit', 2, '系统管理', 0, 8, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '修改角色权限');
INSERT INTO `sys_permission` VALUES (9, '角色删除', 'system:role:remove', 2, '系统管理', 0, 9, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '删除角色权限');
INSERT INTO `sys_permission` VALUES (10, '菜单管理', 'system:menu:list', 2, '系统管理', 0, 10, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '菜单列表权限');
INSERT INTO `sys_permission` VALUES (11, '菜单新增', 'system:menu:add', 2, '系统管理', 0, 11, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '新增菜单权限');
INSERT INTO `sys_permission` VALUES (12, '菜单修改', 'system:menu:edit', 2, '系统管理', 0, 12, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '修改菜单权限');
INSERT INTO `sys_permission` VALUES (13, '菜单删除', 'system:menu:remove', 2, '系统管理', 0, 13, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '删除菜单权限');
INSERT INTO `sys_permission` VALUES (14, '部门管理', 'system:dept:list', 2, '系统管理', 0, 14, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '部门列表权限');
INSERT INTO `sys_permission` VALUES (15, '部门新增', 'system:dept:add', 2, '系统管理', 0, 15, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '新增部门权限');
INSERT INTO `sys_permission` VALUES (16, '部门修改', 'system:dept:edit', 2, '系统管理', 0, 16, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '修改部门权限');
INSERT INTO `sys_permission` VALUES (17, '部门删除', 'system:dept:remove', 2, '系统管理', 0, 17, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '删除部门权限');
INSERT INTO `sys_permission` VALUES (18, '岗位管理', 'system:post:list', 2, '系统管理', 0, 18, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '岗位列表权限');
INSERT INTO `sys_permission` VALUES (19, '岗位新增', 'system:post:add', 2, '系统管理', 0, 19, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '新增岗位权限');
INSERT INTO `sys_permission` VALUES (20, '岗位修改', 'system:post:edit', 2, '系统管理', 0, 20, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '修改岗位权限');
INSERT INTO `sys_permission` VALUES (21, '岗位删除', 'system:post:remove', 2, '系统管理', 0, 21, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '删除岗位权限');
INSERT INTO `sys_permission` VALUES (22, '字典查询', 'system:dict:list', 2, '系统管理', 0, 22, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '字典查询权限');
INSERT INTO `sys_permission` VALUES (23, '字典新增', 'system:dict:add', 2, '系统管理', 0, 23, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '新增字典权限');
INSERT INTO `sys_permission` VALUES (24, '字典修改', 'system:dict:edit', 2, '系统管理', 0, 24, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '修改字典权限');
INSERT INTO `sys_permission` VALUES (25, '字典删除', 'system:dict:remove', 2, '系统管理', 0, 25, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '删除字典权限');
INSERT INTO `sys_permission` VALUES (26, '配置查询', 'system:config:list', 2, '系统管理', 0, 26, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '配置查询权限');
INSERT INTO `sys_permission` VALUES (27, '配置新增', 'system:config:add', 2, '系统管理', 0, 27, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '新增配置权限');
INSERT INTO `sys_permission` VALUES (28, '配置修改', 'system:config:edit', 2, '系统管理', 0, 28, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '修改配置权限');
INSERT INTO `sys_permission` VALUES (29, '配置删除', 'system:config:remove', 2, '系统管理', 0, 29, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '删除配置权限');
INSERT INTO `sys_permission` VALUES (30, '公告查询', 'system:notice:list', 2, '系统管理', 0, 30, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '公告查询权限');
INSERT INTO `sys_permission` VALUES (31, '公告新增', 'system:notice:add', 2, '系统管理', 0, 31, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '新增公告权限');
INSERT INTO `sys_permission` VALUES (32, '公告修改', 'system:notice:edit', 2, '系统管理', 0, 32, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '修改公告权限');
INSERT INTO `sys_permission` VALUES (33, '公告删除', 'system:notice:remove', 2, '系统管理', 0, 33, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '删除公告权限');
INSERT INTO `sys_permission` VALUES (34, '用户查询API', 'system:user:query', 3, '系统接口', 0, 34, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '用户查询接口');
INSERT INTO `sys_permission` VALUES (35, '用户创建API', 'system:user:create', 3, '系统接口', 0, 35, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '用户创建接口');
INSERT INTO `sys_permission` VALUES (36, '角色查询API', 'system:role:query', 3, '系统接口', 0, 36, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '角色查询接口');
INSERT INTO `sys_permission` VALUES (37, '文件上传API', 'file:upload', 3, '文件管理', 0, 37, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '文件上传接口');
INSERT INTO `sys_permission` VALUES (38, '文件删除API', 'file:delete', 3, '文件管理', 0, 38, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '文件删除接口');
INSERT INTO `sys_permission` VALUES (39, '数据导出API', 'data:export', 3, '数据管理', 0, 39, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '数据导出接口');
INSERT INTO `sys_permission` VALUES (40, '数据导入API', 'data:import', 3, '数据管理', 0, 40, '0', 'admin', '2024-01-15 10:00:00', '', NULL, '数据导入接口');

-- 权限和角色关联
INSERT INTO `sys_permission_role` VALUES (1, 1);
INSERT INTO `sys_permission_role` VALUES (2, 1);
INSERT INTO `sys_permission_role` VALUES (3, 1);
INSERT INTO `sys_permission_role` VALUES (4, 1);
INSERT INTO `sys_permission_role` VALUES (5, 1);
INSERT INTO `sys_permission_role` VALUES (6, 1);
INSERT INTO `sys_permission_role` VALUES (7, 1);
INSERT INTO `sys_permission_role` VALUES (8, 1);
INSERT INTO `sys_permission_role` VALUES (9, 1);
INSERT INTO `sys_permission_role` VALUES (10, 1);
INSERT INTO `sys_permission_role` VALUES (11, 1);
INSERT INTO `sys_permission_role` VALUES (12, 1);
INSERT INTO `sys_permission_role` VALUES (13, 1);
INSERT INTO `sys_permission_role` VALUES (14, 1);
INSERT INTO `sys_permission_role` VALUES (15, 1);
INSERT INTO `sys_permission_role` VALUES (16, 1);
INSERT INTO `sys_permission_role` VALUES (17, 1);
INSERT INTO `sys_permission_role` VALUES (18, 1);
INSERT INTO `sys_permission_role` VALUES (19, 1);
INSERT INTO `sys_permission_role` VALUES (20, 1);
INSERT INTO `sys_permission_role` VALUES (21, 1);
INSERT INTO `sys_permission_role` VALUES (22, 1);
INSERT INTO `sys_permission_role` VALUES (23, 1);
INSERT INTO `sys_permission_role` VALUES (24, 1);
INSERT INTO `sys_permission_role` VALUES (25, 1);
INSERT INTO `sys_permission_role` VALUES (26, 1);
INSERT INTO `sys_permission_role` VALUES (27, 1);
INSERT INTO `sys_permission_role` VALUES (28, 1);
INSERT INTO `sys_permission_role` VALUES (29, 1);
INSERT INTO `sys_permission_role` VALUES (30, 1);
INSERT INTO `sys_permission_role` VALUES (31, 1);
INSERT INTO `sys_permission_role` VALUES (32, 1);
INSERT INTO `sys_permission_role` VALUES (33, 1);
INSERT INTO `sys_permission_role` VALUES (34, 1);
INSERT INTO `sys_permission_role` VALUES (35, 1);
INSERT INTO `sys_permission_role` VALUES (36, 1);
INSERT INTO `sys_permission_role` VALUES (37, 1);
INSERT INTO `sys_permission_role` VALUES (38, 1);
INSERT INTO `sys_permission_role` VALUES (39, 1);
INSERT INTO `sys_permission_role` VALUES (40, 1);
INSERT INTO `sys_permission_role` VALUES (1, 2);
INSERT INTO `sys_permission_role` VALUES (2, 2);
INSERT INTO `sys_permission_role` VALUES (3, 2);
INSERT INTO `sys_permission_role` VALUES (4, 2);
INSERT INTO `sys_permission_role` VALUES (6, 2);
INSERT INTO `sys_permission_role` VALUES (7, 2);
INSERT INTO `sys_permission_role` VALUES (8, 2);
INSERT INTO `sys_permission_role` VALUES (22, 2);
INSERT INTO `sys_permission_role` VALUES (30, 2);
