import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
    import xueshengxuanke from '@/views/modules/xueshengxuanke/list'
    import jiaoshixinxi from '@/views/modules/jiaoshixinxi/list'
    import xuesheng from '@/views/modules/xuesheng/list'
    import shetuanshenqing from '@/views/modules/shetuanshenqing/list'
    import kechengchengji from '@/views/modules/kechengchengji/list'
    import jiaoshi from '@/views/modules/jiaoshi/list'
    import xueshengchengji from '@/views/modules/xueshengchengji/list'
    import menu from '@/views/modules/menu/list'
    import kechengxinxi from '@/views/modules/kechengxinxi/list'
    import tijianbaogao from '@/views/modules/tijianbaogao/list'
    import jiaoxuefankui from '@/views/modules/jiaoxuefankui/list'
    import jiaoshishenqingjiaoshi from '@/views/modules/jiaoshishenqingjiaoshi/list'
    import xinlibaogao from '@/views/modules/xinlibaogao/list'
    import jiangchengdengji from '@/views/modules/jiangchengdengji/list'
    import xueshengqingjia from '@/views/modules/xueshengqingjia/list'
    import kechengfenlei from '@/views/modules/kechengfenlei/list'
    import xueshengshenqingjiaoshi from '@/views/modules/xueshengshenqingjiaoshi/list'


//2.配置路由   注意：名字
const routes = [{
    path: '/index',
    name: '首页',
    component: Index,
    children: [{
      // 这里不设置值，是把main作为默认页面
      path: '/',
      name: '首页',
      component: Home,
      meta: {icon:'', title:'center'}
    }, {
      path: '/updatePassword',
      name: '修改密码',
      component: UpdatePassword,
      meta: {icon:'', title:'updatePassword'}
    }, {
      path: '/pay',
      name: '支付',
      component: pay,
      meta: {icon:'', title:'pay'}
    }, {
      path: '/center',
      name: '个人信息',
      component: center,
      meta: {icon:'', title:'center'}
    }
      ,{
	path: '/xueshengxuanke',
        name: '学生选课',
        component: xueshengxuanke
      }
      ,{
	path: '/jiaoshixinxi',
        name: '教室信息',
        component: jiaoshixinxi
      }
      ,{
	path: '/xuesheng',
        name: '学生',
        component: xuesheng
      }
      ,{
	path: '/shetuanshenqing',
        name: '社团申请',
        component: shetuanshenqing
      }
      ,{
	path: '/kechengchengji',
        name: '课程成绩',
        component: kechengchengji
      }
      ,{
	path: '/jiaoshi',
        name: '教师',
        component: jiaoshi
      }
      ,{
	path: '/xueshengchengji',
        name: '学生成绩',
        component: xueshengchengji
      }
      ,{
	path: '/menu',
        name: '菜单列表',
        component: menu
      }
      ,{
	path: '/kechengxinxi',
        name: '课程信息',
        component: kechengxinxi
      }
      ,{
	path: '/tijianbaogao',
        name: '体检报告',
        component: tijianbaogao
      }
      ,{
	path: '/jiaoxuefankui',
        name: '教学反馈',
        component: jiaoxuefankui
      }
      ,{
	path: '/jiaoshishenqingjiaoshi',
        name: '教师申请教室',
        component: jiaoshishenqingjiaoshi
      }
      ,{
	path: '/xinlibaogao',
        name: '心理报告',
        component: xinlibaogao
      }
      ,{
	path: '/jiangchengdengji',
        name: '奖惩登记',
        component: jiangchengdengji
      }
      ,{
	path: '/xueshengqingjia',
        name: '学生请假',
        component: xueshengqingjia
      }
      ,{
	path: '/kechengfenlei',
        name: '课程分类',
        component: kechengfenlei
      }
      ,{
	path: '/xueshengshenqingjiaoshi',
        name: '学生申请教室',
        component: xueshengshenqingjiaoshi
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {icon:'', title:'login'}
  },
  {
    path: '/register',
    name: 'register',
    component: register,
    meta: {icon:'', title:'register'}
  },
  {
    path: '/',
    name: '首页',
    redirect: '/index'
  }, /*默认跳转路由*/
  {
    path: '*',
    component: NotFound
  }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
  mode: 'hash',
  /*hash模式改为history*/
  routes // （缩写）相当于 routes: routes
})

export default router;
