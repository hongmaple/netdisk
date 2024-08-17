package com.ruoyi.disk.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.disk.domain.BackFilelist;
import com.ruoyi.disk.service.IBackFilelistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 已上传文件列表Controller
 */
@RestController
@RequestMapping("/disk/backFilelist")
public class BackFilelistController extends BaseController {
    @Autowired
    private IBackFilelistService backFilelistService;

    /**
     * 查询已上传文件列表列表
     */
    @PreAuthorize("@ss.hasPermi('disk:backFilelist:query')")
    @GetMapping("/list")
    public TableDataInfo list(BackFilelist backFilelist)
    {
        startPage("id desc");
        List<BackFilelist> list = backFilelistService.selectBackFilelistList(backFilelist);
        return getDataTable(list);
    }

    /**
     * 导出已上传文件列表列表
     */
    @PreAuthorize("@ss.hasPermi('disk:backFilelist:export')")
    @Log(title = "已上传文件列表", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BackFilelist backFilelist)
    {
        List<BackFilelist> list = backFilelistService.selectBackFilelistList(backFilelist);
        ExcelUtil<BackFilelist> util = new ExcelUtil<BackFilelist>(BackFilelist.class);
        return util.exportExcel(list, "filelist");
    }

    /**
     * 获取已上传文件列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('disk:backFilelist:detail')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(backFilelistService.selectBackFilelistById(id));
    }

    /**
     * 新增已上传文件列表
     */
    @PreAuthorize("@ss.hasPermi('disk:backFilelist:add')")
    @Log(title = "已上传文件列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BackFilelist backFilelist)
    {
        return toAjax(backFilelistService.insertBackFilelist(backFilelist));
    }

    /**
     * 修改已上传文件列表
     */
    @PreAuthorize("@ss.hasPermi('disk:backFilelist:edit')")
    @Log(title = "已上传文件列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BackFilelist backFilelist)
    {
        return toAjax(backFilelistService.updateBackFilelist(backFilelist));
    }

    /**
     * 删除已上传文件列表
     */
    @PreAuthorize("@ss.hasPermi('disk:backFilelist:remove')")
    @Log(title = "已上传文件列表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(backFilelistService.deleteBackFilelistByIds(ids));
    }
}
