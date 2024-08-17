package com.ruoyi.disk.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.disk.domain.BackChunk;
import com.ruoyi.disk.service.IBackChunkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 文件分片管理Controller
 */
@RestController
@RequestMapping("/disk/chunk")
public class BackChunkController extends BaseController
{
    @Autowired
    private IBackChunkService backChunkService;

    /**
     * 查询文件分片管理列表
     */
    @PreAuthorize("@ss.hasPermi('file:chunk:list')")
    @GetMapping("/list")
    public TableDataInfo list(BackChunk backChunk)
    {
        startPage("id desc");
        List<BackChunk> list = backChunkService.selectBackChunkList(backChunk);
        return getDataTable(list);
    }

    /**
     * 导出文件分片管理列表
     */
    @PreAuthorize("@ss.hasPermi('disk:fileManagement:export')")
    @Log(title = "文件分片管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BackChunk backChunk)
    {
        List<BackChunk> list = backChunkService.selectBackChunkList(backChunk);
        ExcelUtil<BackChunk> util = new ExcelUtil<BackChunk>(BackChunk.class);
        return util.exportExcel(list, "chunk");
    }

    /**
     * 获取文件分片管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('file:chunk:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(backChunkService.selectBackChunkById(id));
    }

    /**
     * 新增文件分片管理
     */
    @PreAuthorize("@ss.hasPermi('file:chunk:add')")
    @Log(title = "文件分片管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BackChunk backChunk)
    {
        return toAjax(backChunkService.insertBackChunk(backChunk));
    }

    /**
     * 修改文件分片管理
     */
    @PreAuthorize("@ss.hasPermi('file:chunk:edit')")
    @Log(title = "文件分片管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BackChunk backChunk)
    {
        return toAjax(backChunkService.updateBackChunk(backChunk));
    }

    /**
     * 删除文件分片管理
     */
    @PreAuthorize("@ss.hasPermi('file:chunk:remove')")
    @Log(title = "文件分片管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(backChunkService.deleteBackChunkByIds(ids));
    }
}
