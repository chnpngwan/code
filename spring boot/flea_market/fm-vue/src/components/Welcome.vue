<template>
  <div class="block">
    <span class="demonstration"></span>
    <el-carousel height="750px">
      <el-carousel-item v-for="item in 4" :key="item">
        <div style="text-align: center;" class="div">
          <div class="div2">
            每年三月最后一个星期六20:30-21:30为地球一小时（ EARTH HOUR )<br>
            是世界自然基金会提出的节能活动为宣传环保理念，发展循环经济爱护我们的地球<br>
            3月开展以跳蚤市场的方式将闲置物品实现资源再利用精简生活<br>为环保尽一份力设计灵感主要围绕"循环""地球""节能"旧物"等关键词<br>用矢量插画的表现形式在后期更好的落地和衍生，也更具有商业性，同时又不失趣味和艺术感
          </div>
          <el-button type="primary" round class="el-button" @click="handle">点击一下 立即进入</el-button>
        </div>

      </el-carousel-item>
    </el-carousel>
  </div>

</template>

<script>
export default {

  name: "Welcome",
methods:{
    handle(){
      this.$router.replace('Login');
    }
}
}
</script>

<style scoped>

.el-carousel__item h3 {
  /*color: #475669;*/
  font-size: 30px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
  height: 200px;
  background-attachment: fixed;
  /*background:url("../assets/img1.jpg") no-repeat;*/
  background-size: cover;
}

.el-carousel__item:nth-child(4n) {
  /*background-color: #99a9bf;*/
  background:url("../assets/img5.jpg") no-repeat;
  background-size: cover;
}

.el-carousel__item:nth-child(4n+1) {
  /*background-color: #d3dce6;*/
  background-attachment: fixed;
  background:url("../assets/img10.png") no-repeat;
  background-size: cover;
}
.el-carousel__item:nth-child(4n+2) {
  /*background-color: #d3dce6;*/
  background-attachment: fixed;
  background:url("../assets/img6.jpg") no-repeat;
  background-size: cover;
}
.el-carousel__item:nth-child(4n+3) {
  /*background-color: #d3dce6;*/
  background-attachment: fixed;
  background:url("../assets/img11.jpg") no-repeat;
  background-size: cover;
}
.el-button {
  background-color: rgba(40, 98, 34, 0.99);
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  width: 20%;
  position: absolute;
  bottom: 60px;
  left :615px;
}
  .div{

  }
  .div2
  {
    background-color: rgba(217, 217, 199, 0.7);
    width: 1535px;
    height: 150px;
    color: #344f35;
    margin-top:30px;
    text-align: center;
    padding-top: 50px;
  }

</style>