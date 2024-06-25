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
