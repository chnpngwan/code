<template>
  <div>
    <div class="searchContainer">
      <el-input
        v-model="keywords"
        class="searchBar"
        placeholder="找影视剧、影人、影院"
      >
      </el-input>
      <el-button
        id="searchBtn"
        icon="el-icon-search"
        type="primary"
        circle
        @click="searchInfo"
      >
      </el-button>
    </div>
    <div>
      <el-menu
        :default-active="$route.path"
        class="nav-menu"
        mode="horizontal"
        :router="true"
        background-color="#47464a"
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
    </div>
    <div>
      <router-view :keywords="keywords"></router-view>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      menuList: [
        {
          id: "1",
          name: "电影",
          path: "/search/movie",
        },
        {
          id: "2",
          name: "影人",
          path: "/search/actor",
        },
        {
          id: "3",
          name: "影院",
          path: "/search/cinema",
        },
      ],
      keywords: this.$route.query.keywords,
    };
  },
  created() {},
  methods: {
    searchInfo() {
      this.$router.push(this.$route.path + "?keywords=" + this.keywords);
    },
  },
};
</script>

<style scoped>
.el-header {
  padding: 0;
}

.nav-menu {
  display: flex;
  justify-content: space-around;
  font-size: 16px;
}

.el-menu-item {
  font-size: 16px;
}

.el-menu-item:hover {
  color: #ffffff !important;
}

.searchContainer {
  padding: 30px 0;
  display: flex;
  background: #47464a;
  justify-content: center;
}

.searchBar {
  width: 630px;
}

.searchBar >>> input {
  padding-right: 0;
  border-radius: 50px;
  width: 630px;
  height: 50px;
}

#searchBtn {
  transform: translate(-100%, 0);
  width: 50px;
  height: 50px;
}
</style>
