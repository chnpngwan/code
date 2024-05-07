import request from "./request";

export function getRecommendTagsApi(keyword) {
    return request({
        method: "post",
        url: '/tag/recommend',
        data: { keyword }
    })
}


export function createTagApi(name) {
    return request({
        method: "post",
        url: '/tag/add',
        data: { name }
    })
}


export function getApi(page) {
    return request.get(`/tag/get/${page}`)
}