import request from '@/utils/request'

// 查询回收站列表
export function listRecovery(query) {
  return request({
    url: '/disk/recovery/list',
    method: 'get',
    params: query
  })
}

// 查询回收站详细
export function getRecovery(id) {
  return request({
    url: '/disk/recovery/' + id,
    method: 'get'
  })
}

// 新增回收站
export function addRecovery(data) {
  return request({
    url: '/disk/recovery',
    method: 'post',
    data: data
  })
}

// 修改回收站
export function updateRecovery(data) {
  return request({
    url: '/disk/recovery',
    method: 'put',
    data: data
  })
}

// 删除回收站
export function delRecovery(id) {
  return request({
    url: '/disk/recovery/' + id,
    method: 'delete'
  })
}

// 恢复回收站
export function refresh(id) {
  return request({
    url: '/disk/recovery/refresh/' + id,
    method: 'put'
  })
}

