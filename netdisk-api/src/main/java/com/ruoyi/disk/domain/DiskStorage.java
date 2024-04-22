package com.ruoyi.disk.domain;

import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户存储对象 disk_storage
 * 
 * @author maple
 * @date 2024-04-11
 */
public class DiskStorage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 基础目录 */
    @Excel(name = "基础目录")
    private String baseDir;

    /** 总容量 */
    @Excel(name = "总容量")
    private Long totalCapacity;

    /** 已用容量 */
    @Excel(name = "已用容量")
    private Long usedCapacity;

    /** 创建者 */
    @Excel(name = "创建者")
    private Long createId;

    /** 更新者 */
    @Excel(name = "更新者")
    private Long updateId;

    /** 删除标志（0代表存在 */
    private String delFlag;

    private SysUser sysUser;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setBaseDir(String baseDir) 
    {
        this.baseDir = baseDir;
    }

    public String getBaseDir() 
    {
        return baseDir;
    }
    public void setTotalCapacity(Long totalCapacity) 
    {
        this.totalCapacity = totalCapacity;
    }

    public Long getTotalCapacity() 
    {
        return totalCapacity;
    }
    public void setUsedCapacity(Long usedCapacity) 
    {
        this.usedCapacity = usedCapacity;
    }

    public Long getUsedCapacity() 
    {
        return usedCapacity;
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
            .append("baseDir", getBaseDir())
            .append("totalCapacity", getTotalCapacity())
            .append("usedCapacity", getUsedCapacity())
            .append("createId", getCreateId())
            .append("createTime", getCreateTime())
            .append("updateId", getUpdateId())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
