import request from '@/utils/request'

// 合并文件
export function fileMerge(param) {
  return request({
    url: '/disk/fileManagement/merge',
    //前端不校验重复提交
    headers: {
      repeatSubmit: false
    },
    method: 'post',
    params: param
  })
}
