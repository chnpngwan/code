<template>
  <el-card class="main-card">
    <!-- 标题 -->
    <div class="title">{{ this.$route.name }}</div>
    <div class="operation-container">
      <el-button
        type="primary"
        size="small"
        icon="el-icon-plus"
        @click="openLaminationDialog(null)"
      >
        上映电影
      </el-button>
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="this.laminationIdList.length === 0"
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
      :data="laminationList"
    >
      <el-table-column type="selection" width="55" fixed />
      <el-table-column prop="movie.name" label="电影名称" fixed width="150"/>
      <el-table-column prop="cinema.name" label="影院名称" width="250"/>
      <el-table-column prop="hall.name" label="影厅名称" width="150"/>
      <el-table-column prop="langVersion" label="语言版本" />
      <el-table-column prop="startDate" label="上映日期" width="100"/>
      <el-table-column prop="startTime" label="开始时间" />
      <el-table-column prop="endTime" label="结束时间" />
      <el-table-column prop="price" label="场次价格" />
      <el-table-column prop="tips" label="温馨提示" width="250"/>
      <el-table-column prop="createTime" label="创建时间" width="200" />
      <el-table-column prop="updateTime" label="更新时间" width="200" />
      <!--操作按钮-->
      <el-table-column fixed="right" label="操作" width="200" align="center">
        <template slot-scope="scope">
          <el-button type="text" size="mini" @click="openLaminationDialog(scope.row)">
            <i class="el-icon-edit" /> 修改
          </el-button>
          <el-popconfirm
            title="确定删除吗？"
            style="margin-left:10px"
            @confirm="deleteLamination(scope.row.id)"
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
        <el-button type="primary" @click="deleteLamination(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="laminationDialog" width="30%">
      <div class="dialog-title-container" slot="title" ref="title" />
      <el-form label-width="80px" size="medium" :model="laminationForm">
        <el-form-item label="影院名称" label-width="auto">
          <el-select
              v-model="laminationForm.cinemaId"
              filterable
              placeholder="请选择影院"
              style="width:360px"
          >
            <el-option
                v-for="item in cinemaList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="影厅名称" label-width="auto">
          <el-select
              v-model="laminationForm.hallId"
              filterable
              placeholder="请选择影厅"
              style="width:360px"
              @visible-change="getHallList"
              :loading="hallLoading"
          >
            <el-option
                v-for="item in hallList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="电影名称" label-width="auto">
          <el-select
              v-model="laminationForm.movieId"
              filterable
              placeholder="请选择电影"
              style="width:360px"
          >
            <el-option
                v-for="item in movieList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="语言版本" label-width="auto">
          <el-input v-model="laminationForm.langVersion" style="width:360px" />
        </el-form-item>
        <el-form-item label="上映日期" label-width="auto">
          <el-date-picker
              v-model="laminationForm.startDate"
              value-format="yyyy-MM-dd"
              type="date"
              placeholder="选择上映日期"
              style="width:360px"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="开始时间"  label-width="auto">
          <el-time-select
              v-model="laminationForm.startTime"
              :picker-options="{
                  start: '00:00',
                  step: '00:01',
                  end: '23:59'
                }"
              placeholder="选择开始时间(可手动输入符合时间格式的时间)"
              style="width: 360px"
          >
          </el-time-select>
        </el-form-item>
        <el-form-item
            v-if="laminationForm.endTime !== undefined"
            label="结束时间"
            label-width="auto"
        >
          <el-time-select
              v-model="laminationForm.endTime"
              disabled
              style="width: 360px"
          >
          </el-time-select>
        </el-form-item>
        <el-form-item label="场次价格"  label-width="auto">
          <el-input v-model="laminationForm.price" style="width: 360px" />
        </el-form-item>
        <el-form-item label="温馨提示"  label-width="auto">
          <el-input v-model="laminationForm.tips" style="width: 360px" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="laminationDialog = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdateLamination">确 定</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  created() {
    this.getLaminationList();
    this.getCinemaList();
    this.getMovieList();
  },
  data() {
    return {
      loading: true,
      hallLoading: true,
      laminationDialog: false,
      isDelete: false,
      cinemaList: [],
      movieList: [],
      hallList: [],
      laminationList: [],
      laminationIdList: [],
      keywords: null,
      current: 1,
      size: 10,
      count: 0,
      laminationForm: {}
    };
  },
  methods: {
    selectionChange(laminationList) {
      this.laminationIdList = [];
      laminationList.forEach(item => {
        this.laminationIdList.push(item.id);
      });
    },
    search() {
      this.current = 1;
      this.getLaminationList();
    },
    sizeChange(size) {
      this.size = size;
      this.getLaminationList();
    },
    currentChange(current) {
      this.current = current;
      this.getLaminationList();
    },
    openLaminationDialog(object) {
      if (object != null) {
        object["cinemaId"] = object.cinema.id;
        object["hallId"] = object.hall.id;
        object["movieId"] = object.movie.id;
        this.laminationForm = JSON.parse(JSON.stringify(object));
        delete this.laminationForm.cinema;
        delete this.laminationForm.hall;
        delete this.laminationForm.movie;
        this.getHallList();
        this.$refs.title.innerHTML = "修改排片";
      } else {
        this.laminationForm = {};
        this.$refs.title.innerHTML = "添加排片";
      }
      this.laminationDialog = true;
    },
    getLaminationList() {
      this.loading = true;
      this.axios
        .get("/api/lamination", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.laminationList = data.data.recordList;
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
    saveOrUpdateLamination() {
      this.axios.post("/api/lamination", this.laminationForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getLaminationList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
      this.laminationDialog = false;
    },
    deleteLamination(id) {
      let param = {};
      if (id != null) {
        param = { data: [id] };
      } else {
        param = { data: this.laminationIdList };
      }
      this.axios.delete("/api/lamination", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getLaminationList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.isDelete = false;
      });
    },
    getCinemaList() {
      this.axios.get("/api/cinema/list").then(({data}) => {
        if (data.code === 200) {
          this.cinemaList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      })
    },
    getMovieList() {
      this.axios.get("/api/movie/list").then(({data}) => {
        if (data.code === 200) {
          this.movieList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      })
    },
    getHallList() {
      this.hallLoading = true;
      if (this.laminationForm.cinemaId === undefined || this.laminationForm.cinemaId === null) {
        this.hallList = [{
          id: null,
          name: "请先选择影院之后再选择影厅"
        }]
        this.hallLoading = false;
      } else {
        this.axios.get("/api/hall/list", {
          params: {
            cinemaId: this.laminationForm.cinemaId
          }
        })
        .then(({data}) => {
          if (data.code === 200) {
            this.hallList = data.data;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message
            });
          }
          this.hallLoading = false;
        });
      }
    }
  }
};
</script>

<style scoped>
label {
  font-weight: bold !important;
}
</style>
