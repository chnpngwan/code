<template>
  <!--  个人信息页 -->
  <div class="main">
    <el-form :model="user" label-width="120px">
      <el-form-item label="用户名">
        <el-input v-model="user.username" disabled />
      </el-form-item>
      <el-form-item label="昵称">
        <el-input v-model="user.nickname" />
      </el-form-item>
      <el-form-item label="简介">
        <el-input v-model="user.description" type="textarea" />
      </el-form-item>
      <el-form-item label="性别">
        <el-radio-group v-model="user.gender">
            <el-radio :label="1" >男</el-radio>
            <el-radio :label="2" >女</el-radio>
            <el-radio :label="0" >未知</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="生日">
        <el-date-picker
          v-model="user.birthday"
          type="date"
          placeholder="生日"
          value-format="X"
          style="width: 100%"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="change">保存</el-button>
        <el-button>Cancel</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { mapState } from "vuex";
import { modifyInfo, getInfo } from "@/api/userApi.js";
import { ElMessage } from "element-plus";
import { mapActions } from "vuex";
export default {
  data() {
    return {
      user: {},
    };
  },
  computed: {

  },
  mounted() {
    this.syncUser();
  },
  methods: {
    ...mapActions(["updateUser"]),
    syncUser() {
      this.user = Object.assign({},this.$store.state.user);
    },
    change() {
        console.log("userinfo change");
      modifyInfo(this.user).then(
        (res) => {
          getInfo(this.user.id).then(async (res) => {
            var resB = await this.updateUser(res);
            ElMessage.success("修改成功")
          });
        },
        (err) => {
          ElMessage.error(err);
        }
      );
    },
  },
};
</script>

<style scoped lang="less">
.main{
    padding: 30px 20px 0 0;
}
</style>