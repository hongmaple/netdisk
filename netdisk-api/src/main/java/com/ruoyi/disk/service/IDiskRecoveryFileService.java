package com.ruoyi.disk.service;

import java.util.List;
import com.ruoyi.disk.domain.DiskRecoveryFile;

/**
 * 回收站Service接口
 * 
 * @author maple
 * @date 2024-04-11
 */
public interface IDiskRecoveryFileService 
{
    /**
     * 查询回收站
     * 
     * @param id 回收站主键
     * @return 回收站
     */
    public DiskRecoveryFile selectDiskRecoveryFileById(Long id);

    /**
     * 查询回收站列表
     * 
     * @param diskRecoveryFile 回收站
     * @return 回收站集合
     */
    public List<DiskRecoveryFile> selectDiskRecoveryFileList(DiskRecoveryFile diskRecoveryFile);

    /**
     * 新增回收站
     * 
     * @param diskRecoveryFile 回收站
     * @return 结果
     */
    public int insertDiskRecoveryFile(DiskRecoveryFile diskRecoveryFile);

    /**
     * 修改回收站
     * 
     * @param diskRecoveryFile 回收站
     * @return 结果
     */
    public int updateDiskRecoveryFile(DiskRecoveryFile diskRecoveryFile);

    /**
     * 批量删除回收站
     * 
     * @param ids 需要删除的回收站主键集合
     * @return 结果
     */
    public int deleteDiskRecoveryFileByIds(Long[] ids);

    /**
     * 删除回收站信息
     * 
     * @param id 回收站主键
     * @return 结果
     */
    public int deleteDiskRecoveryFileById(Long id);

    List<DiskRecoveryFile> selectDiskRecoveryFileByIdsAndUserId(Long[] ids, Long userId);

    int refresh(Long[] ids,Long userId);
}
