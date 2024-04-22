package com.ruoyi.maple.commom.sms.service;

import org.dromara.sms4j.api.SmsBlend;
import org.dromara.sms4j.api.entity.SmsResponse;
import org.dromara.sms4j.core.factory.SmsFactory;
import org.springframework.stereotype.Service;

@Service
public class SmsService {

    /**
     * 发送验证码
     * @param phone 手机号
     * @param configId  厂商
     * @param code 验证码
     * @return
     */
    public SmsResponse sendCode(String phone, String configId, String code) {
        //在创建完SmsBlend实例后，再未手动调用注销的情况下框架会持有该实例，可以直接通过指定configId来获取想要的配置，如果你想使用
        //负载均衡形式获取实例，只要使用getSmsBlend的无参重载方法即可，如果你仅有一个配置，也可以使用该方法
        SmsBlend smsBlend = SmsFactory.getSmsBlend(configId);
        return smsBlend.sendMessage(phone,String.valueOf(code));
    }

}
