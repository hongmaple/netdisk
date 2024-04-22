package com.ruoyi.disk.service;

import java.util.List;
import com.ruoyi.disk.domain.DiskSensitiveWord;

/**
 * 敏感词Service接口
 * 
 * @author maple
 * @date 2024-04-17
 */
public interface IDiskSensitiveWordService 
{
    /**
     * 查询敏感词
     * 
     * @param id 敏感词主键
     * @return 敏感词
     */
    public DiskSensitiveWord selectDiskSensitiveWordById(Long id);

    /**
     * 查询敏感词列表
     * 
     * @param diskSensitiveWord 敏感词
     * @return 敏感词集合
     */
    public List<DiskSensitiveWord> selectDiskSensitiveWordList(DiskSensitiveWord diskSensitiveWord);

    /**
     * 新增敏感词
     * 
     * @param diskSensitiveWord 敏感词
     * @return 结果
     */
    public int insertDiskSensitiveWord(DiskSensitiveWord diskSensitiveWord);

    /**
     * 修改敏感词
     * 
     * @param diskSensitiveWord 敏感词
     * @return 结果
     */
    public int updateDiskSensitiveWord(DiskSensitiveWord diskSensitiveWord);

    /**
     * 批量删除敏感词
     * 
     * @param ids 需要删除的敏感词主键集合
     * @return 结果
     */
    public int deleteDiskSensitiveWordByIds(Long[] ids);

    /**
     * 删除敏感词信息
     * 
     * @param id 敏感词主键
     * @return 结果
     */
    public int deleteDiskSensitiveWordById(Long id);

    List<DiskSensitiveWord> selectDiskSensitiveWordAllList();

    /**
     * 是否有敏感词 是：true 否：false
     * @param text 待检测词
     * @return 是否有敏感词 是：true 否：false
     */
    boolean filterSensitiveWord(String text);
}
