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
    url: '/hit/game/detaillist',
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


// 根据活动id查询配置的奖品列表
export function getGameProducts(gameId) {
  return request({
    url: '/hit/info/'+gameId,
    method: 'get'
  })
}
// 根据活动id查询配置的策略列表
export function getGameRules(gameId) {
  return request({
    url: '/hit/game_rule/detaillist/'+gameId,
    method: 'get'
  })
}

// 导出活动
export function exportPost(query) {
  return request({
    url: '/hit/game/export/detail',
    method: 'get',
    params: query
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
