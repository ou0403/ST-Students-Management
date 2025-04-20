import request from '@/utils/request'



// 查询周记任务发布列表
export function listWeeklyDiary(query) {
  return request({
    url: '/WeeklyDiary/WeeklyDiary/list',
    method: 'get',
    params: query
  })
}

// 查询周记任务发布详细
export function getWeeklyDiary(weeklydiaryId) {
  return request({
    url: '/WeeklyDiary/WeeklyDiary/' + weeklydiaryId,
    method: 'get'
  })
}

// 新增周记任务发布
export function addWeeklyDiary(data) {
  return request({
    url: '/WeeklyDiary/WeeklyDiary',
    method: 'post',
    data: data
  })
}

// 修改周记任务发布
export function updateWeeklyDiary(data) {
  return request({
    url: '/WeeklyDiary/WeeklyDiary',
    method: 'put',
    data: data
  })
}

// 删除周记任务发布
export function delWeeklyDiary(weeklydiaryId) {
  return request({
    url: '/WeeklyDiary/WeeklyDiary/' + weeklydiaryId,
    method: 'delete'
  })
}
