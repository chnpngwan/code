import request from "./request";

export function createClassApi(fd) {
    return request.post(
        "/class/create",
        fd)
}

export function getByCidApi(cid) {
    return request.get(
        `/class/get/${cid}`
    )
}

export function getByNameApi(name) {
    let fd = new FormData()
    fd.append("name", name)
    return request.get(
        "/class/get",
        fd
    )
}

export function getMyClassApi() {
    return request.get("/class/myclass")
}

export function getByCreatorId(uid){
    return request.get(`/class/user/${uid}`)
}

export function midifyInfoApi(info) {
    return request.post("/class/modifyInfo", info)
}

export function modifyAvatarApi(cid, avatar) {
    let fd = new FormData()
    fd.append("avatar", avatar)
    fd.append("id", cid)
    return request.post("/class/modifyAvatar", fd)
}

export function modifyCreatorApi(cid, uid) {
    let data = { cid, uid }
    return request.post("/class/modifyCreator", data)
}

export function deleteClassApi(cid) {
    return request.get(`/class/delete/${cid}`)
}

export function add2ClassApi(cid) {
    return request.get(`/class/add/${cid}`)
}

export function removeClassApi(data) {
    return request.post("/class/removeFromClass",
    data)
}

export function changeRoleApi(data) {
    return request.post("/class/changeRole",
    data)
}

export function getStuListApi(cid,page) {
    return request.get(`/class/stuList/${cid}`,
    {
        params:{page}
    })
}
