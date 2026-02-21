import request from '@/utils/request'

// 查询等级字典
export function levelPost(query) {
  return request({
    url: '/hit/dict/list',
    method: 'get',
    params: query
  })
}

// 查询会员列表
export function listPost(query) {
  return request({
    url: '/hit/card/list',
    method: 'get',
    params: query
  })
}
// 根据id查询会员
export function getPost(postId) {
  return request({
    url: '/hit/card/' + postId,
    method: 'get'
  })
}


// 新增会员
export function addPost(data) {
  return request({
    url: '/hit/card',
    method: 'post',
    data: data
  })
}


// 修改岗位
export function updatePost(data) {
  return request({
    url: '/hit/card',
    method: 'put',
    data: data
  })
}

// 删除岗位
export function delPost(postId) {
  return request({
    url: '/hit/card/' + postId,
    method: 'delete'
  })
}

// 导出岗位
export function exportPost(query) {
  return request({
    url: '/hit/card/export',
    method: 'get',
    params: query
  })
}
