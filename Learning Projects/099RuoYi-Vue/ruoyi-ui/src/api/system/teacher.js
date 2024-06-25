import request from '@/utils/request'

// 查询老师列表列表
export function listTeacher(query) {
  return request({
    url: '/system/teacher/list',
    method: 'get',
    params: query
  })
}

// 查询老师列表详细
export function getTeacher(teacherId) {
  return request({
    url: '/system/teacher/' + teacherId,
    method: 'get'
  })
}

// 新增老师列表
export function addTeacher(data) {
  return request({
    url: '/system/teacher',
    method: 'post',
    data: data
  })
}

// 修改老师列表
export function updateTeacher(data) {
  return request({
    url: '/system/teacher',
    method: 'put',
    data: data
  })
}

// 删除老师列表
export function delTeacher(teacherId) {
  return request({
    url: '/system/teacher/' + teacherId,
    method: 'delete'
  })
}
