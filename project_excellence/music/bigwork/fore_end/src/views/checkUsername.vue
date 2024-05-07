<template>
  <div class="center-container">
    <div class="wrapper">
      <h2>找回密码</h2>
      <el-form
        :model="form"
        :rules="rules"
        ref="form"
        label-width="100px"
        label-position="top"
      >
        <el-form-item label="用户名" prop="username">
          <el-input v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item class="next-button">
          <el-button type="primary" @click="checkUsername">下一步</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import { ElMessage } from "element-plus";
import { checkUsername } from "@/api/securityQuestionApi.js";
export default {
  data() {
    return {
      form: {
        username: "",
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    async checkUsername() {
      // 在此处进行用户名的校验逻辑，可以发送异步请求到后端校验用户名是否正确
      if (this.username == "") {
        ElMessage.error("请输入用户名");
      }
      checkUsername(this.form.username).then((res) => {
        // 如果用户名正确，则路由到下一个表单页面，否则显示错误提示
          this.$router.push({
            path: `/forgetPassword/checkQuestion/${this.form.username}`,
          }); // 路由到下一个表单页面，并传递参数

      }).catch(err=>{
        ElMessage.error("用户名有误")
      });
    },
  },
};
</script>

<style scoped lang="less">
.center-container {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100vw;
  height: 100vh;

  .wrapper {
    border: 1px solid #000;
    border-radius: 5px;
    padding: 20px;
    position: relative;
    bottom: 60px;
    width: 30vw;

    h2,
    form {
      margin-bottom: 20px;
    }
  }

  .next-button {
    text-align: right;
  }
}
</style>
