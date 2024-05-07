<template>
  <div class="manage-title">用户管理页</div>
  <div class="manage-main">
    <div class="selector">
      <el-form :model="selector" label-position="left" :inline="true">
        <el-form-item>
          <el-input v-model="selector.id" placeholder="ID选择" />
        </el-form-item>
        <el-form-item>
          <el-input v-model="selector.username" placeholder="用户名筛选" />
        </el-form-item>
        <el-form-item style="width: 100px">
          <el-select v-model="selector.gender" placeholder="性别查询">
            <el-option label="未知" :value="0" />
            <el-option label="男" :value="1" />
            <el-option label="女" :value="2" />
          </el-select>
        </el-form-item>
        <el-form-item style="width: 100px">
          <el-select v-model="selector.teacher" placeholder="教师查询">
            <el-option label="不是教师" :value="0" />
            <el-option label="是教师" :value="1" />
          </el-select>
        </el-form-item>
        <el-form-item style="width: 100px">
          <el-select v-model="selector.baned" placeholder="封禁查询">
            <el-option label="未封禁" :value="0" />
            <el-option label="封禁" :value="1" />
          </el-select>
        </el-form-item>
        <el-form-item style="width: 100px">
          <el-select v-model="selector.delete" placeholder="是否删除">
            <el-option label="未删除" :value="0" />
            <el-option label="删除" :value="1" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="selectBySelector">查询</el-button>
        </el-form-item>
        <el-form-item style="width: 100px">
          <el-button @click="clearSelector">清空查询条件</el-button>
        </el-form-item>
      </el-form>
    </div>
    <el-table :data="users" stripe style="width: 100%">
      <el-table-column prop="id" align="center" label="id" width="50" />
      <el-table-column
        prop="username"
        align="center"
        label="用户名"
        width="100"
      />
      <el-table-column
        prop="nickname"
        align="center"
        label="昵称"
        width="100"
      />
      <el-table-column
        prop="description"
        align="center"
        label="个人简介"
        width="130"
      >
        <template #default="scope">
          <el-text truncated>{{ scope.row.description }}</el-text>
        </template>
      </el-table-column>
      <el-table-column prop="gender" align="center" label="性别" width="130">
        <template #default="scope">
          <template v-if="scope.row.gender == 0">未知</template>
          <template v-if="scope.row.gender == 1">男</template>
          <template v-if="scope.row.gender == 2">女</template>
        </template>
      </el-table-column>
      <el-table-column prop="birthday" align="center" label="生日" width="130">
        <template #default="scope">
          {{ getDateStr(scope.row.birthday) }}
        </template>
      </el-table-column>
      <el-table-column prop="avatar" align="center" label="头像" width="130">
        <template #default="scope">
          <img :src="scope.row.avatar"  class="img" />
        </template>
      </el-table-column>
      <el-table-column prop="teacher" align="center" label="老师" width="80"
        ><template #default="scope">
          {{ getBoolStr(scope.row.teacher) }}</template
        ></el-table-column
      >
      <el-table-column prop="baned" align="center" label="是否被封" width="80"
        ><template #default="scope">
          {{ getBoolStr(scope.row.baned) }}</template
        ></el-table-column
      >
      <el-table-column prop="delete" align="center" label="是否删除" width="80"
        ><template #default="scope">
          {{ getBoolStr(scope.row.delete) }}</template
        ></el-table-column
      >
      <el-table-column label="操作" align="center">
        <template #default="scope">
          <el-button link type="primary" size="small" @click="edit(scope.row)">
            修改
          </el-button>
          <el-button
            link
            type="primary"
            size="small"
            v-if="scope.row.baned == false"
            @click="Myban(scope.row.id)"
            >封禁</el-button
          >
          <el-button
            link
            type="primary"
            size="small"
            v-if="scope.row.baned == true"
            @click="Myunban(scope.row.id)"
            >解封</el-button
          >
          <el-button
            link
            type="primary"
            size="small"
            v-if="scope.row.delete == false"
            @click="MydeleteUser(scope.row.id)"
            >删除</el-button
          >
          <el-button
            link
            type="primary"
            size="small"
            v-if="scope.row.delete == true"
            @click="Myundelete(scope.row.id)"
            >恢复</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
  <popup :show="showtable" :hidden="hiddenTable">
    <template #main>
      <el-form :model="editUser" label-width="120px">
        <el-form-item label="ID">
          <el-input v-model="editUser.id" disabled />
        </el-form-item>
        <el-form-item label="用户名">
          <el-input v-model="editUser.username" disabled />
        </el-form-item>
        <el-form-item label="昵称">
          <el-input v-model="editUser.nickname" />
        </el-form-item>
        <el-form-item label="简介">
          <el-input v-model="editUser.description" type="textarea" />
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="editUser.gender">
            <el-radio :label="1">男</el-radio>
            <el-radio :label="2">女</el-radio>
            <el-radio :label="0">未知</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="生日">
          <el-date-picker
            v-model="editUser.birthday"
            type="date"
            placeholder="生日"
            value-format="X"
            style="width: 100%"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="editSubmit">保存</el-button>
          <el-button @click="hiddenTable">取消</el-button>
        </el-form-item>
      </el-form>
    </template>
  </popup>
</template>

<script>
import popup from "../components/popup.vue";
import {
  getUsers,
  getUsersBySelector,
  ban,
  unban,
  deleteUser,
  undelete,
  modify,
} from "@/api/userManage.js";
export default {
  data() {
    return {
      selector: {
        // 筛选条件
        id: null,
        username: null,
        gender: null,
        teacher: null,
        baned: null,
        delete: null,
      },
      users: [
      ],
      editUser: {},
      page: 1,
      showtable: false,
    };
  },
  methods: {
    edit(user) {
      this.editUser = {
        id: user.id,
        username: user.username,
        nickname: user.nickname,
        description: user.description,
        gender: user.gender,
        birthday: user.birthday,
      };
      this.showtable = true;
    },
    editSubmit() {
      modify(this.editUser).then((res) => {
        this.hiddenTable();
        this.refreshUsers();
      });
    },
    selectBySelector() {
      this.page = 1;
      getUsersBySelector(this.selector, this.page).then((res) => {
        this.users = res;
      });
    },
    clearSelector() {
      this.selector = {
        id: null,
        gender: null,
        birthday: null,
        teacher: null,
        baned: null,
        delete: null,
      };
    },
    getDateStr(timestamp) {
      return new Date(timestamp * 1000).toLocaleDateString();
    },
    getBoolStr(val) {
      if (val) return "是";
      else return "否";
    },
    hiddenTable() {
      this.showtable = false;
    },
    refreshUsers() {
      getUsersBySelector(this.selector, this.page).then((res) => {
        this.users = res;
      });
    },
    Myban(user) {ban(user).then(res=>{this.refreshUsers()})},
    Myunban(user) {unban(user).then(res=>{this.refreshUsers()})},
    MydeleteUser(user) {deleteUser(user).then(res=>{this.refreshUsers()})},
    Myundelete(user) {undelete(user).then(res=>{this.refreshUsers()})},
  },
  components: { popup },
  mounted() {
    this.refreshUsers();
  },
};
</script>

<style lang="less">
</style>