import request from "../request"

export function get() {
    return request.get("/check/video/get");
}

export function uncheck(data) {
    return request.post("/check/video/uncheck",data);
}

export function pass(id) {
    return request.get("/check/video/pass/"+id);
}

export function unpass(id) {
    return request.get("/check/video/unpass/"+id);
}
