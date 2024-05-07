<template>
  <div class="background-container">
    <div class="login-container">
      <el-row type="flex" class="row-bg row-two" justify="center" align="middle">
        <el-col :span="6"></el-col>
        <el-col :span="6">
          <h1 class="title">音乐管理系统</h1>
        </el-col>
        <el-col :span="6"></el-col>
      </el-row>

      <el-row type="flex" class="row-bg card" justify="center" align="bottom">
        <el-col :span="7" class="login-card">
          <div class="centered-content">
            <el-form :model="loginForm" :rules="rules" ref="loginForm" label-width="21%" class="loginForm">
              <el-form-item label="账户" prop="loginName" style="width: 380px">
                <el-input v-model="loginForm.loginName"></el-input>
              </el-form-item>
              <el-form-item label="密码" prop="password" style="width: 380px">
                <el-input type="password" v-model="loginForm.password"></el-input>
              </el-form-item>
              <!-- 删除了验证码验证相关的代码 -->
              <el-form-item label="记住密码" prop="remember">
                <el-switch v-model="loginForm.remember"></el-switch>
              </el-form-item>
              <el-form-item class="btn-ground">
                <el-button type="primary" @click="submitForm('loginForm')">立即登录</el-button>
                <el-button @click="resetForm('loginForm')">重置</el-button>
              </el-form-item>
            </el-form>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: "LoginScreen",
  data() {
    return {
      loginForm: {
        loginName: '',
        password: '',
        remember: false,
      },
      rules: {
        loginName: [
          {required: true, message: '请输入账户', trigger: 'blur'},
          {min: 3, max: 10, message: '长度在 3 到 10 个字符的账户', trigger: 'blur'}
        ],
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'},
          {min: 6, max: 15, message: '长度在 6 到 15 个字符的密码', trigger: 'blur'}
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          // 表单验证通过，继续执行登录操作
          this.login();
        } else {
          this.$message.error('表单验证失败，请检查输入。');
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    login() {
      const loginUrl = '/login/logon';
      axios.post(loginUrl, this.loginForm, {
        headers: {
          'Content-Type': 'application/json',
        }
      })
          .then(response => {
            // 处理登录成功的逻辑
            console.log('登录成功', response.data);
          })
          .catch(error => {
            // 处理登录失败的逻辑
            console.error('登录失败', error.response.data);
          });
    }
  }
}
</script>

<style>

.background-container {
  /* 设置背景图片，修改URL为你的图片路径 */
  background-image: url('@/assets/preview.jpg');
  background-size: cover; /* 背景图片将填充整个容器 */
  background-position: center; /* 图片在容器中居中 */
  /* 其他样式属性，如边框、圆角等 */
}

.centered-content {
  display: flex;
  justify-content: center; /* 水平居中 */
  align-items: center; /* 垂直居中 */
  height: 100%; /* 使内容占满容器高度 */
}

.btn-ground {
  text-align: center;
}

.title {
  text-shadow: -3px 3px 1px #5f565e;
  text-align: center;
  margin-top: 60%;
  color: #41b9a6;
  font-size: 40px;
}

.login-card {
  background-color: #ffffff;
  opacity: 0.9;
  box-shadow: 0 0 20px #ffffff;
  border-radius: 10px;
  padding: 40px 40px 30px 15px;
  width: auto;
}
</style>
