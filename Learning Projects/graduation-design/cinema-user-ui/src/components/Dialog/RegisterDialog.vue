<template>
  <el-dialog :visible.sync="registerDialog" width="40%" title="注册">
    <el-form label-width="70px" :model="form">
      <el-form-item label="用户名">
        <el-input
          v-model="form.username"
          placeholder="请输入用户名"
          style="font-size: 16px"
        />
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input
          v-model="form.email"
          placeholder="请输入邮箱"
          style="font-size: 16px"
        />
      </el-form-item>
      <el-form-item label="密码">
        <el-input
          v-model="form.password"
          placeholder="请输入密码"
          show-password
          style="font-size: 16px"
        />
      </el-form-item>
      <el-form-item label="确认密码">
        <el-input
          v-model="form.checkPassword"
          placeholder="请再次密码"
          show-password
          style="font-size: 16px"
        />
      </el-form-item>
      <el-form-item label="验证码">
        <el-input
          v-model="code"
          placeholder="请输入5位验证码"
          style="font-size: 16px"
        >
          <el-button
            type="text"
            :disabled="flag"
            slot="suffix"
            style="padding-right:10px"
            @click="getCode"
          >
            {{codeMsg}}
          </el-button>
        </el-input>
      </el-form-item>
      <el-button
        type="primary"
        round
        style="width: 200px; margin-left: 200px"
        @click="register"
      >
        注册
      </el-button>
    </el-form>
    <br />
    <span>
      <a @click="openLogin" style="float: left; padding-bottom: 10px">
        立即登录
      </a>
      <a @click="openForget" style="float: right; padding-bottom: 10px">
        忘记密码
      </a>
    </span>
  </el-dialog>
</template>

<script>
export default {
  data: function () {
    return {
      form: {},
      code: null,
      codeMsg: "发送验证码",
      flag: false,
      time: 60,
    };
  },
  computed: {
    registerDialog: {
      set(value) {
        this.$store.state.registerDialog = value;
      },
      get() {
        return this.$store.state.registerDialog;
      },
    },
  },
  methods: {
    openLogin() {
      this.$store.state.loginDialog = true;
      this.$store.state.registerDialog = false;
    },
    openForget() {
      this.$store.state.registerDialog = false;
      this.$store.state.forgetDialog = true;
    },
    getCode() {
      const reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
      if (!reg.test(this.form.email)) {
        this.$message.error("邮箱格式错误！");
        return false;
      }
      this.countDown();
      this.axios
        .get("/api/register/code", {
          params: {
            to: this.form.email,
          },
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.$message.success("发送成功，请注意查收");
          } else {
            this.$message.error(data.message);
          }
        });
    },
    countDown() {
      this.flag = true;
      this.timer = setInterval(() => {
        this.time--;
        this.codeMsg = this.time + "s";
        if (this.time <= 0) {
          clearInterval(this.timer);
          this.codeMsg = "发送验证码";
          this.time = 60;
          this.flag = false;
        }
      }, 1000);
    },
    register() {
      const reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
      if (!reg.test(this.form.email)) {
        this.$message.error("邮箱格式错误！");
        return false;
      }
      if (this.code.trim().length !== 5) {
        this.$message.error("请输入5位验证码！");
        return false;
      }
      if (this.form.password.trim().length === 0) {
        this.$message.error("密码不能为空！");
        return false;
      }
      if (this.form.password !== this.form.checkPassword) {
        this.$message.error("前后密码不一致！");
        return false;
      }
      let param = {};
      param["username"] = this.form.username;
      param["password"] = this.form.password;
      param["checkPassword"] = this.form.checkPassword;
      param["email"] = this.form.email;
      param["code"] = this.code;
      this.axios.post("/api/user/register", param).then(({ data }) => {
        if (data.code === 200) {
          this.$message.success("注册成功,跳转到登录");
          this.openLogin();
          this.form = {};
        } else {
          this.$message.error(data.message);
        }
      });
    },
  },
};
</script>

<style scoped></style>
