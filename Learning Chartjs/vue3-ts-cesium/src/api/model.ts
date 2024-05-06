import { http } from '../utils/http'
export const getPrimitivesList = (): any => {
  return http.request('get', '/primitive/getPrimitivesList')
}