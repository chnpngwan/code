import axios from "axios";
import baseURL from "@/api/baseURL"
// import { Message } from "element-plus"
axios.defaults.withCredentials = true;
let request = axios.create({
    baseURL: baseURL,
    timeout: 5000,
})
// 请求拦截器，用于添加token等必要验证信息
// request.interceptors.request.use()

// 响应拦截器，用于初步处理响应数据
request.interceptors.response.use(
    res => {
        res = res.data
        if (res.code == 200) {
            return res.data
        }
        throw res.msg
    },
    error => {
        console.log("error -- ", error);
        // Message.error(error)
        return Promise.reject(error)
    }
)



export default request