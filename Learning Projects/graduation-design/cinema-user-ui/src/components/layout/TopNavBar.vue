<template>
  <v-app-bar app :elevation="8" height="65" style="background: white">
    <div class="logo">
      <router-link to="/">
        <img
          style="width: 200px; height: 68px"
          src="../../assets/homeLogo.jpg"
          alt=""
        />
      </router-link>
    </div>
    <div>
      <el-menu
        :default-active="activeUrl"
        class="nav-menu"
        mode="horizontal"
        router
        active-text-color="#409EFF"
        text-color="#000000"
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
    <div class="search">
      <el-input
        v-model="keywords"
        class="searchBar"
        placeholder="找影视剧、影人、影院"
      />
      <el-button
        id="searchBtn"
        icon="el-icon-search"
        type="primary"
        circle
        @click="search"
      />
    </div>
    <div style="margin-left: 30px">
      <a
        class="login"
        v-if="!this.$store.state.userId"
        @click="openLoginDialog"
      >
        <i class="el-icon-user"> 登录 </i>
      </a>
      <el-dropdown v-else>
        <img
          class="user-avatar"
          :src="this.$store.state.avatar"
          height="40"
          width="40"
        />
        <i class="el-icon-arrow-down el-icon--right" />
        <el-dropdown-menu slot="dropdown" placement="bottom">
          <el-dropdown-item>
            <router-link to="/user" class="user-center">
              <i class="el-icon-user" /> 个人中心
            </router-link>
          </el-dropdown-item>
          <el-dropdown-item>
            <a @click="logout" class="user-center">
              <i class="el-icon-switch-button" /> 退出
            </a>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </v-app-bar>
</template>

<script>
export default {
  data() {
    return {
      keywords: null,
      activeUrl: "/",
      menuList: [
        {
          id: 1,
          name: "首页",
          path: "/",
        },
        {
          id: 2,
          name: "电影",
          path: "/movie",
        },
        {
          id: 3,
          name: "影院",
          path: "/cinema",
        },
        {
          id: 4,
          name: "榜单",
          path: "/rank",
        },
      ],
    };
  },
  methods: {
    openLoginDialog() {
      this.$store.state.loginDialog = true;
    },
    search() {
      let tmp = this.keywords;
      this.$router.push("/search/movie?keywords=" + tmp);
      this.keywords = "";
    },
    logout() {
      this.$store.commit("logout2");
      this.$router.push("/");
    }
  },
};
</script>

<style scoped>
.logo {
  margin-top: 9px;
  margin-left: 200px;
  height: 80px;
  width: 200px;
}

.nav-menu {
  border-bottom: 0 solid #eee !important;
  height: 60px;
  margin: 9px auto;
}

.el-menu-item {
  font-size: 20px;
}

.el-menu-item:hover {
  color: #409eff !important;
}

.el-menu-item.is-active {
  background-color: #409eff !important;
  color: white !important;
}

.search {
  padding: 30px 0;
  display: flex;
}

.searchBar {
  padding-left: 30px;
  width: 300px;
}

.searchBar >>> input {
  border-radius: 50px;
}

#searchBtn {
  transform: translate(-100%, 0);
}

.login {
  color: black;
  font-size: 20px;
}

.login:hover {
  color: #49b1f5 !important;
}

.user-avatar {
  cursor: pointer;
  border-radius: 50%;
}

.user-center {
  text-decoration: none;
  color: black;
}

.user-center:hover {
  color: #49b1f5 !important;
}

.el-dropdown {
  padding-right: 50px;
}
</style>
