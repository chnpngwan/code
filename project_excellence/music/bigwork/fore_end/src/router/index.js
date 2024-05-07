import { createRouter, createWebHistory } from 'vue-router'
import index from '../views/index.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'index',
      component: index
    },
    {
      path: "/myspace",
      name: "主页",
      component: () => import("@/views/myspace.vue")
    },
    {
      path: "/video/:id",
      name: "视频页",
      component: () => import("@/views/video.vue")
    },
    {
      path: "/upload",
      name: "上传页面",
      component: () => import("@/views/myupload.vue")
    },
    {
      path: "/login",
      name: "登录页面",
      component: () => import("@/views/loginView.vue")
    },
    {
      path: "/account",
      name: "账户管理",
      redirect:"/account/info",
      component: () => import("@/views/myAccount.vue"),
      children: [
        {
          path: "info",
          name:"个人信息页",
          component: () => import("@/components/account/myInfo.vue")
        },
        {
          path: "avatar",
          name:"头像修改页",
          component: () => import("@/components/account/myAvatar.vue")
        },
        {
          path: "teacher",
          name:"教师认证页",
          component: () => import("@/components/account/myTeacher.vue")
        },
        {
          path: "class",
          name:"班级页",
          component: () => import("@/components/account/myClass.vue")
        },
        {
          path:"comment",
          name:"我的评论",
          component:()=>import("@/components/account/myComment.vue")
        },
        {
          path:"history",
          name:"播放历史",
          component: ()=> import("@/components/account/myHistory.vue")
        },
        {
          path:"securityQuestion",
          name:"创建安全问题",
          component: () => import("@/components/account/securityQuestion.vue")
        },
        {
          path:"modifyPassword",
          name:"修改密码",
          component: ()=> import("@/components/account/myModifyPassword.vue")
        },
        {
          path:"chat",
          name:"私信",
          component: ()=> import("@/components/account/myChat.vue")
        },

      ]
    },
    {
      path:"/search",
      name:"搜索页",
      component: ()=>import("@/views/searchView.vue")
    },
    {
      path:"/class/:cid",
      name:"班级详情页面",
      component: () => import("@/views/myClassDetail.vue")
    },
    {
      path:"/user/:id",
      name :"用户详情页",
      component: () => import("@/views/myUserDetail.vue")
    },
    {
      path:"/works/:uid",
      name : "用户发布的视频展示",
      component: ()=> import("@/views/myWorks.vue")
    },
    {
      path:"/video/tag/:tid",
      name:"视频分类 -> tag",
      component: () => import("@/views/myTagVideoView.vue")
    },
    {
      path:"/forgetPassword",
      name:"忘记密码",
      redirect:"/forgetPassword/checkUsername",
      children:[
        {
          path:"checkUsername",
          name:"校验用户名",
          component: () => import("@/views/checkUsername.vue")
        },
        {
          path:"checkQuestion/:username",
          name:"校验安全问题",
          component: () => import("@/views/checkQuestion.vue")
        },
        {
          path:"resetPassword/:token",
          name:"重置密码",
          component: () => import("@/views/resetPassword.vue")
        }
      ]
    }
  ]
})

export default router
