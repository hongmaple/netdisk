package com.ruoyi.disk.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 分享对象 disk_share_file
 *
 * @author maple
 * @date 2024-04-12
 */
public class DiskShareFile extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    @Excel(name = "")
    private Long id;

    /** 分享的文件ids */
    @Excel(name = "分享的文件ids")
    private String fileIds;

    /**  */
    @Excel(name = "")
    private String uuid;

    /**  */
    @Excel(name = "")
    private String secretKey;

    /**  */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expirationTime;

    /** 创建者 */
    @Excel(name = "创建者")
    private Long createId;

    /** 更新者 */
    @Excel(name = "更新者")
    private Long updateId;

    /** 删除标志（0代表存在 */
    private String delFlag;

    private String secretKeyRadio;

    private String expirationTimeRadio;

    private Integer isPermanent;

    private String allFileIds;

    private String type;

    private SysUser sysUser;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setFileIds(String fileIds)
    {
        this.fileIds = fileIds;
    }

    public String getFileIds()
    {
        return fileIds;
    }
    public void setUuid(String uuid)
    {
        this.uuid = uuid;
    }

    public String getUuid()
    {
        return uuid;
    }
    public void setSecretKey(String secretKey)
    {
        this.secretKey = secretKey;
    }

    public String getSecretKey()
    {
        return secretKey;
    }
    public void setExpirationTime(Date expirationTime)
    {
        this.expirationTime = expirationTime;
    }

    public Date getExpirationTime()
    {
        return expirationTime;
    }
    public void setCreateId(Long createId)
    {
        this.createId = createId;
    }

    public Long getCreateId()
    {
        return createId;
    }
    public void setUpdateId(Long updateId)
    {
        this.updateId = updateId;
    }

    public Long getUpdateId()
    {
        return updateId;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    public String getSecretKeyRadio() {
        return secretKeyRadio;
    }

    public void setSecretKeyRadio(String secretKeyRadio) {
        this.secretKeyRadio = secretKeyRadio;
    }

    public String getExpirationTimeRadio() {
        return expirationTimeRadio;
    }

    public void setExpirationTimeRadio(String expirationTimeRadio) {
        this.expirationTimeRadio = expirationTimeRadio;
    }

    public Integer getIsPermanent() {
        return isPermanent;
    }

    public void setIsPermanent(Integer isPermanent) {
        this.isPermanent = isPermanent;
    }

    public String getAllFileIds() {
        return allFileIds;
    }

    public void setAllFileIds(String allFileIds) {
        this.allFileIds = allFileIds;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("fileIds", getFileIds())
                .append("uuid", getUuid())
                .append("secretKey", getSecretKey())
                .append("expirationTime", getExpirationTime())
                .append("createId", getCreateId())
                .append("createTime", getCreateTime())
                .append("updateId", getUpdateId())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .append("delFlag", getDelFlag())
                .toString();
    }
}
