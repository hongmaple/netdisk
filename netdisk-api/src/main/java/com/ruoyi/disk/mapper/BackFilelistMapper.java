package com.ruoyi.disk.mapper;


import com.ruoyi.disk.domain.BackFilelist;

import java.util.List;

/**
 * 已上传文件列表Mapper接口
 */
public interface BackFilelistMapper 
{
    /**
     * 查询已上传文件列表
     * 
     * @param id 已上传文件列表ID
     * @return 已上传文件列表
     */
    public BackFilelist selectBackFilelistById(Long id);

    /**
     *
     * 功能描述: 查询单条已上传文件记录
     *
     * @param: backFilelist 已上传文件列表
     * @return:
     * @author: xjd
     * @date: 2020/7/31 23:07
     */
    Integer selectSingleBackFilelist(BackFilelist backFilelist);

    /**
     * 查询已上传文件列表列表
     * 
     * @param backFilelist 已上传文件列表
     * @return 已上传文件列表集合
     */
    public List<BackFilelist> selectBackFilelistList(BackFilelist backFilelist);

    /**
     * 新增已上传文件列表
     * 
     * @param backFilelist 已上传文件列表
     * @return 结果
     */
    public int insertBackFilelist(BackFilelist backFilelist);

    /**
     * 修改已上传文件列表
     * 
     * @param backFilelist 已上传文件列表
     * @return 结果
     */
    public int updateBackFilelist(BackFilelist backFilelist);

    /**
     * 删除已上传文件列表
     * 
     * @param id 已上传文件列表ID
     * @return 结果
     */
    public int deleteBackFilelistById(Long id);

    /**
     * 批量删除已上传文件列表
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBackFilelistByIds(Long[] ids);
}