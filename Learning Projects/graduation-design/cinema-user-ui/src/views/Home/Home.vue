<template>
  <div>
    <el-carousel height="500px">
      <el-carousel-item v-for="item in posterList" :key="item.url">
        <img :src="item.url" alt style="object-fit: contain"/>
      </el-carousel-item>
    </el-carousel>
    <div class="whole">
      <div class="left">
        <div class="panel">
          <div class="panel-header">
            <h2 style="color: #ef4238">正在热映</h2>
            <router-link to="/movie/ongoing">全部</router-link>
          </div>
          <div class="panel-content">
            <movie-item
              :movieItem="item"
              v-for="(item, index) in ongoingMovieList"
              :key="index"
            >
            </movie-item>
          </div>
        </div>
        <div class="panel">
          <div class="panel-header">
            <h2 style="color: #2d98f3">即将上映</h2>
            <router-link to="/movie/upcoming">全部</router-link>
          </div>
          <div class="panel-content">
            <div class="panel-content">
              <movie-item
                :movieItem="item"
                v-for="(item, index) in upcomingMovieList"
                :key="index"
              >
              </movie-item>
            </div>
          </div>
        </div>
        <div class="panel">
          <div class="panel-header">
            <h2 style="color: #ef4238">经典影片</h2>
            <router-link to="/movie/classic">全部</router-link>
          </div>
          <div class="panel-content">
            <div class="panel-content">
              <movie-item
                :movieItem="item"
                v-for="(item, index) in classicMovieList"
                :key="index"
              >
              </movie-item>
            </div>
          </div>
        </div>
      </div>
      <div class="right">
        <div class="panel">
          <div class="panel-header">
            <h2 style="color: #ffb400">今日票房</h2>
          </div>
          <div class="panel-content">
            <div
              class="board"
              v-for="(item, index) in todayList"
              :key="index"
            >
              <div class="board-left">
                <i class="board-index">{{ index + 1 }}</i>
              </div>
              <div class="board-middle">
                <a :href="'/movie/' + item.id">
                  <p class="name" style="padding-top: 10px">{{ item.nameCn }}</p>
                </a>
              </div>
              <div class="board-right">
                <p>{{ item.score.toFixed(1) }} 分</p>
              </div>
            </div>
          </div>
        </div>

        <div class="panel">
          <div class="panel-header">
            <h2 style="color: #ffb400">TOP 100</h2>
            <router-link to="/rank/top100">查看完整榜单</router-link>
          </div>
          <div class="panel-content">
            <div class="board" v-for="(item, index) in top100List" :key="index">
              <div class="board-left">
                <i class="board-index">{{ index + 1 }}</i>
              </div>
              <div class="board-middle">
                <a :href="'/movie/' + item.id">
                  <p class="name" style="padding-top: 10px">{{ item.nameCn }}</p>
                </a>
              </div>
              <div class="board-right">
                <p>{{ item.score.toFixed(1) }} 分</p>
              </div>
            </div>
          </div>
        </div>

        <div class="panel">
          <div class="panel-header">
            <h2 style="color: #ffb400">热门影人</h2>
          </div>
          <div class="panel-content">
            <div
              class="board"
              v-for="(item, index) in popularActorList"
              :key="index"
            >
              <div class="board-left">
                <i class="board-index">{{ index + 1 }}</i>
              </div>
              <div class="board-middle">
                <router-link :to="'/actor/' + item.id">
                  <p style="padding-top: 10px">{{ item.name }}</p>
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import movieItem from "../../components/movie-item";

