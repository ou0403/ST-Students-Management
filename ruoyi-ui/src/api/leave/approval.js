import request from '@/utils/request'

// 查询请假审批列表
export function listApproval(query) {
  return request({
    url: '/leave/approval/list',
    method: 'get',
    params: query
  })
}

// 查询请假审批详细
export function getApproval(approvalId) {
  return request({
    url: '/leave/approval/' + approvalId,
    method: 'get'
  })
}

// 新增请假审批
export function addApproval(data) {
  return request({
    url: '/leave/approval',
    method: 'post',
    data: data
  })
}

// 修改请假审批
export function updateApproval(data) {
  return request({
    url: '/leave/approval',
    method: 'put',
    data: data
  })
}

// 删除请假审批
export function delApproval(approvalId) {
  return request({
    url: '/leave/approval/' + approvalId,
    method: 'delete'
  })
}
