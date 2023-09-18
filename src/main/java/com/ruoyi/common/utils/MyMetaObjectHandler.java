package com.ruoyi.common.utils;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;

@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ....");
//        this.strictInsertFill(metaObject, "createTime", () -> LocalDateTime.now(), LocalDateTime.class); // 起始版本 3.3.3(推荐)
//        this.strictInsertFill(metaObject, "updateTime", () -> LocalDateTime.now(), LocalDateTime.class); // 起始版本 3.3.3(推荐)
//        this.strictInsertFill(metaObject, "delFlag", () -> 0, Integer.class); // 起始版本 3.3.3(推荐)
        Date d=new Date();
        this.setFieldValByName("createTime",d,metaObject);
        this.setFieldValByName("updateTime",d,metaObject);
        this.setFieldValByName("delFlag",0,metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ....");
        Date d=new Date();
        this.setFieldValByName("updateTime",d,metaObject);
    }
}

