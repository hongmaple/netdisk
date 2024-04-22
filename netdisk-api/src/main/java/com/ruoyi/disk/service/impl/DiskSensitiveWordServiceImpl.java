package com.ruoyi.disk.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.bloomfilter.BitMapBloomFilter;
import cn.hutool.core.collection.CollectionUtil;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.maple.commom.utils.BadWordFilter;
import com.ruoyi.maple.commom.utils.SensitiveFilterUtil;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.disk.mapper.DiskSensitiveWordMapper;
import com.ruoyi.disk.domain.DiskSensitiveWord;
import com.ruoyi.disk.service.IDiskSensitiveWordService;

/**
 * 敏感词Service业务层处理
 * 
 * @author maple
 * @date 2024-04-17
 */
@Service
public class DiskSensitiveWordServiceImpl implements IDiskSensitiveWordService 
{
    @Autowired
    private DiskSensitiveWordMapper diskSensitiveWordMapper;

    @Autowired
    private ISysConfigService configService;

    /**
     * 查询敏感词
     * 
     * @param id 敏感词主键
     * @return 敏感词
     */
    @Override
    public DiskSensitiveWord selectDiskSensitiveWordById(Long id)
    {
        return diskSensitiveWordMapper.selectDiskSensitiveWordById(id);
    }

    /**
     * 查询敏感词列表
     * 
     * @param diskSensitiveWord 敏感词
     * @return 敏感词
     */
    @Override
    public List<DiskSensitiveWord> selectDiskSensitiveWordList(DiskSensitiveWord diskSensitiveWord)
    {
        return diskSensitiveWordMapper.selectDiskSensitiveWordList(diskSensitiveWord);
    }

    /**
     * 新增敏感词
     * 
     * @param diskSensitiveWord 敏感词
     * @return 结果
     */
    @Override
    public int insertDiskSensitiveWord(DiskSensitiveWord diskSensitiveWord)
    {
        diskSensitiveWord.setCreateTime(DateUtils.getNowDate());
        return diskSensitiveWordMapper.insertDiskSensitiveWord(diskSensitiveWord);
    }

    /**
     * 修改敏感词
     * 
     * @param diskSensitiveWord 敏感词
     * @return 结果
     */
    @Override
    public int updateDiskSensitiveWord(DiskSensitiveWord diskSensitiveWord)
    {
        diskSensitiveWord.setUpdateTime(DateUtils.getNowDate());
        return diskSensitiveWordMapper.updateDiskSensitiveWord(diskSensitiveWord);
    }

    /**
     * 批量删除敏感词
     * 
     * @param ids 需要删除的敏感词主键
     * @return 结果
     */
    @Override
    public int deleteDiskSensitiveWordByIds(Long[] ids)
    {
        return diskSensitiveWordMapper.deleteDiskSensitiveWordByIds(ids);
    }

    /**
     * 删除敏感词信息
     * 
     * @param id 敏感词主键
     * @return 结果
     */
    @Override
    public int deleteDiskSensitiveWordById(Long id)
    {
        return diskSensitiveWordMapper.deleteDiskSensitiveWordById(id);
    }

    @Override
    public List<DiskSensitiveWord> selectDiskSensitiveWordAllList() {
        return diskSensitiveWordMapper.selectDiskSensitiveWordAllList();
    }

    @Override
    public boolean filterSensitiveWord(String text) {
        String ifFilter = configService.selectConfigByKey("sensitiveWord.ifFilter");
        if ("false".equals(ifFilter)) return false;
        //        BitMapBloomFilter filter = new BitMapBloomFilter(sensitiveWordList.size());
//        sensitiveWordList.forEach(filter::add);
//        return filter.contains(text);
//        BadWordFilter.loadConfigs(sensitiveWordList);
//        return BadWordFilter.filterText(text);
        //这里我的敏感词存在数据库 大家结合自己的业务需求改动 可以存在txt文件中或者excel
//        QueryFilter filter = new QueryFilter(DsSensitiveWords.class);
//        filter.addFilter("type=", type);
//        List<DsSensitiveWords> list = dsSensitiveWordsService.find(filter);
//        for (DsSensitiveWords dsSensitiveWords : list) {
//            //从数据库中取出敏感词 且用set去重
//            set.add(dsSensitiveWords.getWords());
//        }
        HashSet<String> set = this.selectDiskSensitiveWordAllList()
                .stream().map(DiskSensitiveWord::getSensitiveWord).collect(Collectors.toCollection(HashSet::new));
        HashSet hashSet = SensitiveFilterUtil.checkTxt(text, set);
        if (CollectionUtil.isEmpty(hashSet)) return false;
        throw new ServiceException("有敏感词 "+ hashSet);
    }
}
