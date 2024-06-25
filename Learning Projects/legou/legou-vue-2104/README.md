## 01. 搭建项目



> === 创建项目：legou-vue



### 1.1 初始化项目

```cmd
#初始化项目
npm i

#运行项目
npm run dev
```



### 1.2 Bootstrap 环境



```cmd
 #安装 bootstrap
 npm i bootstrap sass
 
 #安装 bootstrap 图标库
 npm i bootstrap-icons
```



main.js 全局引入 bootstrap 样式

- **src/main.js**

```js
import { createApp } from 'vue'
import App from './App.vue'

import 'bootstrap/scss/bootstrap.scss'
import 'bootstrap/dist/js/bootstrap.bundle.js'
import 'bootstrap-icons/font/bootstrap-icons.scss'


createApp(App).mount('#app')
```



### 1.3 Axios 环境





安装 Axios

```cmd
npm i axios
```



配置 axios 基础实例（统一接口配置）



- **src/utils/axios.js**

```js
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
```





### 1.4 Router 环境



安装路由

```cmd
npm i vue-router
```

- **路由配置文件**
- **src/router/index.js**

```js
import {createRouter, createWebHistory} from "vue-router";

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {

        }
    ]
});

export default router
```

- **src/main.js**

```js
import { createApp } from 'vue'
import App from './App.vue'

import 'bootstrap/scss/bootstrap.scss'
import 'bootstrap/dist/js/bootstrap.bundle.js'
import 'bootstrap-icons/font/bootstrap-icons.scss'

//挂载 router
import router from "@/router/index.js";

const app = createApp(App);
app.use(router)
    .mount('#app')

```





### 1.5 Pinia 环境



安装 pinia

```cmd
# 安装 pinia
npm i pinia

# pinia 持久化
npm i pinia-plugin-persistedstate
```



- **src/main.js**

```js
import { createApp } from 'vue'
import App from './App.vue'

import 'bootstrap/scss/bootstrap.scss'
import 'bootstrap/dist/js/bootstrap.bundle.js'
import 'bootstrap-icons/font/bootstrap-icons.scss'
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'

import router from "@/router/index.js";
import {createPinia} from "pinia";

const pinia = createPinia();
pinia.use(piniaPluginPersistedstate)


const app = createApp(App);
app.use(router)
    .use(pinia)
    .mount('#app')
```





### 1.6 路由首页



![image-20240606095359373](assets/image-20240606095359373.png)



- **src/App.vue**

```vue
<script setup>
</script>

<template>
<RouterView v-slot="{ Component }">
  <keep-alive>
    <component :is="Component"/>
  </keep-alive>
</RouterView>
</template>

<style scoped>
</style>
```

- **首页页面**
- **src/views/HomeView.vue**

```vue
<script setup>

</script>

<template>
<!--导航条-->
  <h1 class="text-danger">我是导航条</h1>
<!--内容二级路由-->
<!--页脚-->
</template>

<style scoped>

</style>
```

- **路由首页**
- **src/router/index.js**

```js
import {createRouter, createWebHistory} from "vue-router";
import HomeView from "@/views/HomeView.vue";

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            component: HomeView
        }
    ]
});

export default router
```





## 02. 导航条组件



- **src/components/nav/Nav.vue**

```vue
<script setup>
</script>

<template>
  <!--导航条-->

  <header class="nav navbar navbar-expand-lg py-3 fixed-top">
    <nav class="container">

        导航条内容

    </nav>
  </header>

</template>

<style scoped>
header {
  backdrop-filter: blur(4px);
  background-color: rgba(255, 255, 255, 0.5);
}
</style>
```

- **首页挂载导航条组件**
- **src/views/HomeView.vue**

```vue
<script setup>
</script>

<template>
  <!--导航条组件-->
  <Nav/>
</template>

<style scoped>
</style>
```





### 2.1 Logo 组件



- **src/components/nav/NavLogo.vue**

```vue
<script setup>
defineProps({logoText: {type:String, required: true}})
</script>

<template>
  <a href="#" class="navbar-brand text-danger">{{logoText}}</a>
</template>

<style scoped>

</style>
```



### 2.2 导航条列表组件



- **src/components/nav/NavList.vue**

