import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import axios from "axios";
import "./plugins/element.js";
import vuetify from "./plugins/vuetify";
import "vuesax/dist/vuesax.css";
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
import NProgress from "nprogress";

Vue.config.productionTip = false;
Vue.use(ElementUI);
Vue.prototype.axios = axios;
new Vue({
  router,
  store,
  vuetify,
  render: (h) => h(App),
}).$mount("#app");

NProgress.configure({
  easing: "ease", // 动画方式
  speed: 500, // 递增进度条的速度
  showSpinner: false, // 是否显示加载ico
  trickleSpeed: 200, // 自动递增间隔
  minimum: 0.3 // 初始化时的最小百分比
});
