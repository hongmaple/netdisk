package com.ruoyi.disk.mapper;

import com.ruoyi.disk.domain.BackChunk;

import java.util.List;

/**
 * 文件分片管理Mapper接口
 * 
 */
public interface BackChunkMapper 
{
    /**
     * 查询文件分片管理
     * 
     * @param id 文件分片管理ID
     * @return 文件分片管理
     */
    public BackChunk selectBackChunkById(Long id);

    /**
     * 查询文件分片管理列表
     * 
     * @param backChunk 文件分片管理
     * @return 文件分片管理集合
     */
    public List<BackChunk> selectBackChunkList(BackChunk backChunk);

    /**
     * 新增文件分片管理
     * 
     * @param backChunk 文件分片管理
     * @return 结果
     */
    public int insertBackChunk(BackChunk backChunk);

    /**
     * 修改文件分片管理
     * 
     * @param backChunk 文件分片管理
     * @return 结果
     */
    public int updateBackChunk(BackChunk backChunk);

    /**
     * 删除文件分片管理
     * 
     * @param id 文件分片管理ID
     * @return 结果
     */
    public int deleteBackChunkById(Long id);

    /**
     *
     * 功能描述: 根据文件名和MD5值删除chunk记录
     *
     * @param:
     * @return:
     * @author: xjd
     * @date: 2020/7/31 23:43
     */
    int deleteBackChunkByIdentifier(BackChunk backChunk);

    /**
     * 批量删除文件分片管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBackChunkByIds(Long[] ids);
}