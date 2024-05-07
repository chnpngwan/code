<template>
  <main class="main">
    <div class="tags">
      <p>分类</p>
      <template v-for="tag in tags" :key="tag">
        <router-link :to="`/video/tag/${tag.id}`">
          <el-tag class="tag">{{ tag.name }}</el-tag>
        </router-link>
      </template>
    </div>
    <el-space wrap class="video_group">
      <template v-for="video in videos" :key="video.id">
        <myvideo class="video_item" :video="video"></myvideo>
      </template>
    </el-space>
  </main>
</template>

<script>
import myvideo from "../components/global/myVideo.vue";
import { getRecommend } from "@/api/videoApi.js";
import { getApi } from "@/api/tagApi.js";
import { ElMessage } from "element-plus";
export default {
  data() {
    return {
      videos: [],
      videoPage: 0,
      tags: [],
      tagPage: 0,
    };
  },
  components: {
    myvideo,
  },
  methods: {
    getMoreVideos() {
      this.videoPage++;
      getRecommend(this.videoPage).then((res) => {
        if (res.length == 0) {
          ElMessage.warning("没有更多视频了");
        } else this.videos.push(...res);
      });
    },
    getMoreTags() {
      this.tagPage++;
      getApi(this.tagPage).then((res) => {
        if (res.length == 0) {
          if(this.tagPage == 1){
            return ;
          }
          this.tagPage = 1;
          this.getMoreTags();
          return;
        } else this.tags.splice(0, this.tags.length, ...res);
      });
    },
  },
  mounted() {
    this.getMoreTags();
    this.getMoreVideos();
  },
};
</script>

<style scoped lang="less">
.main {
  height: 100%;
  padding: 5px 45px;
  .tags {
    margin: 10px 0;
    margin-bottom: 30px;
    height: 2rem;
    p {
      font-size: 14px;
      font-weight: 600;
    }
    .tag {
      margin: 0 5px;
    }
  }

  .video_group {
    width: 100%;
    .video_item {
      width: calc(90vw / 5);
      height: 200px;
      margin-bottom: 20px;
    }
  }
}
</style>