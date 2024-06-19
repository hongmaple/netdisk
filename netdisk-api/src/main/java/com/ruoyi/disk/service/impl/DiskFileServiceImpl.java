package com.ruoyi.disk.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IORuntimeException;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.MimeTypeUtils;
import com.ruoyi.disk.HadoopTemplate;
import com.ruoyi.disk.domain.DiskStorage;
import com.ruoyi.disk.service.IDiskSensitiveWordService;
import com.ruoyi.disk.service.IDiskStorageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.disk.mapper.DiskFileMapper;
import com.ruoyi.disk.domain.DiskFile;
import com.ruoyi.disk.service.IDiskFileService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 文件Service业务层处理
 * 
 * @author maple
 * @date 2024-04-11
 */
@Service

public class DiskFileServiceImpl implements IDiskFileService 
{
    private static final Logger log = LoggerFactory.getLogger(DiskRecoveryFileServiceImpl.class);

    @Autowired
    private DiskFileMapper diskFileMapper;

    @Autowired
    private IDiskStorageService diskStorageService;

    @Autowired
    private IDiskSensitiveWordService diskSensitiveWordService;

    @Autowired
    private HadoopTemplate hadoopTemplate;

    /**
     * 查询文件
     * 
     * @param id 文件主键
     * @return 文件
     */
    @Override
    public DiskFile selectDiskFileById(Long id)
    {
        return diskFileMapper.selectDiskFileById(id);
    }

    /**
     * 查询文件列表
     * 
     * @param diskFile 文件
     * @return 文件
     */
    @Override
    public List<DiskFile> selectDiskFileList(DiskFile diskFile)
    {
        return diskFileMapper.selectDiskFileList(diskFile);
    }

    /**
     * 新增文件
     * 
     * @param diskFile 文件
     * @return 结果
     */
    @Override
    public int insertDiskFile(DiskFile diskFile)
    {
        diskFile.setCreateTime(DateUtils.getNowDate());
        validEntityBeforeSave(diskFile);
        int i = diskFileMapper.verify(diskFile.getName(), diskFile.getParentId(),null, SecurityUtils.getUserId(),"0");
        if (i>0) throw new ServiceException("名称重复");
        i = diskFileMapper.verify(diskFile.getName(), diskFile.getParentId(),null, SecurityUtils.getUserId(),"2");
        if (i>0) throw new ServiceException("与回收站中的重名了");
        return diskFileMapper.insertDiskFile(diskFile);
    }

    private void validEntityBeforeSave(DiskFile diskFile) {
        boolean b = diskSensitiveWordService.filterSensitiveWord(diskFile.getName());
        if (b) throw new ServiceException("检测到敏感词，请重试");
    }

    /**
     * 修改文件
     * 
     * @param diskFile 文件
     * @return 结果
     */
    @Override
    public int updateDiskFile(DiskFile diskFile)
    {
        diskFile.setUpdateTime(DateUtils.getNowDate());
        validEntityBeforeSave(diskFile);
        int i = diskFileMapper.verify(diskFile.getName(), diskFile.getParentId(),diskFile.getId(), SecurityUtils.getUserId(),"0");
        if (i>0) throw new ServiceException("名称重复");
        i = diskFileMapper.verify(diskFile.getName(), diskFile.getParentId(),null, SecurityUtils.getUserId(),"2");
        if (i>0) throw new ServiceException("与回收站中的重名了");
        return diskFileMapper.updateDiskFile(diskFile);
    }

    /**
     * 批量删除文件
     * 
     * @param ids 需要删除的文件主键
     * @return 结果
     */
    @Override
    public int deleteDiskFileByIds(Long[] ids)
    {
        return diskFileMapper.deleteDiskFileByIds(ids);
    }

    /**
     * 删除文件信息
     * 
     * @param id 文件主键
     * @return 结果
     */
    @Override
    public int deleteDiskFileById(Long id)
    {
        return diskFileMapper.deleteDiskFileById(id);
    }

    @Override
    public List<Long> selectDiskFileByParentIds(Long[] ids) {
        return diskFileMapper.selectDiskFileByParentIds(ids);
    }

    @Override
    public int removeDiskFileByIds(Long[] ids) {
        return diskFileMapper.removeDiskFileByIds(ids);
    }

    @Override
    public Integer getType(String extension) {
        if (FileUploadUtils.isAllowedExtension(extension, MimeTypeUtils.IMAGE_EXTENSION)) {
            return 0;
        } else if (FileUploadUtils.isAllowedExtension(extension, MimeTypeUtils.VIDEO_EXTENSION)) {
            return 1;
        } else if (FileUploadUtils.isAllowedExtension(extension, MimeTypeUtils.DOC_EXTENSION)) {
            return 2;
        } else if (FileUploadUtils.isAllowedExtension(extension, MimeTypeUtils.MEDIA_EXTENSION)) {
            return 3;
        } else {
            return 4;
        }
    }

    @Override
    public List<DiskFile> selectDiskFileListByIds(Long[] ids) {
        return diskFileMapper.selectDiskFileListByIds(ids);
    }

    @Override
    public List<DiskFile> selectDiskFileListByIds(Long[] ids, Long userId) {
        return diskFileMapper.selectDiskFileListByIdsAndUserId(ids,userId);
    }

