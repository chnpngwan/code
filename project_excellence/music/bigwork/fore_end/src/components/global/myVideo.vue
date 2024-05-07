<template>
  <div class="item">
    <router-link :to="`/video/${video.id}`">
      <div class="cover">
        <el-image
          :src="video.cover"
          fit="cover"
          style="width: 100%; height: 100%"
        ></el-image>
      </div>
    </router-link>
    <router-link :to="`/video/${video.id}`">
      <div class="title">
        <el-text truncated>{{ video.title }}</el-text>
      </div>
    </router-link>
    <router-link :to="`/user/${video.creator.id}`">
      <div class="info">
        <div class="nickname">{{ video.creator.nickname }}</div>
        <div class="publish_time">{{ video.publishTime }}</div>
      </div>
    </router-link>
  </div>
</template>

<script>
import { now } from "lodash";

export default {
  data() {
    return {};
  },
  methods: {
    toDateString(timestamp) {
      timestamp = timestamp ? timestamp : null;

      let date = new Date(timestamp); //时间戳为10位需*1000，时间戳为13位的话不需乘1000
      let Y = date.getFullYear() + "-";
      let M =
        (date.getMonth() + 1 < 10
          ? "0" + (date.getMonth() + 1)
          : date.getMonth() + 1) + "-";
      let D =
        (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " ";
      let h =
        (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":";
      let m =
        (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) +
        ":";
      let s =
        date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
      return Y + M + D + h + m + s;
    },
  },
  props: ["video"],
};
</script>

<style lang="less">
.item {
  width: 100%;
  height: 100%;
  .cover {
    width: 100%;
    height: 70%;
    * {
      @img-radius: 8px;
      border-radius: @img-radius;
    }
  }

  .title {
    height: fit-content;
    padding-top: 5px;
    line-height: 1.1;
    * {
      color: #000;
      font-weight: 700;
    }
  }

  .info {
    height: 10%;
    font-size: 8px;
    font-weight: 400;
    color: #999;
    display: flex;
    justify-content: space-between;
  }
}
</style>