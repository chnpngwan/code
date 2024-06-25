import {createRouter, createWebHistory} from "vue-router";
import HomeView from "@/views/HomeView.vue";
import HomeIndexView from "@/views/home/HomeIndexView.vue";
import SearchResultView from "@/views/search/SearchResultView.vue";

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            component: HomeView,
            children: [
                {
                    path: '/',
                    component: HomeIndexView
                },
                {
                    path: '/search',
                    component: SearchResultView
                }
            ]
        }
    ]
});

export default router