<template>
  <div class="my-history-detail">
    <p>
      <span class="title">标题:</span>
      <span class="title-content">{{ history.video.title }}</span>
    </p>
    <p>
      <span class="time-label">观看进度:</span>
      <span class="time-content">{{ formatTime(history.time) }}</span>
    </p>
    <p class="timestamp">{{ formatTimestamp(history.createTime) }}</p>
    <router-link :to="'/video/' + history.video.id">查看视频</router-link>
  </div>
</template>
  
<script>
export default {
  props: {
    history: {
      type: Object,
      required: true,
    },
  },
  methods: {
    formatTimestamp(timestamp) {
      const date = new Date(timestamp * 1000);
      return date.toLocaleString(); // 根据需要自定义日期格式化方式
    },
    formatTime(time) {
      const minutes = Math.floor(time / 60)
        .toString()
        .padStart(2, "0");
      const seconds = (time % 60).toString().padStart(2, "0");
      return `${minutes}:${seconds}`;
    },
  },
};
</script>

<style lang="less" scoped>
.my-history-detail {
  background-color: skyblue;
  border: 1px solid #000;
  border-radius: 5px;
  padding: 10px;

  .title {
    font-weight: bold;
  }

  .title-content {
    font-size: 16px;
  }

  .time-label {
    font-weight: bold;
  }

  .time-content {
    font-size: 14px;
  }

  .timestamp {
    font-size: 12px;
  }
}
</style>