package com.ruoyi.project.system.mapper;

import java.util.List;
import com.ruoyi.project.system.domain.SysPermission;

public interface SysPermissionMapper
{
    public List<SysPermission> selectPermissionList(SysPermission permission);
    
    public SysPermission selectPermissionById(Long id);
    
    public int insertPermission(SysPermission permission);
    
    public int updatePermission(SysPermission permission);
    
    public int deletePermissionByIds(Long[] ids);
}
