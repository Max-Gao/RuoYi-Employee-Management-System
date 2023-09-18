package com.ruoyi.project.system.domain;

import com.ruoyi.framework.web.domain.BaseEntity;

public class SysPermission extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;

    private String permissionName;

    private String permissionCode;

    private String permissionType;

    private String moduleName;

    private Long parentId;

    private Integer orderNum;

    private String status;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getPermissionName()
    {
        return permissionName;
    }

    public void setPermissionName(String permissionName)
    {
        this.permissionName = permissionName;
    }

    public String getPermissionCode()
    {
        return permissionCode;
    }

    public void setPermissionCode(String permissionCode)
    {
        this.permissionCode = permissionCode;
    }

    public String getPermissionType()
    {
        return permissionType;
    }

    public void setPermissionType(String permissionType)
    {
        this.permissionType = permissionType;
    }

    public String getModuleName()
    {
        return moduleName;
    }

    public void setModuleName(String moduleName)
    {
        this.moduleName = moduleName;
    }

    public Long getParentId()
    {
        return parentId;
    }

    public void setParentId(Long parentId)
    {
        this.parentId = parentId;
    }

    public Integer getOrderNum()
    {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum)
    {
        this.orderNum = orderNum;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }
}
