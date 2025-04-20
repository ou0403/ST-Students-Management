import request from '@/utils/request'

// 查询考试成绩管理列表
export function listScore(query) {
  return request({
    url: '/Score/score/list',
    method: 'get',
    params: query
  })
}

// 查询考试成绩管理详细
export function getScore(scoreId) {
  return request({
    url: '/Score/score/' + scoreId,
    method: 'get'
  })
}

// 新增考试成绩管理
export function addScore(data) {
  return request({
    url: '/Score/score',
    method: 'post',
    data: data
  })
}

// 修改考试成绩管理
export function updateScore(data) {
  return request({
    url: '/Score/score',
    method: 'put',
    data: data
  })
}

// 删除考试成绩管理
export function delScore(scoreId) {
  return request({
    url: '/Score/score/' + scoreId,
    method: 'delete'
  })
}
