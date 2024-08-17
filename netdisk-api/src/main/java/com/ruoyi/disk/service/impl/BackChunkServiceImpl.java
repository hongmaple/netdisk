package com.ruoyi.disk.service.impl;

import com.ruoyi.disk.domain.BackChunk;
import com.ruoyi.disk.mapper.BackChunkMapper;
import com.ruoyi.disk.service.IBackChunkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文件分片管理Service业务层处理
 * 
 * @author csixframework
 * @date 2020-07-28
 */
@Service
public class BackChunkServiceImpl implements IBackChunkService
{
    @Autowired
    private BackChunkMapper backChunkMapper;

    /**
     * 查询文件分片管理
     * 
     * @param id 文件分片管理ID
     * @return 文件分片管理
     */
    @Override
    public BackChunk selectBackChunkById(Long id)
    {
        return backChunkMapper.selectBackChunkById(id);
    }

    /**
     * 查询文件分片管理列表
     * 
     * @param backChunk 文件分片管理
     * @return 文件分片管理
     */
    @Override
    public List<BackChunk> selectBackChunkList(BackChunk backChunk)
    {
        return backChunkMapper.selectBackChunkList(backChunk);
    }

    /**
     * 新增文件分片管理
     * 
     * @param backChunk 文件分片管理
     * @return 结果
     */
    @Override
    public int insertBackChunk(BackChunk backChunk)
    {
        return backChunkMapper.insertBackChunk(backChunk);
    }

    /**
     * 修改文件分片管理
     * 
     * @param backChunk 文件分片管理
     * @return 结果
     */
    @Override
    public int updateBackChunk(BackChunk backChunk)
    {
        return backChunkMapper.updateBackChunk(backChunk);
    }

    /**
     * 批量删除文件分片管理
     * 
     * @param ids 需要删除的文件分片管理ID
     * @return 结果
     */
    @Override
    public int deleteBackChunkByIds(Long[] ids)
    {
        return backChunkMapper.deleteBackChunkByIds(ids);
    }

    /**
     * 删除文件分片管理信息
     * 
     * @param id 文件分片管理ID
     * @return 结果
     */
    @Override
    public int deleteBackChunkById(Long id)
    {
        return backChunkMapper.deleteBackChunkById(id);
    }
}