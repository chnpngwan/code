import VueRouter from "vue-router";

const routes = [
    {
        path: '/',
        name: 'welcome',
        component:()=>import ('../components/Welcome')
    },
    {
        path:'/Login',
        name:'login',
        component:()=>import('../components/Login')
    },
    {
        path:'/Index',
        name:'index',
        component:()=>import('../components/admin/Index'),
        redirect:'/Home',
        children:[
            {
                path:'/Home',
                name:'home',
                meta:{
                    title:'首页'
                },
                component:()=>import('../components/admin/Home')
            },
            {
                path:'/Category',
                name:'category',
                component:()=>import('../components/admin/Category')
            },
            {
                path:'/Commodity',
                name:'commodity',
                component:()=>import('../components/admin/Commodity')
            },
            {
                path:'/Order',
                name:'order',
                component:()=>import('../components/admin/Order')
            },
            {
                path:'/User',
                name:'user',
                component:()=>import('../components/admin/User')
            }
        ]
    },
    {
        path:'/Market',
        name: 'market',
        component:()=>import('../components/customer/Market'),
        redirect:'/Shopping',
        children: [
            {
                path: '/Shopping',
                name: 'shopping',
                component:()=>import('../components/customer/Shopping')
            },
            {
                path: '/MyShop',
                name: 'myShop',
                component:()=>import('../components/customer/MyShop')
            },
            {
                path: '/MyOrders',
                name: 'myOrders',
                component:()=>import('../components/customer/MyOrders')
            },
            {
                path: '/Personal',
                name: 'personal',
                component:()=>import('../components/customer/Personal')
            }
        ]
    }

]

const router = new VueRouter({
    mode:'history',
    routes
})

export default router;