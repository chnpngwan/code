<template>
  <v-app id="app">
    <TopNavBar></TopNavBar>
    <v-content>
      <router-view :key="$route.fullPath" />
    </v-content>
    <Footer></Footer>
    <LoginDialog></LoginDialog>
    <RegisterDialog></RegisterDialog>
    <ForgetDialog></ForgetDialog>
  </v-app>
</template>

<script>
import TopNavBar from "./components/layout/TopNavBar";
import Footer from "./components/layout/Footer";
import LoginDialog from "./components/Dialog/LoginDialog";
import RegisterDialog from "./components/Dialog/RegisterDialog";
import ForgetDialog from "./components/Dialog/ForgetDialog";
export default {
  name: "App",
  components: {
    TopNavBar,
    Footer,
    LoginDialog,
    RegisterDialog,
    ForgetDialog,
  },
  created() {
    this.incrViewCount();
  },
  methods: {
    incrViewCount() {
      this.axios.get("/api/view");
    },
  },
};
</script>
