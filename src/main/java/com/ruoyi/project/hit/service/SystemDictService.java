package com.ruoyi.project.hit.service;

import com.ruoyi.project.hit.domain.SystemDict;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 *
 */
public interface SystemDictService extends IService<SystemDict> {

    List<SystemDict> selectDictList(SystemDict systemDict);

    String checkLevelNameUnique(SystemDict systemDict);

    int insertLevel(SystemDict systemDict);
}
