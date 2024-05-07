<template>
  <RouterView></RouterView>
</template>

<script>
import { RouterView } from "vue-router";
import { status } from "@/api/admin.js";
export default {
  mounted() {
    status()
      .then((res) => {
        if (res.id != 0) {
          this.$store.dispatch("updateAdmin", res);
          this.$router.push("/manage");
        } else {
          this.$router.push("/login");
        }
      })
      .catch((err) => {
        console.log(err);
        this.$router.push("/login");
      });
  },
};
</script>

<style scoped lang="less">
</style>