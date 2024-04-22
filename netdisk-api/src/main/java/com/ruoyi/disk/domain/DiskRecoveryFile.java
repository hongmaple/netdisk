package com.ruoyi.disk.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 回收站对象 disk_recovery_file
 * 
 * @author maple
 * @date 2024-04-11
 */
public class DiskRecoveryFile extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 文件id */
    @Excel(name = "文件id")
    private Long fileId;

    /** 创建者 */
    @Excel(name = "创建者")
    private Long createId;

    /** 更新者 */
    @Excel(name = "更新者")
    private Long updateId;

    private List<DiskFile> diskFileList;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setFileId(Long fileId) 
    {
        this.fileId = fileId;
    }

    public Long getFileId() 
    {
        return fileId;
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

    public List<DiskFile> getDiskFileList() {
        return diskFileList;
    }

    public void setDiskFileList(List<DiskFile> diskFileList) {
        this.diskFileList = diskFileList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("fileId", getFileId())
            .append("createId", getCreateId())
            .append("createTime", getCreateTime())
            .append("updateId", getUpdateId())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
