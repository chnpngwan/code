import { http } from '../utils/http'
export const getPointsEffectList = (): any => {
  return http.request('get', '/effect/getPointsEffectList')
}

export const getLinesEffectList = (): any => {
  return http.request('get', '/effect/getLinesEffectList')
}