import request from '@/utils/request'

//学生获取老师发布的作业
export function listHomeworkStu(query) {
  return request({
    url: '/homework/homework/listStu',
    method: 'get',
    params: query
  })
}

// 查询发布作业列表
export function listHomework(query) {
  return request({
    url: '/homework/homework/list',
    method: 'get',
    params: query
  })
}


// 查询发布作业详细
export function getHomework(id) {
  return request({
    url: '/homework/homework/' + id,
    method: 'get'
  })
}

// 新增发布作业
export function addHomework(data) {
  console.log(data)
  return request({
    url: '/homework/homework',
    method: 'post',
    data: data
  })
}

// 修改发布作业
export function updateHomework(data) {
  return request({
    url: '/homework/homework',
    method: 'put',
    data: data
  })
}

// 删除发布作业
export function delHomework(id) {
  return request({
    url: '/homework/homework/' + id,
    method: 'delete'
  })
}
