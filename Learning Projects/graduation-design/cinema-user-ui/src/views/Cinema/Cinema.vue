<template>
  <!-- 分类查询 -->
  <div>
    <div class="tags-container">
      <div class="tags-line">
        <div class="tags-title">类型:</div>
        <el-radio-group v-model="brandRadio" size="medium">
          <el-radio-button :label="0">全部</el-radio-button>
          <el-radio-button
            :label="item.id"
            v-for="item in brandList"
            :key="item.id"
          >
            {{ item.name }}
          </el-radio-button>
        </el-radio-group>
      </div>
      <div class="tags-line">
        <div class="tags-title">行政区:</div>
        <el-radio-group v-model="districtRadio" size="medium">
          <el-radio-button :label="0">全部</el-radio-button>
          <el-radio-button
            :label="item.id"
            v-for="item in districtList"
            :key="item.id"
          >
            {{ item.name }}
          </el-radio-button>
        </el-radio-group>
      </div>
      <div class="tags-line">
        <div class="tags-title">特殊厅:</div>
        <el-radio-group v-model="typeRadio" size="medium">
          <el-radio-button :label="0">全部</el-radio-button>
          <el-radio-button
            :label="item.id"
            v-for="item in typeList"
            :key="item.id"
          >
            {{ item.name }}
          </el-radio-button>
        </el-radio-group>
      </div>
      <div class="tags-line">
        <div class="tags-title">服务:</div>
        <el-radio-group v-model="serveRadio" size="medium">
          <el-radio-button :label="0">全部</el-radio-button>
          <el-radio-button
            :label="item.id"
            v-for="item in serveList"
            :key="item.id"
          >
            {{ item.name }}
          </el-radio-button>
        </el-radio-group>
      </div>
    </div>
    <div class="list-header">
      <h2 class=""><span>影院列表</span></h2>
    </div>
    <div class="list-content" v-for="item in cinemaList" :key="item.id">
      <div class="list-left">
        <router-link :to="'cinema/' + item.id" class="cinema-name">
          {{ item.name }}
        </router-link>
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
        <router-link :to="'cinema/' + item.id">
          <el-button
            type="primary"
            round
            size="medium"
          >
            选座购票
          </el-button>
        </router-link>
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
  </div>
</template>

<script>
export default {
  data() {
    return {
      total: null,
      current: null,
      size: null,
      brandRadio: 0,
      districtRadio: 0,
      typeRadio: 0,
      serveRadio: 0,
      brandList: [],
      districtList: [],
      typeList: [],
      serveList: [],
      cinemaList: [],
    };
  },
  created() {
    this.getBrandList();
    this.getTypeList();
    this.getDistrictList();
    this.getServeList();
    this.getCinemaList();
  },
  computed: {
    listenChange() {
      const { brandRadio, districtRadio, typeRadio, serveRadio } = this;
      return { brandRadio, districtRadio, typeRadio, serveRadio };
    },
  },
  watch: {
    listenChange() {
      this.getCinemaList();
    },
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
        .get("/api/cinema/query", {
          params: {
            brandId: this.brandRadio,
            districtId: this.districtRadio,
            typeId: this.typeRadio,
            serveId: this.serveRadio,
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
    getTypeList() {
      this.axios.get("/api/type/list").then(({ data }) => {
        if (data.code === 200) {
          this.typeList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message,
          });
        }
      });
    },
    getDistrictList() {
      this.axios.get("/api/district/list").then(({ data }) => {
        if (data.code === 200) {
          this.districtList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message,
          });
        }
      });
    },
    getBrandList() {
      this.axios.get("/api/brand/list").then(({ data }) => {
        if (data.code === 200) {
          this.brandList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message,
          });
        }
      });
    },
    getServeList() {
      this.axios.get("/api/serve/list").then(({ data }) => {
        if (data.code === 200) {
          this.serveList = data.data;
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
.tags-container {
  width: 1200px;
  margin: 40px auto;
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

.pageHelper {
  display: flex;
  justify-content: center;
  margin: 40px 0;
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
  border: solid #eee 0px !important;
  border-radius: 50px !important;
}

.order-by-container {
  margin: 30px 10px 0 10px;
}

.list-header {
  width: 1200px;
  display: flex;
  margin: 0 auto;
}

.list-header > h2 {
  padding-left: 6px;
  border-left: 4px solid #409eff;
  font-size: 18px;
  color: #333;
}

.list-content {
  width: 1200px;
  display: flex;
  justify-content: space-between;
  border-bottom: solid #eeeeee 1px;
  padding: 10px 0;
  margin: 0 auto 30px;
}

.list-left {
}

.list-right {
  margin-top: 30px;
}

a {
  text-decoration: none;
}

.cinema-name {
  color: #333;
}

.buy-ticket {
  display: inline-block;
  color: #ffffff;
  border-radius: 100px;
  background-color: #409eff;
  width: 100%;
  font-size: 14px;
  text-align: center;
}

.cinema-address {
  color: #999999;
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
</style>
