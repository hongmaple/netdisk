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
import com.ruoyi.disk.domain.DiskRecoveryFile;
import com.ruoyi.disk.service.IDiskRecoveryFileService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 回收站Controller
 * 
 * @author maple
 * @date 2024-04-11
 */
@RestController
@RequestMapping("/disk/recovery")
public class DiskRecoveryFileController extends BaseController
{
    @Autowired
    private IDiskRecoveryFileService diskRecoveryFileService;

    /**
     * 查询回收站列表
     */
    @PreAuthorize("@ss.hasPermi('disk:recovery:list')")
    @GetMapping("/list")
    public TableDataInfo list(DiskRecoveryFile diskRecoveryFile)
    {
        startPage("id desc");
        diskRecoveryFile.setCreateId(getUserId());
        List<DiskRecoveryFile> list = diskRecoveryFileService.selectDiskRecoveryFileList(diskRecoveryFile);
        return getDataTable(list);
    }

    /**
     * 导出回收站列表
     */
    @PreAuthorize("@ss.hasPermi('disk:recovery:export')")
    @Log(title = "回收站", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DiskRecoveryFile diskRecoveryFile)
    {
        List<DiskRecoveryFile> list = diskRecoveryFileService.selectDiskRecoveryFileList(diskRecoveryFile);
        ExcelUtil<DiskRecoveryFile> util = new ExcelUtil<DiskRecoveryFile>(DiskRecoveryFile.class);
        util.exportExcel(response, list, "回收站数据");
    }

    /**
     * 获取回收站详细信息
     */
    @PreAuthorize("@ss.hasPermi('disk:recovery:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(diskRecoveryFileService.selectDiskRecoveryFileById(id));
    }

    /**
     * 新增回收站
     */
    @PreAuthorize("@ss.hasPermi('disk:recovery:add')")
    @Log(title = "回收站", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DiskRecoveryFile diskRecoveryFile)
    {
        diskRecoveryFile.setCreateId(getUserId());
        return toAjax(diskRecoveryFileService.insertDiskRecoveryFile(diskRecoveryFile));
    }

    /**
     * 修改回收站
     */
    @PreAuthorize("@ss.hasPermi('disk:recovery:edit')")
    @Log(title = "回收站", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DiskRecoveryFile diskRecoveryFile)
    {
        return toAjax(diskRecoveryFileService.updateDiskRecoveryFile(diskRecoveryFile));
    }

    /**
     * 删除回收站
     */
    @PreAuthorize("@ss.hasPermi('disk:recovery:remove')")
    @Log(title = "回收站", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(diskRecoveryFileService.deleteDiskRecoveryFileByIds(ids));
    }

    /**
     * 恢复文件
     */
    @PreAuthorize("@ss.hasPermi('disk:recovery:add')")
    @Log(title = "恢复文件", businessType = BusinessType.UPDATE)
    @PutMapping("/refresh/{ids}")
    public AjaxResult refresh(@PathVariable Long[] ids)
    {
       return toAjax(diskRecoveryFileService.refresh(ids,getUserId()));
    }


}
