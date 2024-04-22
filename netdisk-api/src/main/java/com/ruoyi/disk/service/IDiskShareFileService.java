package com.ruoyi.disk.service;

import java.util.List;
import com.ruoyi.disk.domain.DiskShareFile;

/**
 * 分享Service接口
 * 
 * @author maple
 * @date 2024-04-11
 */
public interface IDiskShareFileService 
{
    /**
     * 查询分享
     * 
     * @param id 分享主键
     * @return 分享
     */
    public DiskShareFile selectDiskShareFileById(Long id);

    /**
     * 查询分享列表
     * 
     * @param diskShareFile 分享
     * @return 分享集合
     */
    public List<DiskShareFile> selectDiskShareFileList(DiskShareFile diskShareFile);

    /**
     * 新增分享
     * 
     * @param diskShareFile 分享
     * @return 结果
     */
    public DiskShareFile insertDiskShareFile(DiskShareFile diskShareFile);

    /**
     * 修改分享
     * 
     * @param diskShareFile 分享
     * @return 结果
     */
    public DiskShareFile updateDiskShareFile(DiskShareFile diskShareFile);

    /**
     * 批量删除分享
     * 
     * @param ids 需要删除的分享主键集合
     * @return 结果
     */
    public int deleteDiskShareFileByIds(Long[] ids);

    /**
     * 删除分享信息
     * 
     * @param id 分享主键
     * @return 结果
     */
    public int deleteDiskShareFileById(Long id);

    DiskShareFile get(String uuid);

    void verify(DiskShareFile diskShareFileBo, DiskShareFile diskShareFile);
}
