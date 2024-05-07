<template>
  <header>
    <navbar> </navbar>
  </header>
  <div class="body">
    <RouterView v-if="show" />
  </div>

  <router-link to="/upload" v-if="$store.state.user.teacher">
    <div class="upload">
      <el-icon size="64"><Plus /></el-icon>
    </div>
  </router-link>
</template>

<script>
import { RouterLink, RouterView } from "vue-router";
import { status } from "@/api/userApi.js";
import navbar from "./components/global/navbar.vue";
import { Plus } from "@element-plus/icons";
export default {
  data() {
    return {
      show: true,
    };
  },
  methods: {
    reload() {
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      });
    },
  },
  provide() {
    return {
      reload: this.reload,
    };
  },
  components: { navbar, RouterLink, RouterView, Plus },
  mounted() {
    this.$store.dispatch("updateUser");
  },
};
</script>

<style scoped lang="less">
.body {
  min-height: 80vh;
  padding: 0;
}
.upload {
  @upload-size: 60px;
  width: @upload-size;
  height: @upload-size;
  border-radius: 50%;
  position: fixed;
  bottom: 30px;
  right: 50px;
  background-color: pink;
  color: white;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
