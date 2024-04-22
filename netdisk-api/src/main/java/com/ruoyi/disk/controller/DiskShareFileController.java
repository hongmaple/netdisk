package com.ruoyi.disk.controller;

import java.util.*;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.disk.domain.DiskFile;
import com.ruoyi.disk.service.IDiskFileService;
import com.ruoyi.system.service.ISysUserService;
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
import com.ruoyi.disk.domain.DiskShareFile;
import com.ruoyi.disk.service.IDiskShareFileService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 分享Controller
 * 
 * @author maple
 * @date 2024-04-11
 */
@RestController
@RequestMapping("/disk/share")
public class DiskShareFileController extends BaseController
{
    @Autowired
    private IDiskShareFileService diskShareFileService;

    @Autowired
    private IDiskFileService diskFileService;

    @Autowired
    private ISysUserService iSysUserService;

    /**
     * 查询分享列表
     */
    @PreAuthorize("@ss.hasPermi('disk:share:list')")
    @GetMapping("/list")
    public TableDataInfo list(DiskShareFile diskShareFile)
    {
        startPage();
        diskShareFile.setCreateId(getUserId());
        List<DiskShareFile> list = diskShareFileService.selectDiskShareFileList(diskShareFile);
        return getDataTable(list);
    }

    /**
     * 导出分享列表
     */
    @PreAuthorize("@ss.hasPermi('disk:share:export')")
    @Log(title = "分享", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DiskShareFile diskShareFile)
    {
        List<DiskShareFile> list = diskShareFileService.selectDiskShareFileList(diskShareFile);
        ExcelUtil<DiskShareFile> util = new ExcelUtil<DiskShareFile>(DiskShareFile.class);
        util.exportExcel(response, list, "分享数据");
    }

    /**
     * 获取分享详细信息
     */
    @PreAuthorize("@ss.hasPermi('disk:share:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(diskShareFileService.selectDiskShareFileById(id));
    }

    /**
     * 新增分享
     */
    @PreAuthorize("@ss.hasPermi('disk:share:add')")
    @Log(title = "分享", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DiskShareFile diskShareFile)
    {
        diskShareFile.setCreateId(getUserId());
        String[] fileIdsArry = diskShareFile.getFileIds().split(",");
        List<Long> shareFileIds = Arrays.stream(fileIdsArry)
                .map(Long::valueOf)
                .collect(Collectors.toList());
        List<DiskFile> allShareFiles = diskFileService.selectDiskFileListByIds(shareFileIds.toArray(new Long[0]));
        List<DiskFile> allDiskFiles = diskFileService.selectAll();
        shareFileIds.forEach(parentId -> diskFileService.getChildPerms(allDiskFiles,allShareFiles,parentId));
        diskShareFile.setAllFileIds(StringUtils.join(allShareFiles.stream().map(DiskFile::getId).collect(Collectors.toList()), ","));
        return AjaxResult.success(diskShareFileService.insertDiskShareFile(diskShareFile));
    }

    /**
     * 修改分享
     */
    @PreAuthorize("@ss.hasPermi('disk:share:edit')")
    @Log(title = "分享", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DiskShareFile diskShareFile)
    {
        return AjaxResult.success(diskShareFileService.updateDiskShareFile(diskShareFile));
    }

    /**
     * 删除分享
     */
    @PreAuthorize("@ss.hasPermi('disk:share:remove')")
    @Log(title = "分享", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(diskShareFileService.deleteDiskShareFileByIds(ids));
    }

    @GetMapping("/listByUUIDAndsecretKey")
    public AjaxResult listByUUIDAndsecretKey(DiskShareFile diskShareFile)
    {
        DiskShareFile diskShareFile1 = diskShareFileService.get(diskShareFile.getUuid().trim());
        diskShareFileService.verify(diskShareFile,diskShareFile1);
        List<DiskFile> list = diskFileService.selectDiskFileListByIds(
                Arrays.stream(diskShareFile1.getFileIds().split(","))
                        .map(String::trim)
                        .map(Long::valueOf)
                        .toArray(Long[]::new));
        if (CollectionUtil.isEmpty(list)) throw new ServiceException("文件不存在") ;
        List<Long> userIds = list.stream().map(DiskFile::getCreateId).collect(Collectors.toList());
        List<SysUser> sysUsers = iSysUserService.selectUserByIds(userIds);
        list.forEach(diskFile -> sysUsers.stream().filter(sysUser -> sysUser.getUserId().equals(diskFile.getCreateId())).findFirst().ifPresent(
                diskFile::setSysUser
        ));
        return AjaxResult.success(list);
    }

    @GetMapping("/info/{uuid}")
    public AjaxResult getInfo(@PathVariable("uuid") String uuid) {
        DiskShareFile diskShareFile = diskShareFileService.get(uuid);
        if (Objects.isNull(diskShareFile)) throw new ServiceException("分享不存在");
        diskShareFile.setSecretKey("");
        SysUser sysUser = iSysUserService.selectUserById(diskShareFile.getCreateId());
        SysUser sysUserVo = new SysUser();
        sysUserVo.setUserName(sysUser.getUserName());
        sysUserVo.setNickName(sysUser.getNickName());
        sysUserVo.setAvatar(sysUser.getAvatar());
        diskShareFile.setSysUser(sysUserVo);
        return AjaxResult.success(diskShareFile);
    }

}
