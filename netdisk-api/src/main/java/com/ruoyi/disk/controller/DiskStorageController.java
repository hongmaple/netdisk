package com.ruoyi.disk.controller;

import java.util.*;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollectionUtil;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.disk.domain.DiskFile;
import com.ruoyi.disk.service.IDiskFileService;
import com.ruoyi.disk.service.IDiskRecoveryFileService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
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
import com.ruoyi.disk.domain.DiskStorage;
import com.ruoyi.disk.service.IDiskStorageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户存储Controller
 * 
 * @author maple
 * @date 2024-04-11
 */
@RestController
@RequestMapping("/disk/storage")
public class DiskStorageController extends BaseController
{
    @Autowired
    private IDiskStorageService diskStorageService;

    @Autowired
    private ISysUserService iSysUserService;

    @Autowired
    private IDiskFileService diskFileService;

    @Autowired
    private IDiskRecoveryFileService recoveryFileService;

    /**
     * 查询用户存储列表
     */
    @PreAuthorize("@ss.hasPermi('disk:storage:list')")
    @GetMapping("/myList")
    public TableDataInfo myList(DiskStorage diskStorage)
    {
        startPage("id desc");
        diskStorage.setCreateId(getUserId());
        DiskStorage initDiskStorage = new DiskStorage();
        initDiskStorage.setCreateId(getUserId());
        diskStorageService.insertDiskStorage(initDiskStorage);
        List<DiskStorage> list = diskStorageService.selectDiskStorageList(diskStorage);
        List<Long> userIds = list.stream().map(DiskStorage::getCreateId).collect(Collectors.toList());
        List<SysUser> sysUsers = iSysUserService.selectUserByIds(userIds);
        list.forEach(storage -> sysUsers.stream().filter(sysUser -> sysUser.getUserId().equals(storage.getCreateId())).findFirst().ifPresent(
                storage::setSysUser
        ));
        return getDataTable(list);
    }

    /**
     * 查询用户存储列表
     */
    @PreAuthorize("@ss.hasPermi('disk:storage:list')")
    @GetMapping("/list")
    public TableDataInfo list(DiskStorage diskStorage)
    {
        startPage("id desc");
        if (!getLoginUser().getUser().isAdmin()) diskStorage.setCreateId(getUserId());
        List<DiskStorage> list = diskStorageService.selectDiskStorageList(diskStorage);
        list = list.stream().filter(s -> !s.getCreateId().equals(getUserId())).collect(Collectors.toList());
        List<Long> userIds = list.stream().map(DiskStorage::getCreateId).collect(Collectors.toList());
        List<SysUser> sysUsers = iSysUserService.selectUserByIds(userIds);
        list.forEach(storage -> sysUsers.stream().filter(sysUser -> sysUser.getUserId().equals(storage.getCreateId())).findFirst().ifPresent(
                storage::setSysUser
        ));
        DiskStorage initDiskStorage = new DiskStorage();
        initDiskStorage.setCreateId(getUserId());
        diskStorageService.insertDiskStorage(initDiskStorage);
        return getDataTable(list);
    }

    /**
     * 导出用户存储列表
     */
    @PreAuthorize("@ss.hasPermi('disk:storage:export')")
    @Log(title = "用户存储", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DiskStorage diskStorage)
    {
        List<DiskStorage> list = diskStorageService.selectDiskStorageList(diskStorage);
        ExcelUtil<DiskStorage> util = new ExcelUtil<DiskStorage>(DiskStorage.class);
        util.exportExcel(response, list, "用户存储数据");
    }

    /**
     * 获取用户存储详细信息
     */
    @PreAuthorize("@ss.hasPermi('disk:storage:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(diskStorageService.selectDiskStorageById(id));
    }

    /**
     * 新增用户存储
     */
    @PreAuthorize("@ss.hasPermi('disk:storage:add')")
    @Log(title = "用户存储", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DiskStorage diskStorage)
    {
        diskStorage.setCreateId(getUserId());
        return toAjax(diskStorageService.insertDiskStorage(diskStorage));
    }

    /**
     * 修改用户存储
     */
    @PreAuthorize("@ss.hasPermi('disk:storage:edit')")
    @Log(title = "用户存储", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DiskStorage diskStorage)
    {
        return toAjax(diskStorageService.updateDiskStorage(diskStorage));
    }

