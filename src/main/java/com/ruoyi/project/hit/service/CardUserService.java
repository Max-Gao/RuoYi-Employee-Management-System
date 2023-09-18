package com.ruoyi.project.hit.service;

import com.ruoyi.project.hit.domain.CardUser;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 *
 */
public interface CardUserService extends IService<CardUser> {

    List<CardUser> selectCardUser(CardUser cardUser);
}
