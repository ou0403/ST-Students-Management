import request from '@/utils/request'

// 查询简历投递列表
export function listWork(query) {
  return request({
    url: '/ResumeWork/work/list',
    method: 'get',
    params: query
  })
}

// 查询简历投递详细
export function getWork(id) {
  return request({
    url: '/ResumeWork/work/' + id,
    method: 'get'
  })
}

// 新增简历投递
export function addWork(data) {
  return request({
    url: '/ResumeWork/work',
    method: 'post',
    data: data
  })
}

// 修改简历投递
export function updateWork(data) {
  return request({
    url: '/ResumeWork/work',
    method: 'put',
    data: data
  })
}

// 删除简历投递
export function delWork(id) {
  return request({
    url: '/ResumeWork/work/' + id,
    method: 'delete'
  })
}
