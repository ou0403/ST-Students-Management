import request from '@/utils/request'

// 查询行事历周数时间列表
export function listTime(query) {
  return request({
    url: '/activity/time/list',
    method: 'get',
    params: query
  })
}

// 查询行事历周数时间详细
export function getTime(timeId) {
  return request({
    url: '/activity/time/' + timeId,
    method: 'get'
  })
}

// 查询行事历周数
export function getWeeks(query) {
  return request({
    url: '/activity/time/getWeeks',
    method: 'get',
    params: query
  })
}

// 新增行事历周数时间
export function addTime(data) {
  return request({
    url: '/activity/time',
    method: 'post',
    data: data
  })
}

// 修改行事历周数时间
export function updateTime(data) {
  return request({
    url: '/activity/time',
    method: 'put',
    data: data
  })
}

// 删除行事历周数时间
export function delTime(timeId) {
  return request({
    url: '/activity/time/' + timeId,
    method: 'delete'
  })
}
