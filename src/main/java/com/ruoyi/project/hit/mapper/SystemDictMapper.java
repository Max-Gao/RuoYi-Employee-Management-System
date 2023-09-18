package com.ruoyi.project.hit.mapper;

import com.ruoyi.project.hit.domain.SystemDict;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.system.domain.SysPost;

import java.util.List;

/**
 * @Entity com.ruoyi.project.hit.domain.SystemDict
 */
public interface SystemDictMapper extends BaseMapper<SystemDict> {
    /**
     * 查询等级数据集合
     *
     * @param systemDict 等级信息
     * @return 等级数据集合
     */
    public List<SystemDict> selectDictList(SystemDict systemDict);
}




