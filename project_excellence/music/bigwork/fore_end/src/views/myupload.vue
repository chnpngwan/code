<template>
  <el-form
    :model="video"
    :rules="formRules"
    label-width="120px"
    class="main"
    ref="form"
  >
    <el-form-item label="标题" :prop="title">
      <el-input v-model="video.title" />
    </el-form-item>
    <el-form-item label="简介" :prop="description">
      <el-input v-model="video.description" type="textarea" />
    </el-form-item>
    <!-- 上传视频 -->
    <el-form-item label="视频">
      <el-upload
        ref="upload"
        class="upload-video"
        action=""
        :limit="1"
        :on-change="videoUploadChange"
        :on-exceed="handleVideoExceed"
        :auto-upload="false"
        :before-upload="beforeVideoUpload"
      >
        <template #trigger>
          <el-button type="primary">select file</el-button>
        </template>
        <template #tip>
          <div class="el-upload__tip text-red">
            limit 1 file, new file will cover the old file
          </div>
        </template>
      </el-upload>
    </el-form-item>
    <!-- 上传封面 -->
    <el-form-item label="封面">
      <el-upload
        class="upload-cover"
        action=""
        :file-list="coverList"
        :show-file-list="false"
        :on-change="coverUploadChange"
        :auto-upload="false"
        :on-exceed="handleExceed"
      >
        <img v-if="video.cover" :src="coverImg" class="cover" />
        <div class="cover-icon" v-if="!video.cover">
          <el-icon :size="50"><Plus /></el-icon>
        </div>
      </el-upload>
    </el-form-item>
    <el-form-item label="是否公开">
      <el-switch v-model="video.open" />
    </el-form-item>
    <el-form-item label="所属班级课程">
      <el-select v-model="video.class" placeholder="班级" clearable>
        <el-option
          v-for="clazz in myClasses"
          :key="clazz"
          :label="clazz.name"
          :value="clazz.id"
        />
      </el-select>
    </el-form-item>
    <el-form-item label="tag">
      <ul class="tagContainer">
        <li
          v-for="(tag, index) in video.tags"
          :key="tag.id"
          @click="removeTag(index)"
        >
          <el-tag class="tag">{{ tag.name }}</el-tag>
        </li>
      </ul>
    </el-form-item>
    <el-form-item label="添加tag">
      <el-select
        v-model.trim="tagKeyWord"
        placeholder="tags"
        clearable
        filterable
        remote
        :remote-method="changeTagKeyword"
      >
        <el-option
          v-for="recommendTag in recommendTags"
          :key="recommendTag"
          :label="recommendTag.name"
          :value="recommendTag.value"
          @click="addtag(recommendTag)"
        />
      </el-select>
      <div class="tip" @click="showAddTagPop">tag不存在?创建tag</div>
    </el-form-item>
    <!-- 按钮 -->
    <el-form-item>
      <el-button type="primary" @click="upload">上传</el-button>
      <el-button @click="goBack">取消</el-button>
    </el-form-item>
  </el-form>
  <!-- 弹出层1  -->
  <popup :hidden="hiddenAddTagPop" :show="showAddTag">
    <template #main>
      <el-form label-width="90px" class="createTag" @submit.prevent>
        <el-form-item label="tag名称">
          <el-input v-model="newTagName" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="createTag">创建</el-button>
        </el-form-item>
      </el-form>
    </template>
  </popup>

  <!-- 等待遮罩 -->
  <div class="overlay" v-show="uploading">
      <div class="spinner">上传中...</div>
    </div>
</template>

