<template>
  <el-card class="main-card">
    <div class="title">{{ this.$route.name }}</div>
    <!-- 表格操作 -->
    <div class="operation-container">
      <el-button
        type="primary"
        size="small"
        icon="el-icon-plus"
        @click="openMenuModel(null)"
      >
        新增
      </el-button>
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="this.roleIdList.length === 0"
        @click="isDelete = true"
      >
        批量删除
      </el-button>
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="this.roleIdList.length === 0"
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
          placeholder="请输入角色名"
          style="width:200px"
          @keyup.enter.native="searchRoles"
        />
        <el-button
          type="primary"
          size="small"
          icon="el-icon-search"
          style="margin-left:1rem"
          @click="searchRoles"
        >
          搜索
        </el-button>
      </div>
    </div>
    <!-- 表格展示 -->
    <el-table
      border
      :data="roleList"
      @selection-change="selectionChange"
      v-loading="loading"
    >
      <!-- 表格列 -->
      <el-table-column type="selection" width="55" />
      <el-table-column prop="name" label="角色名" align="center" />
      <el-table-column label="权限标签" align="center">
        <template slot-scope="scope">
          <el-tag>
            {{ scope.row.label }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="禁用" align="center" width="100">
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
        width="150"
        align="center"
      >
        <template slot-scope="scope">
          <i class="el-icon-time" style="margin-right:5px" />
          {{ scope.row.createTime | date }}
        </template>
      </el-table-column>
      <!-- 列操作 -->
      <el-table-column label="操作" align="center" width="220">
        <template slot-scope="scope">
          <el-button type="text" size="mini" @click="openMenuModel(scope.row)">
            <i class="el-icon-edit" /> 菜单权限
          </el-button>
          <el-button
            type="text"
            size="mini"
            @click="openResourceModel(scope.row)"
          >
            <i class="el-icon-folder-checked" /> 资源权限
          </el-button>
          <el-popconfirm
            title="确定删除吗？"
            style="margin-left:10px"
            @confirm="deleteRole(scope.row.id)"
          >
            <el-button size="mini" type="text" slot="reference">
              <i class="el-icon-delete" /> 删除
            </el-button>
          </el-popconfirm>
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
    <!-- 菜单对话框 -->
    <el-dialog :visible.sync="roleMenu" width="30%">
      <div class="dialog-title-container" slot="title" ref="roleTitle" />
      <el-form label-width="80px" size="medium" :model="roleForm">
        <el-form-item label="角色名">
          <el-input v-model="roleForm.name" style="width:250px" />
        </el-form-item>
        <el-form-item label="权限标签">
          <el-input v-model="roleForm.label" style="width:250px" />
        </el-form-item>
        <el-form-item label="菜单权限">
          <el-tree
            :data="menuList"
            :default-checked-keys="roleForm.menuIdList"
            show-checkbox
            node-key="id"
            ref="menuTree"
          />
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="roleMenu = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdateRoleMenu">
          确 定
        </el-button>
      </div>
    </el-dialog>
    <!-- 资源对话框 -->
    <el-dialog :visible.sync="roleResource" width="30%" top="9vh">
      <div class="dialog-title-container" slot="title">修改资源权限</div>
      <el-form label-width="80px" size="medium" :model="roleForm">
        <el-form-item label="角色名">
          <el-input v-model="roleForm.name" style="width:250px" />
        </el-form-item>
        <el-form-item label="权限标签">
          <el-input v-model="roleForm.label" style="width:250px" />
        </el-form-item>
        <el-form-item label="资源权限">
          <el-tree
            :data="resourceList"
            :default-checked-keys="roleForm.resourceIdList"
            show-checkbox
            node-key="id"
            ref="resourceTree"
          />
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="roleResource = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdateRoleResource">
          确 定
        </el-button>
      </div>
    </el-dialog>
    <!-- 批量删除对话框 -->
    <el-dialog :visible.sync="isDelete" width="30%">
      <div class="dialog-title-container" slot="title">
        <i class="el-icon-warning" style="color:#ff9900" />提示
      </div>
      <div style="font-size:1rem">是否删除选中项？</div>
      <div slot="footer">
        <el-button @click="isDelete = false">取 消</el-button>
        <el-button type="primary" @click="deleteRole(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  created() {
    this.getRoleList();
    this.getResourceList();
    this.getMenuList();
  },
  data: function() {
    return {
      loading: true,
      isDelete: false,
      roleList: [],
      roleIdList: [],
      keywords: null,
      current: 1,
      size: 10,
      count: 0,
      roleMenu: false,
      roleResource: false,
      resourceList: [],
      menuList: [],
      roleForm: {}
    };
  },
  methods: {
    searchRoles() {
      this.current = 1;
      this.getRoleList();
    },
    sizeChange(size) {
      this.size = size;
      this.getRoleList();
    },
    currentChange(current) {
      this.current = current;
      this.getRoleList();
    },
    selectionChange(roleList) {
      this.roleIdList = [];
      roleList.forEach(item => {
        this.roleIdList.push(item.id);
      });
    },
    getRoleList() {
      this.axios
        .get("/api/role", {
          params: {
            current: this.current,
            size: this.size,
            keyword: this.keywords
          }
        })
        .then(({ data }) => {
          this.roleList = data.data.recordList;
          this.count = data.data.count;
          this.loading = false;
        });
    },
    getResourceList() {
      this.axios.get("/api/resource/role").then(({ data }) => {
        this.resourceList = data.data;
      });
    },
    getMenuList() {
      this.axios.get("/api/menu/role").then(({ data }) => {
        this.menuList = data.data;
      });
    },
    deleteRole(id) {
      let param = {};
      if (id == null) {
        param = { data: this.roleIdList };
      } else {
        param = { data: [id] };
      }
      this.axios.delete("/api/role", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getRoleList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.isDelete = false;
      });
    },
    openMenuModel(role) {
      this.$nextTick(function() {
        this.$refs.menuTree.setCheckedKeys([]);
      });
      this.$refs.roleTitle.innerHTML = role ? "修改角色" : "新增角色";
      if (role != null) {
        this.roleForm = JSON.parse(JSON.stringify(role));
      } else {
        this.roleForm = {
          name: "",
          label: "",
          resourceIdList: [],
          menuIdList: []
        };
      }
      this.roleMenu = true;
    },
    openResourceModel(role) {
      this.$nextTick(function() {
        this.$refs.resourceTree.setCheckedKeys([]);
      });
      this.roleForm = JSON.parse(JSON.stringify(role));
      this.roleResource = true;
    },
    saveOrUpdateRoleResource() {
      this.roleForm.menuIdList = null;
      this.roleForm.resourceIdList = this.$refs.resourceTree.getCheckedKeys();
      this.axios.post("/api/role", this.roleForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getRoleList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.roleResource = false;
      });
    },
    saveOrUpdateRoleMenu() {
      this.roleForm.resourceIdList = null;
      this.roleForm.menuIdList = this.$refs.menuTree
        .getCheckedKeys()
        .concat(this.$refs.menuTree.getHalfCheckedKeys());
      this.axios.post("/api/role", this.roleForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getRoleList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.roleMenu = false;
      });
    },
    updateAbleFlag(id, ableFlag) {
      let params = {};
      if (id !== null) {
        params["roleIdList"] = [id];
      } else {
        params["roleIdList"] = this.roleIdList;
      }
      params["ableFlag"] = ableFlag;
      this.axios.put("/api/role/able", params).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getRoleList();
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
