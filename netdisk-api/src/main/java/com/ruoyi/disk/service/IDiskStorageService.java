package com.ruoyi.disk.service;

import java.util.List;
import com.ruoyi.disk.domain.DiskStorage;

/**
 * 用户存储Service接口
 * 
 * @author maple
 * @date 2024-04-11
 */
public interface IDiskStorageService 
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
     * 批量删除用户存储
     * 
     * @param ids 需要删除的用户存储主键集合
     * @return 结果
     */
    public int deleteDiskStorageByIds(Long[] ids);

    /**
     * 删除用户存储信息
     * 
     * @param id 用户存储主键
     * @return 结果
     */
    public int deleteDiskStorageById(Long id);

    DiskStorage selectDiskStorageByUserId(Long userId);

    int updateUsedCapacity(Long id, long usedCapacity);

    boolean updateUsedCapacityByUserId(Long userId, long l);
}
