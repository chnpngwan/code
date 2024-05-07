import request from "./request";

export function login(data){
    return request.post(
        "/login",
        data
    )
}

export function status(){
    return request.get(
        "/status"
    )
}