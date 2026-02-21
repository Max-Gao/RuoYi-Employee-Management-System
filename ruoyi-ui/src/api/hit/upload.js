import request from '@/utils/request'
// 用户头像上传
export function uploadAvatar(data) {
  return request({
    url: '/hit/uploadImg',
    method: 'post',
    data: data
  })
}
export function uploadExcel(data) {
  return request({
    url: '/hit/product/uploadExcel',
    method: 'post',
    data: data
  })
}