```vue
<script setup>
</script>

<template>
  <ul class="navbar-nav me-auto">
    <li class="nav-item"><RouterLink to="/" class="nav-link">首页</RouterLink></li>
    <li class="nav-item dropdown">
      <RouterLink to="/" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">商品分类</RouterLink>
      <ul class="dropdown-menu">
        <li><RouterLink to="/type/美妆个护" class="dropdown-item">美妆 | 个护清洁</RouterLink></li>
        <li><RouterLink to="/type/手机电脑" class="dropdown-item">手机 | 电脑</RouterLink></li>
        <li><RouterLink to="/type/家具厨具" class="dropdown-item">家具 | 厨具</RouterLink></li>
        <li><RouterLink to="/type/食品生鲜" class="dropdown-item">食品 | 生鲜</RouterLink></li>
        <li><RouterLink to="/type/礼品鲜花" class="dropdown-item">艺术 | 礼品鲜花</RouterLink></li>
        <li><RouterLink to="/type/图书文娱" class="dropdown-item">图书 | 文娱</RouterLink></li>
      </ul>
    </li>
    <li class="nav-item"><RouterLink to="/" class="nav-link">购物车</RouterLink></li>
    <li class="nav-item"><RouterLink to="/" class="nav-link">收藏夹</RouterLink></li>
    <li class="nav-item"><RouterLink to="/" class="nav-link">商家服务</RouterLink></li>
  </ul>
</template>

<style scoped>

</style>
```



### 2.3 搜索框组件

> === 搜索框内容变动时，查询搜索推荐词条

- **封装搜索推荐请求**
- **src/apis/goods.js**

```js
import axiosInstance from "@/utils/axios.js";

//自动补全下拉列表推荐
export function getSuggestListApi(keywords){
    return axiosInstance({
        url: 'anonymous/goods/suggest',
        params: {
            prefix: keywords
        }
    })
}
```

- **搜索框组件**
- **src/components/nav/NavSearch.vue**

```vue
<script setup>
import {ref, watch} from "vue";
import {getSuggestListApi} from "@/apis/goods.js";

const keywords = ref('')
const suggestList = ref(["手机","平板","笔记本","手表","家电"])

watch(keywords, ()=> {
  getSuggestListApi(keywords.value)
      .then(resp => resp.data)
      .then(data => suggestList.value = data.suggestList)
})

</script>

<template>
  <div class="d-flex flex-column flex-sm-row">
    <input type="search"
           class="form-control rounded-0 me-1 mb-2"
           placeholder="搜索..." list="tipSearchList" v-model="keywords">
    <datalist id="tipSearchList">
      <option v-for="item in suggestList" :value="item"/>
    </datalist>


    <button class="btn bg-danger rounded-0 mb-2 text-white" type="button">
      <i class="bi bi-search"></i>
    </button>
  </div>
</template>

<style scoped>

</style>
```



### 2.4 登录注册组件



- **src/components/nav/NavAuth.vue**

```vue
<script setup>

</script>

<template>
  <ul class="navbar-nav">
    <li class="nav-item"><RouterLink to="/login" class="nav-link active">登录</RouterLink></li>
    <li class="nav-item"><RouterLink to="/register" class="nav-link">注册</RouterLink></li>
  </ul>
</template>

<style scoped>

</style>
```



### 2.5 导航条组件组装



- **src/components/nav/Nav.vue**

```vue
<script setup>
import NavList from "@/components/nav/NavList.vue";
import NavLogo from "@/components/nav/NavLogo.vue";
import NavSearch from "@/components/nav/NavSearch.vue";
import NavAuth from "@/components/nav/NavAuth.vue";
</script>

<template>
  <!--导航条-->

  <header class="nav navbar navbar-expand-lg py-3 fixed-top">
    <nav class="container">

      <NavLogo :logo-text="'Le-Go'"/>

      <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#menu">
        <i class="navbar-toggler-icon"></i>
      </button>

      <div id="menu" class="navbar-collapse collapse">
        <NavList/>
        <NavSearch/>
        <NavAuth/>
      </div>

    </nav>
  </header>

</template>

<style scoped>
header {
  backdrop-filter: blur(4px);
  background-color: rgba(255, 255, 255, 0.5);
}
</style>
```


