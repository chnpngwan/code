import request from "../request";

export function getTeacherCheckInfo(){
    return request.get("/teacher/get")
}

export function passApi(id){
    return request.get("/teacher/pass/"+id)
}

export function unpassApi(id){
    return request.get("/teacher/unpass/"+id)
}

export function exit(){
    return request.get("/teacher/exit")
}