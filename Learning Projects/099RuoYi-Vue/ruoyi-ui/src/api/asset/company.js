import request from '@/utils/request'

// 查询组织架构列表
export function listCompany(query) {
  return request({
    url: '/asset/company/list',
    method: 'get',
    params: query
  })
}

// 查询组织架构详细
export function getCompany(id) {
  return request({
    url: '/asset/company/' + id,
    method: 'get'
  })
}

// 新增组织架构
export function addCompany(data) {
  return request({
    url: '/asset/company',
    method: 'post',
    data: data
  })
}

// 修改组织架构
export function updateCompany(data) {
  return request({
    url: '/asset/company',
    method: 'put',
    data: data
  })
}

// 删除组织架构
export function delCompany(id) {
  return request({
    url: '/asset/company/' + id,
    method: 'delete'
  })
}
