import request from "./request";

const API_BASE_URL = '/security-questions';

// 获取安全问题
export function getSecurityQuestionByUsername(username) {
    return request.get(`${API_BASE_URL}/${username}`);
}

// 校验用户名是否存在
export function checkUsername(username) {
    return request.get(`${API_BASE_URL}/checkUsername/${username}`);
}

// 校验用户名是否存在
export function checkAnswer(username, answer) {
    return request.post(`${API_BASE_URL}/checkAnswer`,
        { username, answer });
}

// 重置密码
export function resetPassword(password, token) {
    let fd = new FormData();
    fd.append("password", password);
    fd.append("token", token);
    return request.post(`${API_BASE_URL}/resetPassword`,
        fd);
}

// 创建安全问题
export function createSecurityQuestion(securityQuestion) {
    return request.post(API_BASE_URL, securityQuestion);
}

// 获取用户安全问题
export function getSecurityQuestionByUserId() {
    return request.get(API_BASE_URL);
}