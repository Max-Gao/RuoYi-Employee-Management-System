-- 只插入权限测试数据（表已存在）

-- 权限测试数据
INSERT INTO `sys_permission` VALUES (11, 'User List', 'system:user:list', 2, 'System', 0, 1, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'User List Permission');
INSERT INTO `sys_permission` VALUES (12, 'User Add', 'system:user:add', 2, 'System', 0, 2, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'User Add Permission');
INSERT INTO `sys_permission` VALUES (13, 'User Edit', 'system:user:edit', 2, 'System', 0, 3, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'User Edit Permission');
INSERT INTO `sys_permission` VALUES (14, 'User Delete', 'system:user:remove', 2, 'System', 0, 4, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'User Delete Permission');
INSERT INTO `sys_permission` VALUES (15, 'Role List', 'system:role:list', 2, 'System', 0, 5, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Role List Permission');
INSERT INTO `sys_permission` VALUES (16, 'Role Add', 'system:role:add', 2, 'System', 0, 6, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Role Add Permission');
INSERT INTO `sys_permission` VALUES (17, 'Role Edit', 'system:role:edit', 2, 'System', 0, 7, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Role Edit Permission');
INSERT INTO `sys_permission` VALUES (18, 'Menu List', 'system:menu:list', 2, 'System', 0, 8, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Menu List Permission');
INSERT INTO `sys_permission` VALUES (19, 'Dept List', 'system:dept:list', 2, 'System', 0, 9, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Dept List Permission');
INSERT INTO `sys_permission` VALUES (20, 'Permission List', 'system:permission:list', 2, 'System', 0, 10, '0', 'admin', '2024-01-15 10:00:00', '', NULL, 'Permission List Permission');

-- 权限和角色关联
INSERT IGNORE INTO `sys_permission_role` VALUES (11, 1);
INSERT IGNORE INTO `sys_permission_role` VALUES (12, 1);
INSERT IGNORE INTO `sys_permission_role` VALUES (13, 1);
INSERT IGNORE INTO `sys_permission_role` VALUES (14, 1);
INSERT IGNORE INTO `sys_permission_role` VALUES (15, 1);
