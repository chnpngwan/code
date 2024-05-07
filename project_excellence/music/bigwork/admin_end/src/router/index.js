import { createRouter, createWebHistory } from 'vue-router'
import index from '../views/index.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      redirect: "/login"
    },
    {
      path: '/manage',
      name: 'home',
      component: index,
      redirect:"/manage/userManage",
      children: [
        {
          path: "userManage",
          name: "用户管理",
          component: () => import("@/views/userManage.vue")
        },
        {
          path: "videoManage",
          name: "视频管理",
          component: () => import("@/views/videoManage.vue")
        },
        {
          path: "check",
          name: "审核",
          children: [
            {
              path: "video",
              name: "视频审核",
              component: () => import("@/views/check/videoCheck.vue")
            },
            {
              path: "teacher",
              name: "教师审核",
              component: () => import("@/views/check/teacherCheck.vue")
            },
          ]
        },

      ]
    },
    {
      path: '/login',
      name: '登录',
      component: () => import("@/views/login.vue")
    },
  ]
})

export default router
