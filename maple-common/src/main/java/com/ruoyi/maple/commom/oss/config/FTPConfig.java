package com.ruoyi.maple.commom.oss.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "ftp")
public class FTPConfig {

    /**
     * 服务地址
     */
    private static String serverUrl;

    /**
     * 端口
     */
    private static int port;

    /**
     * 用户名
     */
    private static String userName;

    /**
     * 密码
     */
    private static String password;


    public static String getServerUrl() {
        return serverUrl;
    }

    public void setServerUrl(String serverUrl) {
        this.serverUrl = serverUrl;
    }

    public static int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public static String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public static String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}