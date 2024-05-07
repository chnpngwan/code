import request from "./request";

export function search(data, page) {
    return request.post(`/search/${page}`, data);

}