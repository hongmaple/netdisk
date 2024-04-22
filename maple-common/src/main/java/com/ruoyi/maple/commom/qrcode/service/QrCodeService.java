package com.ruoyi.maple.commom.qrcode.service;

import cn.hutool.core.io.FileUtil;
import cn.hutool.extra.qrcode.QrCodeUtil;
import cn.hutool.extra.qrcode.QrConfig;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import org.springframework.stereotype.Service;

import java.io.File;

@Service
public class QrCodeService {

    /**
     * 创建带有logo的二维码
     *
     * @param content 内容
     * @param logoUrl 图片地址（本地图片文件地址绝对路径）
     * @param file    存放二维码的文件 jpg,png格式
     * @return 是否成功
     */
    public boolean createQrCodeFile(String content, String logoUrl, File file) {
        QrConfig config = new QrConfig();
        // 高纠错级别
        config.setErrorCorrection(ErrorCorrectionLevel.H);
        config.setImg(logoUrl); //附带logo
        QrCodeUtil.generate(content,
                config,
                file);
        return true;
    }

    /**
     * 识别二维码文件
     * @param file 文件
     * @return 识别内容
     */
    public String decode(File file) {
       return QrCodeUtil.decode(file);
    }


    public static void main(String[] args) {
        System.out.println(QrCodeUtil.decode(FileUtil.file("C:\\Users\\Maple\\Desktop\\wx.jpg")));
    }

}
