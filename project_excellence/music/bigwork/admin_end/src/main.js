import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import store from "@/store"

const app = createApp(App)

import utils from "@/utils"
app.mixin(utils)

app.use(store)
app.use(ElementPlus)
app.use(router)

app.mount('#app')
