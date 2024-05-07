import axios from "axios";
import baseURL from "@/api/baseURL"
import store from "@/store"
import router from "@/router"
// import { Message } from "element-plus"
axios.defaults.withCredentials = true;
let request = axios.create({
    baseURL: baseURL,
    timeout: 3000,
})
// 请求拦截器，用于添加token等必要验证信息
// request.interceptors.request.use(data => {
//     if(store.state.admin.id == null)
    
// })

// 响应拦截器，用于初步处理响应数据
request.interceptors.response.use(
    res => {
        res = res.data
        if (res.code == 200) {
            return res.data
        }else if(res.code == 403){
            router.push("/login");
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