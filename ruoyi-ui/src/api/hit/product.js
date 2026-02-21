import request from '@/utils/request'



// 查询奖品列表
export function listPost(query) {
  return request({
    url: '/hit/product/list',
    method: 'get',
    params: query
  })
}

//查询奖品详细
export function getPost(postId) {
  return request({
    url: '/hit/product/' + postId,
    method: 'get'
  })
}

// 新增奖品
export function addPost(data) {
  return request({
    url: '/hit/product',
    method: 'post',
    data: data
  })
}


// 修改奖品
export function updatePost(data) {
  return request({
    url: '/hit/product',
    method: 'put',
    data: data
  })
}

// 删除奖品
export function delPost(postId) {
  return request({
    url: '/hit/product/' + postId,
    method: 'delete'
  })
}

// 导出奖品
export function exportPost(ids) {
  return request({
    url: '/hit/product/export',
    method: 'post',
    data: ids
  })
}
