<template>
  <main class="main">
    <div class="tags">
      <p>分类</p>
      <template v-for="tag in tags" :key="tag">
          <el-tag class="tag" @click="toTagVideo(tag.id)">{{ tag.name }}</el-tag>
      </template>
    </div>
    <el-space wrap class="video_group">
      <template v-for="video in videos" :key="video.id">
        <router-link :to="`/video/${video.id}`">
          <myvideo class="video_item" :video="video"></myvideo>
        </router-link>
      </template>
    </el-space>
  </main>
</template>
  
  <script>
import myvideo from "../components/global/myVideo.vue";
import { getBytagApi } from "@/api/videoApi.js";
import { getApi } from "@/api/tagApi.js";
import { ElMessage } from "element-plus";
export default {
  data() {
    return {
      videos: [],
      videoPage: 1,
      tags: [],
      tagPage: 1,
      tid:null
    };
  },
  inject:["reload"],
  components: {
    myvideo,
  },
  methods: {
    getMoreVideos() {
      getBytagApi(this.tid, this.videoPage++).then((res) => {
        if (res.length == 0) {
          ElMessage.warning("没有更多视频了");
        } else this.videos.push(...res);
      });
    },
    async toTagVideo(tid){
        let t = await this.$router.push(`/video/tag/${tid}`);
        this.reload()
    },
    getMoreTags() {
      getApi(this.tagPage++).then((res) => {
        if (res.length == 0) {
          this.tagPage = 1;
          this.getMoreTags();
          return;
        } else this.tags.splice(0, this.tags.length, ...res);
      });
    },
  },
  mounted() {
    this.getMoreTags();
    this.tid = this.$route.params.tid;
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
    height: 2rem;
    margin-bottom: 30px;
    p {
      font-size: 14px;
      font-weight: 600;
    }
    .tag {
      margin: 0 5px;
      cursor: pointer;
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