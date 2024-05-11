package com.ruoyi.disk;
 
import org.apache.hadoop.fs.FileSystem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
 
/**
 * @author yanan.wang
 * @describe
 * @createTime 2019-12-19 15:13
 */
@Configuration
public class HadoopConfig {
    private static final Logger log = LoggerFactory.getLogger(HadoopConfig.class);

    @Value("${hadoop.user}")
    private String user;
    @Value("${hadoop.password}")
    private String password;
    @Value("${hdfs.hdfs-site}")
    private String hdfsSite;
    @Value("${hdfs.core-site}")
    private String coreSite;
 
    @Bean("fileSystem")
    public FileSystem createFs() throws Exception {
 
        System.setProperty("HADOOP_USER_NAME", user);
        System.setProperty("HADOOP_USER_PASSWORD", password);
        //读取配置文件
        org.apache.hadoop.conf.Configuration conf = new org.apache.hadoop.conf.Configuration();
//        conf.addResource(coreSite);
//        conf.addResource(hdfsSite);
        conf.set("fs.defaultFS","hdfs://192.168.1.156:9000");
        conf.set("fs.hdfs.impl", "org.apache.hadoop.hdfs.DistributedFileSystem");
        log.info("===============【hadoop configuration info start.】===============");
        log.info("【hadoop conf】: size:{}, {}", conf.size(), conf.toString());
        log.info("【fs.defaultFS】: {}", conf.get("fs.defaultFS"));
        log.info("【fs.hdfs.impl】: {}", conf.get("fs.hdfs.impl"));
        FileSystem fs = FileSystem.newInstance(conf);
        log.info("【fileSystem scheme】: {}", fs.getScheme());
        log.info("===============【hadoop configuration info end.】===============");
        return fs;
    }
}