<template>
  <div>
    <div style="border-bottom: #b9bbbe 1px solid">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="line-height: 20px;margin-bottom: 20px;font-size: 15px">
        <el-breadcrumb-item>首页</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div style="margin-left: 5%;margin-right: 5%">

    <div style="margin-top: 60px">
      <div class="left">
        <p>上架商品数</p>
        <hr />
        <h1 model="commodity">{{ commodity }}</h1>
      </div>
      <div class="right">
        <p>用户活跃度</p>
        <hr />
        <h1 model="user">{{ user }}</h1>
      </div>
      <div class="main">
        <p>订单成交数</p>
        <hr />
        <h1 model="orders">{{ orders }}</h1>
      </div>
    </div>
    <div style="margin-top: 40px">
      <div class="left_img"></div>
      <div class="right_img"></div>
      <div class="main_img"></div>
    </div>

    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "Home",
  data(){
    return{
      size:'',
      commodity:0,
      user:0,
      orders:0
    }
  },
  methods:{
    loadGet(){
      request.get(this.$httpUrl + '/common/countUser').then((res)=>{
        this.user = res.data.data
      })
      request.get(this.$httpUrl + '/common/countCommodity').then((res)=>{
        this.commodity = res.data.data
      })
      request.get(this.$httpUrl + '/common/countOrders').then((res)=>{
        this.orders = res.data.data
      })
    }
  },beforeMount() {
    this.loadGet()
  }
}
</script>

<style scoped>
.el-button{
  background-color: #84a2d4;
}
p{
  margin-top: 20px;
  font-family: "思源黑体 CN Heavy";
  text-align: center;
  letter-spacing: 4px;
  font-size: 27px;
  color: #414040;
}
h1{
  font-family: 字魂70号-灵悦黑体;
  letter-spacing: 12px;
  color: #ffffff;
  font-size: 100px;
  text-align: center;
  margin-top: 7%;
}
.left {
  float: left;
  height: 30vh;
  width: 26%;
  margin-left: 20px;
  margin-right: 100px;
  background-color: rgba(194, 123, 123, 0.8);
  border-radius: 40px;
}
.right {
  width: 26%;
  height: 30vh;
  background-color: rgb(69, 69, 92, 0.8);
  float: right;
  margin-left: 100px;
  margin-right: 20px;
  border-radius: 40px;
}
.main {
  overflow: hidden;
  height: 30vh;
  width: 26%;
  background-color: rgb(95, 214, 95, 0.8);
  border-radius: 40px;
}
.left_img {
  background: url("../../assets/logo1.jpg") no-repeat center;
  background-size: 260px 260px;
  float: left;
  height: 30vh;
  width: 26%;
  margin-left: 20px;
  margin-right: 90px;
}
.main_img {
  background: url("../../assets/logo2.jpg") no-repeat center;
  background-size: 280px 280px;
  overflow: hidden;
  height: 30vh;
  width: 26%;

}
.right_img {
  background: url("../../assets/logo3.jpg") no-repeat center;
  background-size: 280px 280px;
  float: right;
  height: 30vh;
  width: 26%;
  margin-left: 60px;
  margin-right: 20px;
  margin-top: 40px;
}
</style>
