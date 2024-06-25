<template>
  <el-card class="main-card">
    <!-- 标题 -->
    <div class="title">{{ this.$route.name }}</div>
    <div class="operation-container">
      <el-button
        type="primary"
        size="small"
        icon="el-icon-plus"
        @click="openDialog(null)"
      >
        新增职务
      </el-button>
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="this.idList.length === 0"
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
          @keyup.enter.native="search"
        />
        <el-button
          type="primary"
          size="small"
          icon="el-icon-search"
          style="margin-left:1rem"
          @click="search"
        >
          搜索
        </el-button>
      </div>
    </div>

    <el-table
      border
      @selection-change="selectionChange"
      v-loading="loading"
      :data="list"
    >
      <el-table-column type="selection" width="55" />
      <el-table-column prop="name" label="职务名称" />
      <el-table-column prop="createTime" label="创建时间" />
      <el-table-column prop="updateTime" label="更新时间" />
      <!--操作按钮-->
      <el-table-column label="操作" width="200" align="center">
        <template slot-scope="scope">
          <el-button type="text" size="mini" @click="openDialog(scope.row)">
            <i class="el-icon-edit" /> 修改
          </el-button>
          <el-popconfirm
            title="确定删除吗？"
            style="margin-left:10px"
            @confirm="del(scope.row.id)"
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
        <el-button type="primary" @click="del(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="dialog" width="30%">
      <div class="dialog-title-container" slot="title" ref="title" />
      <el-form label-width="80px" size="medium" :model="form">
        <el-form-item label="服务名称" label-width="auto">
          <el-input v-model="form.name" style="width:360px" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialog = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdate">确 定</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  created() {
    this.getList();
  },
  data() {
    return {
      loading: true,
      dialog: false,
      isDelete: false,
      list: [],
      idList: [],
      keywords: null,
      current: 1,
      size: 10,
      count: 0,
      form: {}
    };
  },
  methods: {
    selectionChange(list) {
      this.idList = [];
      list.forEach(item => {
        this.idList.push(item.id);
      });
    },
    search() {
      this.current = 1;
      this.getList();
    },
    sizeChange(size) {
      this.size = size;
      this.getList();
    },
    currentChange(current) {
      this.current = current;
      this.getList();
    },
    openDialog(object) {
      if (object != null) {
        this.form = JSON.parse(JSON.stringify(object));
        this.$refs.title.innerHTML = "修改职务";
      } else {
        this.form = {};
        this.$refs.title.innerHTML = "新增职务";
      }
      this.dialog = true;
    },
    getList() {
      this.axios
        .get("/api/duty", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.list = data.data.recordList;
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
    saveOrUpdate() {
      this.axios.post("/api/duty", this.form).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
      this.dialog = false;
    },
    del(id) {
      let param = {};
      if (id != null) {
        param = { data: [id] };
      } else {
        param = { data: this.idList };
      }
      this.axios.delete("/api/duty", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getList();
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
