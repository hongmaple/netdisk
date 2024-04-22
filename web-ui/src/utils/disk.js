// 存储单位换算
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
