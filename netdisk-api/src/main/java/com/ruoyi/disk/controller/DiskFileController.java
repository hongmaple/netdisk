package com.ruoyi.disk.controller;

import java.io.*;
import java.util.*;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.ZipUtil;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.disk.domain.*;
import com.ruoyi.disk.domain.bo.DownloadBo;
import com.ruoyi.disk.service.*;
import com.ruoyi.framework.config.ServerConfig;
import com.ruoyi.maple.commom.utils.BadWordFilter;
import com.ruoyi.system.service.ISysConfigService;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件Controller
 * 
 * @author maple
 * @date 2024-04-11
 */
@RestController
@RequestMapping("/disk/file")
public class DiskFileController extends BaseController
{
    private static final Logger log = LoggerFactory.getLogger(DiskFileController.class);

    @Autowired
    private IDiskFileService diskFileService;

    @Autowired
    private IDiskStorageService diskStorageService;

    @Autowired
    private IDiskRecoveryFileService diskRecoveryFileService;

    @Autowired
    private IDiskShareFileService diskShareFileService;

    @Autowired
    private ServerConfig serverConfig;

    @Autowired
    private IDiskSensitiveWordService diskSensitiveWordService;

    private static final String FILE_DELIMETER = ",";

    /**
     * 查询文件列表
     */
    @PreAuthorize("@ss.hasPermi('disk:file:list')")
    @GetMapping("/list")
    public TableDataInfo list(DiskFile diskFile)
    {
        startPage();
        diskFile.setCreateId(getUserId());
        DiskStorage diskStorage = new DiskStorage();
        diskStorage.setCreateId(getUserId());
        diskStorageService.insertDiskStorage(diskStorage);
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
     * 导出文件列表
     */
    @PreAuthorize("@ss.hasPermi('disk:file:export')")
    @Log(title = "文件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DiskFile diskFile)
    {
        List<DiskFile> list = diskFileService.selectDiskFileList(diskFile);
        ExcelUtil<DiskFile> util = new ExcelUtil<DiskFile>(DiskFile.class);
        util.exportExcel(response, list, "文件数据");
    }

    /**
     * 获取文件详细信息
     */
    @PreAuthorize("@ss.hasPermi('disk:file:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(diskFileService.selectDiskFileById(id));
    }

    /**
     * 新增文件
     */
    @PreAuthorize("@ss.hasPermi('disk:file:add')")
    @Log(title = "文件", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DiskFile diskFile)
    {
        diskFile.setCreateId(getUserId());
        if (diskFile.getIsDir()==1) {
            //是文件夹，设置url
            // 上传文件路径
            String url = Constants.RESOURCE_PREFIX;
            // 获取当前用户本人的存储目录
            DiskStorage diskStorage = diskStorageService.selectDiskStorageByUserId(SecurityUtils.getUserId());
            String[] localPaths = RuoYiConfig.getUploadPath().split("/");
            if (diskFile.getParentId()==0) {
                if (Objects.nonNull(diskStorage)) url = url+"/"+localPaths[localPaths.length-1]+"/"+diskStorage.getBaseDir()+"/"+diskFile.getName();
            }else {
                DiskFile parentIdFile = diskFileService.selectDiskFileById(diskFile.getParentId());
                if (Objects.isNull(parentIdFile)) throw new ServiceException("父文件夹不存在");
                String[] parentPaths = parentIdFile.getUrl().split("/");
                if (Objects.nonNull(diskStorage)) url = url+"/"+localPaths[localPaths.length-1]+"/"+diskStorage.getBaseDir()
                        +"/"+parentPaths[parentPaths.length-1]+"/"+diskFile.getName();
            }
            diskFile.setUrl(url);
            // 本地资源路径
            String localPath = RuoYiConfig.getProfile();
            // 数据库资源地址
            String filePath = localPath + StringUtils.substringAfter(diskFile.getUrl(), Constants.RESOURCE_PREFIX);
            FileUtil.mkdir(filePath);
            diskFile.setType(5);
        }
        return toAjax(diskFileService.insertDiskFile(diskFile));
    }

    /**
     * 修改文件
     */
    @PreAuthorize("@ss.hasPermi('disk:file:edit')")
    @Log(title = "文件", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DiskFile diskFile)
    {
        return toAjax(diskFileService.updateDiskFile(diskFile));
    }

    /**
     * 删除文件
     */
    @PreAuthorize("@ss.hasPermi('disk:file:remove')")
    @Log(title = "文件", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        int j = removeByParentIds(ids);
        for (Long id : ids) {
            DiskRecoveryFile diskRecoveryFile = new DiskRecoveryFile();
            diskRecoveryFile.setFileId(id);
            diskRecoveryFile.setCreateId(getUserId());
            diskRecoveryFileService.insertDiskRecoveryFile(diskRecoveryFile);
        }
        return toAjax(j);
    }

    private int removeByParentIds(Long[] ids) {
        int j = diskFileService.removeDiskFileByIds(ids);
        List<Long> idsList = diskFileService.selectDiskFileByParentIds(ids);
        Long[] itmeIds = new Long[idsList.size()];
        idsList.toArray(itmeIds);
        if (itmeIds.length>0) {
            removeByParentIds(itmeIds);
        }else {
            return j;
        }
        return j;
    }

    /**
     * 通用上传请求（单个）
     */
    @PostMapping("/upload/{parentId}")
    public AjaxResult uploadFile(MultipartFile file,@PathVariable Long parentId) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            // 获取当前用户本人的存储目录
            DiskStorage diskStorage = diskStorageService.selectDiskStorageByUserId(SecurityUtils.getUserId());
            if (diskStorage.getTotalCapacity()-diskStorage.getUsedCapacity()<=0) throw new ServiceException("存储空间不足");
            if (parentId.equals(0L)) {
                if (Objects.nonNull(diskStorage)) filePath = filePath+"/"+diskStorage.getBaseDir();
            } else {
                DiskFile parentIdFile = diskFileService.selectDiskFileById(parentId);
                if (Objects.isNull(parentIdFile)) throw new ServiceException("父文件夹不存在");
                String[] localPaths = RuoYiConfig.getUploadPath().split("/");
                if (Objects.nonNull(diskStorage)) filePath = filePath+"/"+diskStorage.getBaseDir()+parentIdFile.getUrl()
                        .replace(Constants.RESOURCE_PREFIX,"").replace(localPaths[localPaths.length-1],"")
                        .replace("/"+diskStorage.getBaseDir(),"");
            }
            diskSensitiveWordService.filterSensitiveWord(file.getOriginalFilename());
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath,false, file);
            String url = serverConfig.getUrl() + fileName;
            DiskFile diskFile = new DiskFile();
            diskFile.setCreateId(getUserId());
            String[] fileNames = fileName.split("/");
            diskFile.setName(fileNames[fileNames.length-1]);
            diskFile.setOldName(file.getOriginalFilename());
            diskFile.setIsDir(0);
            diskFile.setOrderNum(0);
            diskFile.setParentId(parentId);
            diskFile.setUrl(fileName);
            diskFile.setSize(file.getSize());
            diskFile.setType(diskFileService.getType(FileUploadUtils.getExtension(file)));
            diskFileService.save(diskFile,diskStorage);
            AjaxResult ajax = AjaxResult.success();
            ajax.put("url", url);
            ajax.put("fileName", fileName);
            ajax.put("newFileName", FileUtils.getName(fileName));
            ajax.put("originalFilename", file.getOriginalFilename());
            ajax.put("size", file.getSize());
            ajax.put("type", FileUploadUtils.getExtension(file));
            return ajax;
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 查询文件列表
     */
    @GetMapping("/listFileByUUIDAndsecretKey/{parentId}")
    public AjaxResult listFileByUUIDAndsecretKey(DiskShareFile diskShareFile,@PathVariable("parentId") Long parentId)
    {
        DiskShareFile diskShareFile1 = diskShareFileService.get(diskShareFile.getUuid().trim());
        diskShareFileService.verify(diskShareFile,diskShareFile1);
        DiskFile diskFile = new DiskFile();
        diskFile.setParentId(parentId);
        List<DiskFile> diskFiles = diskFileService.selectDiskFileList(diskFile);
        Set<String> avoidWordSet = new HashSet<>(Arrays.asList(diskShareFile1.getAllFileIds().split(",")));

        List<DiskFile> filteredList = diskFiles.stream()
                .filter(word -> avoidWordSet.contains(String.valueOf(word.getId())))
                .collect(Collectors.toList());
        return AjaxResult.success(filteredList);
    }

    /**
     * 本地资源通用下载
     */
    @GetMapping("/download/zip")
    public void resourceDownload(DownloadBo downloadBo, HttpServletRequest request, HttpServletResponse response) {
        List<DiskFile> diskFiles;
        String dest = RuoYiConfig.getProfile()+"/";
        if (StringUtils.isNotEmpty(downloadBo.getUuid())&&StringUtils.isNotEmpty(downloadBo.getSecretKey())) {
            diskFiles = diskFileService.selectDiskFileListByIds(Arrays.stream(downloadBo.getIds().split(","))
                    .map(String::trim)
                    .map(Long::valueOf)
                    .toArray(Long[]::new));
            dest = dest + downloadBo.getUuid();
        } else {
            diskFiles = diskFileService.selectDiskFileListByIds(Arrays.stream(downloadBo.getIds().split(","))
                    .map(String::trim)
                    .map(Long::valueOf)
                    .toArray(Long[]::new),getUserId());
            dest = dest + RandomUtil.randomString(12);
        }
        FileUtil.mkdir(dest);
        List<String> downloadPaths = new ArrayList<>();

        diskFiles.forEach(diskFile -> {
            // 本地资源路径
            String localPath = RuoYiConfig.getProfile();
            // 数据库资源地址
            String downloadPath = localPath + StringUtils.substringAfter(diskFile.getUrl(), Constants.RESOURCE_PREFIX);
            downloadPaths.add(downloadPath);
        });
        String downloadPath = dest + ".zip";

        try {
            String finalDest = dest;
            downloadPaths.forEach(path -> FileUtil.copy(path, finalDest,true));
            // 调用zip方法进行压缩
            ZipUtil.zip(dest, downloadPath);
            byte[] data = FileUtil.readBytes(FileUtil.file(downloadPath));
            response.reset();
            response.addHeader("Access-Control-Allow-Origin", "*");
            response.addHeader("Access-Control-Expose-Headers", "Content-Disposition");
            response.setHeader("Content-Disposition", "attachment; filename=\"ruoyi.zip\"");
            response.addHeader("Content-Length", "" + data.length);
            response.setContentType("application/octet-stream; charset=UTF-8");
            IOUtils.write(data, response.getOutputStream());
        } catch (IOException e) {
            log.error("diskFile 下载文件失败", e);
        } finally {
            FileUtil.del(dest);
            FileUtils.deleteFile(downloadPath);
        }

    }

}
