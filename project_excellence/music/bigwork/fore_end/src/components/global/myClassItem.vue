<template>
  <div class="container">
    <router-link :to="`/class/${clazz.id}`">
      <div class="avatar"><img :src="clazz.avatar" /></div>
    </router-link>
    <div class="name">{{ clazz.name }}</div>
    <el-text truncated class="description w-100px">{{ clazz.description }}</el-text>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  props: ["clazz"],
};
</script>

<style scoped lang="less">
.container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  .avatar {
    @avatar-size: 180px;
    width: @avatar-size;
    height: @avatar-size;
    border-radius: @avatar-size;
    img {
      border-radius: @avatar-size;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  }
  .description{
    max-width: 130px;
  }
}
</style>