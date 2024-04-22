import request from '@/utils/request'

// 查询敏感词列表
export function listSensitiveWord(query) {
  return request({
    url: '/disk/sensitiveWord/list',
    method: 'get',
    params: query
  })
}

// 查询敏感词详细
export function getSensitiveWord(id) {
  return request({
    url: '/disk/sensitiveWord/' + id,
    method: 'get'
  })
}

// 新增敏感词
export function addSensitiveWord(data) {
  return request({
    url: '/disk/sensitiveWord',
    method: 'post',
    data: data
  })
}

// 修改敏感词
export function updateSensitiveWord(data) {
  return request({
    url: '/disk/sensitiveWord',
    method: 'put',
    data: data
  })
}

// 删除敏感词
export function delSensitiveWord(id) {
  return request({
    url: '/disk/sensitiveWord/' + id,
    method: 'delete'
  })
}
