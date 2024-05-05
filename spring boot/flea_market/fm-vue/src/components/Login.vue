<template>
  <div class="loginBody">
    <div class="loginDiv">
      <div class="login-content">
        <h1 class="login-title">用户登录</h1>
        <el-form :model="loginForm" label-width="100px"
                 :rules="rules" ref="loginForm">
            <el-form-item label="用户名" prop="username">
                <el-input style="width:200px" type="text" v-model="loginForm.username"
                          autocomplete="off" size="small"></el-input>
            </el-form-item>
          <el-form-item label="密 码" prop="password">
            <el-input style="width:200px" type="password" v-model="loginForm.password"
                      show-password autocomplete="off" size="small" ></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="login" style="max-height: 40px;right: 10px" class="el-button">登 录</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "Login",
  data() {
    return {
      loginForm: {
        username: '',
        password: ''
      },
      rules: {
        username: [
          {required: true, message: '请输入用户名', trigger: 'blur'}
        ],
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'}
        ],
      }
    }
  },
  methods: {
    login() {
      // console.log(this.loginForm)
      //去后台验证用户名和密码
          request.post(this.$httpUrl + '/user/login', this.loginForm).then(res => {
            // console.log(res.data.code)
            //管理员登录
            if (String(res.data.code) === "201") {
              //存储
              // console.log(res.data.data)
              localStorage.setItem("user", JSON.stringify(res.data.data));
              //跳转到主页
              this.$router.replace('Index');
            } else if (String(res.data.code) === "202") {
              //存储
              // console.log(res.data.data)
              localStorage.setItem("user", JSON.stringify(res.data.data));
              //跳转到主页
              this.$router.replace('Market');
            } else {
              alert(res.data.msg);
              return false;
            }
          });

    }
  }
}
</script>

<style scoped>
  .loginBody{
    /*position:absolute;*/
    width: 100%;
    height: 100%;
    margin:0;
    padding:0;
    border:0;
    position:fixed;
    background-attachment: fixed;
    background:url("../assets/img5.jpg") no-repeat;
    background-size: cover;
  }
  .loginDiv{
    position: absolute;
    top: 33%;
    left: 50%;
    margin-top: -95px;
    margin-left: -250px;
    width: 450px;
    height: 330px;
    background: #fff;
    border-radius: 5%;
    opacity:0.9;
  }
  .login-title{
    margin: 20px 0;
    text-align: center;
  }
  .login-content{
    width: 400px;
    height: 250px;
    position:absolute;
    top:25px;
    left: 25px;
  }
  .el-button{
    margin-left: 58px;
  }
</style>