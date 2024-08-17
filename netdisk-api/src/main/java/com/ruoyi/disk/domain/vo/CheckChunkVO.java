package com.ruoyi.disk.domain.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class CheckChunkVO implements Serializable {
    private boolean skipUpload = false;

    private String url;

    private List<Integer> uploaded = new ArrayList<>();

    private boolean needMerge = true;

    //暂时没用上,通过设置此标识,可以在前端做判断,将一些状态码为200却有问题的返回信息进行拦截,前端相关代码已注释
    private boolean result = true;

    public boolean isSkipUpload() {
        return skipUpload;
    }

    public void setSkipUpload(boolean skipUpload) {
        this.skipUpload = skipUpload;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<Integer> getUploaded() {
        return uploaded;
    }

    public void setUploaded(List<Integer> uploaded) {
        this.uploaded = uploaded;
    }

    public boolean isNeedMerge() {
        return needMerge;
    }

    public void setNeedMerge(boolean needMerge) {
        this.needMerge = needMerge;
    }

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }
}