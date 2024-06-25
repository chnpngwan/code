<template>
  <el-card class="main-card">
    <el-tabs v-model="activeName">
      <!-- 修改信息 -->
      <el-tab-pane label="修改信息" name="info">
        <div class="info-container">
          <el-upload
            class="avatar-uploader"
            action="/api/movie/image"
            :show-file-list="false"
            :before-upload="handleBeforeUpload"
            :on-success="handleImageUploadSuccess"
            v-loading="loading"
          >
            <img v-if="imageUrl" :src="imageUrl" class="avatar" />
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
          <el-form
            label-width="110px"
            :model="infoForm"
            style="width:320px;margin-left:3rem"
          >
            <el-form-item label="昵称" label-width="auto">
              <el-input v-model="infoForm.nickname" style="width:360px" />
            </el-form-item>
            <el-form-item label="邮箱" label-width="auto">
              <el-input v-model="infoForm.email" style="width:360px" />
            </el-form-item>
            <el-form-item label="电话" label-width="auto">
              <el-input v-model="infoForm.telephone" style="width:360px" />
            </el-form-item>
            <el-form-item label="简介" label-width="auto">
              <el-input
                type="textarea"
                :rows="4"
                v-model="infoForm.intro"
                style="width:360px"
              />
            </el-form-item>
            <el-button
              @click="updateUser"
              type="primary"
              size="medium"
              style="margin-left:4.375rem"
            >
              修改
            </el-button>
          </el-form>
        </div>
      </el-tab-pane>
      <!-- 修改密码 -->
      <el-tab-pane label="修改密码" name="password">
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
      </el-tab-pane>
    </el-tabs>
  </el-card>
</template>

<script>
export default {
  data: function() {
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
      infoForm: {},
      passwordForm: {
        oldPassword: "",
        newPassword: "",
        confirmPassword: ""
      },
      activeName: "info",
      loading: false,
      imageUrl: null,
      ruleForm: {
        oldPassword: "",
        newPassword: "",
        checkPassword: ""
      },
      rules: {
        oldPassword: [
          { required: true, message: "旧密码不能为空", trigger: "blur" }
        ],
        newPassword: [
          { required: true, message: "新密码不能为空", trigger: "blur" }
        ],
        checkPassword: [{ validator: validatePass, trigger: "blur" }]
      }
    };
  },
  created() {
    this.getUserInfo();
  },
  methods: {
    handleBeforeUpload() {
      this.loading = true;
    },
    handleImageUploadSuccess(response) {
      if (response.code === 200) {
        this.loading = false;
        this.imageUrl = response.data;
      } else {
        this.$notify.error({
          title: "失败",
          message: response.message
        });
      }
    },
    getUserInfo() {
      this.axios
        .get("/api/user/info", {
          params: {
            userId: this.$store.state.userId
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.infoForm = data.data;
            this.imageUrl = data.data.avatar;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message
            });
          }
        });
    },
    updateUser() {
      this.infoForm["avatar"] = this.imageUrl;
      this.axios.post("/api/user", this.infoForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getUserInfo();
          this.$store.state.avatar = this.infoForm.avatar;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          this.ruleForm["userId"] = this.$store.state.userId;
          this.axios
            .put("/api/user/password", this.ruleForm)
            .then(({ data }) => {
              if (data.code === 200) {
                this.$notify.success({
                  title: "成功",
                  message: data.message
                });
                this.$store.commit("logout2");
                this.$router.push("/");
              } else {
                this.$notify.error({
                  title: "失败",
                  message: data.message
                });
              }
            });
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
};
</script>

<style scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
.info-container {
  display: flex;
  align-items: center;
  margin-left: 20%;
}
</style>
