package com.ruoyi.disk.service;


import com.ruoyi.disk.domain.BackFilelist;

import java.util.List;

/**
 * 已上传文件列表Service接口
 * 
 */
public interface IBackFilelistService 
{
    /**
     * 查询已上传文件列表
     * 
     * @param id 已上传文件列表ID
     * @return 已上传文件列表
     */
    public BackFilelist selectBackFilelistById(Long id);

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
     * 批量删除已上传文件列表
     * 
     * @param ids 需要删除的已上传文件列表ID
     * @return 结果
     */
    public int deleteBackFilelistByIds(Long[] ids);

    /**
     * 删除已上传文件列表信息
     * 
     * @param id 已上传文件列表ID
     * @return 结果
     */
    public int deleteBackFilelistById(Long id);
}