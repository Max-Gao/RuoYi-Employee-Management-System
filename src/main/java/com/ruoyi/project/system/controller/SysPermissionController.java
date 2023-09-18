package com.ruoyi.project.system.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.domain.SysPermission;
import com.ruoyi.project.system.service.ISysPermissionService;

@RestController
@RequestMapping("/system/permission")
public class SysPermissionController extends BaseController
{
    @Autowired
    private ISysPermissionService permissionService;

    @PreAuthorize("@ss.hasPermi('system:permission:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysPermission permission)
    {
        startPage();
        List<SysPermission> list = permissionService.selectPermissionList(permission);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('system:permission:query')")
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable Long id)
    {
        return AjaxResult.success(permissionService.selectPermissionById(id));
    }

    @Log(title = "权限管理", businessType = BusinessType.INSERT)
    @PreAuthorize("@ss.hasPermi('system:permission:add')")
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysPermission permission)
    {
        return toAjax(permissionService.insertPermission(permission));
    }

    @Log(title = "权限管理", businessType = BusinessType.UPDATE)
    @PreAuthorize("@ss.hasPermi('system:permission:edit')")
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysPermission permission)
    {
        return toAjax(permissionService.updatePermission(permission));
    }

    @Log(title = "权限管理", businessType = BusinessType.DELETE)
    @PreAuthorize("@ss.hasPermi('system:permission:remove')")
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(permissionService.deletePermissionByIds(ids));
    }

    @Log(title = "权限状态修改", businessType = BusinessType.UPDATE)
    @PreAuthorize("@ss.hasPermi('system:permission:edit')")
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysPermission permission)
    {
        return toAjax(permissionService.changeStatus(permission));
    }
}
