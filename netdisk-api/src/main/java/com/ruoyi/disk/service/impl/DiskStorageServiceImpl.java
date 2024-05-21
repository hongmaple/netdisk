package com.ruoyi.disk.service.impl;

import java.util.List;
import java.util.Objects;

import cn.hutool.core.util.RandomUtil;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.disk.mapper.DiskStorageMapper;
import com.ruoyi.disk.domain.DiskStorage;
import com.ruoyi.disk.service.IDiskStorageService;

/**
 * 用户存储Service业务层处理
 * 
 * @author maple
 * @date 2024-04-11
 */
@Service
public class DiskStorageServiceImpl implements IDiskStorageService 
{
    @Autowired
    private DiskStorageMapper diskStorageMapper;

    @Autowired
    private ISysConfigService configService;

    /**
     * 查询用户存储
     * 
     * @param id 用户存储主键
     * @return 用户存储
     */
    @Override
    public DiskStorage selectDiskStorageById(Long id)
    {
        return diskStorageMapper.selectDiskStorageById(id);
    }

    /**
     * 查询用户存储列表
     * 
     * @param diskStorage 用户存储
     * @return 用户存储
     */
    @Override
    public List<DiskStorage> selectDiskStorageList(DiskStorage diskStorage)
    {
        return diskStorageMapper.selectDiskStorageList(diskStorage);
    }

    /**
     * 新增用户存储
     * 
     * @param diskStorage 用户存储
     * @return 结果
     */
    @Override
    public int insertDiskStorage(DiskStorage diskStorage)
    {
        DiskStorage diskStorage1 = diskStorageMapper.selectDiskStorageByUserId(diskStorage.getCreateId());
        if (Objects.nonNull(diskStorage1)) return updateDiskStorage(diskStorage);
        diskStorage.setCreateTime(DateUtils.getNowDate());
        diskStorage.setTotalCapacity(Long.valueOf(configService.selectConfigByKey("storage.capacity")));
        diskStorage.setBaseDir(RandomUtil.randomString(6));
        return diskStorageMapper.insertDiskStorage(diskStorage);
    }

    /**
     * 修改用户存储
     * 
     * @param diskStorage 用户存储
     * @return 结果
     */
    @Override
    public int updateDiskStorage(DiskStorage diskStorage)
    {
        diskStorage.setUpdateTime(DateUtils.getNowDate());
        return diskStorageMapper.updateDiskStorage(diskStorage);
    }

    /**
     * 批量删除用户存储
     * 
     * @param ids 需要删除的用户存储主键
     * @return 结果
     */
    @Override
    public int deleteDiskStorageByIds(Long[] ids)
    {
        return diskStorageMapper.deleteDiskStorageByIds(ids);
    }

    /**
     * 删除用户存储信息
     * 
     * @param id 用户存储主键
     * @return 结果
     */
    @Override
    public int deleteDiskStorageById(Long id)
    {
        return diskStorageMapper.deleteDiskStorageById(id);
    }

    @Override
    public DiskStorage selectDiskStorageByUserId(Long userId) {
        return diskStorageMapper.selectDiskStorageByUserId(userId);
    }

    @Override
    public int updateUsedCapacity(Long id, long usedCapacity) {
        return diskStorageMapper.updateUsedCapacity(id,usedCapacity);
    }
}