## 03. Banner 组件



bootstrap 参考：https://v5.bootcss.com/docs/components/carousel/



- **src/components/banner/Banner.vue**

```vue
<script setup>
import banner1 from "@/assets/imgs/banner01.jpg";
import banner2 from "@/assets/imgs/banner02.jpg";
import banner3 from "@/assets/imgs/banner03.jpg";

const banners = [
  {
    number: 0,
    src: banner1,
    active: false,
    title: '限时七折',
    class: 'text-start',
    description: 'Tata时装限时七折，全场顺丰包邮，上门退换.'
  },
  {
    number: 1,
    src: banner2,
    active: true,
    title: '好物上新',
    class: 'text-center',
    description: 'Pefresh春夏换新季，春夏新品第一波，新品买一送一.'
  },
  {
    number: 2,
    src: banner3,
    active: false,
    title: '时尚百搭',
    class: 'text-end',
    description: '百搭贝壳包 黑 白 红 [三色可选] 更多好物等您来拿.'
  }
]

</script>

<template>

  <div id="banner" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#banner" data-bs-slide-to="0" class=""></button>
      <button type="button" data-bs-target="#banner" data-bs-slide-to="1" class="active" aria-current="true"></button>
      <button type="button" data-bs-target="#banner" data-bs-slide-to="2" class=""></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item" :class="{'active': banner.active}" v-for="banner in banners" :key="banner.number">
        <img class="w-100" :src="banner.src" alt=""/>
        <div class="container">
          <div class="carousel-caption" :class="banner.class">
            <h1>{{banner.title}}</h1>
            <p>{{banner.description}}</p>
            <p><a class="btn btn-lg btn-primary rounded-0" href="#">了 解 更 多</a></p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#banner" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#banner" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</template>

<style scoped>

</style>
```

- **首页挂载 Banner**
- **src/views/home/HomeIndexView.vue**

```vue
<script setup>

import Banner from "@/components/banner/Banner.vue";
    
</script>

<template>

  <!--导航条-->
  <Banner/>
  <!--全分类-->
  <div class="container mt-5">全分类</div>
  <!--热门商品-->
  <div class="container mt-5">热门推荐</div>
  

</template>

<style scoped>

</style>
```

- **路由首页**
- **src/router/index.js**

```js
import {createRouter, createWebHistory} from "vue-router";
import HomeIndexView from "@/views/home/HomeIndexView.vue";
import HomeView from "@/views/HomeView.vue";

const router = createRouter({
    history: createWebHistory(), //属性表示路由浏览器历史前后退规则
    routes: [
        {
            path: '/',
            component: HomeView,
            //这里
            children: [
                {
                    path: '/',
                    component: HomeIndexView
                }
            ]
        }
    ]
})

export default router
```



## 04. 页脚组件



- **src/components/footer/Footer.vue**

```vue
<script setup>

const footerItem = [
  {
    title: '配送方式',
    context: ['上门自提','24小时达','配送服务查询','配送费用标准','联系客服']
  },
  {
    title: '支付方式',
    context: ['货到付款','在线支付','分期付款','公司转账']
  },
  {
    title: '售后服务',
    context: ['售后政策','价格保护','退款说明','返修/退换货','取消订单']
  }
]
</script>

<template>
  <div class="container">
    <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-5 border-top">
      <div class="col">
        <a href="/" class="d-flex mb-3">
          <i class="bi bi-shop-window display-5 text-danger"></i>
        </a>
        <p class="text-muted">© 2024</p>
      </div>

      <div class="col"></div>

      <div class="col" v-for="item in footerItem">
        <h5 class="text-danger">{{item.title}}</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2" v-for="c in item.context">
            <a href="#" class="nav-link p-0 text-muted">{{c}}</a>
          </li>
        </ul>
      </div>

    </footer>
  </div>
</template>

<style scoped>

</style>
```

- **挂载页脚**
- **src/views/HomeView.vue**

```vue
<script setup>

import Nav from "@/components/nav/Nav.vue";
import Footer from "@/components/footer/Footer.vue";

</script>

<template>

  <Nav/>
  <!-- 二级路由出口 -->
  <RouterView/>
  <Footer/>

</template>

<style scoped>

</style>
```


















