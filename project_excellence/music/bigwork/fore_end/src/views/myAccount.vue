<template>
  <!-- 个人中心页 -->
  <div class="container">
    <ul class="left">
      <RouterLink to="/">
        <li>
          <el-icon><HomeFilled /></el-icon>
          <span>首页</span>
        </li>
      </RouterLink>
      <RouterLink to="/account/info">
        <li>
          <el-icon><User /></el-icon>
          <span>我的信息</span>
        </li>
      </RouterLink>
      <RouterLink to="/account/avatar">
        <li>
          <el-icon><PictureRounded /></el-icon>
          <span>我的头像</span>
        </li>
      </RouterLink>
      <RouterLink to="/account/chat">
        <li>
          <el-icon><PictureRounded /></el-icon>
          <span>私信</span>
        </li>
      </RouterLink>
      <RouterLink to="/account/teacher">
        <li>
          <el-icon><PictureRounded /></el-icon>
          <span>教师认证</span>
        </li>
      </RouterLink>
      <RouterLink to="/account/class">
        <li>
          <el-icon><PictureRounded /></el-icon>
          <span>我的班级</span>
        </li>
      </RouterLink>
      <RouterLink to="/account/comment">
        <li>
          <el-icon><PictureRounded /></el-icon>
          <span>我的评论</span>
        </li>
      </RouterLink>
      <RouterLink to="/account/history">
        <li>
          <el-icon><PictureRounded /></el-icon>
          <span>播放历史</span>
        </li>
      </RouterLink>
      <RouterLink to="/account/securityQuestion">
        <li>
          <el-icon><PictureRounded /></el-icon>
          <span>安全问题</span>
        </li>
      </RouterLink>
      <RouterLink to="/account/modifyPassword">
        <li>
          <el-icon><PictureRounded /></el-icon>
          <span>修改密码</span>
        </li>
      </RouterLink>
      <RouterLink to="/myspace">
        <li>
          <el-icon><House /></el-icon>
          <span>个人空间</span>
        </li>
      </RouterLink>
    </ul>
    <div class="right">
      <RouterView></RouterView>
    </div>
  </div>
</template>

<script>
import { RouterView, RouterLink } from "vue-router";
import { House, User, PictureRounded, HomeFilled } from "@element-plus/icons";

export default {
  data() {
    return {};
  },
  components: { House, User, PictureRounded, HomeFilled },
};
</script>

<style scoped lang="less">
.container {
  width: 60vw;
  //   min-height: 60vh;
  margin: 10vh 20vw 0 20vw;
  display: flex;
  border: 1px solid #eee;

  .left {
    border-right: 1px solid #eee;
    flex: 1;

    a {
      text-decoration: none;
      color: #000;
    }

    li {
      width: 100%;
      padding: 1vh 0;
      border-bottom: 1px solid #eee;
      span {
        display: inline-block;
        width: 50%;
        margin-left: 12px;
        text-align-last: justify;
      }
    }
    li:hover {
      background-color: #eee;
    }
  }
  .right {
    flex: 5;
  }
}
</style>