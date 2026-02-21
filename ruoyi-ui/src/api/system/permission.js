import request from '@/utils/request'

export function listPermission(query) {
  return request({
    url: '/system/permission/list',
    method: 'get',
    params: query
  })
}

export function getPermission(id) {
  return request({
    url: '/system/permission/' + id,
    method: 'get'
  })
}

export function addPermission(data) {
  return request({
    url: '/system/permission',
    method: 'post',
    data: data
  })
}

export function updatePermission(data) {
  return request({
    url: '/system/permission',
    method: 'put',
    data: data
  })
}

export function delPermission(id) {
  return request({
    url: '/system/permission/' + id,
    method: 'delete'
  })
}

export function changePermissionStatus(id, status) {
  return request({
    url: '/system/permission/changeStatus',
    method: 'put',
    data: { id: id, status: status }
  })
}
