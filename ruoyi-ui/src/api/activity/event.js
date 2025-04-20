import request from '@/utils/request'

// 查询行事历列表
export function listEvent(query) {
  return request({
    url: '/activity/event/list',
    method: 'get',
    params: query
  })
}

export function listEventCalendar(query) {
  return request({
    url: '/activity/event/listCalendar',
    method: 'get',
    params: query
  })
}

// 查询行事历详细
export function getEvent(eventId) {
  return request({
    url: '/activity/event/' + eventId,
    method: 'get'
  })
}

// 新增行事历
export function addEvent(data) {
  return request({
    url: '/activity/event',
    method: 'post',
    data: data
  })
}

// 修改行事历
export function updateEvent(data) {
  return request({
    url: '/activity/event',
    method: 'put',
    data: data
  })
}

// 删除行事历
export function delEvent(eventId) {
  return request({
    url: '/activity/event/' + eventId,
    method: 'delete'
  })
}
