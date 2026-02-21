import request from '@/utils/request'

export function listLog(query) {
  return request({
    url: '/monitor/operlog/list',
    method: 'get',
    params: query
  })
}

export function delLog(logId) {
  return request({
    url: '/monitor/operlog/' + logId,
    method: 'delete'
  })
}

export function cleanLog() {
  return request({
    url: '/monitor/operlog/clean',
    method: 'delete'
  })
}

export function exportLog(query) {
  return request({
    url: '/monitor/operlog/export',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
