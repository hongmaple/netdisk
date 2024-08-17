package com.ruoyi.disk.service.impl;

import com.ruoyi.disk.domain.BackFilelist;
import com.ruoyi.disk.mapper.BackFilelistMapper;
import com.ruoyi.disk.service.IBackFilelistService;
import org.apache.commons.compress.utils.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * 已上传文件列表Service业务层处理
 */
@Service
public class BackFilelistServiceImpl implements IBackFilelistService
{
    private static final Logger log = LoggerFactory.getLogger(BackFilelistServiceImpl.class);

    @Autowired
    private BackFilelistMapper backFilelistMapper;

    @Value("${ruoyi.profile}")
    private String filePath;

    private final static String folderPath = "/file";
    /**
     * 查询已上传文件列表
     *
     * @param id 已上传文件列表ID
     * @return 已上传文件列表
     */
    @Override
    public BackFilelist selectBackFilelistById(Long id)
    {
        return backFilelistMapper.selectBackFilelistById(id);
    }

    /**
     * 查询已上传文件列表列表
     *
     * @param backFilelist 已上传文件列表
     * @return 已上传文件列表
     */
    @Override
    public List<BackFilelist> selectBackFilelistList(BackFilelist backFilelist)
    {
        return backFilelistMapper.selectBackFilelistList(backFilelist);
    }

    /**
     * 新增已上传文件列表
     *
     * @param backFilelist 已上传文件列表
     * @return 结果
     */
    @Override
    public int insertBackFilelist(BackFilelist backFilelist)
    {
        return backFilelistMapper.insertBackFilelist(backFilelist);
    }

    /**
     * 修改已上传文件列表
     *
     * @param backFilelist 已上传文件列表
     * @return 结果
     */
    @Override
    public int updateBackFilelist(BackFilelist backFilelist)
    {
        return backFilelistMapper.updateBackFilelist(backFilelist);
    }

    /**
     * 批量删除已上传文件列表
     *
     * @param ids 需要删除的已上传文件列表ID
     * @return 结果
     */
    @Override
    public int deleteBackFilelistByIds(Long[] ids)
    {
        ArrayList<Boolean> dels = Lists.newArrayList();
        //先删除文件再删除对应的表记录
        for (Long id : ids) {
            BackFilelist backFilelist = backFilelistMapper.selectBackFilelistById(id);
            String fileFolder = filePath + folderPath + "/" + backFilelist.getIdentifier();
            String filePathTrue=fileFolder+"/"+backFilelist.getFilename();
            boolean b=false;
            try {
                b = Files.deleteIfExists(Paths.get(filePathTrue));
                dels.add(b);
              /*  if(b){
                    FileUtils.deleteDirectory(new File(fileFolder));
                }*/
            } catch (IOException e) {
                log.info("删除文件: {}报错，信息为{}", filePathTrue,e.getMessage());
            }
        }
        if(dels.contains(false)){
            //删除失败
            return 0;
        }
        return backFilelistMapper.deleteBackFilelistByIds(ids);
    }

    /**
     * 删除已上传文件列表信息
     *
     * @param id 已上传文件列表ID
     * @return 结果
     */
    @Override
    public int deleteBackFilelistById(Long id)
    {
        return backFilelistMapper.deleteBackFilelistById(id);
    }


}