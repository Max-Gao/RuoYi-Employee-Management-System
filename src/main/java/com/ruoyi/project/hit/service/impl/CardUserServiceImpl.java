package com.ruoyi.project.hit.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.project.hit.domain.CardUser;
import com.ruoyi.project.hit.domain.SystemDict;
import com.ruoyi.project.hit.mapper.SystemDictMapper;
import com.ruoyi.project.hit.service.CardUserService;
import com.ruoyi.project.hit.mapper.CardUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 */
@Service
public class CardUserServiceImpl extends ServiceImpl<CardUserMapper, CardUser>
    implements CardUserService{

    @Autowired
    private CardUserMapper cardUserMapper;

    @Override
    public List<CardUser> selectCardUser(CardUser cardUser) {
        LambdaQueryWrapper<CardUser> wrapper = new LambdaQueryWrapper<>();


        if(cardUser.getRealname()!=null &&!cardUser.getRealname().equals("")){
            wrapper.like(CardUser::getRealname,cardUser.getRealname());
        }

        if(cardUser.getUserName()!=null &&!cardUser.getUserName().equals("")){
            wrapper.like(CardUser::getUserName,cardUser.getUserName());
        }

        if(cardUser.getIdCard()!=null &&!cardUser.getIdCard().equals("")){
            wrapper.like(CardUser::getIdCard,cardUser.getIdCard());
        }

        if(cardUser.getPhone()!=null &&!cardUser.getPhone().equals("")){
            wrapper.like(CardUser::getPhone,cardUser.getPhone());
        }

        if(cardUser.getLevel()!=null &&!cardUser.getLevel().equals("")){
            wrapper.like(CardUser::getLevel,cardUser.getLevel());
        }

        if(cardUser.getCreateTime()!=null &&!cardUser.getCreateTime().equals("")){
            wrapper.le(CardUser::getCreateTime,cardUser.getCreateTime());
        }

        if(cardUser.getCreateTime()!=null &&!cardUser.getCreateTime().equals("")){
            wrapper.lt(CardUser::getCreateTime,cardUser.getCreateTime());
        }

        if(cardUser.getUpdateTime()!=null &&!cardUser.getUpdateTime().equals("")){
            wrapper.gt(CardUser::getUpdateTime,cardUser.getUpdateTime());
        }
        return cardUserMapper.selectList(wrapper);
    }
}




