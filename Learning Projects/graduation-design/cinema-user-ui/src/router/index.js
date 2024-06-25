import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    component: (resolve) => require(["../views/Home/Home"], resolve),
  },
  {
    path: "/movie/",
    redirect: { name: "ongoing" },
    component: (resolve) => require(["../views/Movie/Movie"], resolve),
    children: [
      {
        path: "ongoing",
        name: "ongoing",
        component: (resolve) => require(["../views/Movie/Ongoing"], resolve),
      },
      {
        path: "upcoming",
        name: "upcoming",
        component: (resolve) => require(["../views/Movie/Upcoming"], resolve),
      },
      {
        path: "classic",
        name: "classic",
        component: (resolve) => require(["../views/Movie/Classic"], resolve),
      },
    ],
  },
  {
    path: "/cinema",
    component: (resolve) => require(["../views/Cinema/Cinema"], resolve),
  },
  {
    path: "/rank/",
    redirect: { name: "reputation" },
    component: (resolve) => require(["../views/Rank/Rank"], resolve),
    children: [
      {
        path: "reputation",
        name: "reputation",
        component: (resolve) => require(["../views/Rank/Reputation"], resolve),
      },
      {
        path: "gross",
        name: "gross",
        component: (resolve) => require(["../views/Rank/gross"], resolve),
      },
      {
        path: "top100",
        name: "top100",
        component: (resolve) => require(["../views/Rank/Top100"], resolve),
      },
    ],
  },
  {
    path: "/search/",
    redirect: { name: "movie" },
    component: (resolve) => require(["../views/Search/Search"], resolve),
    children: [
      {
        path: "movie",
        name: "movie",
        component: (resolve) => require(["../views/Search/Movie"], resolve),
      },
      {
        path: "actor",
        name: "actor",
        component: (resolve) => require(["../views/Search/Actor"], resolve),
      },
      {
        path: "cinema",
        name: "cinema",
        component: (resolve) => require(["../views/Search/Cinema"], resolve),
      },
    ],
  },
  {
    path: "/actor/:actorId",
    component: (resolve) => require(["../views/Actor/Actor"], resolve),
  },
  {
    path: "/movie/:movieId",
    component: (resolve) => require(["../views/Movie/Detail"], resolve),
  },
  {
    path: "/cinema/:cinemaId",
    component: (resolve) => require(["../views/Cinema/Detail"], resolve),
  },
  {
    path: "/seat/:laminationId",
    component: (resolve) => require(["../views/Order/Seat"], resolve),
  },
  {
    path: "/order/:orderId",
    component: (resolve) => require(["../views/Order/Order"], resolve),
  },
  {
    path: "/user/",
    redirect: { name: "order" },
    component: (resolve) => require(["../views/User/UserMenu"], resolve),
    children: [
      {
        path: "order",
        name: "order",
        component: (resolve) => require(["../views/User/Order"], resolve),
      },
      {
        path: "info",
        name: "info",
        component: (resolve) => require(["../views/User/Info"], resolve),
      },
      {
        path: "password",
        name: "password",
        component: (resolve) => require(["../views/User/Password"], resolve),
      },
    ],
  },
];

const router = new VueRouter({
  routes,
});

export default router;
