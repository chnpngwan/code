<template>
  <el-form
    ref="form"
    :model="form"
    :rules="formRules"
    label-width="80px"
    class="loginForm"
  >
    <div class="changeMode">
      <el-button link @click="isLogin = true">登录</el-button>
      <el-button link @click="isLogin = false">注册</el-button>
    </div>
    <el-form-item label="用户名" prop="username">
      <el-input v-model="form.username" />
    </el-form-item>
    <el-form-item label="密码" prop="password">
      <el-input v-model="form.password" type="password" />
    </el-form-item>
    <el-form-item label="确认密码" v-if="!isLogin" prop="ensurePassword">
      <el-input v-model="form.ensurePassword" type="password" />
    </el-form-item>
    <el-form-item>
      <el-button style="width: 80%" type="primary" @click="login" v-if="isLogin"
        >登录</el-button
      >
      <el-button
        style="width: 80%"
        type="primary"
        @click="register"
        v-if="!isLogin"
        >注册</el-button
      >
      <router-link to="/forgetPassword" style="color: #999; font-size: 12px">
        忘记密码
      </router-link>
    </el-form-item>
  </el-form>
</template>

<script>
import { login as loginApi, register as registerApi } from "@/api/userApi.js";
import { ElMessage } from "element-plus";

export default {
  data() {
    return {
      form: {
        username: "",
        password: "",
        ensurePassword: "",
      },
      isLogin: true,
    };
  },
  methods: {
    login() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          loginApi(this.form).then(
            (res) => {
              this.$store.dispatch("updateUser", res);
              ElMessage.success("登录成功");
              this.$router.push("/");
            },
            (err) => {
              ElMessage.error(err);
            }
          );
        } else {
          ElMessage.error("请按要求填写表单");
        }
      });
    },
    register() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          if (this.form.password === this.form.ensurePassword) {
            registerApi(this.form).then(
              (res) => {
                ElMessage.success("注册成功");
                this.form.username = "";
                this.form.password = "";
                this.form.ensurePassword = "";
                this.isLogin = true;
              },
              (error) => {
                ElMessage.error(error);
              }
            );
          } else {
            ElMessage.error("两次密码不一致");
          }
        } else {
          ElMessage.error("请按要求填写表单");
        }
      });
    },
  },
  computed: {
    formRules() {
      if (!this.isLogin) {
        return {
          username: [
            { required: true, message: "请输入用户名", trigger: "blur" },
          ],
          password: [
            { required: true, message: "请输入密码", trigger: "blur" },
          ],
          ensurePassword: [
            { required: true, message: "请输入确认密码", trigger: "blur" },
            { validator: this.validateEnsurePassword, trigger: "blur" },
          ],
        };
      } else {
        return {
          username: [
            { required: true, message: "请输入用户名", trigger: "blur" },
          ],
          password: [
            { required: true, message: "请输入密码", trigger: "blur" },
          ],
        };
      }
    },
  },
};
</script>

<style scoped lang="less">
.loginForm {
  width: fit-content;
  height: fit-content;

  position: fixed;
  top: 40vh;
  left: 50vw;
  transform: translate(-50%, -50%);

  border: 2px solid #ddd;
  padding: 30px 70px;
  border-radius: 20px;

  .changeMode {
    width: 100%;
    text-align: center;
    font-size: 16px;
    margin-bottom: 20px;
  }
}
</style>
