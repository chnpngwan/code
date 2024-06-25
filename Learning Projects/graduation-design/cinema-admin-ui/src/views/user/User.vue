<template>
  <el-card class="main-card">
    <div class="title">{{ this.$route.name }}</div>
    <!-- 表格操作 -->
    <div class="operation-container">
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="userIdList.length === 0"
        @click="updateAbleFlag(null, false)"
      >
        批量禁用
      </el-button>
      <!-- 条件筛选 -->
      <div style="margin-left:auto">
        <el-input
          v-model="keywords"
          prefix-icon="el-icon-search"
          size="small"
          placeholder="请输入昵称"
          style="width:200px"
          @keyup.enter.native="searchUsers"
        />
        <el-button
          type="primary"
          size="small"
          icon="el-icon-search"
          style="margin-left:1rem"
          @click="searchUsers"
        >
          搜索
        </el-button>
      </div>
    </div>
    <!-- 表格展示 -->
    <el-table
      border
      :data="userList"
      v-loading="loading"
      @selection-change="selectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!-- 表格列 -->
      <el-table-column
        prop="linkAvatar"
        label="头像"
        align="center"
        width="100"
      >
        <template slot-scope="scope">
          <img :src="scope.row.avatar" width="40" height="40" />
        </template>
      </el-table-column>
      <el-table-column
        prop="nickname"
        label="昵称"
        align="center"
        width="140"
      />
      <el-table-column prop="email" label="邮箱" align="center" width="200" />
      <el-table-column
        prop="telephone"
        label="电话"
        align="center"
        width="140"
      />
      <el-table-column label="用户角色" align="center">
        <template slot-scope="scope">
          <el-tag
            v-for="(item, index) of scope.row.roleList"
            :key="index"
            style="margin-right:4px;margin-top:4px"
          >
            {{ item.name }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="禁用状态" align="center" width="100">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.ableFlag"
            active-color="#13ce66"
            inactive-color="#ff4949"
            @change="updateAbleFlag(scope.row.id, scope.row.ableFlag)"
          />
        </template>
      </el-table-column>
      <el-table-column
        prop="createTime"
        label="创建时间"
        width="180"
        align="center"
      />
      <el-table-column
        prop="updateTime"
        label="更新时间"
        width="180"
        align="center"
      />
      <!-- 列操作 -->
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button
            type="primary"
            size="mini"
            @click="openEditModel(scope.row)"
          >
            编辑
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <el-pagination
      class="pagination-container"
      background
      @size-change="sizeChange"
      @current-change="currentChange"
      :current-page="current"
      :page-size="size"
      :total="count"
      :page-sizes="[10, 20]"
      layout="total, sizes, prev, pager, next, jumper"
    />
    <!-- 修改对话框 -->
    <el-dialog :visible.sync="isEdit" width="30%">
      <div class="dialog-title-container" slot="title">
        修改用户
      </div>
      <el-form label-width="60px" size="medium" :model="userForm">
        <el-form-item label="昵称">
          <el-input v-model="userForm.nickname" style="width:220px" />
        </el-form-item>
        <el-form-item label="角色">
          <el-checkbox-group v-model="roleIdList">
            <el-checkbox
              v-for="item of roleList"
              :key="item.id"
              :label="item.id"
            >
              {{ item.name }}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="isEdit = false">取 消</el-button>
        <el-button type="primary" @click="updateUserRole">
          确 定
        </el-button>
      </div>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  created() {
    this.getUserList();
    this.getRoleList();
  },
  data: function() {
    return {
      loading: true,
      isEdit: false,
      userForm: {},
      roleList: [],
      roleIdList: [],
      userList: [],
      userIdList: [],
      keywords: null,
      current: 1,
      size: 10,
      count: 0
    };
  },
  methods: {
    searchUsers() {
      this.current = 1;
      this.getUserList();
    },
    sizeChange(size) {
      this.size = size;
      this.getUserList();
    },
    currentChange(current) {
      this.current = current;
      this.getUserList();
    },
    selectionChange(userList) {
      this.userIdList = [];
      userList.forEach(item => {
        this.userIdList.push(item.id);
      });
    },
    openEditModel(user) {
      this.roleIdList = [];
      this.userForm = JSON.parse(JSON.stringify(user));
      this.userForm.roleList.forEach(item => {
        this.roleIdList.push(item.id);
      });
      this.isEdit = true;
    },
    updateUserRole() {
      this.userForm.roleIdList = this.roleIdList;
      this.axios.post("/api/user", this.userForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getUserList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.isEdit = false;
      });
    },
    getUserList() {
      this.loading = true;
      this.axios
        .get("/api/user", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.userList = data.data.recordList;
            this.count = data.data.count;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message
            });
          }
          this.loading = false;
        });
    },
    getRoleList() {
      this.axios.get("/api/role/list").then(({ data }) => {
        if (data.code === 200) {
          this.roleList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    updateAbleFlag(id, ableFlag) {
      let params = {};
      if (id !== null) {
        params["userIdList"] = [id];
      } else {
        params["userIdList"] = this.userIdList;
      }
      params["ableFlag"] = ableFlag;
      this.axios.put("/api/user/able", params).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getUserList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    }
  }
};
</script>
