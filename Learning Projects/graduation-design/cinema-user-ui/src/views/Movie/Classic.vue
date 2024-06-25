<template>
  <div>
    <div class="movie-list">
      <movie-item :movieItem="item" v-for="item in movieList" :key="item.id">
      </movie-item>
    </div>

    <div class="no-cinema" v-if="movieList.length === 0">
      <p>抱歉，没有找到相关结果，请尝试用其他条件筛选。</p>
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
import movieItem from "../../components/movie-item";
export default {
  components: {
    movieItem,
  },
  props: {
    categoryId: Number,
    areaId: Number,
    ageId: Number,
    orderType: Number,
  },
  data() {
    return {
      total: null,
      current: null,
      size: null,
      movieList: [],
    };
  },
  computed: {
    listenChange() {
      const { categoryId, areaId, ageId, orderType } = this;
      return { categoryId, areaId, ageId, orderType };
    },
  },
  created() {
    this.getMovieList();
  },
  watch: {
    listenChange() {
      this.getMovieList();
    },
  },
  methods: {
    sizeChange(size) {
      this.size = size;
      this.getMovieList();
    },
    currentChange(current) {
      this.current = current;
      this.getMovieList();
    },
    getMovieList() {
      this.axios
        .get("/api/movie/classic", {
          params: {
            current: this.current,
            size: this.size,
            categoryId: this.categoryId,
            areaId: this.areaId,
            ageId: this.ageId,
            orderType: this.orderType,
          },
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.movieList = data.data.recordList;
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
.movie-list {
  display: flex;
  flex-wrap: wrap;
}

.pageHelper {
  display: flex;
  justify-content: center;
  margin: 40px 0;
}

.no-cinema {
  display: flex;
  justify-content: center;
  margin-top: 40px;
  margin-bottom: 40px;
  font-size: 16px;
  color: #333;
}
</style>
