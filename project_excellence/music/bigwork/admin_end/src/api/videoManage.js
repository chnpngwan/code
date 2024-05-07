import request from './request';

export function getBySelectorApi(videoSelector, page) {
  return request.post(`/video/getBySelector/${page}`, videoSelector);
}

export function banApi(id) {
  return request.get(`/video/ban/${id}`);
}

export function unbanApi(id) {
  return request.get(`/video/unban/${id}`);
}

export function deleteApi(id) {
  return request.get(`/video/delete/${id}`);
}

export function undeleteApi(id) {
  return request.get(`/video/undelete/${id}`);
}