package com.ruoyi.common.utils.file;

/**
 * 媒体类型工具类
 * 
 * @author ruoyi
 */
public class MimeTypeUtils
{
    public static final String IMAGE_PNG = "image/png";

    public static final String IMAGE_JPG = "image/jpg";

    public static final String IMAGE_JPEG = "image/jpeg";

    public static final String IMAGE_BMP = "image/bmp";

    public static final String IMAGE_GIF = "image/gif";
    
    public static final String[] IMAGE_EXTENSION = { "bmp","tif", "gif", "jpg", "jpeg", "png","pcx",
            "tga","exif","fpx","svg","psd","cdr","pcd","dxf","ufo",
            "eps","ai","raw","WMF","webp","avif","apng" };

    public static final String[] FLASH_EXTENSION = { "swf", "flv" };

    public static final String[] MEDIA_EXTENSION = { "swf", "flv", "mp3", "wav", "wma", "wmv", "mid", "avi", "mpg",
            "asf", "rm", "rmvb" };

    public static final String[] VIDEO_EXTENSION = { "mp4", "avi", "rmvb" };

    public static final String[] DOC_EXTENSION = { "doc", "docx", "xls", "ppt", "txt", "pdf"};

    public static final String[] COMPRESS_EXTENSION = { "rar","rar4", "zip", "gz", "bz2", "7z" };

    public static final String[] DEFAULT_ALLOWED_EXTENSION = {
            // 图片
            "bmp","tif", "gif", "jpg", "jpeg", "png","pcx",
            "tga","exif","fpx","svg","psd","cdr","pcd","dxf","ufo",
            "eps","ai","raw","WMF","webp","avif","apng",
            // word excel powerpoint
            "doc", "docx", "xls", "xlsx", "ppt", "pptx", "html", "htm", "txt",
            // 压缩文件
            "rar","rar4", "zip", "gz", "bz2", "7z",
            // 视频格式
            "mp4", "avi", "rmvb",
            // pdf
            "pdf" };

    public static String getExtension(String prefix)
    {
        switch (prefix)
        {
            case IMAGE_PNG:
                return "png";
            case IMAGE_JPG:
                return "jpg";
            case IMAGE_JPEG:
                return "jpeg";
            case IMAGE_BMP:
                return "bmp";
            case IMAGE_GIF:
                return "gif";
            default:
                return "";
        }
    }
}
