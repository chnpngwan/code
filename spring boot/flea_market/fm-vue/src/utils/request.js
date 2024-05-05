import axios from "axios";

const request=axios.create({
    baseURL:'/api',
    timeout:5000
})

//request拦截器
//可以自请求发送前对请求做一些处理
request.interceptors.request.use(config=> {
    config.headers['Content-Type'] = 'application/json;charset=utf-8';
    let user=localStorage.getItem("user")?JSON.parse(localStorage.getItem("user")):null
    if(user){
        //console.log("user信息："+ user.token);
        //设置请求头
        config.headers['token'] = user.token;
    }

    return config
},error => {
    return Promise.reject(error)
});

//response拦截器
//可以在接口响应后统一处理结果
// request.interceptors.response.use(
//     response=>{
//         let res=response.data;
//         //若是返回的文件
//         if(response.config.responseType==='blob'){
//             return res;
//         }
//         //兼容服务端返回的字符串数据
//         if(typeof res==='string'){
//             res=res?JSON.parse(res):res
//         }
//         return res;
//     },
//     error => {
//         console.log('err'+error)
//         return Promise.reject(error)
//     }
// )

export default request