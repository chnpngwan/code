import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import './assets/glocal.css'
import VueRouter from "vue-router";
import router from "@/router";
import request from "@/utils/request";
//导入md5.js
import MD5 from "js-md5"

Vue.config.productionTip = false
Vue.use(ElementUI);
Vue.use(VueRouter);
Vue.prototype.request=request;
//设置全局地址
Vue.prototype.$httpUrl='http://localhost:8090'
Vue.prototype.http
//将md5转换成vue原型：
Vue.prototype.md5 = MD5

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