    @Override
    public List<DiskFile> selectDiskFileListByIdsIgnoreDel(Long[] ids) {
        return diskFileMapper.selectDiskFileListByIdsIgnoreDel(ids);
    }

    @Override
    public List<DiskFile> selectAll() {
        return diskFileMapper.selectAll();
    }

    @Override
    public List<DiskFile> selectAllByUserId(Long userId) {
        return diskFileMapper.selectAllByUserId(userId);
    }

    @Override
    public List<Map<String, Object>> typeCapacityStats(Long userId) {
        return diskFileMapper.typeCapacityStats(userId);
    }

    @Override
    public List<Map<String, Object>> fileTypeNumStats(Long userId) {
        return diskFileMapper.fileTypeNumStats(userId);
    }

    @Override
    public String getTypeName(Integer type) {
        switch (type) {
            case 0:
                return "图片";
            case 1:
                return "视频";
            case 2:
                return "文档";
            case 3:
                return "音乐";
            case 5:
                return "文件夹";
            default:
                return "其他";
        }
    }

    /**
     * 根据父节点的ID获取所有子节点
     *
     * @param list 分类表
     * @param allList 汇总
     * @param parentId 传入的父节点ID
     * @return String
     */
    @Override
    public List<DiskFile> getChildPerms(List<DiskFile> list, List<DiskFile> allList, Long parentId)
    {
        List<DiskFile> returnList = new ArrayList<>();
        for (Iterator<DiskFile> iterator = list.iterator(); iterator.hasNext();)
        {
            DiskFile t = iterator.next();
            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
            if (t.getParentId().equals(parentId))
            {
                recursionFn(list,allList, t);
                returnList.add(t);
            }
        }
        return returnList;
    }

    @Override
    public int refresh(Long[] ids) {
        return diskFileMapper.refresh(ids);
    }

    @Override
    @Transactional
    public int save(DiskFile diskFile, DiskStorage diskStorage) {
        int i = this.insertDiskFile(diskFile);
        if (i==0) throw new ServiceException("上传失败");
        //更新已经用的容量
        i = diskStorageService.updateUsedCapacity(diskStorage.getId(), diskStorage.getUsedCapacity() + diskFile.getSize());
        if (i==0) throw new ServiceException("上传失败");
        return i;
    }

    /**
     * 根据父节点的ID获取所有子节点
     *
     * @param list 分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public List<DiskFile> getChildPerms(List<DiskFile> list, int parentId)
    {
        List<DiskFile> returnList = new ArrayList<>();
        for (Iterator<DiskFile> iterator = list.iterator(); iterator.hasNext();)
        {
            DiskFile t = iterator.next();
            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
            if (t.getParentId() == parentId)
            {
                recursionFn(list, t);
                returnList.add(t);
            }
        }
        return returnList;
    }

    /**
     * 递归列表
     *
     * @param list 分类表
     * @param t 子节点
     */
    private void recursionFn(List<DiskFile> list,List<DiskFile> allList, DiskFile t)
    {
        // 得到子节点列表
        List<DiskFile> childList = getChildList(list, t);
        t.setChildren(childList);
        allList.addAll(childList);
        allList.add(t);
        for (DiskFile tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 递归列表
     *
     * @param list 分类表
     * @param t 子节点
     */
    private void recursionFn(List<DiskFile> list, DiskFile t)
    {
        // 得到子节点列表
        List<DiskFile> childList = getChildList(list, t);
        t.setChildren(childList);
        for (DiskFile tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    public List<DiskFile> getChildList(List<DiskFile> list, DiskFile t)
    {
        List<DiskFile> tlist = new ArrayList<>();
        Iterator<DiskFile> it = list.iterator();
        while (it.hasNext())
        {
            DiskFile n = (DiskFile) it.next();
            if (n.getParentId().longValue() == t.getId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    public boolean hasChild(List<DiskFile> list, DiskFile t)
    {
        return getChildList(list, t).size() > 0;
    }

    @Override
    public int deleteDiskFileByIdsAndRemoveFile(List<Long> delFileIds) {
        List<DiskFile> allDelFiles = this.selectDiskFileListByIdsIgnoreDel(delFileIds.toArray(new Long[0]));
        List<DiskFile> allDiskFiles = this.selectAllByUserId(SecurityUtils.getUserId());
        delFileIds.forEach(parentId -> this.getChildPerms(allDiskFiles,allDelFiles,parentId));
        this.deleteDiskFileByIds(allDelFiles.stream().map(DiskFile::getId).toArray(Long[]::new));
        allDelFiles.forEach(diskFile -> {
            try {
                hadoopTemplate.rmdir(StringUtils.substringAfter(diskFile.getUrl(), Constants.HADOOP_PREFIX).replace("--","/"),null);
            } catch (IORuntimeException e) {
                log.debug("文件删除失败 文件不存在 {0}",e);
            }
        });
        return this.deleteDiskFileByIds(allDelFiles.stream().map(DiskFile::getId).toArray(Long[]::new));
    }

    @Override
    public List<Long> selectAllIdsByUserId(Long userId) {
        return diskFileMapper.selectAllIdsByUserId(userId);
    }
}
