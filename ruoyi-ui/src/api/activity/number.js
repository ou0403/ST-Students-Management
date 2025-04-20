import request from '@/utils/request'

// 查询行事历期数列表
export function listNumber(query) {
  return request({
    url: '/activity/number/list',
    method: 'get',
    params: query
  })
}

// 查询行事历期数详细
export function getNumber(numberId) {
  return request({
    url: '/activity/number/' + numberId,
    method: 'get'
  })
}

// 新增行事历期数
export function addNumber(data) {
  return request({
    url: '/activity/number',
    method: 'post',
    data: data
  })
}

// 修改行事历期数
export function updateNumber(data) {
  return request({
    url: '/activity/number',
    method: 'put',
    data: data
  })
}

// 删除行事历期数
export function delNumber(numberId) {
  return request({
    url: '/activity/number/' + numberId,
    method: 'delete'
  })
}
