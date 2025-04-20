import request from '@/utils/request'



// 查询请假管理列表
export function listDetails(query) {
  return request({
    url: '/leave/details/list',
    method: 'get',
    params: query
  })
}

// 查询请假管理详细
export function getDetails(leaveId) {
  return request({
    url: '/leave/details/' + leaveId,
    method: 'get'
  })
}

// 新增请假管理
export function addDetails(data) {
  return request({
    url: '/leave/details',
    method: 'post',
    data: data
  })
}

// 修改请假管理
export function updateDetails(data) {
  return request({
    url: '/leave/details',
    method: 'put',
    data: data
  })
}

export function updateDetailsToExamine(data) {
  return request({
    url: '/leave/details/toExamine',
    method: 'put',
    data: data
  })
}

export function updateDetailsRefuse(data) {
  return request({
    url: '/leave/details/refuse',
    method: 'put',
    data: data
  })
}

// 删除请假管理
export function delDetails(leaveId) {
  return request({
    url: '/leave/details/' + leaveId,
    method: 'delete'
  })
}


export function listUser() {
  return request({
    url: '/leave/details/userList',
    method: 'get'
  })
}

export function listUserTeacher() {
  return request({
    url: '/leave/details/userListTeacher',
    method: 'get'
  })
}



