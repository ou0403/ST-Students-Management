import request from '@/utils/request'


export function listdoc() {
  return request({
    url: '/profile/avatar/2025/03/24/1.docx',
    method: 'get',
  })
}
