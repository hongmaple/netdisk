import request from '@/utils/request'

// 查询用户存储列表
export function listStorage(query) {
  return request({
    url: '/disk/storage/list',
    method: 'get',
    params: query
  })
}

// 查询用户存储的文件列表 （管理用）
export function getStorageFileListByUserId(query,userId) {
  return request({
    url: '/disk/storage/getStorageFileListByUserId/'+userId,
    method: 'get',
    params: query
  })
}

// 查询用户存储列表
export function myListStorage(query) {
  return request({
    url: '/disk/storage/myList',
    method: 'get',
    params: query
  })
}

// 查询存储统计
export function getFileStorageStats() {
  return request({
    url: '/disk/storage/getFileStorageStats',
    method: 'get'
  })
}

// 查询用户存储详细
export function getStorage(id) {
  return request({
    url: '/disk/storage/' + id,
    method: 'get'
  })
}

// 新增用户存储
export function addStorage(data) {
  return request({
    url: '/disk/storage',
    method: 'post',
    data: data
  })
}

// 修改用户存储
export function updateStorage(data) {
  return request({
    url: '/disk/storage',
    method: 'put',
    data: data
  })
}

// 删除用户存储
export function delStorage(id) {
  return request({
    url: '/disk/storage/' + id,
    method: 'delete'
  })
}

// 删除用户存储
export function formattedDisk(userId) {
  return request({
    url: '/disk/storage/formattedDisk/' + userId,
    method: 'delete'
  })
}
