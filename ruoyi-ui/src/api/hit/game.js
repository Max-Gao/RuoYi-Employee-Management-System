import request from '@/utils/request'

// 查询等级字典
export function typePost(query) {
  return request({
    url: '/hit/dict/list',
    method: 'get',
    params: query
  })
}

// 查询活动列表
export function listPost(query) {
  return request({
    url: '/hit/game/list',
    method: 'get',
    params: query
  })
}
// 根据id查询活动
export function getPost(postId) {
  return request({
    url: '/hit/game/' + postId,
    method: 'get'
  })
}
//查询奖品
export function getProduct() {
  return request({
    url: '/hit/product/list',
    method: 'get'
  })
}

// 新增活动
export function addPost(data) {
  return request({
    url: '/hit/game',
    method: 'post',
    data: data
  })
}
// 根据活动id查询配置的奖品列表
export function getGameProducts(gameId) {
  return request({
    url: '/hit/game_product/detaillist/'+gameId,
    method: 'get'
  })
}
// // 根据活动id查询配置的策略列表
// export function getGameRules(gameId) {
//   return request({
//     url: '/hit/game_rule/detaillist/'+gameId,
//     method: 'get'
//   })
// }
export function deleteRule(id){
  return request({
    url:"/hit/game/rule/"+id,
    method:"delete"
  })
}
export function deleteProduct(id){
  return request({
    url:"/hit/game/product/"+id,
    method:"delete"
  })
}
// 修改活动
export function updatePost(data) {
  return request({
    url: '/hit/game',
    method: 'put',
    data: data
  })
}

// 删除活动
export function delPost(postId) {
  return request({
    url: '/hit/game/' + postId,
    method: 'delete'
  })
}

// 导出活动
export function exportPost(query) {
  return request({
    url: '/hit/game/export',
    method: 'get',
    params: query
  })
}
//配置奖品
export function addOrUpdateProduct(data) {
  return request({
    url: '/hit/game_product',
    method: 'post',
    data: data
  })
}
//配置策略
export function addOrUpdateRule(data) {
  return request({
    url: '/hit/game_rule',
    method: 'post',
    data: data
  })
}
// 查询等级列表
export function levelPost(query) {
  return request({
    url: '/hit/dict/list',
    method: 'get',
    params: query
  })
}
