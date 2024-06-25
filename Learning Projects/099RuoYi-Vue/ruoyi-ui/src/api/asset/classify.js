import request from '@/utils/request'

// 查询资产分类列表
export function listClassify(query) {
  return request({
    url: '/asset/classify/list',
    method: 'get',
    params: query
  })
}

// 查询资产分类详细
export function getClassify(id) {
  return request({
    url: '/asset/classify/' + id,
    method: 'get'
  })
}

// 新增资产分类
export function addClassify(data) {
  return request({
    url: '/asset/classify',
    method: 'post',
    data: data
  })
}

// 修改资产分类
export function updateClassify(data) {
  return request({
    url: '/asset/classify',
    method: 'put',
    data: data
  })
}

// 删除资产分类
export function delClassify(id) {
  return request({
    url: '/asset/classify/' + id,
    method: 'delete'
  })
}
