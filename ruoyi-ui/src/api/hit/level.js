import request from '@/utils/request'

// 查询等级列表
export function levelPost(query) {
  return request({
    url: '/hit/dict/list',
    method: 'get',
    params: query
  })
}


// 新增等级
export function addPost(data) {
  return request({
    url: '/hit/dict',
    method: 'post',
    data: data
  })
}
// 根据id查询等级
export function getPost(postId) {
  return request({
    url: '/hit/dict/' + postId,
    method: 'get'
  })
}
// 修改等级
export function updatePost(data) {
  return request({
    url: '/hit/dict',
    method: 'put',
    data: data
  })
}

// 删除等级
export function delPost(postId) {
  return request({
    url: '/hit/dict/' + postId,
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
