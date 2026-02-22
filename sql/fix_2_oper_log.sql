-- 检查现有表结构
DESCRIBE sys_oper_log;

-- 添加 oper_id 列（如果不存在）
ALTER TABLE sys_oper_log ADD COLUMN oper_id BIGINT(20) PRIMARY KEY AUTO_INCREMENT FIRST;
