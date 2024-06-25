<template>
  <el-card class="main-card">
    <!-- 标题 -->
    <div class="title">{{ this.$route.name }}</div>
    <div class="operation-container">
      <el-button
        type="primary"
        size="small"
        icon="el-icon-plus"
        @click="openActorDialog(null)"
      >
        新增演员
      </el-button>
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="this.actorIdList.length === 0"
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
          @keyup.enter.native="searchActor"
        />
        <el-button
          type="primary"
          size="small"
          icon="el-icon-search"
          style="margin-left:1rem"
          @click="searchActor"
        >
          搜索
        </el-button>
      </div>
    </div>

    <el-table
      ref="table"
      border
      :data="actorList"
      style="width:100%"
      @selection-change="selectionChange"
      v-loading="loading"
    >
      <el-table-column type="selection" width="55" fixed />
      <el-table-column prop="name" label="姓名" fixed width="200" />
      <el-table-column label="照片（点击可放大预览）" width="200">
        <template slot-scope="scope">
          <el-image
            style="width: 50px; height: 50px"
            :src="scope.row.image"
            :preview-src-list="[scope.row.image]"
          >
            <div slot="error" class="image-slot">
              <i class="el-icon-picture-outline"></i>
            </div>
          </el-image>
        </template>
      </el-table-column>
      <el-table-column prop="height" label="身高" width="150" />
      <el-table-column prop="age" label="年龄" width="150" />
      <el-table-column label="性别" width="150">
        <template slot-scope="scope">
          <span v-if="scope.row.gender === 1">男</span>
          <span v-else>女</span>
        </template>
      </el-table-column>
      <el-table-column prop="school" label="毕业院校" width="150" />
      <el-table-column prop="race" label="民族" width="150" />
      <el-table-column label="血型" width="150">
        <template slot-scope="scope">
          <span v-if="scope.row.bloodType === 0">A型</span>
          <span v-else-if="scope.row.bloodType === 1">B型</span>
          <span v-else-if="scope.row.bloodType === 2">O型</span>
          <span v-else>RH型</span>
        </template>
      </el-table-column>
      <el-table-column prop="constellation" label="星座" width="150" />
      <el-table-column prop="nation" label="国籍" width="150" />
      <el-table-column
        prop="information"
        label="详细信息"
        show-overflow-tooltip
        width="200"
      />
      <el-table-column prop="createTime" label="创建时间" width="200" />
      <el-table-column prop="updateTime" label="更新时间" width="200" />

      <!--      操作按钮-->
      <el-table-column fixed="right" label="操作" width="200" align="center">
        <template slot-scope="scope">
          <el-button
            type="text"
            size="mini"
            @click="openActorDialog(scope.row)"
          >
            <i class="el-icon-edit" /> 修改
          </el-button>
          <el-popconfirm
            title="确定删除吗？"
            style="margin-left:10px"
            @confirm="deleteActor(scope.row.id)"
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
      :page-sizes="[5, 10, 20]"
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
        <el-button type="primary" @click="deleteActor(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="actorDialog" width="30%">
      <div class="dialog-title-container" slot="title" ref="actorTitle" />
      <el-form label-width="80px" size="medium" :model="actorForm">
        <el-form-item label="姓名" label-width="auto">
          <el-input v-model="actorForm.name" style="width:360px" />
        </el-form-item>
        <el-form-item label="照片" label-width="auto">
          <el-upload
            drag
            :show-file-list="false"
            action="/api/movie/image"
            :on-success="handleImageUploadSuccess"
            :before-upload="handleBeforeUpload"
            v-loading="uploadLoading"
          >
            <i class="el-icon-upload" v-if="actorForm.image === undefined" />
            <div class="el-upload__text" v-if="actorForm.image === undefined">
              将文件拖到此处，或<em>点击上传</em>
            </div>
            <el-image
              v-else
              :src="actorForm.image"
              width="360px"
              height="180px"
              alt=""
            />
          </el-upload>
        </el-form-item>
        <el-form-item label="身高" label-width="auto">
          <el-input v-model="actorForm.height" style="width:360px" />
        </el-form-item>
        <el-form-item label="年龄" label-width="auto">
          <el-input v-model="actorForm.age" style="width:360px" />
        </el-form-item>
        <el-form-item label="性别" label-width="auto">
          <el-select
            v-model="actorForm.gender"
            placeholder="请选择性别"
            style="width:360px"
          >
            <el-option
              v-for="item in genderList"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="院校" label-width="auto">
          <el-input v-model="actorForm.school" style="width:360px" />
        </el-form-item>
        <el-form-item label="民族" label-width="auto">
          <el-input v-model="actorForm.race" style="width:360px" />
        </el-form-item>
        <el-form-item label="血型" label-width="auto">
          <el-select
            v-model="actorForm.bloodType"
            placeholder="请选择血型"
            style="width:360px"
          >
            <el-option
              v-for="item in bloodTypeList"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="星座" label-width="auto">
          <el-input v-model="actorForm.constellation" style="width:360px" />
        </el-form-item>
        <el-form-item label="国籍" label-width="auto">
          <el-input v-model="actorForm.nation" style="width:360px" />
        </el-form-item>
        <el-form-item label="简介" label-width="auto">
          <el-input
            type="textarea"
            :rows="4"
            v-model="actorForm.information"
            style="width:360px"
          />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="actorDialog = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdateActor">确 定</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  created() {
    this.getActorList();
  },
  data() {
    return {
      loading: true,
      uploadLoading: false,
      actorDialog: false,
      isDelete: false,
      actorList: [],
      actorIdList: [],
      keywords: null,
      current: 1,
      size: 5,
      count: 0,
      actorForm: {},
      genderList: [
        {
          value: 0,
          label: "女"
        },
        {
          value: 1,
          label: "男"
        }
      ],
      bloodTypeList: [
        {
          value: 0,
          label: "A型"
        },
        {
          value: 1,
          label: "B型"
        },
        {
          value: 2,
          label: "O型"
        },
        {
          value: 3,
          label: "RH型"
        }
      ]
    };
  },
  methods: {
    selectionChange(actorList) {
      this.actorIdList = [];
      actorList.forEach(item => {
        this.actorIdList.push(item.id);
      });
    },
    searchActor() {
      this.current = 1;
      this.getActorList();
    },
    sizeChange(size) {
      this.size = size;
      this.getActorList();
    },
    currentChange(current) {
      this.current = current;
      this.getActorList();
    },
    openActorDialog(actor) {
      if (actor != null) {
        this.actorForm = JSON.parse(JSON.stringify(actor));
        this.$refs.actorTitle.innerHTML = "修改演员";
      } else {
        this.actorForm = {};
        this.$refs.actorTitle.innerHTML = "添加演员";
      }
      this.actorDialog = true;
    },
    getActorList() {
      this.loading = true;
      this.axios
        .get("/api/actor", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.actorList = data.data.recordList;
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
    saveOrUpdateActor() {
      this.axios.post("/api/actor", this.actorForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getActorList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
      this.actorDialog = false;
    },
    deleteActor(id) {
      let param = {};
      if (id != null) {
        param = { data: [id] };
      } else {
        param = { data: this.actorIdList };
      }
      this.axios.delete("/api/actor", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getActorList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.isDelete = false;
      });
    },
    handleBeforeUpload() {
      this.uploadLoading = true;
    },
    handleImageUploadSuccess(response) {
      this.uploadLoading = false;
      if (response.code === 200) {
        if (this.actorForm.image === undefined) {
          this.actorForm["image"] = response.data;
        } else {
          this.actorForm.image = response.data;
        }
        this.$notify.success({
          title: "成功",
          message: response.message
        });
      } else {
        this.$notify.error({
          title: "失败",
          message: response.message
        });
      }
    },
    doLayout() {
      this.$nextTick(() => {
        this.$refs.table.doLayout();
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
