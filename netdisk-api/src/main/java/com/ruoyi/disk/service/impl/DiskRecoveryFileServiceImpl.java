package com.ruoyi.disk.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IORuntimeException;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.disk.controller.DiskFileController;
import com.ruoyi.disk.domain.DiskFile;
import com.ruoyi.disk.domain.DiskStorage;
import com.ruoyi.disk.service.IDiskFileService;
import com.ruoyi.disk.service.IDiskStorageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.disk.mapper.DiskRecoveryFileMapper;
import com.ruoyi.disk.domain.DiskRecoveryFile;
import com.ruoyi.disk.service.IDiskRecoveryFileService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 回收站Service业务层处理
 * 
 * @author maple
 * @date 2024-04-11
 */
@Service
public class DiskRecoveryFileServiceImpl implements IDiskRecoveryFileService 
{
    private static final Logger log = LoggerFactory.getLogger(DiskRecoveryFileServiceImpl.class);

    @Autowired
    private DiskRecoveryFileMapper diskRecoveryFileMapper;

    @Autowired
    private IDiskFileService diskFileService;

    @Autowired
    private IDiskStorageService diskStorageService;

    /**
     * 查询回收站
     * 
     * @param id 回收站主键
     * @return 回收站
     */
    @Override
    public DiskRecoveryFile selectDiskRecoveryFileById(Long id)
    {
        return diskRecoveryFileMapper.selectDiskRecoveryFileById(id);
    }

    /**
     * 查询回收站列表
     * 
     * @param diskRecoveryFile 回收站
     * @return 回收站
     */
    @Override
    public List<DiskRecoveryFile> selectDiskRecoveryFileList(DiskRecoveryFile diskRecoveryFile)
    {
        return diskRecoveryFileMapper.selectDiskRecoveryFileList(diskRecoveryFile);
    }

    /**
     * 新增回收站
     * 
     * @param diskRecoveryFile 回收站
     * @return 结果
     */
    @Override
    public int insertDiskRecoveryFile(DiskRecoveryFile diskRecoveryFile)
    {
        diskRecoveryFile.setCreateTime(DateUtils.getNowDate());
        return diskRecoveryFileMapper.insertDiskRecoveryFile(diskRecoveryFile);
    }

    /**
     * 修改回收站
     * 
     * @param diskRecoveryFile 回收站
     * @return 结果
     */
    @Override
    public int updateDiskRecoveryFile(DiskRecoveryFile diskRecoveryFile)
    {
        diskRecoveryFile.setUpdateTime(DateUtils.getNowDate());
        return diskRecoveryFileMapper.updateDiskRecoveryFile(diskRecoveryFile);
    }

    /**
     * 批量删除回收站
     * 
     * @param ids 需要删除的回收站主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteDiskRecoveryFileByIds(Long[] ids)
    {
        // 获取当前用户本人的存储目录
        DiskStorage diskStorage = diskStorageService.selectDiskStorageByUserId(SecurityUtils.getUserId());
        //查询回收的文件
        List<DiskRecoveryFile> diskRecoveryFiles = diskRecoveryFileMapper.selectDiskRecoveryFileByIdsAndUserId(ids, SecurityUtils.getUserId());
        //更新已经用的容量
        Long usedCapacity = 0L;
        for (DiskRecoveryFile diskRecoveryFile : diskRecoveryFiles) {
            usedCapacity = usedCapacity + diskRecoveryFile.getDiskFileList().stream().map(DiskFile::getSize)
                    .reduce(0L, Long::sum);
        }
        diskStorageService.updateUsedCapacity(diskStorage.getId()
                , diskStorage.getUsedCapacity() - usedCapacity);

        //删除文件
        List<Long> delFileIds = diskRecoveryFiles.stream().map(DiskRecoveryFile::getFileId).collect(Collectors.toList());
        diskFileService.deleteDiskFileByIdsAndRemoveFile(delFileIds);
        return diskRecoveryFileMapper.deleteDiskRecoveryFileByIds(ids);
    }

    /**
     * 删除回收站信息
     * 
     * @param id 回收站主键
     * @return 结果
     */
    @Override
    public int deleteDiskRecoveryFileById(Long id)
    {
        return diskRecoveryFileMapper.deleteDiskRecoveryFileById(id);
    }

    @Override
    public List<DiskRecoveryFile> selectDiskRecoveryFileByIdsAndUserId(Long[] ids, Long userId) {
        return diskRecoveryFileMapper.selectDiskRecoveryFileByIdsAndUserId(ids,userId);
    }

    @Override
    @Transactional
    public int refresh(Long[] ids,Long userId) {
        List<DiskRecoveryFile> diskRecoveryFiles = diskRecoveryFileMapper.selectDiskRecoveryFileByIdsAndUserId(ids, userId);
        if (diskRecoveryFiles.size()==0) throw new ServiceException("回收的文件不存在");
        List<Long> decoveryFileIds = diskRecoveryFiles.stream().map(DiskRecoveryFile::getFileId).collect(Collectors.toList());
        List<DiskFile> allDecoveryFiles = diskFileService.selectDiskFileListByIdsIgnoreDel(decoveryFileIds.toArray(new Long[0]));
        List<DiskFile> allDiskFiles = diskFileService.selectAllByUserId(userId);
        decoveryFileIds.forEach(parentId -> diskFileService.getChildPerms(allDiskFiles,allDecoveryFiles,parentId));
        diskFileService.refresh(allDecoveryFiles.stream().map(DiskFile::getId)
                .toArray(Long[]::new));
        return diskRecoveryFileMapper.deleteDiskRecoveryFileByIds(ids);
    }

    @Override
    public int deleteDiskRecoveryFileByUserId(Long userId) {
        return diskRecoveryFileMapper.deleteDiskRecoveryFileByUserId(userId);
    }
}
