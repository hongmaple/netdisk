package com.ruoyi.disk.mapper;

import java.util.List;
import java.util.Map;

import com.ruoyi.disk.domain.DiskFile;
import org.apache.ibatis.annotations.Param;

/**
 * 文件Mapper接口
 * 
 * @author maple
 * @date 2024-04-11
 */
public interface DiskFileMapper 
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
     * 删除文件
     * 
     * @param id 文件主键
     * @return 结果
     */
    public int deleteDiskFileById(Long id);

    /**
     * 批量删除文件
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDiskFileByIds(Long[] ids);

    int removeDiskFileByIds(Long[] ids);

    List<Long> selectDiskFileByParentIds(Long[] ids);

    int verify(@Param("name") String name, @Param("parentId") Long parentId, @Param("id") Long id,@Param("userId") Long userId,@Param("delFlag") String delFlag);

    List<DiskFile> selectDiskFileListByIds(Long[] ids);

    List<DiskFile> selectDiskFileListByIdsAndUserId(@Param("ids") Long[] ids, @Param("userId") Long userId);

    List<DiskFile> selectDiskFileListByIdsIgnoreDel(Long[] ids);

    List<DiskFile> selectAll();

    int refresh(Long[] ids);

    List<DiskFile> selectAllByUserId(Long userId);

    List<Map<String, Object>> typeCapacityStats(Long userId);

    List<Map<String, Object>> fileTypeNumStats(Long userId);

    List<Long> selectAllIdsByUserId(Long userId);
}
