<template>
  <div>
    <div class="list-content" v-for="item in cinemaList" :key="item.id">
      <div class="list-left">
        <a href="#" class="cinema-name">{{ item.name }}</a>
        <p class="cinema-address">地址：{{ item.address }}</p>
        <el-tag
          size="small"
          effect="plain"
          type="danger"
          v-for="serve in item.serveList"
          :key="serve.id"
        >
          {{ serve.name }}
        </el-tag>
        <el-tag
          size="small"
          effect="plain"
          type="danger"
          v-for="type in item.typeList"
          :key="type.id"
        >
          {{ type.name }}
        </el-tag>
      </div>
      <div class="list-right">
        <el-button
          @click="toCinemaInfo(item.id)"
          type="primary"
          round
          size="medium"
        >
          选座购票
        </el-button>
      </div>
    </div>
    <div class="no-cinema" v-if="cinemaList.length === 0">
      <p>抱歉，没有找到相关结果，请尝试用其他条件筛选。</p>
    </div>
    <div class="pageHelper" v-if="cinemaList.length !== 0">
      <el-pagination
        class="pagination-container"
        background
        @size-change="sizeChange"
        @current-change="currentChange"
        :current-page="current"
        :page-size="size"
        :total="total"
        :page-sizes="[10, 20]"
        layout="total, sizes, prev, pager, next, jumper"
      />
    </div>
    <div>
      <router-view :keywords="keywords"></router-view>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    keywords: String,
  },
  data() {
    return {
      current: null,
      size: null,
      total: null,
      cinemaList: [],
    };
  },
  created() {
    this.getCinemaList();
  },
  methods: {
    sizeChange(size) {
      this.size = size;
      this.getCinemaList();
    },
    currentChange(current) {
      this.current = current;
      this.getCinemaList();
    },
    getCinemaList() {
      this.axios
        .get("/api/cinema/search", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords,
          },
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.cinemaList = data.data.recordList;
            this.total = data.data.count;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message,
            });
          }
        });
    },
  },
  watch: {
    $route() {
      this.getCinemaList();
    },
  },
};
</script>

<style scoped>
.list-content {
  width: 1200px;
  display: flex;
  justify-content: space-between;
  border-bottom: solid #eeeeee 1px;
  padding: 10px 0;
  margin: 0 auto 30px;
}

.list-right {
  margin-top: 30px;
}

.cinema-name {
  color: #333333;
  font-size: 24px;
  font-weight: 700;
}

.cinema-address {
  margin: 10px 0;
  color: #999999;
}

a {
  text-decoration: none;
  cursor: pointer;
  color: #333333;
}

.el-tag {
  margin: 0 10px 10px 0;
}

.el-button {
  margin-right: 20px;
}

.no-cinema {
  display: flex;
  justify-content: center;
  margin-top: 40px;
  margin-bottom: 40px;
  font-size: 16px;
  color: #333;
}

.pageHelper {
  display: flex;
  justify-content: center;
  margin: 40px 0;
}
</style>
