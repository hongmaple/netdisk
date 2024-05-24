package com.ruoyi.disk;
 
import com.ruoyi.common.utils.file.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.stereotype.Component;
 
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;
import java.text.SimpleDateFormat;

/**
 * @author maple
 * @describe
 * @createTime 2024/05/12
 */
@Component
@ConditionalOnBean(FileSystem.class)
public class HadoopTemplate {
    private static final Logger log = LoggerFactory.getLogger(HadoopConfig.class);

    @Autowired
    private FileSystem fileSystem;

    public void uploadFile(String srcFile, String destPath) {
        copyFileToHDFS(false, true, srcFile, destPath);
    }
 
    public void uploadFile(boolean del, String srcFile, String destPath) {
        copyFileToHDFS(del, true, srcFile, destPath);
    }
 
    public void delDir(String path) {
        rmdir(path, null);
    }
 
    public void download(String fileName, String savePath) {
        getFile(fileName, savePath);
    }
 
 
    /**
     * 创建目录
     *
     * @param filePath
     * @param create
     * @return
     */
    public boolean existDir(String filePath, boolean create) throws IOException {
        boolean flag = false;
        if (StringUtils.isEmpty(filePath)) {
            throw new IllegalArgumentException("filePath不能为空");
        }
        Path path = new Path(filePath);
        if (create) {
            if (!fileSystem.exists(path)) {
                fileSystem.mkdirs(path);
            }
        }
        if (fileSystem.isDirectory(path)) {
            flag = true;
        }
        return flag;
    }
 
    /**
     * 创建目录
     *
     * @param filePath
     * @return
     */
    public boolean existFile(String filePath) throws IOException {
        if (StringUtils.isEmpty(filePath)) {
            throw new IllegalArgumentException("filePath不能为空");
        }
        Path path = new Path(filePath);
        return fileSystem.exists(path);
    }
 
 
    /**
     * 文件上传至 HDFS
     *
     * @param delSrc    指是否删除源文件，true 为删除，默认为 false
     * @param overwrite
     * @param srcFile   源文件，上传文件路径
     * @param destPath  hdfs的目的路径
     */
    public void copyFileToHDFS(boolean delSrc, boolean overwrite, String srcFile, String destPath) {
        // 源文件路径是Linux下的路径，如果在 windows 下测试，需要改写为Windows下的路径，比如D://hadoop/djt/weibo.txt
        Path srcPath = new Path(srcFile);
        Path dstPath = new Path(destPath);
        // 实现文件上传
        try {
            // 获取FileSystem对象
            fileSystem.copyFromLocalFile(delSrc, overwrite, srcPath, dstPath);
            System.out.println(dstPath);
        } catch (IOException e) {
            log.error("", e);
        }
    }
 
    /**
     * 删除文件或者文件目录
     *
     * @param path
     */
    public void rmdir(String path, String fileName) {
        try {
            if (StringUtils.isNotBlank(fileName)) {
                path = path + "/" + fileName;
            }
            // 删除文件或者文件目录  delete(Path f) 此方法已经弃用
            fileSystem.delete(new Path(path), true);
        } catch (IllegalArgumentException | IOException e) {
            log.error("", e);
        }
    }
 
    /**
     * 从 HDFS 下载文件
     *
     * @param hdfsFile
     * @param destPath 文件下载后,存放地址
     */
    public void getFile(String hdfsFile, String destPath) {
 
        Path hdfsPath = new Path(hdfsFile);
        Path dstPath = new Path(destPath);
        try {
            // 下载hdfs上的文件
            fileSystem.copyToLocalFile(hdfsPath, dstPath);
        } catch (IOException e) {
            log.error("", e);
        }
    }
 
 
    public void writer(String destPath, InputStream in)  {
        try {
            FSDataOutputStream out = fileSystem.create(new Path(destPath));
            IOUtils.copyBytes(in, out, fileSystem.getConf());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void open(String destPath, OutputStream out) {
        FSDataInputStream in = null;
        try {
            in = fileSystem.open(new Path(destPath));
            IOUtils.copyBytes(in,out,4096,false);
            in.seek(0);
            IOUtils.copyBytes(in,out,4096,false);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeStream(in);
        }

    }

    //获取特定路径的所有文件
    public void getFileList(String path) throws IOException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        FileStatus[] fileStatuses = fileSystem.listStatus(new Path(path));
        for(FileStatus fileStatus: fileStatuses) {
            System.out.println(fileStatus.getPath().getName());
            System.out.println(format.format(fileStatus.getModificationTime()));
            if(fileStatus.isDirectory())
                 System.out.println("目录");
            else
                 System.out.println("文件");
        }
        //排序，目录放前面，文件放后面
        //Collator collator = Collator.getInstance(Locale.CHINA);
        //fileList.sort((f1, f2) -> (collator.compare(f1.getType(), f2.getType())));
        //return System.out.println(format.format(fileStatus.getModificationTime()));;
    }
 
}