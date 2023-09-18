-- ==============================================
-- 测试数据（ASCII兼容版本）
-- ==============================================

-- 操作日志测试数据
INSERT INTO `sys_oper_log` (`title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES 
('User Management', 1, 'addUser', 'POST', 1, 'admin', 'RD', '/system/user', '127.0.0.1', 'Local', '{"userName":"test"}', '{"userId":100}', 0, '', '2024-01-15 09:30:00', 125),
('User Management', 2, 'updateUser', 'PUT', 1, 'admin', 'RD', '/system/user', '127.0.0.1', 'Local', '{"userId":2}', '{"userId":2}', 0, '', '2024-01-15 10:15:00', 89),
('User Management', 3, 'deleteUser', 'DELETE', 1, 'admin', 'RD', '/system/user/3', '127.0.0.1', 'Local', '{"userIds":[3]}', '{"code":200}', 0, '', '2024-01-15 11:20:00', 156),
('Role Management', 1, 'addRole', 'POST', 1, 'admin', 'RD', '/system/role', '127.0.0.1', 'Local', '{"roleName":"test"}', '{"roleId":10}', 0, '', '2024-01-15 14:00:00', 78),
('Role Management', 2, 'updateRole', 'PUT', 1, 'admin', 'RD', '/system/role', '127.0.0.1', 'Local', '{"roleId":2}', '{"code":200}', 0, '', '2024-01-15 15:30:00', 95),
('Dept Management', 1, 'addDept', 'POST', 1, 'admin', 'RD', '/system/dept', '127.0.0.1', 'Local', '{"deptName":"dept"}', '{"deptId":110}', 0, '', '2024-01-16 09:00:00', 110),
('Menu Management', 2, 'updateMenu', 'PUT', 1, 'admin', 'RD', '/system/menu', '127.0.0.1', 'Local', '{"menuId":100}', '{"code":200}', 0, '', '2024-01-16 10:30:00', 68),
('System Config', 2, 'updateConfig', 'PUT', 1, 'admin', 'RD', '/system/config', '127.0.0.1', 'Local', '{"configKey":"key"}', '{"code":200}', 0, '', '2024-01-16 14:20:00', 45),
('Dict Management', 1, 'addDict', 'POST', 1, 'admin', 'RD', '/system/dict', '127.0.0.1', 'Local', '{"dictName":"test"}', '{"dictId":20}', 0, '', '2024-01-17 09:15:00', 130),
('Notice Management', 3, 'deleteNotice', 'DELETE', 1, 'admin', 'RD', '/system/notice/5', '127.0.0.1', 'Local', '{"noticeId":5}', '{"code":200}', 0, '', '2024-01-17 11:00:00', 88),
('User Management', 4, 'listUser', 'GET', 1, 'admin', 'RD', '/system/user/list', '127.0.0.1', 'Local', '{"pageNum":1}', '{"rows":[]}', 0, '', '2024-01-17 14:30:00', 230),
('Role Management', 4, 'listRole', 'GET', 1, 'admin', 'RD', '/system/role/list', '127.0.0.1', 'Local', '{"pageNum":1}', '{"rows":[]}', 0, '', '2024-01-17 15:00:00', 180);

-- 登录日志测试数据
INSERT INTO `sys_login_log` (`user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES 
('admin', '127.0.0.1', 'Local', 'Chrome 120', 'Windows 11', '0', 'Login success', '2024-01-15 08:30:00'),
('admin', '127.0.0.1', 'Local', 'Chrome 120', 'Windows 11', '0', 'Login success', '2024-01-15 13:20:00'),
('admin', '127.0.0.1', 'Local', 'Firefox 121', 'Windows 10', '0', 'Login success', '2024-01-15 16:45:00'),
('ry', '192.168.1.100', 'Beijing', 'Safari 17', 'macOS', '0', 'Login success', '2024-01-16 09:00:00'),
('test', '192.168.1.101', 'Shanghai', 'Edge 120', 'Windows 11', '0', 'Login success', '2024-01-16 10:15:00'),
('admin', '127.0.0.1', 'Local', 'Chrome 120', 'Windows 11', '0', 'Login success', '2024-01-16 14:30:00'),
('admin', '127.0.0.1', 'Local', 'Chrome 120', 'Windows 11', '0', 'Login success', '2024-01-17 08:00:00'),
('admin', '127.0.0.1', 'Local', 'Chrome 120', 'Windows 11', '0', 'Login success', '2024-01-17 13:45:00'),
('wronguser', '192.168.1.105', 'Guangzhou', 'Chrome 120', 'Windows 11', '1', 'User not found', '2024-01-17 15:30:00'),
('admin', '192.168.1.106', 'Shenzhen', 'Chrome 120', 'Windows 11', '1', 'Wrong password', '2024-01-17 16:00:00'),
('admin', '127.0.0.1', 'Local', 'Chrome 120', 'Windows 11', '0', 'Login success', '2024-01-18 08:30:00'),
('ry', '192.168.1.110', 'Hangzhou', 'Safari 17', 'macOS', '0', 'Login success', '2024-01-18 09:30:00');

-- 权限表（如果没有）
CREATE TABLE IF NOT EXISTS `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Permission ID',
  `permission_name` varchar(50) NOT NULL COMMENT 'Permission Name',
  `permission_code` varchar(100) NOT NULL COMMENT 'Permission Code',
  `permission_type` char(1) DEFAULT '1' COMMENT 'Type: 1=Menu 2=Button 3=API',
  `module_name` varchar(50) DEFAULT '' COMMENT 'Module Name',
  `parent_id` bigint(20) DEFAULT 0 COMMENT 'Parent ID',
  `order_num` int(4) DEFAULT 0 COMMENT 'Sort Order',
  `status` char(1) DEFAULT '0' COMMENT 'Status: 0=Normal 1=Disabled',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Create Time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update Time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='Permission Table';

-- 权限关联角色表（如果没有）
CREATE TABLE IF NOT EXISTS `sys_permission_role` (
  `permission_id` bigint(20) NOT NULL COMMENT 'Permission ID',
  `role_id` bigint(20) NOT NULL COMMENT 'Role ID',
  PRIMARY KEY (`permission_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Permission Role Relation';

-- 权限测试数据
INSERT INTO `sys_permission` VALUES (1, 'User List', 'system:user:list', 2, 'System', 0, 1, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'User List Permission');
INSERT INTO `sys_permission` VALUES (2, 'User Add', 'system:user:add', 2, 'System', 0, 2, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'User Add Permission');
INSERT INTO `sys_permission` VALUES (3, 'User Edit', 'system:user:edit', 2, 'System', 0, 3, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'User Edit Permission');
INSERT INTO `sys_permission` VALUES (4, 'User Delete', 'system:user:remove', 2, 'System', 0, 4, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'User Delete Permission');
INSERT INTO `sys_permission` VALUES (5, 'Role List', 'system:role:list', 2, 'System', 0, 5, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Role List Permission');
INSERT INTO `sys_permission` VALUES (6, 'Role Add', 'system:role:add', 2, 'System', 0, 6, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Role Add Permission');
INSERT INTO `sys_permission` VALUES (7, 'Role Edit', 'system:role:edit', 2, 'System', 0, 7, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Role Edit Permission');
INSERT INTO `sys_permission` VALUES (8, 'Menu List', 'system:menu:list', 2, 'System', 0, 8, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Menu List Permission');
INSERT INTO `sys_permission` VALUES (9, 'Dept List', 'system:dept:list', 2, 'System', 0, 9, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Dept List Permission');
INSERT INTO `sys_permission` VALUES (10, 'Permission List', 'system:permission:list', 2, 'System', 0, 10, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Permission List Permission');

-- 权限和角色关联
INSERT IGNORE INTO `sys_permission_role` VALUES (1, 1);
INSERT IGNORE INTO `sys_permission_role` VALUES (2, 1);
INSERT IGNORE INTO `sys_permission_role` VALUES (3, 1);
INSERT IGNORE INTO `sys_permission_role` VALUES (4, 1);
INSERT IGNORE INTO `sys_permission_role` VALUES (5, 1);
