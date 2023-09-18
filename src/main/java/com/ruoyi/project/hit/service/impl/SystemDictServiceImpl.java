package com.ruoyi.project.hit.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.project.hit.domain.SystemDict;
import com.ruoyi.project.hit.service.SystemDictService;
import com.ruoyi.project.hit.mapper.SystemDictMapper;
import com.ruoyi.project.system.mapper.SysPostMapper;
import com.ruoyi.project.system.mapper.SysUserPostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 */
@Service
public class SystemDictServiceImpl extends ServiceImpl<SystemDictMapper, SystemDict>
    implements SystemDictService{

    @Autowired
    private SystemDictMapper systemDictMapper;

    @Autowired
    private SysUserPostMapper userPostMapper;

    @Override
    public List<SystemDict> selectDictList(SystemDict systemDict) {
        LambdaQueryWrapper<SystemDict> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SystemDict::getDictType,systemDict.getDictType());

        if(systemDict.getDictValue()!=null &&!systemDict.getDictValue().equals("")){
            wrapper.like(SystemDict::getDictValue,systemDict.getDictValue());
        }
        return systemDictMapper.selectList(wrapper);
    }

    @Override
    public String checkLevelNameUnique(SystemDict systemDict) {
        return null;
    }

    @Override
    public int insertLevel(SystemDict systemDict) {
        return 0;
    }
}




