<template>
  <div>
    <h2>修改密码</h2>
    <el-form
      :model="form"
      :rules="rules"
      ref="form"
      label-width="100px"
      label-position="top"
    >
      <el-form-item label="旧密码" prop="old_password">
        <el-input type="password" v-model="form.old_password"></el-input>
      </el-form-item>
      <el-form-item label="新密码" prop="new_password">
        <el-input type="password" v-model="form.new_password"></el-input>
      </el-form-item>
      <el-form-item label="确认密码" prop="confirm_password">
        <el-input type="password" v-model="form.confirm_password"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="changePassword">确认修改</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
  
  <script>
import { modifyPassword } from "@/api/userApi.js";
export default {
  data() {
    return {
      form: {
        old_password: "",
        new_password: "",
        confirm_password: "",
      },
      rules: {
        old_password: [
          { required: true, message: "请输入旧密码", trigger: "blur" },
        ],
        new_password: [
          { required: true, message: "请输入新密码", trigger: "blur" },
          { min: 6, message: "密码长度不能少于6位", trigger: "blur" },
        ],
        confirm_password: [
          { required: true, message: "请确认密码", trigger: "blur" },
          { validator: this.confirmValidator, trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    confirmValidator(rule, value, callback) {
      if (value !== this.form.new_password) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    },
    changePassword() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          // 在此处进行密码修改逻辑，可以发送异步请求到后端进行密码修改
          // 如果密码修改成功，可以进行相关的成功提示，并进行页面跳转等操作
          // 如果密码修改失败，可以进行相关的错误提示
          // 这里只做简单的示例，需要根据实际情况进行修改
          modifyPassword({
            old_password: this.form.old_password,
            new_password: this.form.new_password,
          }).then(res=>{
          // 假设密码修改成功
          const successMessage = "密码修改成功";
          this.$message.success(successMessage);
          }).catch(err=>{this.$message.error(err);})

          // 清空表单数据
          this.form.old_password = "";
          this.form.new_password = "";
          this.form.confirm_password = "";
        } else {
          // 表单校验不通过，显示错误提示
          const errorMessage = "请按要求填写表单";
          this.$message.error(errorMessage);
        }
      });
    },
  },
};
</script>