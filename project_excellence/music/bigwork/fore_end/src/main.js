import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import ElementPlus from 'element-plus'
// import zhCn from "element-plus/lib/locale/lang/zh-cn"
import "dayjs/locale/zh-cn"
import 'element-plus/dist/index.css'
// import 'element-plus/lib/theme-chalk/index.css';
import store from './store'


const app = createApp(App)

app.use(router)
// app.use(ElementPlus,{locale:zhCn})
app.use(ElementPlus)
app.use(store)

// app.config.devtools = true

app.mount('#app')
