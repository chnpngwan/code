<template>
  <el-form
    :model="ruleForm"
    status-icon
    :rules="rules"
    ref="ruleForm"
    label-width="100px"
    style="margin-top: 40px"
  >
    <el-form-item label="旧密码" prop="oldPassword">
      <el-input
        type="password"
        v-model="ruleForm.oldPassword"
        autocomplete="off"
        style="width: 360px"
      >
      </el-input>
    </el-form-item>
    <el-form-item label="新密码" prop="newPassword">
      <el-input
        type="password"
        v-model="ruleForm.newPassword"
        autocomplete="off"
        style="width: 360px"
      >
      </el-input>
    </el-form-item>
    <el-form-item label="确认密码" prop="checkPassword">
      <el-input
        type="password"
        v-model="ruleForm.checkPassword"
        autocomplete="off"
        style="width: 360px"
      >
      </el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
      <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  data() {
    const validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.ruleForm.newPassword) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    return {
      ruleForm: {
        oldPassword: "",
        newPassword: "",
        checkPassword: "",
      },
      rules: {
        oldPassword: [
          { required: true, message: "旧密码不能为空", trigger: "blur" },
        ],
        newPassword: [
          { required: true, message: "新密码不能为空", trigger: "blur" },
        ],
        checkPassword: [{ validator: validatePass, trigger: "blur" }],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.ruleForm["userId"] = this.$store.state.userId;
          this.axios
            .put("/api/user/password", this.ruleForm)
            .then(({ data }) => {
              if (data.code === 200) {
                this.$notify.success({
                  title: "成功",
                  message: data.message,
                });
                this.$store.commit("logout2");
                this.$router.push("/");
              } else {
                this.$notify.error({
                  title: "失败",
                  message: data.message,
                });
              }
            });
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
};
</script>
