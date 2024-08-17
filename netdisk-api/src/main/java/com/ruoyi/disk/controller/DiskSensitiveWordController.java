package com.ruoyi.disk.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.disk.domain.DiskSensitiveWord;
import com.ruoyi.disk.service.IDiskSensitiveWordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 敏感词Controller
 * 
 * @author maple
 * @date 2024-04-17
 */
@RestController
@RequestMapping("/disk/sensitiveWord")
public class DiskSensitiveWordController extends BaseController
{
    @Autowired
    private IDiskSensitiveWordService diskSensitiveWordService;

    /**
     * 查询敏感词列表
     */
    @PreAuthorize("@ss.hasPermi('disk:sensitiveWord:list')")
    @GetMapping("/list")
    public TableDataInfo list(DiskSensitiveWord diskSensitiveWord)
    {
        startPage("id desc");
        List<DiskSensitiveWord> list = diskSensitiveWordService.selectDiskSensitiveWordList(diskSensitiveWord);
        return getDataTable(list);
    }

    /**
     * 导出敏感词列表
     */
    @PreAuthorize("@ss.hasPermi('disk:sensitiveWord:export')")
    @Log(title = "敏感词", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DiskSensitiveWord diskSensitiveWord)
    {
        List<DiskSensitiveWord> list = diskSensitiveWordService.selectDiskSensitiveWordList(diskSensitiveWord);
        ExcelUtil<DiskSensitiveWord> util = new ExcelUtil<DiskSensitiveWord>(DiskSensitiveWord.class);
        util.exportExcel(response, list, "敏感词数据");
    }

    /**
     * 获取敏感词详细信息
     */
    @PreAuthorize("@ss.hasPermi('disk:sensitiveWord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(diskSensitiveWordService.selectDiskSensitiveWordById(id));
    }

    /**
     * 新增敏感词
     */
    @PreAuthorize("@ss.hasPermi('disk:sensitiveWord:add')")
    @Log(title = "敏感词", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DiskSensitiveWord diskSensitiveWord)
    {
        diskSensitiveWord.setUserName(getUsername());
        return toAjax(diskSensitiveWordService.insertDiskSensitiveWord(diskSensitiveWord));
    }

    /**
     * 修改敏感词
     */
    @PreAuthorize("@ss.hasPermi('disk:sensitiveWord:edit')")
    @Log(title = "敏感词", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DiskSensitiveWord diskSensitiveWord)
    {
        return toAjax(diskSensitiveWordService.updateDiskSensitiveWord(diskSensitiveWord));
    }

    /**
     * 删除敏感词
     */
    @PreAuthorize("@ss.hasPermi('disk:sensitiveWord:remove')")
    @Log(title = "敏感词", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(diskSensitiveWordService.deleteDiskSensitiveWordByIds(ids));
    }
}
