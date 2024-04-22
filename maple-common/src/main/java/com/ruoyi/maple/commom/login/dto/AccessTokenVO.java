package com.ruoyi.maple.commom.login.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel("微信扫码后的token数据")
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AccessTokenVO {
    @ApiModelProperty("accessToken")
    private String accessToken;
    @ApiModelProperty("过期")
    private Long expiresIn;
    @ApiModelProperty("refreshToken 用于刷新accessToken")
    private String refreshToken;
    @ApiModelProperty("普通用户的标识，对当前开发者帐号唯一")
    private String openid;
    @ApiModelProperty("作用域")
    private String scope;
    @ApiModelProperty("用户统一标识。针对一个微信开放平台帐号下的应用，同一用户的unionid是唯一的。")
    private String unionid;

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public Long getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(Long expiresIn) {
        this.expiresIn = expiresIn;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid;
    }
}