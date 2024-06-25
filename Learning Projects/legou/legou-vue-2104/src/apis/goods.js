import axiosInstance from "@/utils/axios.js";

//封装推荐搜索请求
export function getSuggestListApi(keywords){
    return axiosInstance({
        url: 'anonymous/goods/suggest',
        params: {
            prefix: keywords
        }
    })
}

//根据关键字分页查询商品列表
export function getGoodsListBySearchApi(keywords, page, pageSize){
    return axiosInstance({
        url: 'anonymous/goods',
        params :{
            keywords: keywords,
            page: page,
            pageSize: pageSize
        }
    })
}