<template>
  <div>
    <div class="search-container">
      <!-- 搜索的一名演员 -->
      <div class="search-result" v-for="item in actorList" :key="item.id">
        <!-- 演员照片 -->
        <div class="img-container">
          <router-link :to="'/actor/' + item.id">
            <img :src="item.image">
          </router-link>
        </div>
        <!-- 演员信息 -->
        <div class="movie-info">
          <div class="movie-name">
            <router-link :to="'/actor/' + item.id">
              {{ item.name }}
            </router-link>
          </div>
          <div>
            {{
              item.nation + (item.school === null ? "" : " | " + item.school)
            }}
          </div>
          <span class="movie-category">
            代表作: {{ item.movieNameList.join(",") }}
          </span>
        </div>
      </div>
    </div>
    <div class="no-cinema" v-if="actorList.length === 0">
      <p>抱歉，没有找到相关结果，请尝试用其他条件筛选。</p>
    </div>
    <div class="pageHelper" v-if="actorList.length !== 0">
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
      actorList: [],
    };
  },
  created() {
    this.getActorList();
  },
  methods: {
    sizeChange(size) {
      this.size = size;
      this.getActorList();
    },
    currentChange(current) {
      this.current = current;
      this.getActorList();
    },
    getActorList() {
      this.axios
        .get("/api/actor/search", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords,
          },
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.actorList = data.data.recordList;
            this.actorList.forEach((actor) => {
              actor.movieNameList = [];
              actor.movieList.forEach((movie) => {
                actor.movieNameList.push("《" + movie.name + "》");
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
  watch: {
    $route() {
      this.getActorList();
    },
  },
};
</script>

<style scoped>
.search-container {
  width: 980px;
  margin: 0 auto 20px;
  display: flex;
  flex-wrap: wrap;
}

.search-result {
  width: 460px;
  margin: 30px 0 0 30px;
  display: flex;
}

.img-container {
  width: 160px;
  height: 220px;
  margin-right: 20px;
}

.img-container img {
  width: 100%;
  height: 100%;
}

a {
  text-decoration: none;
  cursor:pointer;
}

.movie-info {
  display: flex;
  flex-direction: column;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  margin-top: 5px;
  font-size: 16px;
  width: 280px;
  border-bottom: solid #eee 1px;
}

.movie-name {
  font-size: 26px;
  margin-top: 27px;
}

.movie-ename {
  font-size: 14px;
  color: #999;
  margin-top: 3px;
}

.movie-category {
  color: #333;
  white-space: normal;
  margin-top: 20px;
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
