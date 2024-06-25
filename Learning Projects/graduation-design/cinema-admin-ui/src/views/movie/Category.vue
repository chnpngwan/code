<template>
  <el-card class="main-card">
    <!-- 标题 -->
    <div class="title">{{ this.$route.name }}</div>
    <div class="operation-container">
      <el-button
        type="primary"
        size="small"
        icon="el-icon-plus"
        @click="openCategoryDialog(null)"
      >
        新增类别
      </el-button>
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="this.categoryIdList.length === 0"
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
          @keyup.enter.native="searchCategory"
        />
        <el-button
          type="primary"
          size="small"
          icon="el-icon-search"
          style="margin-left:1rem"
          @click="searchCategory"
        >
          搜索
        </el-button>
      </div>
    </div>

    <el-table
      border
      @selection-change="selectionChange"
      v-loading="loading"
      :data="categoryList"
    >
      <el-table-column type="selection" width="55" />
      <el-table-column prop="name" label="名称" />
      <el-table-column prop="createTime" label="创建时间" />
      <el-table-column prop="updateTime" label="更新时间" />
      <!--操作按钮-->
      <el-table-column label="操作" width="200" align="center">
        <template slot-scope="scope">
          <el-button
            type="text"
            size="mini"
            @click="openCategoryDialog(scope.row)"
          >
            <i class="el-icon-edit" /> 修改
          </el-button>
          <el-popconfirm
            title="确定删除吗？"
            style="margin-left:10px"
            @confirm="deleteCategory(scope.row.id)"
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
        <el-button type="primary" @click="deleteCategory(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="categoryDialog" width="30%">
      <div class="dialog-title-container" slot="title" ref="categoryTitle" />
      <el-form label-width="80px" size="medium" :model="categoryForm">
        <el-form-item label="类别名称" label-width="auto">
          <el-input v-model="categoryForm.name" style="width:360px" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="categoryDialog = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdateCategory"
          >确 定</el-button
        >
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  created() {
    this.getCategoryList();
  },
  data() {
    return {
      loading: true,
      categoryDialog: false,
      isDelete: false,
      categoryList: [],
      categoryIdList: [],
      keywords: null,
      current: 1,
      size: 10,
      count: 0,
      categoryForm: {}
    };
  },
  methods: {
    selectionChange(categoryList) {
      this.categoryIdList = [];
      categoryList.forEach(item => {
        this.categoryIdList.push(item.id);
      });
    },
    searchCategory() {
      this.current = 1;
      this.getCategoryList();
    },
    sizeChange(size) {
      this.size = size;
      this.getCategoryList();
    },
    currentChange(current) {
      this.current = current;
      this.getCategoryList();
    },
    openCategoryDialog(category) {
      if (category != null) {
        this.categoryForm = JSON.parse(JSON.stringify(category));
        this.$refs.categoryTitle.innerHTML = "修改类别";
      } else {
        this.categoryForm = {};
        this.$refs.categoryTitle.innerHTML = "添加类别";
      }
      this.categoryDialog = true;
    },
    getCategoryList() {
      this.loading = true;
      this.axios
        .get("/api/category", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.categoryList = data.data.recordList;
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
    saveOrUpdateCategory() {
      this.axios.post("/api/category", this.categoryForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getCategoryList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
      this.categoryDialog = false;
    },
    deleteCategory(id) {
      let param = {};
      if (id != null) {
        param = { data: [id] };
      } else {
        param = { data: this.categoryIdList };
      }
      this.axios.delete("/api/category", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getCategoryList();
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
