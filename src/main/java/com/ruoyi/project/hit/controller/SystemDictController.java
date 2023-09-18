package com.ruoyi.project.hit.controller;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.hit.domain.SystemDict;
import com.ruoyi.project.hit.service.SystemDictService;
import com.ruoyi.project.system.domain.SysPost;
import com.ruoyi.project.system.service.ISysPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 会员等级列表显示
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/hit/dict")
public class SystemDictController extends BaseController {

    @Resource
    private SystemDictService systemDictService;

    /**
     * 获取会员等级列表
     */
    //@PreAuthorize("@ss.hasPermi('system:post:list')")
    @GetMapping("/list")
    public TableDataInfo list(SystemDict systemDict)
    {
        startPage();
        List<SystemDict> list = systemDictService.selectDictList(systemDict);
        return getDataTable(list);
    }

    /**
     * 新增等级
     */
    //@PreAuthorize("@ss.hasPermi('system:post:add')")
    @Log(title = "岗位管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SystemDict systemDict)
    {
        if (UserConstants.NOT_UNIQUE.equals(systemDictService.checkLevelNameUnique(systemDict)))
        {
            return AjaxResult.error("新增岗位'" + systemDict.getLevelName() + "'失败，岗位名称已存在");
        }
        else if (UserConstants.NOT_UNIQUE.equals(systemDictService.checkLevelNameUnique(systemDict)))
        {
            return AjaxResult.error("新增岗位'" + systemDict.getLevelName() + "'失败，岗位编码已存在");
        }
        //systemDict.setCreateBy(SecurityUtils.getUsername());
        return toAjax(systemDictService.insertLevel(systemDict));
    }
}
