package com.ruoyi.disk.controller;

import com.ruoyi.disk.HadoopTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.ByteArrayOutputStream;

@Controller
@RequestMapping("/hadoop")
public class HadoopController {

    @Autowired
    private HadoopTemplate hadoopTemplate;

    @Value("${hdfs.hdfs-site}")
    private String hdfsSite;

    @GetMapping("/{descPath}")
    public ResponseEntity<ByteArrayResource> preview(@PathVariable("descPath") String descPath) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        hadoopTemplate.open(descPath.replace("--", "/"), outputStream);
        String fileExtension = hadoopTemplate.getFileExtension(descPath.replace("--", "/"));

        byte[] byteArray = outputStream.toByteArray();

        // 创建字节数组资源
        ByteArrayResource resource = new ByteArrayResource(byteArray);

        // 设置响应头
        HttpHeaders headers = new HttpHeaders();

        switch (fileExtension) {
            case "png":
                headers.setContentType(MediaType.IMAGE_PNG);
                break;
            case "gif":
                headers.setContentType(MediaType.IMAGE_GIF);
                break;
            case "jpeg":
                headers.setContentType(MediaType.IMAGE_JPEG);
                break;
            default:
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                break;
        }

        // 返回字节数组资源作为响应
        return ResponseEntity.ok()
                .headers(headers)
                .contentLength(byteArray.length)
                .body(resource);

    }

}