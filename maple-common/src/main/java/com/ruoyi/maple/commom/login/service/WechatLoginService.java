package com.ruoyi.maple.commom.login.service;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.maple.commom.login.config.PcWeChatAppletConfig;
import com.ruoyi.maple.commom.login.config.WeChatAppletConfig;
import com.ruoyi.maple.commom.login.dto.AccessTokenVO;
import com.ruoyi.maple.commom.login.dto.Userinfo;
import com.ruoyi.maple.commom.login.utils.WXCore;
import org.springframework.stereotype.Service;

@Service
public class WechatLoginService {

    /**
     * 解密拿到微信小程序手机号 JSONObject 格式
     *  JSONObject.getString("purePhoneNumber"); 手机号
     * @param encryptedData 微信的
     * @param sessionKey 通过微信code调用getSessionToken获取的sessionKey
     * @param iv 微信的
     * @return
     */
    public JSONObject getWxPhone(String encryptedData,String sessionKey,String iv){
        String result = WXCore.decrypt(WeChatAppletConfig.APPID,encryptedData,sessionKey,iv);
        return JSON.parseObject(result);
    }

    public Userinfo getUserinfo(String accessToken, String openid) {
        String params = "access_token="+accessToken+"&openid=" + openid;
        String s = HttpUtils.sendGet(PcWeChatAppletConfig.WEIXIN_API_DOMAIN+"/sns/userinfo", params);
        return JSON.parseObject(s,Userinfo.class);
    }

    /**
     * 小程序
     * @param code 微信code
     * @return SessionToken
     */
    public String getSessionToken(String code) {
        String params = "appid=" + WeChatAppletConfig.APPID + "&secret=" + WeChatAppletConfig.SECRET + "&js_code=" + code + "&grant_type=authorization_code";
        String s= HttpUtils.sendGet(WeChatAppletConfig.WEIXIN_API_DOMAIN+"/sns/jscode2session", params);
        JSONObject jsonObject = JSON.parseObject(s);
        String sessionKey= null;
        try {
            sessionKey = jsonObject.getString("session_key");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sessionKey;
    }

    /**
     * pc扫码登录
     * @param code 微信code
     * @param state 状态
     * @return
     */
    public AccessTokenVO getAccessToken(String code, String state) {
        String params = "appid=" + PcWeChatAppletConfig.APPID + "&secret=" + PcWeChatAppletConfig.SECRET + "&code=" + code + "&grant_type=authorization_code";
        String s = HttpUtils.sendGet(PcWeChatAppletConfig.WEIXIN_API_DOMAIN+"/sns/oauth2/access_token", params);
        return JSON.parseObject(s, AccessTokenVO.class);
    }
}
