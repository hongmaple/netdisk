package com.ruoyi.disk.mapper;

import java.util.List;
import com.ruoyi.disk.domain.DiskShareFile;
import org.apache.ibatis.annotations.Param;

/**
 * 分享Mapper接口
 * 
 * @author maple
 * @date 2024-04-11
 */
public interface DiskShareFileMapper 
{
    /**
     * 查询分享
     * 
     * @param id 分享主键
     * @return 分享
     */
    public DiskShareFile selectDiskShareFileById(Long id);

    /**
     * 查询分享列表
     * 
     * @param diskShareFile 分享
     * @return 分享集合
     */
    public List<DiskShareFile> selectDiskShareFileList(DiskShareFile diskShareFile);

    /**
     * 新增分享
     * 
     * @param diskShareFile 分享
     * @return 结果
     */
    public int insertDiskShareFile(DiskShareFile diskShareFile);

    /**
     * 修改分享
     * 
     * @param diskShareFile 分享
     * @return 结果
     */
    public int updateDiskShareFile(DiskShareFile diskShareFile);

    /**
     * 删除分享
     * 
     * @param id 分享主键
     * @return 结果
     */
    public int deleteDiskShareFileById(Long id);

    /**
     * 批量删除分享
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDiskShareFileByIds(Long[] ids);

    DiskShareFile get(@Param("uuid") String uuid);
}
