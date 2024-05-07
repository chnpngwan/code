import request from "./request";

// 上传视频接口
export function upload(data){
    return request({
        method:"post",
        url: '/video/upload',
        data:data
    })
}

export function getVideo(id){
    return request({
        method:"get",
        url: '/video/'+id
    })
}

export function getRecommend(page){
    return request({
        method:"get",
        url: `/video/recommend/${page}`
    })
}

export function deleteVideoApi(vid){
    return request.post(`/video/delete/${vid}`)
}

export function modifyVideoApi(data){
    return request.post("/video/modify",data)
}

export function getBytagApi(tid,page){
    return request({
        method:"get",
        url: `/video/tag/${tid}/${page}`,
    })
}
export function getByUidApi(uid,page){
    return request({
        method:"get",
        url: `/video/user/${uid}`,
        params:{page}
    })
}
export function getByClassApi(cid){
    return request({
        method:"get",
        url: `/video/class/${cid}`
    })
}

