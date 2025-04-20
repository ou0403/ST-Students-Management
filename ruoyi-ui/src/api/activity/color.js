import request from '@/utils/request'

// 查询行事历部门颜色列表
export function listColor(query) {
  return request({
    url: '/activity/color/list',
    method: 'get',
    params: query
  })
}

// 查询行事历部门颜色详细
export function getColor(colorId) {
  return request({
    url: '/activity/color/' + colorId,
    method: 'get'
  })
}

// 新增行事历部门颜色
export function addColor(data) {
  return request({
    url: '/activity/color',
    method: 'post',
    data: data
  })
}

// 修改行事历部门颜色
export function updateColor(data) {
  return request({
    url: '/activity/color',
    method: 'put',
    data: data
  })
}

// 删除行事历部门颜色
export function delColor(colorId) {
  return request({
    url: '/activity/color/' + colorId,
    method: 'delete'
  })
}
