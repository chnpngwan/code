import { mock, Random } from "mockjs";
export const menus = mock([
    {
        icon: "desktop",
        id: 1,
        isShow: 1,
        keepAlive: 1,
        title: "控制台",
        name: "dashboard",
        parentId: 0,
        perms: null,
        router: "/dashboard",
        type: 0,
        viewPath: null,
        create_at: () => Random.datetime(),
    },
    {
        icon: "dashboard",
        id: 2,
        isShow: 1,
        keepAlive: 1,
        title: "数据统计",
        name: "data",
        parentId: 1,
        perms: null,
        router: "/dashboard/data",
        type: 1,
        viewPath: 'views/dashboard/index.vue',
        create_at: () => Random.datetime(),
    },
    {
        icon: "icon",
        id: 3,
        isShow: 1,
        keepAlive: 1,
        title: "图标",
        name: "icon",
        parentId: 0,
        perms: null,
        router: "/icon",
        type: 0,
        viewPath: null,
        create_at: () => Random.datetime(),
    },
    {
        icon: "",
        id: 4,
        isShow: 1,
        keepAlive: 1,
        title: "svg",
        name: "svg",
        parentId: 3,
        perms: null,
        router: "/icon/svg",
        type: 1,
        viewPath: 'views/icon/svg.vue',
        create_at: () => Random.datetime(),
    },
    {
        icon: "",
        id: 5,
        isShow: 1,
        keepAlive: 1,
        title: "element",
        name: "element",
        parentId: 3,
        perms: null,
        router: "/icon/element",
        type: 1,
        viewPath: 'views/icon/element.vue',
        create_at: () => Random.datetime(),
    },
    {
        icon: "system",
        id: 6,
        isShow: 1,
        keepAlive: 1,
        title: "系统管理",
        name: "system",
        parentId: 0,
        perms: null,
        router: "/system",
        type: 0,
        viewPath: null,
        create_at: () => Random.datetime(),
    },
    {
        icon: "safetycertificate",
        id: 7,
        isShow: 1,
        keepAlive: 1,
        title: "权限管理",
        name: "auth",
        parentId: 6,
        perms: null,
        router: "/system/auth",
        type: 0,
        viewPath: null,
        create_at: () => Random.datetime(),
    },
    {
        icon: "user-fill",
        id: 8,
        isShow: 1,
        keepAlive: 1,
        title: "用户列表",
        name: "user",
        parentId: 7,
        perms: null,
        router: "/system/user/auth/user",
        type: 1,
        viewPath: 'views/system/auth/user/index.vue',
        create_at: () => Random.datetime(),
    },
    {
        icon: "menu",
        id: 9,
        isShow: 1,
        keepAlive: 1,
        title: "菜单列表",
        name: "menu",
        parentId: 7,
        perms: null,
        router: "/system/user/auth/menu",
        type: 1,
        viewPath: 'views/system/auth/menu/index.vue',
        create_at: () => Random.datetime(),
    },
    {
        icon: "account",
        id: 10,
        isShow: 1,
        keepAlive: 1,
        title: "角色列表",
        name: "role",
        parentId: 7,
        perms: null,
        router: "/system/user/auth/role",
        type: 1,
        viewPath: 'views/system/auth/role/index.vue',
        create_at: () => Random.datetime(),
    }
])