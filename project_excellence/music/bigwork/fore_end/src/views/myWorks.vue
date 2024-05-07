<template>
  <div class="top">
    <div class="avatar">
      <img :src="user.avatar" />
    </div>
    <div class="info">
      <div class="nickname">{{ user.nickname }}</div>
      <div class="description">{{ user.description }}</div>
    </div>
  </div>
  <div class="center">
    <template v-if="user.teacher">
      <div>
        <p>视频</p>
        <el-space wrap>
          <template v-for="video in videos" :key="video">
            <div>
              <videoEditPopup
                v-if="video.creator.id == $store.state.user.id"
                :video="video"
                :submit="modifyVideoInfo"
              ></videoEditPopup>
              <RouterLink :to="`/video/${video.id}`">
                <myVideo :video="video" class="video_item"></myVideo>
              </RouterLink>
            </div>
          </template>
        </el-space>
      </div>
      <div>
        <p>班级</p>
        <el-space wrap>
          <template v-for="clazz in classes" :key="clazz">
            <myClassItem :clazz="clazz"></myClassItem>
          </template>
        </el-space>
      </div>
    </template>
  </div>
  <div class="bottom"></div>
</template>

<script>
import { getByUidApi, modifyVideoApi } from "@/api/videoApi.js";
import { getByCreatorId } from "@/api/classApi.js";
import { getInfo } from "@/api/userApi.js";
import myVideo from "../components/global/myVideo.vue";
import videoEditPopup from "../components/popup/videoEditPopup.vue";
import myClassItem from "../components/global/myClassItem.vue";
export default {
  data() {
    return {
      user: {},
      videos: [],
      videoPage: 1,
      classes: [],
      uid: null,
    };
  },
  mounted() {
    this.uid = this.$route.params.uid;
    this.refreshVideos();
    getInfo(this.uid).then((res) => {
      this.user = res;
    });
    getByCreatorId(this.uid).then((res) => {
      this.classes = res;
    });
  },
  methods: {
    refreshVideos() {
      getByUidApi(this.uid, this.videoPage).then((res) => {
        this.videos.splice(0, this.videos.length, ...res);
      });
    },
    modifyVideoInfo(data) {
      modifyVideoApi(data).then((res) => {
        this.refreshVideos();
      });
    },
  },
  components: { myVideo, videoEditPopup, myClassItem },
};
</script>

<style scoped lang="less">
.top {
  margin: 40px 0 0 90px;
  display: flex;
  align-items: center;
  .avatar {
    @avatar-size: 100px;
    margin: 0 20px;
    img {
      width: @avatar-size;
      height: @avatar-size;
      object-fit: cover;
      border-radius: 50%;
    }
  }
  .info {
    .nickname {
      font-size: 36px;
      font-weight: 700;
    }
    .description {
      font-size: 14px;
      color: #aaa;
    }
  }
}

.center {
  margin: 40px 45px 0 45px;
  p {
    font-size: 16px;
    font-weight: 600;
  }
  .video_item {
    width: calc(90vw / 5);
    height: 200px;
    margin-top: 20px;
  }
}
</style>