import request from '@/utils/request'

// 查询帖子的评论列表
export function listComment(query) {
  return request({
    url: '/forum/comment/list',
    method: 'get',
    params: query
  })
}

// 查询帖子的评论详细
export function getComment(id) {
  return request({
    url: '/forum/comment/' + id,
    method: 'get'
  })
}

// 新增帖子的评论
export function addComment(data) {
  return request({
    url: '/forum/comment',
    method: 'post',
    data: data
  })
}

// 修改帖子的评论
export function updateComment(data) {
  return request({
    url: '/forum/comment',
    method: 'put',
    data: data
  })
}

// 删除帖子的评论
export function delComment(id) {
  return request({
    url: '/forum/comment/' + id,
    method: 'delete'
  })
}
