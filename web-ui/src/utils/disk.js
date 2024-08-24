/**
 *
 * @param capacity 存储容量 单位字节
 * @param format 格式 kb，mb ,gb
 * @returns {string}
 */
export function storageUnitConversion(capacity,format) {
  console.log(capacity)
  if (format==='kb') {
    return (capacity/1024).toFixed(2)
  } else if (format==='mb') {
    return (capacity/1024/1024).toFixed(2)
  } else if (format==='gb') {
    return (capacity/1024/1024/1024).toFixed(2)
  }
  return (capacity/1024/1024/1024).toFixed(2)
}

/**
 * 存储单位格式化
 * @param capacity 存储容量 单位字节
 * @returns {string} 带单位
 */
export function storageUnitFormat(capacity) {
  capacity = (capacity/1024).toFixed(2);
  if (capacity<1024) {
    return capacity+"KB"
  } else if ((capacity = (capacity/1024).toFixed(2))<1024) {
    return capacity+"MB"
  } else if ((capacity = (capacity/1024).toFixed(2))<1024) {
    return capacity+"GB"
  }
  return (capacity/1024).toFixed(2) + "TB"
}

/**
 * 图片文件类型
 * @type {string[]}
 */
export function getImageFileType () {
  return ["bmp","tif", "gif", "jpg", "jpeg", "png","pcx",
    "tga","exif","fpx","svg","psd","cdr","pcd","dxf","ufo",
    "eps","ai","raw","WMF","webp","avif","apng"]
}

/**
 * 文档文件类型
 * @type {string[]}
 */
export function getDocFileType () {
  return ["doc", "docx", "xls", "ppt", "txt", "pdf"]
}

/**
 * 音频文件类型
 * @type {string[]}
 */
export function getMusicFileType () {
  return ["swf", "flv", "mp3", "wav", "wma", "wmv", "mid", "avi", "mpg", "asf", "rm", "rmvb"]
}

/**
 * 视频文件类型
 * @type {string[]}
 */
export function getVideoFileType () {
  return ["mp4", "avi", "rmvb"]
}
