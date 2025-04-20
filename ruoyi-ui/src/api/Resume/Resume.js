import request from '@/utils/request'

// 查询简历管理列表
export function listResume(query) {
  return request({
    url: '/Resume/Resume/list',
    method: 'get',
    params: query
  })
}

// 查询简历管理详细
export function getResume(id) {
  return request({
    url: '/Resume/Resume/' + id,
    method: 'get'
  })
}

// 新增简历管理
export function addResume(data) {
  return request({
    url: '/Resume/Resume',
    method: 'post',
    data: data
  })
}

// 修改简历管理
export function updateResume(data) {
  return request({
    url: '/Resume/Resume',
    method: 'put',
    data: data
  })
}

// 删除简历管理
export function delResume(id) {
  return request({
    url: '/Resume/Resume/' + id,
    method: 'delete'
  })
}
