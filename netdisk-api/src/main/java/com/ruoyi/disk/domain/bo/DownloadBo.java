package com.ruoyi.disk.domain.bo;


import java.io.Serializable;

public class DownloadBo implements Serializable {
    private static final long serialVersionUID = 1L;

    private String uuid;

    private String secretKey;

    private String ids;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }
}
