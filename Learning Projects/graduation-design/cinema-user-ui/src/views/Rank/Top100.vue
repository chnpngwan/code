<template>
  <div>
    <div class="main">
      <div class="board" v-for="(item, index) in top100List" :key="item.id">
        <div class="left">
          <i class="board-index">{{ index + 1 + frontNum }}</i>
        </div>
        <div class="middle1">
          <router-link :to="'/movie/' + item.id">
            <img :src="item.image" :alt="item.nameCn" />
          </router-link>
        </div>
        <div class="middle2">
          <router-link :to="'/movie/' + item.id">
            <p class="name">{{ item.nameCn }}</p>
          </router-link>
          <p class="star">类型：{{ item.categoryNameList.join("/") }}</p>
          <p class="releaseTime">
            上映时间：{{ item.releaseTime.split(" ")[0] }}
          </p>
        </div>
        <div class="right">
          <p>{{ item.score.toFixed(1) }}</p>
        </div>
      </div>
    </div>
    <div class="pageHelper">
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
  </div>
</template>

<script>
export default {
  data() {
    return {
      top100List: [],
      total: null,
      frontNum: 0,
      current: 1,
      size: 10,
    };
  },
  created() {
    this.getTop100List();
    this.frontNum = (this.current - 1) * this.size;
  },
  methods: {
    sizeChange(size) {
      this.size = size;
      this.getTop100List();
      this.frontNum = (this.current - 1) * this.size;
    },
    currentChange(current) {
      this.current = current;
      this.getTop100List();
      this.frontNum = (this.current - 1) * this.size;
    },
    getTop100List() {
      this.axios.get("/api/rank/top100").then(({ data }) => {
        if (data.code === 200) {
          this.top100List = data.data.recordList;
          this.top100List.forEach((movie) => {
            movie.categoryNameList = [];
            movie.categoryList.forEach((category) => {
              movie.categoryNameList.push(category.name);
            });
          });
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
};
</script>

<style scoped>
.main {
  width: 950px;
  margin: 70px auto 0;
}

.board {
  display: flex;
  margin: 25px 0;
}

.left {
  display: flex;
  align-items: center;
  margin-right: 25px;
}

.middle1 {
  display: flex;
  align-items: center;
}

.middle2 {
  display: flex;
  /*align-items: center;*/
  flex-direction: column;
  justify-content: center;
  margin-left: 25px;
  width: 400px;
}

.middle2 > a {
  color: #373d41;
  font-size: 26px;
  text-decoration: none;
}

.name,
.star,
.releaseTime {
  margin-top: 8px;
  margin-bottom: 8px;
}

.releaseTime {
  color: #999999;
}

.right {
  display: flex;
  font-size: 40px;
  font-weight: 700;
  font-style: italic;
  color: #ffb400;
  margin-left: 320px;
  align-items: center;
}

.board-index {
  background: #ffb400;
  color: #fff;
  display: inline-block;
  width: 50px;
  height: 50px;
  line-height: 50px;
  text-align: center;
  font-size: 18px;
  font-weight: 700;
  align-items: center;
}

img {
  width: 160px;
  height: 220px;
}

.pageHelper {
  display: flex;
  justify-content: center;
  margin: 40px 0;
}
</style>
