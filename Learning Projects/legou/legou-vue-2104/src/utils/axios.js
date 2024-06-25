import axios from "axios";

//请求基础封装
const axiosInstance = axios.create({
    baseURL: 'http://localhost:8080',
    timeout: 5000
});


//请求拦截器
axiosInstance.interceptors.request.use(config => {
    return config //在发送请求之前做些什么
}, error => Promise.reject(error)) //请求错误时做些什么


//响应拦截器
axiosInstance.interceptors.response.use(
    res => res.data, //2xx 范围内状态码都会触发此函数
    error => {  //超出 2xx, 触发此函数
        return Promise.reject(error)
    }
)

export default axiosInstance