export default {
  components: {
    movieItem,
  },
  created() {
    this.getOngoingMovieList();
    this.getUpcomingMovieList();
    this.getClassicMovieList();
    this.getPopularActorList();
    this.getTop100List();
    this.getTodayList();
  },
  data() {
    return {
      ongoingMovieList: [],
      upcomingMovieList: [],
      classicMovieList: [],
      todayList: [],
      top100List: [],
      popularActorList: [],
      posterList: [
        { url: require("../../assets/carousel1.jpg") },
        { url: require("../../assets/carousel2.jpg") },
        { url: require("../../assets/carousel3.jpg") },
        { url: require("../../assets/carousel4.jpg") },
      ],
    };
  },
  methods: {
    getOngoingMovieList() {
      this.axios
        .get("/api/movie/ongoing", {
          params: {
            current: 0,
            size: 10,
            categoryId: 0,
            areaId: 0,
            ageId: 0,
            orderType: 0,
          },
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.ongoingMovieList = data.data.recordList;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message,
            });
          }
        });
    },
    getUpcomingMovieList() {
      this.axios
        .get("/api/movie/upcoming", {
          params: {
            current: 0,
            size: 10,
            categoryId: 0,
            areaId: 0,
            ageId: 0,
            orderType: 0,
          },
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.upcomingMovieList = data.data.recordList;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message,
            });
          }
        });
    },
    getClassicMovieList() {
      this.axios
        .get("/api/movie/classic", {
          params: {
            current: 0,
            size: 10,
            categoryId: 0,
            areaId: 0,
            ageId: 0,
            orderType: 0,
          },
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.classicMovieList = data.data.recordList;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message,
            });
          }
        });
    },
    getTodayList() {
      this.axios.get("/api/rank/today").then(({ data }) => {
        if (data.code === 200) {
          this.todayList = data.data.recordList;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message,
          });
        }
      });
    },
    getTop100List() {
      this.axios.get("/api/rank/top100").then(({ data }) => {
        if (data.code === 200) {
          this.top100List = data.data.recordList;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message,
          });
        }
      });
    },
    getPopularActorList() {
      this.axios.get("/api/actor/popular").then(({ data }) => {
        if (data.code === 200) {
          this.popularActorList = data.data;
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
.el-carousel {
  width: 77%;
  margin: 30px auto;
}

.whole {
  width: 1200px;
  margin: 30px auto;
  display: flex;
}

.left {
  width: 70%;
}

h2 {
  font-size: 26px;
}

.panel-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.panel-header > a {
  text-align: center;
  text-decoration: none;
  color: #999;
  padding-right: 14px;
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAOCAYAAAASVl2WAAAABmJLR0QA/wD/AP+gvaeTAAAAv0lEQVQY013RTUpDQRAE4G8eghcR8ScgKCIugpJFjuIjqAvBc7jxj0muEnCjiIQQJOImB3GnbnpkfL1qpqqrunpSzvkDPxjhGdq2VarBF3q4wRHknP8RzvCEQzzguCalaHZwiwHecY6XogCf8TjFHh7Rh9Tx3AylIZa4TgWpSBuY4BSrYlFXKsr4bjrTW5HkJJa9SBW4jbtukmKxG5MDLOKqfzEPcB9LzQN8LSdfwxj7eMMlZvV/NFiPzFddEH4Bt5Y1mf3fnDwAAAAASUVORK5CYII=)
    no-repeat 100%;
}

.panel-header > a:hover {
  color: #409eff !important;
}

.panel-content {
  margin: 0 0 50px 0;
}

.movie-item {
  margin-left: 0;
  margin-right: 30px;
}

.movie-item:nth-child(4n) {
  margin-right: 0;
}

.right {
  width: 30%;
  margin-left: 100px;
}

.board {
  display: flex;
  margin: 10px 10px;
}

.board-left {
  display: flex;
  align-items: center;
}

.board-middle {
  display: flex;
  margin-left: 10px;
  width: 150px;
  font-size: 18px;
}

.board-middle > a {
  text-decoration: none;
  color: #333;
}

.board-right {
  display: flex;
  font-size: 14px;
  font-weight: 700;
  color: #ffb400;
  margin-left: 40px;
  align-items: center;
}

.board-index {
  color: #ffb400;
  display: inline-block;
  width: 50px;
  height: 50px;
  line-height: 50px;
  text-align: center;
  font-size: 18px;
  align-items: center;
}
</style>
