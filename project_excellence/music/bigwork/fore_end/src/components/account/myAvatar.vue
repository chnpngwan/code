<template>
  <div class="main">
    <el-upload
      class="avatar-uploader"
      action=""
      :file-list="fileList"
      :show-file-list="false"
      :on-change="changeFile"
      :auto-upload="false"
      :on-exceed="handleExceed"
    >
      <img v-if="avatar" :src="img" class="avatar" />

      <el-icon v-if="!avatar" class="avatar-uploader-icon" :size="50"
        ><Plus
      /></el-icon>
    </el-upload>
    <el-button type="primary" @click="upload">保存</el-button>
  </div>
</template>

<script>
import { Plus } from "@element-plus/icons";
import { ElMessage } from "element-plus";
import { uploadAvatar } from "@/api/userApi.js";
import { mapActions } from "vuex"
export default {
  data() {
    return {
      avatar: "",
      fileList: [],
      img: "",
    };
  },
  methods: {
    ...mapActions(["updateAvatar"]),
    changeFile(file, fileList) {
      if (fileList.length > 1) {
        fileList.splice(0, 1);
      }
      console.log("fileList", fileList);
      this.avatar = file.raw;
      let reader = new FileReader();
      let that = this;
      reader.onload = function () {
        that.img = this.result;
      };
      reader.readAsDataURL(file.raw);
    },
    handleExceed(file, fileList) {
      ElMessage.info("不知道什么错误 ");
    },
    beforeAvatarUpload() {
      console.log("校验大小");
    },
    upload() {
      let fd = new FormData();
      fd.append("avatar", this.avatar);
      uploadAvatar(fd).then(
        (res) => {
          this.updateAvatar(res);
          ElMessage.success("修改成功")
          console.log(res);
        },
        (err) => {
          ElMessage.error(err);
          console.log(err);
        }
      );
    },
  },
  mounted() {
    if (this.$store.state.user.id != null) {
      this.img = this.$store.state.user.avatar;
      this.avatar = this.$store.state.user.avatar;
      this.$store.dispatch("updateUser");
    }
  },
  components: { Plus },
};
</script>

<style scoped lang="less">
.main {
  text-align: center;

  .avatar-uploader {
    margin: 30px auto;
    width: 200px;
    height: 200px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #eee;
    // border: 1px solid #eee;

    .avatar {
      width: 200px;
      height: 200px;
      border-radius: 50%;
      object-fit: cover;
    }
  }
}
</style>