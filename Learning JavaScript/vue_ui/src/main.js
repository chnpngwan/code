import Vue from 'vue';
import App from './App.vue';
import router from './router';
import Element from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import store from './store'
import axios from 'axios';
// 创建全局Axios实例
const axiosInstance = axios.create({
  baseURL: 'http://127.0.0.1:8001/', // 设置基本的请求URL
  timeout: 10000, // 设置请求超时时间
  // 其他配置项...
});

// 将Axios实例绑定到Vue原型，以便在组件中访问
Vue.prototype.$axios = axiosInstance;

Vue.config.productionTip = false

Vue.use(Element).use(axios)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
