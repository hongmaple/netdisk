package com.ruoyi.disk.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.disk.domain.BackChunk;
import com.ruoyi.disk.domain.BackFilelist;
import com.ruoyi.disk.domain.vo.CheckChunkVO;
import com.ruoyi.disk.service.IBackFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

/**
 * 文件管理Controller
 */
@RestController
@RequestMapping("/disk/fileManagement")
public class BackFileController extends BaseController
{
    @Autowired
    private IBackFileService backFileService;

    /**
     * 上传文件
     */
    @PreAuthorize("@ss.hasPermi('disk:fileManagement:upload')")
    @PostMapping("/upload")
    public AjaxResult postFileUpload(@ModelAttribute BackChunk chunk, HttpServletResponse response)
    {
        int i = backFileService.postFileUpload(chunk, response);
        return toAjax(i);
    }

    /**
     * 检查文件上传状态
     */
    @PreAuthorize("@ss.hasPermi('disk:fileManagement:check')")
    @GetMapping("/upload")
    public CheckChunkVO getFileUpload(@ModelAttribute BackChunk chunk, HttpServletResponse response)
    {
        //查询根据md5查询文件是否存在
        CheckChunkVO fileUpload = backFileService.getFileUpload(chunk, response);
        return fileUpload;
    }

    /**
     *
     */
    @PreAuthorize("@ss.hasPermi('disk:fileManagement:remove')")
    @Log(title = "用户删除文件", businessType = BusinessType.DELETE)
	@DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable("id") Long id)
    {
        return toAjax(backFileService.deleteBackFileByIds(id));
    }

    /**
     * 检查文件上传状态
     */
    @PreAuthorize("@ss.hasPermi('disk:fileManagement:merge')")
    @PostMapping("/merge")
    public AjaxResult merge(BackFilelist fileInfo)
    {
        String path = backFileService.mergeFile(fileInfo);
        return AjaxResult.success("操作成功", path);
    }
}
