package com.ruoyi.disk.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.disk.domain.DiskFile;
import com.ruoyi.disk.domain.DiskStorage;

/**
 * 文件Service接口
 * 
 * @author maple
 * @date 2024-04-11
 */
public interface IDiskFileService 
{
    /**
     * 查询文件
     * 
     * @param id 文件主键
     * @return 文件
     */
    public DiskFile selectDiskFileById(Long id);

    /**
     * 查询文件列表
     * 
     * @param diskFile 文件
     * @return 文件集合
     */
    public List<DiskFile> selectDiskFileList(DiskFile diskFile);

    /**
     * 新增文件
     * 
     * @param diskFile 文件
     * @return 结果
     */
    public int insertDiskFile(DiskFile diskFile);

    /**
     * 修改文件
     * 
     * @param diskFile 文件
     * @return 结果
     */
    public int updateDiskFile(DiskFile diskFile);

    /**
     * 批量删除文件
     * 
     * @param ids 需要删除的文件主键集合
     * @return 结果
     */
    public int deleteDiskFileByIds(Long[] ids);

    /**
     * 删除文件信息
     * 
     * @param id 文件主键
     * @return 结果
     */
    public int deleteDiskFileById(Long id);

    List<Long> selectDiskFileByParentIds(Long[] ids);

    int removeDiskFileByIds(Long[] ids);

    Integer getType(String extension);

    List<DiskFile> selectDiskFileListByIds(Long[] ids);

    List<DiskFile> selectDiskFileListByIds(Long[] ids,Long userId);

    List<DiskFile> selectDiskFileListByIdsIgnoreDel(Long[] ids);

    List<DiskFile> selectAll();

     List<DiskFile> getChildPerms(List<DiskFile> list,List<DiskFile> allList, Long parentId);

    int refresh(Long[] ids);

    int save(DiskFile diskFile, DiskStorage diskStorage);

    List<DiskFile> selectAllByUserId(Long userId);

    List<Map<String,Object>> typeCapacityStats(Long userId);

    String getTypeName(Integer type);

    List<Map<String, Object>> fileTypeNumStats(Long userId);
}
