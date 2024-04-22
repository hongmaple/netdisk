import request from '@/utils/request'

// 查询文件列表
export function listFile(query) {
  return request({
    url: '/disk/file/list',
    method: 'get',
    params: query
  })
}

// 查询文件详细
export function getFile(id) {
  return request({
    url: '/disk/file/' + id,
    method: 'get'
  })
}

// 新增文件
export function addFile(data) {
  return request({
    url: '/disk/file',
    method: 'post',
    data: data
  })
}

// 修改文件
export function updateFile(data) {
  return request({
    url: '/disk/file',
    method: 'put',
    data: data
  })
}

// 删除文件
export function delFile(id) {
  return request({
    url: '/disk/file/' + id,
    method: 'delete'
  })
}

// 查询文件列表
export function listFileByUUIDAndsecretKey(query,parentId) {
  return request({
    url: '/disk/file/listFileByUUIDAndsecretKey/'+parentId,
    method: 'get',
    params: query
  })
}

// 下载文件列表
export function download(query) {
  return request({
    url: '/disk/file/download/resource',
    method: 'get',
    params: query,
  })
}
