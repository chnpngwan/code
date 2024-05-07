import request from "./request";

export function send2Check(data){
    return request.post(
        "/teacher/auth",
        data
    )
}

export function modify(data){
    return request.post(
        "/teacher/modify",
        data
    )
}

export function getAuth(){
    return request.get(
        "/teacher/getAuth"
    )
}

export function getOtherAuth(id){
    return request.get(
        `/teacher/${id}`
    )
}

export function drop(){
    return request.get(
        "/teacher/drop"
    )
}



