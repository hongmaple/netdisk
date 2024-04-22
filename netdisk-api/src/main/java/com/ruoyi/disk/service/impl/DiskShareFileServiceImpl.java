package com.ruoyi.disk.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import cn.hutool.core.util.RandomUtil;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.disk.mapper.DiskShareFileMapper;
import com.ruoyi.disk.domain.DiskShareFile;
import com.ruoyi.disk.service.IDiskShareFileService;

/**
 * 分享Service业务层处理
 * 
 * @author maple
 * @date 2024-04-11
 */
@Service
public class DiskShareFileServiceImpl implements IDiskShareFileService 
{
    @Autowired
    private DiskShareFileMapper diskShareFileMapper;

    /**
     * 查询分享
     * 
     * @param id 分享主键
     * @return 分享
     */
    @Override
    public DiskShareFile selectDiskShareFileById(Long id)
    {
        return diskShareFileMapper.selectDiskShareFileById(id);
    }

    /**
     * 查询分享列表
     * 
     * @param diskShareFile 分享
     * @return 分享
     */
    @Override
    public List<DiskShareFile> selectDiskShareFileList(DiskShareFile diskShareFile)
    {
        return diskShareFileMapper.selectDiskShareFileList(diskShareFile);
    }

    /**
     * 新增分享
     * 
     * @param diskShareFile 分享
     * @return 结果
     */
    @Override
    public DiskShareFile insertDiskShareFile(DiskShareFile diskShareFile)
    {
        diskShareFile.setCreateTime(DateUtils.getNowDate());
        diskShareFile.setUuid(RandomUtil.randomString(12));
        if ("0".equals(diskShareFile.getType())&&diskShareFile.getSecretKeyRadio().equals("1")) {
            diskShareFile.setSecretKey(RandomUtil.randomString(6));
        }
        if (diskShareFile.getExpirationTimeRadio().equals("1")) {
            diskShareFile.setIsPermanent(1);
        } else {
            diskShareFile.setIsPermanent(0);
        }
        int i = diskShareFileMapper.insertDiskShareFile(diskShareFile);
        if (i==0) throw new ServiceException("分享失败");

        return diskShareFile;
    }

    /**
     * 修改分享
     * 
     * @param diskShareFile 分享
     * @return 结果
     */
    @Override
    public DiskShareFile updateDiskShareFile(DiskShareFile diskShareFile)
    {
        diskShareFile.setUpdateTime(DateUtils.getNowDate());
        if (diskShareFile.getSecretKeyRadio().equals("1")) {
            diskShareFile.setSecretKey(RandomUtil.randomString(6));
        }
        if (diskShareFile.getExpirationTimeRadio().equals("1")) {
            diskShareFile.setIsPermanent(1);
        } else {
            diskShareFile.setIsPermanent(0);
        }
        diskShareFileMapper.updateDiskShareFile(diskShareFile);
        return diskShareFile;
    }

    /**
     * 批量删除分享
     * 
     * @param ids 需要删除的分享主键
     * @return 结果
     */
    @Override
    public int deleteDiskShareFileByIds(Long[] ids)
    {
        return diskShareFileMapper.deleteDiskShareFileByIds(ids);
    }

    /**
     * 删除分享信息
     * 
     * @param id 分享主键
     * @return 结果
     */
    @Override
    public int deleteDiskShareFileById(Long id)
    {
        return diskShareFileMapper.deleteDiskShareFileById(id);
    }

    @Override
    public DiskShareFile get(String uuid) {
        return diskShareFileMapper.get(uuid);
    }

    @Override
    public void verify(DiskShareFile diskShareFileBo, DiskShareFile diskShareFile) {
        if (Objects.isNull(diskShareFile)) throw new ServiceException("分享不存在");
        if (diskShareFile.getType().equals("0") && !diskShareFile.getSecretKey().equals(diskShareFileBo.getSecretKey())) throw new ServiceException("提取码不正确");
        if (diskShareFile.getIsPermanent()==0
                && (diskShareFile.getExpirationTime().getTime()-DateUtils.getNowDate().getTime())<=0) throw new ServiceException("分享已经过期");
    }
}
