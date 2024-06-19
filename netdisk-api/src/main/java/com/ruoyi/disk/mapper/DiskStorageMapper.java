package com.ruoyi.disk.mapper;

import java.util.List;
import com.ruoyi.disk.domain.DiskStorage;
import org.apache.ibatis.annotations.Param;

/**
 * 用户存储Mapper接口
 * 
 * @author maple
 * @date 2024-04-11
 */
public interface DiskStorageMapper 
{
    /**
     * 查询用户存储
     * 
     * @param id 用户存储主键
     * @return 用户存储
     */
    public DiskStorage selectDiskStorageById(Long id);

    /**
     * 查询用户存储列表
     * 
     * @param diskStorage 用户存储
     * @return 用户存储集合
     */
    public List<DiskStorage> selectDiskStorageList(DiskStorage diskStorage);

    /**
     * 新增用户存储
     * 
     * @param diskStorage 用户存储
     * @return 结果
     */
    public int insertDiskStorage(DiskStorage diskStorage);

    /**
     * 修改用户存储
     * 
     * @param diskStorage 用户存储
     * @return 结果
     */
    public int updateDiskStorage(DiskStorage diskStorage);

    /**
     * 删除用户存储
     * 
     * @param id 用户存储主键
     * @return 结果
     */
    public int deleteDiskStorageById(Long id);

    /**
     * 批量删除用户存储
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDiskStorageByIds(Long[] ids);

    DiskStorage selectDiskStorageByUserId(Long createId);

    int updateUsedCapacity(@Param("id") Long id,@Param("usedCapacity") long usedCapacity);

    int updateUsedCapacityByUserId(@Param("userId") Long userId, @Param("usedCapacity") long usedCapacity);
}
