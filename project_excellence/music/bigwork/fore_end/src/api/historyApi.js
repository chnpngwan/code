import request from "./request";

export function getByVidApi(vid) {
    return request.get(`/history/get/${vid}`)
}

export function updateApi(data) {
    return request.post(`/history/update`, data)
}

export function deleteHistoryApi(id) {
    return request.post(`/history/delete/${id}`)
}

export function getMyHistoryApi(page) {
    return request.get("/history/list",{
        params:{page}
    })
}

export function getVideoHistory(vid) {
    return request.get(`/history/list/${vid}`)
}