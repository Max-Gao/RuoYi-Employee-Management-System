package com.ruoyi.project.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.mapper.SysPermissionMapper;
import com.ruoyi.project.system.domain.SysPermission;
import com.ruoyi.project.system.service.ISysPermissionService;
import com.ruoyi.common.utils.SecurityUtils;

@Service
public class SysPermissionServiceImpl implements ISysPermissionService
{
    @Autowired
    private SysPermissionMapper permissionMapper;

    @Override
    public List<SysPermission> selectPermissionList(SysPermission permission)
    {
        return permissionMapper.selectPermissionList(permission);
    }

    @Override
    public SysPermission selectPermissionById(Long id)
    {
        return permissionMapper.selectPermissionById(id);
    }

    @Override
    public int insertPermission(SysPermission permission)
    {
        permission.setCreateBy(SecurityUtils.getUsername());
        return permissionMapper.insertPermission(permission);
    }

    @Override
    public int updatePermission(SysPermission permission)
    {
        permission.setUpdateBy(SecurityUtils.getUsername());
        return permissionMapper.updatePermission(permission);
    }

    @Override
    public int deletePermissionByIds(Long[] ids)
    {
        return permissionMapper.deletePermissionByIds(ids);
    }

    @Override
    public int changeStatus(SysPermission permission)
    {
        permission.setUpdateBy(SecurityUtils.getUsername());
        return permissionMapper.updatePermission(permission);
    }
}
