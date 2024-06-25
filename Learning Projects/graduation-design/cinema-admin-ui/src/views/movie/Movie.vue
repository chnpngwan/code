<template>
  <el-card class="main-card">
    <div class="title">{{ this.$route.name }}</div>
    <!-- 表格操作 -->
    <div class="operation-container">
      <el-button
        type="primary"
        size="small"
        icon="el-icon-plus"
        @click="openMovieDialog(null)"
      >
        新增电影
      </el-button>
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="this.movieIdList.length === 0"
        @click="isDelete = true"
      >
        批量删除
      </el-button>
      <!-- 条件筛选 -->
      <div style="margin-left:auto">
        <el-input
          v-model="keywords"
          prefix-icon="el-icon-search"
          size="small"
          placeholder="请输入搜索内容"
          style="width:200px"
          @keyup.enter.native="searchMovie"
        />
        <el-button
          type="primary"
          size="small"
          icon="el-icon-search"
          style="margin-left:1rem"
          @click="searchMovie"
        >
          搜索
        </el-button>
      </div>
    </div>

    <el-table
      ref="table"
      border
      :data="movieList"
      style="width:100%"
      @selection-change="selectionChange"
      v-loading="loading"
    >
      <el-table-column type="selection" width="55" fixed />
      <el-table-column prop="nameCn" label="中文名称" fixed width="200" />
      <el-table-column prop="nameEn" label="英文名称" width="200" />
      <el-table-column label="封面（点击可放大预览）" width="200">
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
      <el-table-column prop="time" label="时长" width="150" />
      <el-table-column
        prop="intro"
        label="电影简介"
        show-overflow-tooltip
        width="150"
      />
      <el-table-column prop="area.name" label="区域" width="150" />
      <el-table-column prop="age.name" label="年代" width="150" />
      <el-table-column show-overflow-tooltip label="类型" width="250">
        <template slot-scope="scope">
          <el-tag
            v-for="item in scope.row.categoryList"
            size="small"
            style="margin-left: 5px"
            :key="item.id"
          >
            {{ item.name }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="score" label="评分" width="150" />
      <el-table-column prop="gross" label="总收入" width="150" />
      <el-table-column prop="releaseTime" label="上映时间" width="200" />

      <!--      操作按钮-->
      <el-table-column fixed="right" label="操作" width="220" align="center">
        <template slot-scope="scope">
          <el-button
            type="text"
            size="mini"
            @click="openMovieDialog(scope.row)"
          >
            <i class="el-icon-view" /> 查看
          </el-button>
          <el-button
            type="text"
            size="mini"
            @click="openCommentDialog(scope.row)"
          >
            <i class="el-icon-edit" /> 评论
          </el-button>
          <el-button
            type="text"
            size="mini"
            @click="openActorDialog(scope.row)"
          >
            <i class="el-icon-edit" /> 演员
          </el-button>
          <el-popconfirm
            title="确定删除吗？"
            style="margin-left:10px"
            @confirm="deleteMovie(scope.row.id)"
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
        <el-button type="primary" @click="deleteMovie(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="movieDialog" width="30%">
      <div class="dialog-title-container" slot="title" ref="movieTitle" />
      <el-form label-width="80px" size="medium" :model="movieForm">
        <el-form-item label="中文名称" label-width="auto">
          <el-input v-model="movieForm.nameCn" style="width:360px" />
        </el-form-item>
        <el-form-item label="英文名称" label-width="auto">
          <el-input v-model="movieForm.nameEn" style="width:360px" />
        </el-form-item>
        <el-form-item label="电影时长" label-width="auto">
          <el-input v-model="movieForm.time" style="width:360px" />
        </el-form-item>
        <el-form-item label="电影简介" label-width="auto">
          <el-input
            type="textarea"
            :rows="4"
            v-model="movieForm.intro"
            style="width:360px"
          />
        </el-form-item>
        <el-form-item label="电影类型" label-width="auto">
          <el-select
            v-model="movieForm.categoryIdList"
            multiple
            filterable
            placeholder="请选择电影类型可多选"
            style="width:360px"
          >
            <el-option
              v-for="item in categoryList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="电影区域" label-width="auto">
          <el-select
            v-model="movieForm.areaId"
            clearable
            filterable
            placeholder="请选择电影区域"
            style="width:360px"
          >
            <el-option
              v-for="item in areaList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="电影年代" label-width="auto">
          <el-select
            v-model="movieForm.ageId"
            clearable
            filterable
            placeholder="请选择电影年代"
            style="width:360px"
          >
            <el-option
              v-for="item in ageList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="上映时间" label-width="auto">
          <el-date-picker
            v-model="movieForm.releaseTime"
            value-format="yyyy-MM-dd HH:mm:ss"
            type="datetime"
            placeholder="选择日期"
            style="width:360px"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="电影封面" label-width="auto">
          <el-upload
            drag
            :show-file-list="false"
            action="/api/movie/image"
            :before-upload="handleBeforeUpload"
            :on-success="handleImageUploadSuccess"
            v-loading="uploadLoading"
          >
            <i class="el-icon-upload" v-if="movieForm.image === undefined" />
            <div class="el-upload__text" v-if="movieForm.image === undefined">
              将文件拖到此处，或<em>点击上传</em>
            </div>
            <el-image
              v-else
              :src="movieForm.image"
              alt=""
              :fit="'cover'"
            />
          </el-upload>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="movieDialog = false">取 消</el-button>
        <el-button type="primary" @click="addOrEditMovie">确 定</el-button>
      </span>
    </el-dialog>

    <el-dialog :visible.sync="actorDialog" width="50%">
      <div class="dialog-title-container" slot="title" ref="actorTitle" />
      <el-select
        v-model="actorIdList"
        clearable
        multiple
        filterable
        placeholder="请选择演员，可多选"
        style="width:515px"
      >
        <el-option
          v-for="item in actorList"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        >
        </el-option>
      </el-select>
      <el-select
        v-model="dutyId"
        placeholder="请选择职务"
        clearable
        filterable
        style="width:130px;margin-left: 10px"
      >
        <el-option
          v-for="item in dutyList"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        >
        </el-option>
      </el-select>
      <el-button
        type="primary"
        icon="el-icon-plus"
        style="margin-left: 10px"
        @click="saveMovieActorDuty"
      >
        添加
      </el-button>
      <el-table
        ref="table"
        border
        :data="actorDutyList"
        style="width:100%"
        v-loading="actorLoading"
      >
        <el-table-column label="职务" prop="name" width="100px" />
        <el-table-column label="成员">
          <template slot-scope="scope">
            <el-tag
              v-for="item in scope.row.actorList"
              :key="item.id"
              closable
              size="medium"
              style="margin-left: 5px"
              @close="deleteMovieActorDuty(scope.row.id, item.id)"
            >
              {{ item.name }}
            </el-tag>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

    <el-dialog :visible.sync="commentDialog" width="70%">
      <div class="dialog-title-container" slot="title" ref="commentTitle" />
      <div class="operation-container">
        <el-button
          type="danger"
          size="small"
          icon="el-icon-delete"
          :disabled="commentIdList.length === 0"
          @click="deleteComment(null)"
        >
          批量删除
        </el-button>
        <el-button
          type="success"
          size="small"
          icon="el-icon-success"
          :disabled="commentIdList.length === 0"
          @click="commentReview(null, true)"
        >
          批量通过
        </el-button>
        <!-- 数据筛选 -->
        <div style="margin-left:auto">
          <el-input
            v-model="keywords"
            prefix-icon="el-icon-search"
            size="small"
            placeholder="请输入用户昵称"
            style="width:200px"
            @keyup.enter.native="searchComment"
          />
          <el-button
            type="primary"
            size="small"
            icon="el-icon-search"
            style="margin-left:1rem"
            @click="searchComment"
          >
            搜索
          </el-button>
        </div>
      </div>
      <el-table
        border
        :data="commentList"
        style="width:100%"
        @selection-change="selectionCommentChange"
        v-loading="commentLoading"
      >
        <el-table-column type="selection" width="55" />
        <el-table-column label="头像" align="center" width="80">
          <template slot-scope="scope">
            <img :src="scope.row.user.avatar" width="40" height="40" />
          </template>
        </el-table-column>
        <el-table-column
          prop="user.nickname"
          label="昵称"
          width="120"
        />
        <el-table-column
          show-overflow-tooltip
          prop="content"
          label="评论内容"
        />
        <el-table-column label="审核状态" width="100" align="center">
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.reviewFlag"
              active-color="#13ce66"
              inactive-color="#ff4949"
              @change="commentReview(scope.row.id, scope.row.reviewFlag)"
            >
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="评论时间" width="180" />
        <el-table-column prop="updateTime" label="审核时间" width="180" />
        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-popconfirm
              style="margin-left:10px"
              title="确定删除吗？"
              @confirm="deleteComment(scope.row.id)"
            >
              <el-button size="mini" type="danger" slot="reference">
                删除
              </el-button>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        class="pagination-container"
        background
        @size-change="sizeCommentChange"
        @current-change="currentCommentChange"
        :current-page="currentComment"
        :page-size="sizeComment"
        :total="countComment"
        :page-sizes="[10, 20]"
        style="padding-bottom: 1000px"
        layout="total, sizes, prev, pager, next, jumper"
      />
      <span slot="footer" class="dialog-footer">
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  activated() {
    this.doLayout();
  },
  created() {
    this.getDutyList();
    this.getActorList();
    this.getAreaList();
    this.getAgeList();
    this.getMoviePage();
    this.getCategoryList();
  },
  data: function() {
    return {
      loading: true,
      uploadLoading: false,
      actorLoading: false,
      commentLoading: false,
      isDelete: false,
      movieDialog: false,
      actorDialog: false,
      commentDialog: false,
      imageDisabled: false,
      keywords: null,
      currentMovieId: null,
      dialogImageUrl: "",
      dialogVisible: false,
      current: 1,
      currentComment: 1,
      size: 5,
      sizeComment: 10,
      count: 0,
      countComment: 0,
      actorIdList: [],
      actorList: [],
      dutyId: null,
      dutyList: [],
      movieList: [],
      movieIdList: [],
      areaList: [],
      ageList: [],
      categoryList: [],
      movieForm: {},
      actorDutyList: [],
      commentList: [],
      commentIdList: []
    };
  },
  methods: {
    sizeChange(size) {
      this.size = size;
      this.getMoviePage();
    },
    sizeCommentChange(size) {
      this.size = size;
      this.getCommentList();
    },
    currentChange(current) {
      this.current = current;
      this.getMoviePage();
    },
    currentCommentChange(current) {
      this.current = current;
      this.getCommentList();
    },
    selectionChange(movieList) {
      this.movieIdList = [];
      movieList.forEach(item => {
        this.movieIdList.push(item.id);
      });
    },
    selectionCommentChange(commentList) {
      this.commentIdList = [];
      commentList.forEach(item => {
        this.commentIdList.push(item.id);
      });
    },
    searchMovie() {
      this.current = 1;
      this.getMoviePage();
    },
    searchComment() {
      this.currentComment = 1;
      this.getCommentList();
    },
    openMovieDialog(movie) {
      if (movie != null) {
        this.currentMovieId = movie.id;
        let categoryIdList = [];
        movie.categoryList.forEach(item => {
          categoryIdList.push(item.id);
        });
        movie["categoryIdList"] = categoryIdList;
        movie["areaId"] = movie.area.id;
        movie["ageId"] = movie.age.id;
        this.movieForm = JSON.parse(JSON.stringify(movie));
        delete this.movieForm.categoryList;
        delete this.movieForm.area;
        delete this.movieForm.age;
        this.$refs.movieTitle.innerHTML = "电影详情";
      } else {
        this.movieForm = {};
        this.imageList = [];
        this.$refs.movieTitle.innerHTML = "添加电影";
      }
      this.movieDialog = true;
    },
    openActorDialog(movie) {
      this.actorIdList = [];
      this.dutyId = null;
      this.currentMovieId = movie.id;
      this.getMovieActorDutyList();
      this.$refs.actorTitle.innerHTML = movie.nameCn + "演员详情";
      this.actorDialog = true;
    },
    openCommentDialog(movie) {
      this.commentList = [];
      this.keywords = null;
      this.currentMovieId = movie.id;
      this.getCommentList();
      this.$refs.commentTitle.innerHTML = movie.nameCn + "评论详情";
      this.commentDialog = true;
    },
    getDutyList() {
      this.axios.get("/api/duty/list").then(({ data }) => {
        if (data.code === 200) {
          this.dutyList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    getActorList() {
      this.axios.get("/api/actor/list").then(({ data }) => {
        if (data.code === 200) {
          this.actorList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    getAreaList() {
      this.axios.get("/api/area/list").then(({ data }) => {
        if (data.code === 200) {
          this.areaList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    getAgeList() {
      this.axios.get("/api/age/list").then(({ data }) => {
        if (data.code === 200) {
          this.ageList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    getMoviePage() {
      this.loading = true;
      this.axios
        .get("/api/movie", {
          params: {
            current: this.current,
            size: this.size,
            keyword: this.keywords
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.movieList = data.data.recordList;
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
    getMovieActorDutyList() {
      this.actorLoading = true;
      this.axios
        .get("/api/movie/actor", {
          params: {
            movieId: this.currentMovieId
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.actorDutyList = data.data;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message
            });
          }
          this.actorLoading = false;
        });
    },
    getCategoryList() {
      this.axios.get("/api/category/list").then(({ data }) => {
        if (data.code === 200) {
          this.categoryList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    getCommentList() {
      this.commentLoading = true;
      this.axios
        .get("/api/comment", {
          params: {
            current: this.currentComment,
            size: this.sizeComment,
            movieId: this.currentMovieId,
            keywords: this.keywords
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.commentList = data.data.recordList;
            this.countComment = data.data.count;
            this.commentLoading = false;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message
            });
          }
        });
    },
    addOrEditMovie() {
      this.axios.post("/api/movie", this.movieForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getMoviePage();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.movieDialog = false;
      });
    },
    deleteMovie(id) {
      let param = {};
      if (id != null) {
        param = { data: [id] };
      } else {
        param = { data: this.movieIdList };
      }
      this.axios.delete("/api/movie", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getMoviePage();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.isDelete = false;
      });
    },
    deleteComment(id) {
      let param = {};
      if (id != null) {
        param = { data: [id] };
      } else {
        param = { data: this.commentIdList };
      }
      this.axios.delete("/api/comment", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getCommentList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.isDelete = false;
      });
    },
    commentReview(id, reviewFlag) {
      let param = {};
      if (id != null) {
        param["commentIds"] = [id];
      } else {
        param["commentIds"] = this.commentIdList;
      }
      param["reviewFlag"] = reviewFlag;
      this.axios.put("/api/comment", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.getCommentList();
      });
    },
    saveMovieActorDuty() {
      let saveForm = {};
      saveForm["movieId"] = this.currentMovieId;
      saveForm["actorIdList"] = this.actorIdList;
      saveForm["dutyId"] = this.dutyId;
      this.axios.post("/api/movie/actor", saveForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getMovieActorDutyList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.movieDialog = false;
      });
      this.actorIdList = [];
      this.dutyId = null;
    },
    deleteMovieActorDuty(dutyId, actorId) {
      let param = {
        data: {
          movieId: this.currentMovieId,
          actorIdList: [actorId],
          dutyId: dutyId
        }
      };
      this.axios.delete("/api/movie/actor", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getMovieActorDutyList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    handleBeforeUpload() {
      this.uploadLoading = true;
    },
    handleImageUploadSuccess(response) {
      this.uploadLoading = false;
      if (response.code === 200) {
        this.$notify.success({
          title: "成功",
          message: response.message
        });
        this.movieForm.image = response.data;
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