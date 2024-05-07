<template>
  <div class="card-container">
    <div class="card-avatar">
      <router-link :to="`/user/${user.id}`">
        <img :src="user.avatar" />
      </router-link>
    </div>
    <div class="card-nickname">{{ user.nickname }}</div>
    <div class="card-description">
      <el-text truncated>{{ user.description }}</el-text>
    </div>
    <div class="teacher"></div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  props: ["user"],
  mounted() {},
};
</script>

<style scoped lang="less">
.card-container {
  width: 200px;
  display: flex;
  flex-direction: column;
  align-items: center;
  .card-avatar {
    @avatar-size: 150px;
    width: @avatar-size;
    height: @avatar-size;
    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-radius: 50%;
    }
  }
  .card-nickname {
    font-size: 24px;
    font-weight: 600;
  }
  .card-description {
    max-width: 90%;
  }
}
</style>