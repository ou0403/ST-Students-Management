import request from '@/utils/request'

// 查询教室管理列表
export function listRoom(query) {
  return request({
    url: '/leave/room/list',
    method: 'get',
    params: query
  })
}

// 查询教室管理详细
export function getRoom(roomId) {
  return request({
    url: '/leave/room/' + roomId,
    method: 'get'
  })
}

// 新增教室管理
export function addRoom(data) {
  return request({
    url: '/leave/room',
    method: 'post',
    data: data
  })
}

// 修改教室管理
export function updateRoom(data) {
  return request({
    url: '/leave/room',
    method: 'put',
    data: data
  })
}

// 删除教室管理
export function delRoom(roomId) {
  return request({
    url: '/leave/room/' + roomId,
    method: 'delete'
  })
}

  // 查询部门下拉树结构
  export function deptTreeSelect() {
    return request({
      url: '/leave/room/deptTreeRoom',
      method: 'get'
    })
}

export function getUserList(deptId) {
  return request({
    url: '/leave/room/deptUser/'+deptId,
    method: 'get',
  })
}



