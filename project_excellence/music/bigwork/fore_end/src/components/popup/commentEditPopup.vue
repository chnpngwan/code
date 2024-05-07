<template>
  <el-button link @click="this.show = true">编辑</el-button>
  <popup :show="show" :hidden="() => (this.show = false)">
    <template #main>
      <el-form label-width="120px">
        <el-form-item label="新内容">
          <el-input  style="width: 300px;" v-model="newContent" type="textarea"></el-input>
        </el-form-item>
        <el-form-item label=" ">
          <el-button type="primary" @click="()=>{
            this.submit(this.newContent);
            this.show = false
        }"
            >确定</el-button
          >
          <el-button @click="this.show = false">取消</el-button>
        </el-form-item>
      </el-form>
    </template>
  </popup>
</template>

<script>
import popup from "../global/popup.vue";
export default {
  data() {
    return {
      show: false,
      newContent: "",
    };
  },
  props: ["submit", "content"],
  components: { popup },
  mounted() {
    this.newContent = this.content;
  },
};
</script>

<style>
</style>