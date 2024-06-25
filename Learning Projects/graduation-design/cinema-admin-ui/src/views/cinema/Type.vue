<template>
  <el-card class="main-card">
    <!-- 标题 -->
    <div class="title">{{ this.$route.name }}</div>
    <div class="operation-container">
      <el-button
        type="primary"
        size="small"
        icon="el-icon-plus"
        @click="openTypeDialog(null)"
      >
        新增类别
      </el-button>
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="this.typeIdList.length === 0"
        @click="isDelete = true"
      >
        批量删除
      </el-button>
      <!-- 数据筛选 -->
      <div style="margin-left:auto">
        <el-input
          v-model="keywords"
          prefix-icon="el-icon-search"
          size="small"
          placeholder="请输入搜索内容"
          style="width:200px"
          @keyup.enter.native="searchType"
        />
        <el-button
          type="primary"
          size="small"
          icon="el-icon-search"
          style="margin-left:1rem"
          @click="searchType"
        >
          搜索
        </el-button>
      </div>
    </div>

    <el-table
      border
      @selection-change="selectionChange"
      v-loading="loading"
      :data="typeList"
    >
      <el-table-column type="selection" width="55" />
      <el-table-column prop="name" label="影院类别名称" />
      <el-table-column prop="createTime" label="创建时间" />
      <el-table-column prop="updateTime" label="更新时间" />
      <!--操作按钮-->
      <el-table-column label="操作" width="200" align="center">
        <template slot-scope="scope">
          <el-button type="text" size="mini" @click="openTypeDialog(scope.row)">
            <i class="el-icon-edit" /> 修改
          </el-button>
          <el-popconfirm
            title="确定删除吗？"
            style="margin-left:10px"
            @confirm="deleteType(scope.row.id)"
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

    <!-- 批量删除对话框 -->
    <el-dialog :visible.sync="isDelete" width="30%">
      <div class="dialog-title-container" slot="title">
        <i class="el-icon-warning" style="color:#ff9900" />提示
      </div>
      <div style="font-size:1rem">是否删除选中项？</div>
      <div slot="footer">
        <el-button @click="isDelete = false">取 消</el-button>
        <el-button type="primary" @click="deleteType(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="typeDialog" width="30%">
      <div class="dialog-title-container" slot="title" ref="typeTitle" />
      <el-form label-width="80px" size="medium" :model="typeForm">
        <el-form-item label="类别名称" label-width="auto">
          <el-input v-model="typeForm.name" style="width:360px" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="typeDialog = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdateType">确 定</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  created() {
    this.getTypeList();
  },
  data() {
    return {
      loading: true,
      typeDialog: false,
      isDelete: false,
      typeList: [],
      typeIdList: [],
      keywords: null,
      current: 1,
      size: 10,
      count: 0,
      typeForm: {}
    };
  },
  methods: {
    selectionChange(typeList) {
      this.typeIdList = [];
      typeList.forEach(item => {
        this.typeIdList.push(item.id);
      });
    },
    searchType() {
      this.current = 1;
      this.getTypeList();
    },
    sizeChange(size) {
      this.size = size;
      this.getTypeList();
    },
    currentChange(current) {
      this.current = current;
      this.getTypeList();
    },
    openTypeDialog(type) {
      if (type != null) {
        this.typeForm = JSON.parse(JSON.stringify(type));
        this.$refs.typeTitle.innerHTML = "修改影院类别";
      } else {
        this.typeForm = {};
        this.$refs.typeTitle.innerHTML = "添加影院类别";
      }
      this.typeDialog = true;
    },
    getTypeList() {
      this.axios
        .get("/api/type", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.typeList = data.data.recordList;
            this.count = data.data.count;
            this.loading = false;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message
            });
          }
        });
    },
    saveOrUpdateType() {
      this.axios.post("/api/type", this.typeForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getTypeList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
      this.ageDialog = false;
    },
    deleteType(id) {
      let param = {};
      if (id != null) {
        param = { data: [id] };
      } else {
        param = { data: this.typeIdList };
      }
      this.axios.delete("/api/type", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getTypeList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.isDelete = false;
      });
    }
  }
};
</script>

<style scoped>
label {
  font-weight: bold !important;
}
</style>
