<template>
    <div class="container">
      <h2>重置密码</h2>
      <el-form :model="form" :rules="rules" ref="form" label-width="100px" label-position="top">
        <el-form-item label="新密码" prop="password">
          <el-input type="password" v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="confirmPassword">
          <el-input type="password" v-model="form.confirmPassword"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="resetPassword">确认重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </template>
  
  <script>
  import {
    resetPassword
} from "@/api/securityQuestionApi.js";
import { ElMessage } from 'element-plus';
export default {
  data() {
    return {
      form: {
        password: "",
        confirmPassword: "",
        token: "",
      },
      rules: {
        password: [
          { required: true, message: "请输入新密码", trigger: "blur" },
          { min: 6, message: "密码长度不能少于6位", trigger: "blur" },
        ],
        confirmPassword: [
          { required: true, message: "请确认密码", trigger: "blur" },
          { validator: this.confirmValidator, trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    confirmValidator(rule, value, callback) {
      if (value !== this.form.password) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    },
    resetPassword() {
      // 在此处进行重置密码逻辑，可以发送异步请求到后端进行密码重置
      resetPassword(this.form.password,this.form.token).then(res=>{
        // 假设密码重置成功
        const successMessage = "密码重置成功";
        this.$message.success(successMessage);
        this.$router.push("/login"); // 跳转到登录页
      }).catch(err=>{
        ElMessage.error(err);
      })

    },
  },
  mounted() {
    const token = this.$route.params.token; // 从 URL 中获取 token 参数
    // 可以根据需要对 token 进行处理，例如保存到 data 中，或进行其他操作
    this.form.token = token;
  },
};
</script>
  
<style scoped lang="less">
.container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 30vw;
  border: 1px solid #000;
  border-radius: 5px;
  padding: 20px;

  h2 {
    margin-bottom: 20px;
  }
}
</style>