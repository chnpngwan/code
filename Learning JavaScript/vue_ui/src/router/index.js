import Vue from 'vue'
import VueRouter from 'vue-router'
//import IndexScreen from '../views/MainPage/IndexScreen.vue'
import LoginScreen from '../views/login/LoginScreen.vue'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'login',
    component: LoginScreen
  },
  {
    path: '/main',
    name: 'IndexScreen',
    component: () => import(/* webpackChunkName: "about" */ '../views/MainPage/IndexScreen.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
