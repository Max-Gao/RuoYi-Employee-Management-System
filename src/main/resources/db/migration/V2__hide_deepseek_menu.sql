-- Soft-hide deepseek menu entries instead of physical deletion.
-- Idempotent: repeated execution keeps the same final state.
UPDATE sys_menu
SET visible = '1',
    status = '1',
    update_time = NOW(),
    remark = CONCAT(IFNULL(remark, ''), IF(IFNULL(remark, '') = '', '', ' | '), 'hidden by flyway V2')
WHERE menu_name LIKE '%deepseek%'
   OR path LIKE '%deepseek%';
