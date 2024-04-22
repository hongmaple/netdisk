import request from '@/utils/request'

// 查询分享列表
export function listShare(query) {
  return request({
    url: '/disk/share/list',
    method: 'get',
    params: query
  })
}

// 查询分享列表
export function getInfo(uuid) {
  return request({
    url: '/disk/share/info/'+uuid,
    method: 'get'
  })
}

// 查询分享详细
export function getShare(id) {
  return request({
    url: '/disk/share/' + id,
    method: 'get'
  })
}

// 新增分享
export function addShare(data) {
  return request({
    url: '/disk/share',
    method: 'post',
    data: data
  })
}

// 修改分享
export function updateShare(data) {
  return request({
    url: '/disk/share',
    method: 'put',
    data: data
  })
}

// 删除分享
export function delShare(id) {
  return request({
    url: '/disk/share/' + id,
    method: 'delete'
  })
}

// 查询分享的文件列表
export function listByUUIDAndsecretKey(query) {
  return request({
    url: '/disk/share/listByUUIDAndsecretKey',
    method: 'get',
    params: query
  })
}

