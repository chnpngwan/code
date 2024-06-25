<template>
  <el-container>
    <el-header>
      <el-menu
        :default-active="$route.path"
        class="nav-menu"
        mode="horizontal"
        :router="true"
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b"
      >
        <el-menu-item
          :index="item.path"
          v-for="item in menuList"
          :key="item.id"
        >
          {{ item.name }}
        </el-menu-item>
      </el-menu>
    </el-header>
    <el-main>
      <!-- 分类查询 -->
      <div class="tags-container">
        <div class="tags-line">
          <div class="tags-title">类型:</div>
          <el-radio-group v-model="categoryRadio">
            <el-radio-button :label="0">全部</el-radio-button>
            <el-radio-button
              :label="item.id"
              v-for="item in categoryList"
              :key="item.id"
            >
              {{ item.name }}
            </el-radio-button>
          </el-radio-group>
        </div>
        <div class="tags-line">
          <div class="tags-title">区域:</div>
          <el-radio-group v-model="areaRadio">
            <el-radio-button :label="0">全部</el-radio-button>
            <el-radio-button
              :label="item.id"
              v-for="item in areaList"
              :key="item.id"
            >
              {{ item.name }}
            </el-radio-button>
          </el-radio-group>
        </div>
        <div class="tags-line">
          <div class="tags-title">年代:</div>
          <el-radio-group v-model="ageRadio">
            <el-radio-button :label="0">全部</el-radio-button>
            <el-radio-button
              :label="item.id"
              v-for="item in ageList"
              :key="item.id"
            >
              {{ item.name }}
            </el-radio-button>
          </el-radio-group>
        </div>
      </div>

      <!-- 按条件排序 -->
      <div class="order-by-container">
        <el-radio v-model="orderType" label="0"> 按时间排序 </el-radio>
        <el-radio v-model="orderType" label="1"> 按评价排序 </el-radio>
      </div>

      <router-view
        :categoryId="categoryRadio"
        :areaId="areaRadio"
        :ageId="ageRadio"
        :orderType="orderType"
      >
      </router-view>
    </el-main>
  </el-container>
</template>

<script>
export default {
  data() {
    return {
      menuList: [
        {
          id: "1",
          name: "正在热映",
          path: "/movie/ongoing",
        },
        {
          id: "2",
          name: "即将上映",
          path: "/movie/upcoming",
        },
        {
          id: "3",
          name: "经典影片",
          path: "/movie/classic",
        },
      ],
      categoryRadio: 0,
      categoryList: [],
      areaRadio: 0,
      areaList: [],
      ageRadio: 0,
      ageList: [],
      orderType: "0",
    };
  },
  created() {
    this.getCategoryList();
    this.getAreaList();
    this.getAgeList();
  },
  methods: {
    async getCategoryList() {
      this.axios.get("/api/category/list").then(({ data }) => {
        if (data.code === 200) {
          this.categoryList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message,
          });
        }
      });
    },
    async getAgeList() {
      this.axios.get("/api/age/list").then(({ data }) => {
        if (data.code === 200) {
          this.ageList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message,
          });
        }
      });
    },
    async getAreaList() {
      this.axios.get("/api/area/list").then(({ data }) => {
        if (data.code === 200) {
          this.areaList = data.data;
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
      //页面发生变化时初始化类别选项
      this.categoryRadio = 0;
      this.areaRadio = 0;
      this.ageRadio = 0;
      this.orderType = 0;
    }
  }
};
</script>

<style scoped>
.el-header {
  padding: 0;
}

.nav-menu {
  display: flex;
  justify-content: space-around;
}

.el-menu-item {
  font-size: 16px;
}

.el-menu-item:hover {
  color: #ffffff !important;
}

.el-main {
  width: 1200px;
  margin: 0 auto;
}

.tags-container {
  border: solid #eeeeee 1px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.tags-line {
  width: 100%;
  display: flex;
  padding: 10px;
  box-sizing: border-box;
  border-bottom: solid #eeeeee 1px;
}

.tags-line:last-child {
  border-bottom: 0;
}

.tags-title {
  width: 5%;
  height: 24px;
  line-height: 24px;
  float: left;
  color: #999;
  font-size: 14px;
}

.el-radio-group {
  width: 92%;
  margin-left: 20px;
}

.el-radio-button {
  margin-right: 10px;
}

.el-radio-button:last-child {
  margin-right: 0;
}

.el-radio-button >>> .el-radio-button__inner {
  border: solid #eee 0 !important;
  border-radius: 50px !important;
}

.order-by-container {
  margin: 30px 10px 0 10px;
}
</style>
