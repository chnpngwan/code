<template>
  <el-container>
    <Logo></Logo>
    <el-header>
      <MyMenu></MyMenu>
    </el-header>
    <el-main>
      <div class="soller1">
        <img src="../../assets/advertise.jpg" style="height: 80%;width: 80%">
      </div>
      <router-view />
      <div class="soller2">
        <img src="../../assets/advertise.jpg" style="height: 80%;width: 80%">
      </div>
    </el-main>
    <el-footer>
      <Footer></Footer>
    </el-footer>
  </el-container>

</template>

<script>
import MyMenu from "@/components/customer/MyMenu";
import Footer from "@/components/customer/Footer";
import Logo from "@/components/customer/Logo";
export default {
  name: "Market",
  components: {Logo, Footer, MyMenu}
}
</script>

<style scoped>
body {
  margin: 0;
}

.el-header {
  background-color: #fafafa;
  color: #333;
  text-align: center;
  line-height: 30px;
}

.el-footer {
    background-color: #bfc5d2;
    color: #494848;
    text-align: center;
    font-size: 5px;
    line-height: 30px;
    margin-bottom: 0;
  }

.el-main {
  background-color: #fafafa;
  color: #333;
  text-align: center;
}

.soller1{
  position: fixed;
  top: 15%;
  border: 1px solid rgba(0,0,0,0);
  margin-left: -30px;
}

.soller2{
  position: fixed;
  top: 15%;
  border: 1px solid rgba(0,0,0,0);
  margin-left: 1310px;
  margin-right: -30px;
}

</style>