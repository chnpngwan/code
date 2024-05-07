<template>
  <el-icon class="icon" color="black" size="20">
    <Edit @click="show = true" />
  </el-icon>
  <!-- 修改班级信息表单 -->
  <popup :show="show" :hidden="hidden">
    <template #main>
        <div  class="videoEditForm">
      <el-form label-width="120px">
        <el-form-item label="视频标题">
          <el-input v-model="newVideoInfo.title" />
        </el-form-item>
        <el-form-item label="视频简介">
          <el-input v-model="newVideoInfo.description" />
        </el-form-item>
        <el-form-item label="视频封面">
          <el-upload
            class="upload-cover"
            action="#"
            list-type="picture-card"
            :auto-upload="false"
            :file-list="coverfileList"
            :show-file-list="false"
            :on-change="coverUploadChange"
          >
            <img v-if="newVideoInfo.cover" :src="coverimg" class="cover" />
            <div class="cover-icon" v-if="!newVideoInfo.cover">
              <el-icon :size="50"><Plus /></el-icon>
            </div>
          </el-upload>
        </el-form-item>
        <el-form-item label=" ">
          <el-button type="primary" @click="mysubmit">提交</el-button>
          <el-button @click="hidden">取消</el-button>
        </el-form-item>
      </el-form>
    </div>
    </template>
  </popup>
</template>

<script>
import popup from "../global/popup.vue";
import { Plus, Edit } from "@element-plus/icons";
export default {
  data() {
    return {
      show: false,
      newVideoInfo: {},
      coverimg: null,
      coverfileList: [],
    };
  },
  methods: {
    hidden() {
      this.show = false;
    },
    mysubmit() {
        let fd = new FormData();
        fd.append("id",this.newVideoInfo.id);
        fd.append("title",this.newVideoInfo.title);
        fd.append("description",this.newVideoInfo.description);
        fd.append("cover",this.newVideoInfo.cover);
      this.submit(fd);
      this.show = false;
    },
    coverUploadChange(file, fileList) {
      if (fileList.length > 1) {
        fileList.splice(0, 1);
      }
      this.newVideoInfo.cover = file.raw;
      let reader = new FileReader();
      let that = this;
      reader.onload = function () {
        that.coverimg = this.result;
      };
      reader.readAsDataURL(file.raw);
    },
  },
  mounted() {
    this.newVideoInfo.id = this.video.id;
    this.newVideoInfo.cover = null;
    this.newVideoInfo.title = this.video.title;
    this.newVideoInfo.description = this.video.description;
  },
  props: ["video", "submit"],
  components: { popup, Plus, Edit },
};
</script>

<style scoped lang="less">
.videoEditForm {
    margin: 10px 50px 0 0;
  .upload-cover {
    width: 200px;
    height: 200px;
    border: 2px solid #eee;
    display: flex;
    justify-content: center;
    align-items: center;
    .cover {
      width: 200px;
      height: 200px;
      object-fit: cover;
    }

    el-upload {
      width: 100%;
      height: 100%;
    }
    .cover-icon {
      width: 200px;
      height: 200px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  }
}
</style>