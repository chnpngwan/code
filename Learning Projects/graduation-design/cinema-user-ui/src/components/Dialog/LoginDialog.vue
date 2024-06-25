<template>
  <el-dialog :visible.sync="loginDialog" width="30%" title="登录">
    <el-form label-width="40px" :model="form">
      <el-form-item label="账号">
        <el-input
          v-model="form.username"
          placeholder="请输入账号"
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
      <el-button
        type="primary"
        round
        style="width: 200px; margin-left: 100px"
        @click="login"
      >
        登录
      </el-button>
    </el-form>
    <br />
    <span>
      <a @click="openRegister" style="float: left; padding-bottom: 10px"
        >立即注册</a
      >
      <a @click="openForget" style="float: right; padding-bottom: 10px"
        >忘记密码</a
      >
    </span>
  </el-dialog>
</template>

<script>
export default {
  data: function () {
    return {
      form: {},
    };
  },
  computed: {
    loginDialog: {
      set(value) {
        this.$store.state.loginDialog = value;
      },
      get() {
        return this.$store.state.loginDialog;
      },
    },
  },
  methods: {
    openRegister() {
      this.$store.state.loginDialog = false;
      this.$store.state.registerDialog = true;
    },
    openForget() {
      this.$store.state.loginDialog = false;
      this.$store.state.forgetDialog = true;
    },
    login() {
      let param = new URLSearchParams();
      param.append("username", this.form.username);
      param.append("password", this.form.password);
      this.axios.post("/api/login", param).then(({ data }) => {
        if (data.code === 200) {
          this.$store.commit("login", data.data);
          this.$message.success("登录成功");
          this.$store.commit("closeDialog");
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
