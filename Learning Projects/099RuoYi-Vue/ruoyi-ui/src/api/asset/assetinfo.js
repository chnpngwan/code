import request from '@/utils/request'

// 查询资产入库列表
export function listAssetinfo(query) {
  return request({
    url: '/asset/assetinfo/list',
    method: 'get',
    params: query
  })
}

// 查询资产入库详细
export function getAssetinfo(id) {
  return request({
    url: '/asset/assetinfo/' + id,
    method: 'get'
  })
}

// 新增资产入库
export function addAssetinfo(data) {
  return request({
    url: '/asset/assetinfo',
    method: 'post',
    data: data
  })
}

// 修改资产入库
export function updateAssetinfo(data) {
  return request({
    url: '/asset/assetinfo',
    method: 'put',
    data: data
  })
}

// 删除资产入库
export function delAssetinfo(id) {
  return request({
    url: '/asset/assetinfo/' + id,
    method: 'delete'
  })
}
