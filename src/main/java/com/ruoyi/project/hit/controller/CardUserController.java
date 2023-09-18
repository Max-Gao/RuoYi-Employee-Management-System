package com.ruoyi.project.hit.controller;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.hit.domain.CardUser;
import com.ruoyi.project.hit.domain.SystemDict;
import com.ruoyi.project.hit.service.CardUserService;
import com.ruoyi.project.hit.service.SystemDictService;
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
@RequestMapping("/hit/card")
public class CardUserController extends BaseController {

    @Resource
    private SystemDictService systemDictService;

    @Resource
    private CardUserService cardUserService;

    /**
     * 获取会员等级列表
     */
    //@PreAuthorize("@ss.hasPermi('system:post:list')")
    @GetMapping("/list")
    public TableDataInfo list(CardUser cardUser)
    {
        startPage();
        List<CardUser> list = cardUserService.selectCardUser(cardUser);
        return getDataTable(list);
    }
}
