import request from "./request";

export function getUsers(page) {
    return request.get(
        "/user/get/" + page,
    )
}

export function getUsersBySelector(data, page) {
    return request.post(
        "/user/getBySelector/" + page,
        data
    )
}

export function ban(id) {
    return request.get(
        "/user/ban/" + id
    )
}

export function unban(id) {
    return request.get(
        "/user/unban/" + id
    )
}

export function deleteUser(id) {
    return request.get(
        "/user/delete/" + id
    )
}

export function undelete(id) {
    return request.get(
        "/user/undelete/" + id
    )
}

export function modify(data) {
    return request.post(
        "/user/modify",
        data
    )
}