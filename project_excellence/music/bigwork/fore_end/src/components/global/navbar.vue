<template>
  <div class="container">
    <div class="left-context">
      <div id="logo"></div>
      <router-link to="/">首页</router-link>
      <router-link to="/">首页</router-link>
      <router-link to="/">首页</router-link>
    </div>
    <div class="center-context">
      <el-input v-model="searchKeyWord" placeholder="搜索" clearable>
        <template #append>
          <el-button circle @click="search">
            <el-icon> <Search /></el-icon>
          </el-button>
        </template>
      </el-input>
    </div>
    <div class="right-context">
      <template v-if="user.id != null">
        <router-link to="/myspace">
          <div class="avatar" :key="user.avatar">
            <img :src="user.avatar" />
          </div>
        </router-link>
        <span>{{ user.nickname }}</span>
        <router-link to="/account">
          <div>个人中心</div>
        </router-link>
        <a @click="logout" href="javascript:void(0);"><div>退出登录</div></a>
      </template>
      <template v-else>
        <router-link to="/login">
          <div>登录</div>
        </router-link>
        <router-link to="/login">
          <div>注册</div>
        </router-link>
      </template>
    </div>
  </div>
</template>

<script>
import { Search } from "@element-plus/icons";
import { mapState } from "vuex";
import { logout as logoutApi } from "@/api/userApi";
import { ElMessage } from 'element-plus';
export default {
  data() {
    return {
      searchKeyWord: "",
    };
  },
  inject: ["reload"],
  methods: {
    logout() {
      logoutApi().then((res) => {
        this.$store.dispatch("refreshUser");
      });
    },
    async search() {
      if (this.searchKeyWord === "") {
        ElMessage.error("请输入搜索关键词")
      }else{
        let keys = [];
        this.searchKeyWord.split(" ").forEach((key) => keys.push(key));
        let t = await this.$router.push({ path: "/search", query: { keyword: keys } });
        this.reload();
      }
    },
  },
  computed: {
    ...mapState(["user"]),
  },
  components: {
    Search,
  },
  mounted() {},
};
</script>

<style scoped lang="less">
.container {
  @container-padding: 0vh;
  background-color: #eee;
  width: 100vw;
  height: 8vh;
  display: flex;
  padding: @container-padding 0;
  align-items: center;
  flex-wrap: nowrap;
  .left-context {
    @left-padding-left: 5vw;
    width: 35vw;
    height: 100%;
    padding-left: @left-padding-left;
    display: flex;
    align-items: center;

    * {
      padding-left: 10px;
      font-size: 16px;
      font-weight: 600;
    }

    #logo {
      position: relative;
      top: -@container-padding;
      left: -@left-padding-left+2;
      width: 180px;
      height: 40px;
    }
  }
  .center-context {
    width: 30vw;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    #search_btn {
      background-color: #eee;
      height: 100%;
    }
  }
  .right-context {
    width: 35vw;
    height: 100%;
    padding: 0 40px;

    display: flex;
    align-items: center;

    > * {
      padding-left: 20px;
    }
    .avatar {
      padding: 0;
      border-radius: 50%;
      @avatar-size: 50px;
      height: @avatar-size;
      width: @avatar-size;
      // background-image: url();
      // background-size: cover;
      img {
        height: 100%;
        width: 100%;
        object-fit: cover;
        border-radius: 50%;
      }
    }

    .black {
      color: black;
    }
  }
}
</style>