    /**
     * 删除用户存储
     */
    @PreAuthorize("@ss.hasPermi('disk:storage:remove')")
    @Log(title = "用户存储", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(diskStorageService.deleteDiskStorageByIds(ids));
    }

    @GetMapping("/getFileStorageStats")
    public AjaxResult getFileStorageStats() {
        Map<String, Object> result = new HashMap<>(3);
        List<Map<String, String>> typeCapacityStatsList = new ArrayList<>();
        List<Map<String, Object>> typeCapacityStats = diskFileService.typeCapacityStats(getUserId());
        typeCapacityStats.forEach(s -> {
            Map<String, String> data = new HashMap<>(2);
            data.put("name", diskFileService.getTypeName(Integer.valueOf(s.get("type").toString())));
            data.put("value", s.get("size").toString());
            typeCapacityStatsList.add(data);
        });

        List<Map<String, String>> fileTypeNumStatsList = new ArrayList<>();
        List<Map<String, Object>> fileTypeNumStats = diskFileService.fileTypeNumStats(getUserId());
        fileTypeNumStats.forEach(s -> {
            Map<String, String> data = new HashMap<>(2);
            data.put("name", diskFileService.getTypeName(Integer.valueOf(s.get("type").toString())));
            data.put("value", s.get("num").toString());
            fileTypeNumStatsList.add(data);
        });

        result.put("typeCapacityStats", typeCapacityStatsList);
        result.put("fileTypeNumStats", fileTypeNumStatsList);
        return AjaxResult.success(result);
    }

    /**
     * 查看用户存储的文件列表
     */
    @PreAuthorize("@ss.hasPermi('disk:storage:getStorageFileListByUserId')")
    @Log(title = "查看用户存储的文件列表", businessType = BusinessType.OTHER)
    @GetMapping("/getStorageFileListByUserId/{userId}")
    public TableDataInfo getStorageFileListByUserId(DiskFile diskFile,@PathVariable("userId") Long userId) {
        startPage("id desc");
        SysUser currentUser = getLoginUser().getUser();
        if (StringUtils.isNotNull(currentUser) && currentUser.isAdmin()) {
            diskFile.setCreateId(userId);
        }else {
            diskFile.setCreateId(getUserId());
        }
        List<DiskFile> list = diskFileService.selectDiskFileList(diskFile);
        List<DiskFile> allDiskFiles = diskFileService.selectAll();
        list.forEach(f -> {
            if (f.getIsDir()==1) {
                List<DiskFile> allChildFiles = new ArrayList<>();
                diskFileService.getChildPerms(allDiskFiles,allChildFiles,f.getId());
                f.setSize(allChildFiles.stream().map(DiskFile::getSize)
                        .reduce(0L,Long::sum));
            }
        });
        return getDataTable(list);
    }

    /**
     * 格式化磁盘
     */
    @PreAuthorize("@ss.hasPermi('disk:storage:formattedDisk')")
    @Log(title = "格式化磁盘", businessType = BusinessType.CLEAN)
    @DeleteMapping("/formattedDisk/{userId}")
    @Transactional
    public AjaxResult formatDisk(@PathVariable("userId") Long userId) {
        LoginUser loginUser = getLoginUser();
        SysUser currentUser = loginUser.getUser();
        List<Long> fileIds;
        if (StringUtils.isNotNull(currentUser) && !currentUser.isAdmin()) {
            fileIds = diskFileService.selectAllIdsByUserId(getUserId());
            recoveryFileService.deleteDiskRecoveryFileByUserId(getUserId());
            diskStorageService.updateUsedCapacityByUserId(getUserId(),0L);
        } else {
            fileIds = diskFileService.selectAllIdsByUserId(userId);
            recoveryFileService.deleteDiskRecoveryFileByUserId(userId);
            diskStorageService.updateUsedCapacityByUserId(userId,0L);
        }
        int num = 0;
        if (CollectionUtil.isNotEmpty(fileIds)) {
            num = diskFileService.deleteDiskFileByIdsAndRemoveFile(fileIds);
        }
        return AjaxResult.success(String.format("格式化磁盘成功,共删除文件/目录：%s个",num));
    }
}
