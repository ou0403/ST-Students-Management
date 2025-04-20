import request from '@/utils/request'

// 查询提交作业列表
export function listStuhom(query) {
  return request({
    url: '/stuhom/stuhom/list',
    method: 'get',
    params: query
  })
}

// 查询提交作业列表
export function listStuhomTer(query) {
  return request({
    url: '/stuhom/stuhom/listss',
    method: 'get',
    params: query
  })
}

// 查询提交作业列表
export function listStuhomNUM(query) {
  return request({
    url: '/stuhom/stuhom/listss',
    method: 'get',
    params: query
  })
}

//导出
export function importAllstu() {
  return request({
    url: 'stuhom/stuhom/export',
    method: 'get',
  })
}
export function listHomework(query) {
  return request({
    url: '/homework/homework/list',
    method: 'get',
    params: query
  })
}




// 查询提交作业详细
export function getStuhom(id) {
  return request({
    url: '/stuhom/stuhom/' + id,
    method: 'get'
  })
}

// 新增提交作业
export function addStuhom(data) {
  return request({
    url: '/stuhom/stuhom',
    method: 'post',
    data: data
  })
}

// 修改提交作业
export function updateStuhom(data) {
  return request({
    url: '/stuhom/stuhom',
    method: 'put',
    data: data
  })
}

// 删除提交作业
export function delStuhom(id) {
  return request({
    url: '/stuhom/stuhom/' + id,
    method: 'delete'
  })
}
