<template>
  <div class="my-history">
    <MyHistoryDetail
      v-for="item in historyList"
      :key="item.id"
      :history="item"
    />
    <el-button type="primary" @click="handlePrevPage" :disabled="page === 1">
      <el-icon class="el-icon--left"><ArrowLeft /></el-icon>上一页
    </el-button>
    <el-button
      type="primary"
      @click="handleNextPage"
      :disabled="historyList.length < 20"
    >
      下一页<el-icon class="el-icon--right"><ArrowRight /></el-icon>
    </el-button>
  </div>
</template>
  
  <script>
import { getMyHistoryApi } from "@/api/historyApi.js";
import MyHistoryDetail from "@/components/account/MyHistoryDetail.vue";
import { ElButton } from "element-plus";
import { ArrowLeft, ArrowRight } from "@element-plus/icons";
export default {
  data() {
    return {
      historyList: [],
      page: 1, // 当前页数
      pageSize: 20, // 每页数据条数
    };
  },
  mounted() {
    this.loadHistory();
  },
  methods: {
    loadHistory() {
      getMyHistoryApi(this.page)
        .then((res) => {
          this.historyList = res;
          this.historyList.sort((a, b) =>b.createTime - a.createTime);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    formatTimestamp(timestamp) {
      const date = new Date(timestamp);
      return date.toLocaleString(); // 根据需要自定义日期格式化方式
    },
    loadMore() {
      this.page++;
      this.loadHistory();
    },
    handlePrevPage() {
      if (this.page > 1) {
        this.page--;
        this.loadHistory();
      }
    },
    handleNextPage() {
      this.page++;
      this.loadHistory();
    },
    handleGoToFirstPage() {
      this.page = 1;
      this.loadHistory();
    },
  },
  components: { MyHistoryDetail, ElButton, ArrowLeft, ArrowRight },
};
</script>

<style lang="less" scoped>
.my-history {
  padding-left: 20px;

  .my-history-detail {
    background-color: skyblue;
    margin-bottom: 10px;
  }
}
</style>

