package com.ruoyi.disk.mapper;

import java.util.List;
import com.ruoyi.disk.domain.DiskRecoveryFile;
import org.apache.ibatis.annotations.Param;

/**
 * 回收站Mapper接口
 * 
 * @author maple
 * @date 2024-04-11
 */
public interface DiskRecoveryFileMapper 
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
     * 删除回收站
     * 
     * @param id 回收站主键
     * @return 结果
     */
    public int deleteDiskRecoveryFileById(Long id);

    /**
     * 批量删除回收站
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDiskRecoveryFileByIds(Long[] ids);

    List<DiskRecoveryFile> selectDiskRecoveryFileByIdsAndUserId(@Param("ids") Long[] ids, @Param("userId") Long userId);

    int selectCountByIdsAndUserId(@Param("ids") Long[] ids, @Param("userId") Long userId);

    int deleteDiskRecoveryFileByUserId(Long userId);
}
