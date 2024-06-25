<template>
  <el-card class="main-card">
    <!-- 标题 -->
    <div class="title">{{ this.$route.name }}</div>
    <div class="operation-container">
      <el-button
        type="primary"
        size="small"
        icon="el-icon-plus"
        @click="openAreaDialog(null)"
      >
        新增区域
      </el-button>
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="this.areaIdList.length === 0"
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
          @keyup.enter.native="searchArea"
        />
        <el-button
          type="primary"
          size="small"
          icon="el-icon-search"
          style="margin-left:1rem"
          @click="searchArea"
        >
          搜索
        </el-button>
      </div>
    </div>

    <el-table
      border
      @selection-change="selectionChange"
      v-loading="loading"
      :data="areaList"
    >
      <el-table-column type="selection" width="55" />
      <el-table-column prop="name" label="名称" />
      <el-table-column prop="createTime" label="创建时间" />
      <el-table-column prop="updateTime" label="更新时间" />
      <!--操作按钮-->
      <el-table-column label="操作" width="200" align="center">
        <template slot-scope="scope">
          <el-button type="text" size="mini" @click="openAreaDialog(scope.row)">
            <i class="el-icon-edit" /> 修改
          </el-button>
          <el-popconfirm
            title="确定删除吗？"
            style="margin-left:10px"
            @confirm="deleteArea(scope.row.id)"
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
        <el-button type="primary" @click="deleteArea(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="areaDialog" width="30%">
      <div class="dialog-title-container" slot="title" ref="areaTitle" />
      <el-form label-width="80px" size="medium" :model="areaForm">
        <el-form-item label="区域名称" label-width="auto">
          <el-input v-model="areaForm.name" style="width:360px" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="areaDialog = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdateArea">确 定</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  created() {
    this.getAreaList();
  },
  data() {
    return {
      loading: true,
      areaDialog: false,
      isDelete: false,
      areaList: [],
      areaIdList: [],
      keywords: null,
      current: 1,
      size: 10,
      count: 0,
      areaForm: {}
    };
  },
  methods: {
    selectionChange(areaList) {
      this.areaIdList = [];
      areaList.forEach(item => {
        this.areaIdList.push(item.id);
      });
    },
    searchArea() {
      this.current = 1;
      this.getAreaList();
    },
    sizeChange(size) {
      this.size = size;
      this.getAreaList();
    },
    currentChange(current) {
      this.current = current;
      this.getAreaList();
    },
    openAreaDialog(area) {
      if (area != null) {
        this.areaForm = JSON.parse(JSON.stringify(area));
        this.$refs.areaTitle.innerHTML = "修改区域";
      } else {
        this.areaForm = {};
        this.$refs.areaTitle.innerHTML = "添加区域";
      }
      this.areaDialog = true;
    },
    getAreaList() {
      this.axios
        .get("/api/area", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.areaList = data.data.recordList;
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
    saveOrUpdateArea() {
      this.axios.post("/api/area", this.areaForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getAreaList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
      this.areaDialog = false;
    },
    deleteArea(id) {
      let param = {};
      if (id != null) {
        param = { data: [id] };
      } else {
        param = { data: this.areaIdList };
      }
      this.axios.delete("/api/area", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getAreaList();
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
