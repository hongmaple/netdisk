package com.ruoyi.disk.domain;

import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 文件对象 disk_file
 * 
 * @author maple
 * @date 2024-04-11
 */
public class DiskFile extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 文件名 */
    @Excel(name = "文件名")
    private String name;

    /** 旧文件名 */
    @Excel(name = "旧文件名")
    private String oldName;

    /** 文件大小 */
    @Excel(name = "文件大小")
    private Long size;

    /** 文件地址 */
    @Excel(name = "文件地址")
    private String url;

    /** 文件类型 */
    @Excel(name = "文件类型")
    private Integer type;

    /** 父级id */
    @Excel(name = "父级id")
    private Long parentId;

    /** 是否是目录 */
    @Excel(name = "是否是目录")
    private Integer isDir;

    /** 排序 */
    @Excel(name = "排序")
    private Integer orderNum;

    /** 创建者 */
    @Excel(name = "创建者")
    private Long createId;

    /** 更新者 */
    @Excel(name = "更新者")
    private Long updateId;

    /** 删除标志（0代表存在 */
    private String delFlag;

    private List<DiskFile> children;

    private SysUser sysUser;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setOldName(String oldName) 
    {
        this.oldName = oldName;
    }

    public String getOldName() 
    {
        return oldName;
    }
    public void setSize(Long size) 
    {
        this.size = size;
    }

    public Long getSize() 
    {
        return size;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setType(Integer type) 
    {
        this.type = type;
    }

    public Integer getType() 
    {
        return type;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setIsDir(Integer isDir) 
    {
        this.isDir = isDir;
    }

    public Integer getIsDir() 
    {
        return isDir;
    }
    public void setOrderNum(Integer orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Integer getOrderNum() 
    {
        return orderNum;
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

    public List<DiskFile> getChildren() {
        return children;
    }

    public void setChildren(List<DiskFile> children) {
        this.children = children;
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
            .append("name", getName())
            .append("oldName", getOldName())
            .append("size", getSize())
            .append("url", getUrl())
            .append("type", getType())
            .append("parentId", getParentId())
            .append("isDir", getIsDir())
            .append("orderNum", getOrderNum())
            .append("createId", getCreateId())
            .append("createTime", getCreateTime())
            .append("updateId", getUpdateId())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
