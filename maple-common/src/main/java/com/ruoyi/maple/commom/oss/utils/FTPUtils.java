package com.ruoyi.maple.commom.oss.utils;

import com.ruoyi.maple.commom.oss.config.FTPConfig;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

public class FTPUtils {


    public void uploadFile(String remotePath, MultipartFile file) throws IOException {

        FTPClient ftpClient = this.getConnection();

        try {

            try (InputStream inputStream = file.getInputStream()) {
                boolean done = ftpClient.storeFile(remotePath, inputStream);
                if (done) {
                    System.out.println("File " + file.getOriginalFilename() + " has been uploaded successfully.");
                } else {
                    throw new IOException("Failed to upload file " + file.getOriginalFilename());
                }
            }

        } finally {
            if (ftpClient.isConnected()) {
                ftpClient.logout();
                ftpClient.disconnect();
            }
        }
    }


    /**
     * 建立连接
     */
    private FTPClient getConnection() throws IOException {

        FTPClient ftpClient = new FTPClient();

        ftpClient.connect(FTPConfig.getServerUrl(), FTPConfig.getPort());
        ftpClient.login(FTPConfig.getUserName(), FTPConfig.getPassword());
        ftpClient.enterLocalPassiveMode();
        ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

        return ftpClient;

    }
}