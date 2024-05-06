import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/BarVue',
    name: 'BarVue',
    component: () => import(/* webpackChunkName: "about" */ '../views/BarVue.vue')
  },
  {
    path: '/BarVue1',
    name: 'BarVue1',
    component: () => import(/* webpackChunkName: "about" */ '../views/BarVue1.vue')
  },
  {
    path: '/LineBar',
    name: 'LineBar',
    component: () => import(/* webpackChunkName: "about" */ '../views/LineBar.vue')
  },
  {
    path: '/LineVue',
    name: 'LineVue',
    component: () => import(/* webpackChunkName: "about" */ '../views/LineVue.vue')
  },
  {
    path: '/PieVue',
    name: 'PieVue',
    component: () => import(/* webpackChunkName: "about" */ '../views/PieVue.vue')
  },
  {
    path: '/GetData',
    name: 'GetData',
    component: () => import(/* webpackChunkName: "about" */ '../views/GetData.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
