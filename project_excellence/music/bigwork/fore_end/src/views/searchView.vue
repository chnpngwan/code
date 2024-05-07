<template>
  <!-- 头部切换选项 -->
  <ul class="top">
    <li><el-button link @click="changeMod('video')">视频</el-button></li>
    <li><el-button link @click="changeMod('class')">班级</el-button></li>
    <li><el-button link @click="changeMod('user')">用户</el-button></li>
  </ul>
  <!-- 主体展示数据 -->
  <div class="main">
    <el-space wrap>
      <template v-if="method == 'class'">
        <template v-for="clazz in data.class" :key="clazz">
          <myClassItem :clazz="clazz"></myClassItem>
        </template>
      </template>
      <template v-if="method == 'video'">
        <template v-for="video in data.video" :key="video">
          <div class="video-item">
            <myVideo :video="video"></myVideo>
          </div>
        </template>
      </template>
      <template v-if="method == 'user'">
        <template v-for="user in data.user" :key="user">
          <userDetailCard :user="user"></userDetailCard>
        </template>
      </template>
    </el-space>
  </div>
</template>

<script>
import myClassItem from "../components/global/myClassItem.vue";
import myVideo from "../components/global/myVideo.vue";
import myUserItem from "../components/global/myUserItem.vue";
import userDetailCard from "../components/global/userDetailCard.vue";
import { search } from "@/api/searchApi.js";
export default {
  data() {
    return {
      keyword: [],
      data: {
        user: [],
        video: [],
        class: [],
      },
      method: "video",
      page: 1,
    };
  },
  methods: {
    changeMod(mod) {
      this.method = mod;
      this.search();
    },
    search() {
      search({ keyword: this.keyword, searchMod: this.method }, this.page).then(
        (res) => {
          if (this.method == "video") {
            this.data.video = res;
          } else if (this.method == "user") {
            this.data.user = res;
          } else if (this.method == "class") {
            this.data.class = res;
          }
        }
      );
    },
  },
  components: { myClassItem, myVideo, myUserItem,userDetailCard },
  mounted() {
    console.log("this.$route.query.keyword instanceof Array",this.$route.query.keyword instanceof Array);
    if (!this.$route.query.keyword instanceof Array) {
      this.keyword.push(this.$route.query.keyword);
    } else {
      this.keyword.push(...this.$route.query.keyword);
    }
    this.tags = this.$route.query.tag;
    this.search();
  },
};
</script>

<style scoped lang="less">
.top {
  display: flex;
  margin: 0 0 0 300px;
  * {
    font-size: 20px;
    font-weight: 700;
  }
}
.main {
  height: 100%;
  padding: 5px 45px;
  .video-item {
    width: calc(90vw / 5);
    height: 200px;
    margin-top: 20px;
  }
}
</style>