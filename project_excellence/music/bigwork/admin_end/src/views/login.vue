<template>
  <div class="container">
    <el-form class="form" :model="user" label-width="60px">
      <el-form-item label="用户名">
        <el-input v-model="user.username" />
      </el-form-item>
      <el-form-item label="密码">
        <el-input v-model="user.password" type="password" />
      </el-form-item>
    </el-form>
    <div class="bottons">
      <el-button type="primary" @click="login">登录</el-button>
    </div>
  </div>
</template>

<script>
import { login as loginApi } from "@/api/admin.js"
export default {
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
    };
  },
  methods:{
    login(){
      let fd = new FormData();
      fd.append("username",this.user.username);
      fd.append("password",this.user.password);
      loginApi(fd).then(res=>{
        this.$store.dispatch("updateAdmin",res);
        this.$router.push("/manage")
      })
    }
  }
};
</script>

<style scoped lang="less">
.container {
  height: 300px;
  width: 400px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border: 2px solid #ccc;
  padding: 60px 30px;
  display: flex;
  align-items: center;
  flex-direction: column;
  .form {
    margin-bottom: 20px;
  }
}
</style>