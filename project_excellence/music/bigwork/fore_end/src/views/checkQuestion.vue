<template>
  <div class="container">
    <div class="wrapper">
      <el-form
        :model="form"
        :rules="rules"
        ref="form"
        label-width="100px"
        label-position="top"
      >
      <el-form-item label="安全问题" prop="securityQuestion">
          <el-input v-model="form.securityQuestion" disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="答案" prop="password">
          <el-input type="password" v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="checkAnswer">下一步</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>
  
  <script>
import {
  getSecurityQuestionByUsername,
  checkAnswer,
} from "@/api/securityQuestionApi.js";
import { ElMessage } from 'element-plus';
export default {
  data() {
    return {
      username: "",
      form: {
        securityQuestion: "",
        password: "",
      },
      rules: {
        password: [{ required: true, message: "请输入答案", trigger: "blur" }],
      },
    };
  },
  mounted() {
    this.username = this.$route.params.username;
    this.fetchSecurityQuestion();
  },
  methods: {
    fetchSecurityQuestion() {
      // 根据实际路径修改下面的API调用
      // 根据username获取安全问题
      // 假设getSecurityQuestionByUsername是用于获取安全问题的API方法
      getSecurityQuestionByUsername(this.username)
        .then((response) => {
          this.form.securityQuestion = response.question;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    checkAnswer() {
        if(this.form.password == ""){
            ElMessage.error("请输入答案")
        }
      // 在此处进行密码校验逻辑，可以发送异步请求到后端校验密码是否正确
      checkAnswer(this.username, this.form.password).then((res) => {
        // 如果密码正确，则路由到下一个步骤，否则显示错误提示
        this.$router.push(`/forgetPassword/resetPassword/${res}`); // 路由到重置密码页面
      });
    },
  },
};
</script>
  
  <style scoped lang="less">
@container-height: 100vh;

.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: @container-height;

  .wrapper {
    position: relative;
    bottom: 60px;
    width: 30vw;
    border: 1px solid #000;
    border-radius: 5px;
    padding: 20px;

    h2,
    form {
      margin-bottom: 20px;
    }
  }
}
</style>
  