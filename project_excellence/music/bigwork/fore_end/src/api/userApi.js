import request from "./request";

// 登录接口
export function login(data) {
    return request(
        {
            url: "/user/login",
            data: data,
            method: "post"
        }
    )
}

// 登出接口
export function logout() {
    return request.get(
            "/user/logout"
    )
}

export function status() {
    return request.get(
        "/user/status"
    )
}

export function register(data) {
    return request({
        method:"post",
        url: "/user/register",
        data: data
    }

    )
}

export function getInfo(id) {
    return request({
        method:'get',
        url: "/user/" + id
    }
    )
}

export function modifyInfo(data) {
    return request({
        method:"post",
        url: "/user/modify",
        data: data
    }
    )
}

export function modifyPassword(data) {
    return request({
        method:"post",
        url: "/user/modifypassword",
        data: data
    }
    )
}

export function uploadAvatar(data) {
    return request({
        method:"post",
        url: "/user/uploadavatar",
        data: data
    }
    )
}