<script>
import { Plus } from "@element-plus/icons";
import { ElMessage } from "element-plus";
import { upload as uploadApi } from "@/api/videoApi.js";
import { getRecommendTagsApi, createTagApi } from "@/api/tagApi.js";
import popup from "../components/global/popup.vue";
import { getMyClassApi } from "@/api/classApi.js";
export default {
  data() {
    return {
      video: {
        title: "",
        description: "",
        video: "",
        cover: "",
        duration: 0,
        tags: [],
        open: true,
        class: null,
      },
      myClasses: [],
      videoList: [],
      coverList: [],
      coverImg: "",
      tagKeyWord: "",
      recommendTags: [],
      showAddTag: false,
      newTagName: "",
      uploading:false,
      formRules: {
        title: [
          { required: true, message: "请输入标题", trigger: "blur" },
          { max: 50, message: "标题长度不能超过50个字符", trigger: "blur" },
          // 其他规则
        ],
        description: [
          { required: true, message: "请输入简介", trigger: "blur" },
          { max: 200, message: "简介长度不能超过200个字符", trigger: "blur" },
          // 其他规则
        ],
      },
    };
  },
  methods: {
    coverUploadChange(file, fileList) {
      if (fileList.length > 1) {
        fileList.splice(0, 1);
      }
      this.video.cover = file.raw;
      let reader = new FileReader();
      let that = this;
      reader.onload = function () {
        that.coverImg = this.result;
      };
      reader.readAsDataURL(file.raw);
    },
    async videoUploadChange(file, fileList) {
      let videoUrl = URL.createObjectURL(file.raw);
      let audioElement = new Audio(videoUrl);

      while (
        isNaN(audioElement.duration) ||
        audioElement.duration === Infinity
      ) {
        audioElement.currentTime = 10000000 * Math.random();
        await new Promise((resolve) => setTimeout(resolve, 200));
      }

      this.video.duration = parseInt(audioElement.duration);

      this.video.video = file.raw;
    },
    handleExceed() {
      ElMessage.error("出错了");
    },
    handleVideoExceed() {
      ElMessage.error("只能上传一个视频");
    },
    beforeVideoUpload(file) {
      const isVideo = file.type.startsWith("video/");
      console.log("beforeVideoUpload");
      if (!isVideo) {
        this.$message.error("只能上传视频文件");
      }
      return isVideo;
    },
    upload() {
      this.uploading=true;
      let fd = new FormData();
      fd.append("title", this.video.title);
      fd.append("description", this.video.description);
      fd.append("video", this.video.video);
      fd.append("cover", this.video.cover);
      fd.append("duration", this.video.duration);
      let tags = this.video.tags.map((item, index, array) => {
        return item.id;
      });
      fd.append("tags", tags);
      fd.append("open", this.video.open);
      if (this.video.class == null) fd.append("cid", 0);
      else fd.append("cid", this.video.class);
      uploadApi(fd).then((res) => {
        ElMessage.success("上传成功");
        this.clearForm();
        this.uploading=false;
      }).catch(err=>{
        ElMessage.error("上传失败")
        this.uploading=false;
      });
    },
    changeTagKeyword(keyword) {
      console.log(keyword);
      if (keyword != "") {
        getRecommendTagsApi(keyword).then((res) => {
          this.recommendTags = res;
        });
      }
    },
    addtag(tag) {
      if (this.video.tags.indexOf(tag) > -1) {
        return;
      } else this.video.tags.push(tag);
      this.tagKeyWord = "";
    },
    removeTag(index) {
      this.video.tags.splice(index, 1);
    },
    clearForm() {
      this.video.title = "";
      this.video.description = "";
      this.video.video = "";
      this.video.cover = "";
      this.videoList = [];
      this.coverList = [];
      this.coverImg = "";
      this.video.duration = 0;
      this.tagKeyWord = "";
      this.video.open = true;
      this.video.class = null;
      this.recommendTags = [];
      this.$refs.upload.clearFiles();
    },
    goBack() {
      this.$router.back();
    },
    hiddenAddTagPop() {
      this.showAddTag = false;
    },
    showAddTagPop() {
      this.showAddTag = true;
    },
    createTag() {
      createTagApi(this.newTagName).then(
        (res) => {
          ElMessage.success("创建成功");
          this.hiddenAddTagPop();
        },
        (error) => {
          ElMessage.error(error);
        }
      );
    },
  },
  mounted() {
    getMyClassApi().then((res) => {
      this.myClasses = res;
      this.myClasses = this.myClasses.filter(
        (item) => this.$store.state.user.id == item.creator
      );
    });
  },
  components: { Plus, popup },
};
</script>

<style scoped lang="less">
.main {
  width: 100vw;
  height: fit-content;
  padding: 10px 15vw 100px 15vw;
  .tagContainer {
    display: flex;
    .tag {
      padding: 0 10px;
      border-radius: 5px;
      &:hover {
        background-color: #eee;
      }
      cursor: pointer;
    }
  }
  .tip {
    margin-left: 10px;
    color: #999;
    cursor: pointer;
    &:hover {
      color: greenyellow;
    }
  }

  .upload-cover {
    width: 200px;
    height: 200px;
    border: 2px solid #eee;
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

.createTag {
  margin: 30px 70px;
}

.overlay{
  width: 100vw;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.3);
  position: fixed;
  top: 0;
  left: 0;
  z-index: 999;
  display: flex;
  justify-content: center;
  align-items: center;
  .spinner{
    font-size: 36px;
    color: #eee;
  }
}
</style>