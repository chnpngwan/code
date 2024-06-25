<template>
  <div>
    <!-- 统计数据 -->
    <el-row :gutter="30">
      <el-col :span="6">
        <el-card>
          <div class="card-icon-container">
            <i class="iconfont el-icon-myfangwenliang" style="color:#40C9C6" />
          </div>
          <div class="card-desc">
            <div class="card-title">访问量</div>
            <div class="card-count">{{ viewCount }}</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card>
          <div class="card-icon-container">
            <i class="iconfont el-icon-myuser" style="color:#34BFA3" />
          </div>
          <div class="card-desc">
            <div class="card-title">用户量</div>
            <div class="card-count">{{ userCount }}</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card>
          <div class="card-icon-container">
            <i class="iconfont el-icon-mywenzhang-copy" style="color:#F4516C" />
          </div>
          <div class="card-desc">
            <div class="card-title">电影量</div>
            <div class="card-count">{{ movieCount }}</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card>
          <div class="card-icon-container">
            <i class="el-icon-s-comment" style="color:#36A3F7" />
          </div>
          <div class="card-desc">
            <div class="card-title">评论量</div>
            <div class="card-count">{{ commentCount }}</div>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <!-- 一周访问量展示 -->
    <el-card style="margin-top:1.25rem">
      <div class="e-title">影院一周总票房</div>
      <div style="height:350px">
        <v-chart :options="weekGrossData" v-loading="loading" />
      </div>
    </el-card>
    <el-row :gutter="20" style="margin-top:1.25rem">
      <!-- 文章浏览量排行 -->
      <el-col :span="16">
        <el-card>
          <div class="e-title">电影浏览量排行</div>
          <div style="height:350px">
            <v-chart :options="movieViewCountRank" v-loading="loading" />
          </div>
        </el-card>
      </el-col>
      <!-- 分类数据统计 -->
      <el-col :span="8">
        <el-card>
          <div class="e-title">电影分类统计</div>
          <div style="height:350px">
            <v-chart :options="movieCategoryList" v-loading="loading" />
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  created() {
    this.getData();
  },
  data: function() {
    return {
      loading: true,
      type: 1,
      viewCount: 0,
      commentCount: 0,
      userCount: 0,
      movieCount: 0,
      weekGrossData: {
        tooltip: {
          trigger: "axis",
          axisPointer: {
            type: "cross"
          }
        },
        color: ["#3888fa"],
        legend: {
          data: ["总票房"]
        },
        grid: {
          left: "0%",
          right: "0%",
          bottom: "0%",
          top: "10%",
          containLabel: true
        },
        xAxis: {
          data: [],
          axisLine: {
            lineStyle: {
              // 设置x轴颜色
              color: "#666"
            }
          }
        },
        yAxis: {
          axisLine: {
            lineStyle: {
              // 设置y轴颜色
              color: "#048CCE"
            }
          }
        },
        series: [
          {
            name: "总票房",
            type: "line",
            data: [],
            smooth: true
          }
        ]
      },
      movieViewCountRank: {
        tooltip: {
          trigger: "axis",
          axisPointer: {
            type: "cross"
          }
        },
        color: ["#58AFFF"],
        grid: {
          left: "0%",
          right: "0%",
          bottom: "0%",
          top: "10%",
          containLabel: true
        },
        xAxis: {
          data: []
        },
        yAxis: {},
        series: [
          {
            name: ["浏览量"],
            type: "bar",
            data: []
          }
        ]
      },
      movieCategoryList: {
        color: [
          "#7EC0EE",
          "#FF9F7F",
          "#FFD700",
          "#C9C9C9",
          "#E066FF",
          "#C0FF3E"
        ],
        legend: {
          data: [],
          bottom: "bottom"
        },
        tooltip: {
          trigger: "item"
        },
        series: [
          {
            name: "电影分类",
            type: "pie",
            roseType: "radius",
            data: []
          }
        ]
      }
    };
  },
  methods: {
    getData() {
      this.axios.get("/api/homePage").then(({ data }) => {
        this.viewCount = data.data.viewCount;
        this.commentCount = data.data.commentCount;
        this.userCount = data.data.userCount;
        this.movieCount = data.data.movieCount;
        if (data.data.weekGrossList != null) {
          data.data.weekGrossList.forEach(item => {
            this.weekGrossData.xAxis.data.push(item.day);
            this.weekGrossData.series[0].data.push(item.gross);
          });
        }

        if (data.data.movieViewVOList != null) {
          data.data.movieViewVOList.forEach(item => {
            this.movieViewCountRank.series[0].data.push(item.viewCount);
            this.movieViewCountRank.xAxis.data.push(item.nameCn);
          });
        }

        if (data.data.movieCategoryVOList != null) {
          data.data.movieCategoryVOList.forEach(item => {
            this.movieCategoryList.series[0].data.push({
              value: item.movieCount,
              name: item.name
            });
            this.movieCategoryList.legend.data.push(item.name);
          });
        }
        this.loading = false;
      });
    },
  },
};
</script>

<style scoped>
.card-icon-container {
  display: inline-block;
  font-size: 3rem;
}
.area-wrapper {
  display: flex;
  justify-content: center;
}
.card-desc {
  font-weight: bold;
  float: right;
}
.card-title {
  margin-top: 0.3rem;
  line-height: 18px;
  color: rgba(0, 0, 0, 0.45);
  font-size: 1rem;
}
.card-count {
  margin-top: 0.75rem;
  color: #666;
  font-size: 1.25rem;
}
.echarts {
  width: 100%;
  height: 100%;
}
.e-title {
  font-size: 13px;
  color: #202a34;
  font-weight: 700;
}
</style>
