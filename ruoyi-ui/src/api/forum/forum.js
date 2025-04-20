import request from '@/utils/request'

// 查询知识论坛列表
export function listForum(query) {
  return request({
    url: '/forum/forum/list',
    method: 'get',
    params: query
  })
}

// 查询知识论坛详细
export function getForum(id) {
  return request({
    url: '/forum/forum/' + id,
    method: 'get'
  })
}

// 新增知识论坛
export function addForum(data) {
  return request({
    url: '/forum/forum',
    method: 'post',
    data: data
  })
}

// 修改知识论坛
export function updateForum(data) {
  return request({
    url: '/forum/forum',
    method: 'put',
    data: data
  })
}

// 删除知识论坛
export function delForum(id) {
  return request({
    url: '/forum/forum/' + id,
    method: 'delete'
  })
}
