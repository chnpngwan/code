<template>
  <div class="user-info-container">
    <div style="width: 30%">
      <h1>用户头像</h1>
      <el-upload
        class="avatar-uploader"
        action="/api/movie/image"
        :show-file-list="false"
        :before-upload="handleBeforeUpload"
        :on-success="handleImageUploadSuccess"
        v-loading="loading"
      >
        <img v-if="imageUrl" :src="imageUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>
    </div>
    <div style="width: 70%">
      <el-form label-width="80px" size="medium" :model="form">
        <el-form-item label="昵称" label-width="auto">
          <el-input v-model="form.nickname" style="width:360px" />
        </el-form-item>
        <el-form-item label="邮箱" label-width="auto">
          <el-input v-model="form.email" style="width:360px" />
        </el-form-item>
        <el-form-item label="电话" label-width="auto">
          <el-input v-model="form.telephone" style="width:360px" />
        </el-form-item>
        <el-form-item label="简介" label-width="auto">
          <el-input
            type="textarea"
            :rows="4"
            v-model="form.intro"
            style="width:360px"
          />
        </el-form-item>
        <el-button type="primary" @click="updateUser">保存</el-button>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  created() {
    this.getUserInfo();
  },
  data() {
    return {
      loading: false,
      imageUrl: null,
      form: {},
    };
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
          message: response.message,
        });
      }
    },
    getUserInfo() {
      this.axios
        .get("/api/user/info", {
          params: {
            userId: this.$store.state.userId,
          },
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.form = data.data;
            this.imageUrl = data.data.avatar;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message,
            });
          }
        });
    },
    updateUser() {
      this.form["avatar"] = this.imageUrl;
      this.axios.post("/api/user", this.form).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message,
          });
          this.getUserInfo();
          this.$store.state.avatar = this.form.avatar;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message,
          });
        }
      });
    },
  },
};
</script>

<style scoped>
.user-info-container{
  display: flex;
  margin-top: 40px;
}

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
</style>