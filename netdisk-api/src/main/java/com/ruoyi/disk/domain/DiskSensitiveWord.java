package com.ruoyi.disk.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 敏感词对象 disk_sensitive_word
 * 
 * @author maple
 * @date 2024-04-17
 */
public class DiskSensitiveWord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增id */
    private Long id;

    /** 添加人 */
    @Excel(name = "添加人")
    private String userName;

    /** 敏感词 */
    @Excel(name = "敏感词")
    private String sensitiveWord;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setSensitiveWord(String sensitiveWord) 
    {
        this.sensitiveWord = sensitiveWord;
    }

    public String getSensitiveWord() 
    {
        return sensitiveWord;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userName", getUserName())
            .append("sensitiveWord", getSensitiveWord())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
