import request from "./request";

export function publishApi(vid,content) {
    let fd = new FormData()
    fd.append("vid",vid);
    fd.append("content",content)
    return request.post("/comment/publish",fd)
}

export function getVideoCommentApi(vid,page){
    return request.get(`/comment/video/${vid}`,{
        params:{page}
    })
}

export function getMyCommentApi(page) {
    return request.get("/comment/my",{params:{page}})
}

export function deleteApi(id) {
    return request.post(`/comment/delete/${id}`)
}

export function modifyContent(id,content) {
    let fd = new FormData()
    fd.append("id",id);
    fd.append("content",content)
    return request.post("/comment/modifyContent",fd);
}