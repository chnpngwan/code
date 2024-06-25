<template>
  <el-card class="main-card">
    <!-- 标题 -->
    <div class="title">{{ this.$route.name }}</div>
    <div class="operation-container">
      <el-button
        type="primary"
        size="small"
        icon="el-icon-plus"
        @click="openCinemaDialog(null)"
      >
        新增影院
      </el-button>
      <el-button
        type="danger"
        size="small"
        icon="el-icon-delete"
        :disabled="this.cinemaIdList.length === 0"
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
      @selection-change="cinemaSelectionChange"
      v-loading="loading"
      :data="cinemaList"
    >
      <el-table-column type="selection" width="55" fixed />
      <el-table-column prop="name" label="影院名称" fixed width="250" />
      <el-table-column prop="telephone" label="电话" width="150" />
      <el-table-column
        prop="address"
        label="地址"
        show-overflow-tooltip
        width="200"
      />
      <el-table-column label="实照（点击可放大预览）" width="200">
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
      <el-table-column prop="brand.name" label="品牌" width="200" />
      <el-table-column prop="district.name" label="行政区" width="200" />
      <el-table-column prop="createTime" label="创建时间" width="200" />
      <el-table-column prop="updateTime" label="更新时间" width="200" />
      <!--操作按钮-->
      <el-table-column fixed="right" label="操作" width="220">
        <template slot-scope="scope">
          <el-button
            type="text"
            size="mini"
            @click="openCinemaDialog(scope.row)"
          >
            <i class="el-icon-view" /> 影院
          </el-button>
          <el-button type="text" size="mini" @click="openHallDialog(scope.row)">
            <i class="el-icon-edit" /> 影厅
          </el-button>
          <el-button
            type="text"
            size="mini"
            @click="openServeDialog(scope.row)"
          >
            <i class="el-icon-edit" /> 服务
          </el-button>
          <el-popconfirm
            title="确定删除吗？"
            style="margin-left:10px"
            @confirm="deleteCinema(scope.row.id)"
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
        <el-button type="primary" @click="deleteCinema(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>

    <el-dialog :visible.sync="cinemaDialog" width="30%">
      <div class="dialog-title-container" slot="title" ref="cinemaTitle" />
      <el-form label-width="80px" size="medium" :model="cinemaForm">
        <el-form-item label="影院名称" label-width="auto">
          <el-input v-model="cinemaForm.name" style="width:360px" />
        </el-form-item>
        <el-form-item label="电话号码" label-width="auto">
          <el-input v-model="cinemaForm.telephone" style="width:360px" />
        </el-form-item>
        <el-form-item label="影院地址" label-width="auto">
          <el-input v-model="cinemaForm.address" style="width:360px" />
        </el-form-item>
        <el-form-item label="影院照片" label-width="auto">
          <el-upload
            drag
            :show-file-list="false"
            action="/api/movie/image"
            :on-success="handleImageUploadSuccess"
            :before-upload="handleBeforeUpload"
            v-loading="uploadLoading"
          >
            <i class="el-icon-upload" v-if="cinemaForm.image === undefined" />
            <div class="el-upload__text" v-if="cinemaForm.image === undefined">
              将文件拖到此处，或<em>点击上传</em>
            </div>
            <el-image
              v-else
              :src="cinemaForm.image"
              width="360px"
              height="180px"
              alt=""
            />
          </el-upload>
        </el-form-item>
        <el-form-item label="影院品牌" label-width="auto">
          <el-select
            v-model="cinemaForm.brandId"
            filterable
            placeholder="请选择影院品牌"
            style="width:360px"
          >
            <el-option
              v-for="item in brandList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="行政区域" label-width="auto">
          <el-select
            v-model="cinemaForm.districtId"
            filterable
            placeholder="请选择影院品牌"
            style="width:360px"
          >
            <el-option
              v-for="item in districtList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="cinemaDialog = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdateCinema">确 定</el-button>
      </span>
    </el-dialog>

    <el-dialog :visible.sync="serveDialog" width="50%">
      <div class="dialog-title-container" slot="title" ref="serveTitle" />
      <el-select
        v-model="serveId"
        filterable
        placeholder="请选择服务"
        style="width:150px"
      >
        <el-option
          v-for="item in serveList"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        >
        </el-option>
      </el-select>
      <el-input
        v-model="information"
        style="width: 495px;margin-left: 10px"
        placeholder="请输入服务信息"
      />
      <el-button
        type="primary"
        icon="el-icon-plus"
        style="margin-left: 10px"
        @click="saveServe"
      >
        添加
      </el-button>
      <el-table border v-loading="serveLoading" :data="serveTable">
        <el-table-column prop="name" label="服务名称" />
        <el-table-column
          show-overflow-tooltip
          prop="information"
          label="详细信息"
        />
        <el-table-column label="操作" width="200" align="center">
          <template slot-scope="scope">
            <el-button type="text" size="mini" @click="updateServe(scope.row)">
              <i class="el-icon-edit" /> 修改
            </el-button>
            <el-popconfirm
              title="确定删除吗？"
              style="margin-left:10px"
              @confirm="deleteServe(scope.row.id)"
            >
              <el-button size="mini" type="text" slot="reference">
                <i class="el-icon-delete" /> 删除
              </el-button>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

    <el-dialog :visible.sync="hallDialog" width="50%">
      <div class="dialog-title-container" slot="title" ref="hallTitle" />
      <el-button
        type="primary"
        size="small"
        icon="el-icon-plus"
        @click="openSaveOrUpdateHallDialog(null)"
      >
        新增影厅
      </el-button>
      <el-table border v-loading="hallLoading" :data="hallList">
        <el-table-column prop="name" label="影厅名称" />
        <el-table-column prop="type.name" label="影厅类型" width="150" />
        <el-table-column prop="seatRow" label="座位行数" />
        <el-table-column prop="seatCol" label="座位列数" />
        <el-table-column prop="state" label="禁用状态">
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.state"
              active-color="#13ce66"
              inactive-color="#ff4949"
              @change="updateState(scope.row)"
            >
            </el-switch>
          </template>
        </el-table-column>
        <!--操作按钮-->
        <el-table-column label="操作" width="200" align="center">
          <template slot-scope="scope">
            <el-button
              type="text"
              size="mini"
              @click="openSaveOrUpdateHallDialog(scope.row)"
            >
              <i class="el-icon-edit" /> 影厅
            </el-button>
            <el-button
              type="text"
              size="mini"
              @click="openSeatDialog(scope.row)"
            >
              <i class="el-icon-edit" /> 座位
            </el-button>
            <el-popconfirm
              title="确定删除吗？"
              style="margin-left:10px"
              @confirm="deleteHall(scope.row.id)"
            >
              <el-button size="mini" type="text" slot="reference">
                <i class="el-icon-delete" /> 删除
              </el-button>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

    <el-dialog :visible.sync="seatDialog" :width="seatDialogWidth">
      <div class="dialog-title-container" slot="title" ref="seatTitle" />

      <div style="display:flex; align-content: center">
        <span style="margin-right: 20px">启用</span>
        <span class="seat" :class="isSelected[0]"></span>
        <span style="margin: 0 20px">禁用</span>
        <span class="seat" :class="isSelected[1]"></span>
      </div>

      <br />

      <div class="row" v-for="(value, key) in seat" :key="key">
        <span>{{ key }}</span>
        <div style="display: flex; justify-content: flex-end">
          <span
            class="seat"
            :class="isSelected[seat[key][index]]"
            @click="pressSeat(key, index)"
            v-for="(item, index) in value"
            :key="index"
          />
        </div>
      </div>

      <span slot="footer" class="dialog-footer">
        <el-button @click="seatDialog = false">取 消</el-button>
        <el-button type="primary" @click="updateSeat">确 定</el-button>
      </span>
    </el-dialog>

    <el-dialog :visible.sync="saveOrUpdateHallDialog" width="30%">
      <div
        class="dialog-title-container"
        slot="title"
        ref="saveOrUpdateHallTitle"
      />
      <el-form label-width="80px" size="medium" :model="hallForm">
        <el-form-item label="影厅名称" label-width="auto">
          <el-input v-model="hallForm.name" style="width:360px" />
        </el-form-item>
        <el-form-item label="影厅类型" label-width="auto">
          <el-select
            v-model="hallForm.typeId"
            filterable
            placeholder="请选择影厅类型"
            style="width:360px"
          >
            <el-option
              v-for="item in typeList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="座位行数" label-width="auto">
          <el-input v-model="hallForm.seatRow" style="width:360px" />
        </el-form-item>
        <el-form-item label="座位列数" label-width="auto">
          <el-input v-model="hallForm.seatCol" style="width:360px" />
        </el-form-item>
        <el-form-item label="禁用状态" label-width="auto">
          <el-switch
            v-model="hallForm.state"
            active-color="#13ce66"
            inactive-color="#ff4949"
          >
          </el-switch>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="hallDialog = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdateHall">确 定</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  created() {
    this.getCinemaList();
    this.getBrandList();
    this.getDistrictList();
    this.getServeList();
  },
  data() {
    return {
      loading: true,
      serveLoading: true,
      uploadLoading: false,
      hallLoading: false,
      hallList: [],
      cinemaDialog: false,
      serveDialog: false,
      seatDialog: false,
      hallDialog: false,
      saveOrUpdateHallDialog: false,
      seatDialogWidth: "100px",
      seat: {},
      isDelete: false,
      currentCinemaId: null,
      currentHallId: null,
      serveId: null,
      information: null,
      typeList: [],
      cinemaList: [],
      cinemaIdList: [],
      serveList: [],
      serveIdList: [],
      serveTable: [],
      brandList: [],
      districtList: [],
      keywords: null,
      current: 1,
      size: 5,
      count: 0,
      cinemaForm: {},
      hallForm: {},
      isSelected: {
        0: "seat-default",
        1: "seat-choose"
      }
    };
  },
  methods: {
    cinemaSelectionChange(cinemaList) {
      this.cinemaIdList = [];
      cinemaList.forEach(item => {
        this.cinemaIdList.push(item.id);
      });
    },
    search() {
      this.current = 1;
      this.getCinemaList();
    },
    sizeChange(size) {
      this.size = size;
      this.getCinemaList();
    },
    currentChange(current) {
      this.current = current;
      this.getCinemaList();
    },
    openCinemaDialog(object) {
      if (object != null) {
        object["brandId"] = object.brand.id;
        object["districtId"] = object.district.id;
        this.cinemaForm = JSON.parse(JSON.stringify(object));
        delete this.cinemaForm.brand;
        delete this.cinemaForm.district;
        this.$refs.cinemaTitle.innerHTML = "修改影院";
      } else {
        this.cinemaForm = {};
        this.$refs.cinemaTitle.innerHTML = "添加影院";
      }
      this.cinemaDialog = true;
    },
    openServeDialog(object) {
      this.currentCinemaId = object.id;
      this.serveId = null;
      this.information = null;
      this.serveDialog = true;
      this.$refs.serveTitle.innerHTML = object.name + "服务详情";
      this.getServeTable();
    },
    openHallDialog(object) {
      this.currentCinemaId = object.id;
      this.typeId = null;
      this.name = null;
      this.hallDialog = true;
      this.$refs.hallTitle.innerHTML = object.name + "影厅详情";
      this.getHallList();
      this.getTypeList();
    },
    openSeatDialog(object) {
      this.currentHallId = object.id;
      this.$refs.seatTitle.innerHTML = object.name + "修改座位";
      this.seat = JSON.parse(object.seatJson);
      this.seatDialogWidth = 200 + object.seatRow * 40 + "px";
      this.seatDialog = true;
    },
    openSaveOrUpdateHallDialog(object) {
      if (object != null) {
        object["typeId"] = object.type.id;
        this.hallForm = JSON.parse(JSON.stringify(object));
        delete this.hallForm.type;
      } else {
        this.hallForm = {};
      }
      this.saveOrUpdateHallDialog = true;
    },
    getCinemaList() {
      this.loading = true;
      this.axios
        .get("/api/cinema", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.cinemaList = data.data.recordList;
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
    getServeTable() {
      this.serveLoading = true;
      this.axios
        .get("/api/cinema/serve", {
          params: {
            cinemaId: this.currentCinemaId
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.serveTable = data.data;
            this.serveLoading = false;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message
            });
          }
        });
    },
    getServeList() {
      this.axios.get("/api/serve/list").then(({ data }) => {
        if (data.code === 200) {
          this.serveList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    getBrandList() {
      this.axios.get("/api/brand/list").then(({ data }) => {
        if (data.code === 200) {
          this.brandList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    getTypeList() {
      this.axios.get("/api/type/list").then(({ data }) => {
        if (data.code === 200) {
          this.typeList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    getDistrictList() {
      this.axios.get("/api/district/list").then(({ data }) => {
        if (data.code === 200) {
          this.districtList = data.data;
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    getHallList() {
      this.hallLoading = true;
      this.axios
        .get("/api/cinema/hall", {
          params: {
            cinemaId: this.currentCinemaId
          }
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.hallList = data.data;
            this.hallLoading = false;
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message
            });
          }
        });
    },
    saveOrUpdateCinema() {
      this.axios.post("/api/cinema", this.cinemaForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getCinemaList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
      this.cinemaDialog = false;
    },
    saveOrUpdateHall() {
      if (this.hallForm.cinemaId === undefined) {
        this.hallForm["cinemaId"] = this.currentCinemaId;
      }
      // 无论是新增还是更新都生成新的seatJson，由后端进行校验
      let seatJson = {};
      for (let i = 0; i < this.hallForm.seatRow; i++) {
        let arr = [];
        for (let j = 0; j < this.hallForm.seatCol; j++) {
          arr.push(0);
        }
        seatJson[i + 1] = arr;
      }
      this.hallForm["seatJson"] = JSON.stringify(seatJson);
      this.hallForm.state = this.hallForm.state ? 1 : 0;
      this.axios.post("/api/hall", this.hallForm).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getHallList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
      this.saveOrUpdateHallDialog = false;
    },
    updateServe(serve) {
      this.$prompt("请输入详细信息", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消"
      }).then(({ value }) => {
        let param = {};
        param["id"] = serve.id;
        param["information"] = value;
        delete param.name;
        this.axios.post("/api/cinema/serve", param).then(({ data }) => {
          if (data.code === 200) {
            this.$notify.success({
              title: "成功",
              message: data.message
            });
            this.getServeTable();
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message
            });
          }
        });
      });
    },
    saveServe() {
      let param = {};
      param["cinemaId"] = this.currentCinemaId;
      param["serveId"] = this.serveId;
      param["information"] = this.information;
      this.axios.post("/api/cinema/serve", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getServeTable();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    updateSeat() {
      let param = {};
      param["id"] = this.currentHallId;
      param["seatJson"] = JSON.stringify(this.seat);
      this.axios.put("/api/hall/seat", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getHallList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
      this.seatDialog = false;
    },
    updateState(object) {
      let param = {};
      param["id"] = object.id;
      param["state"] = object.state;
      this.axios.put("/api/hall/state", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getHallList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    deleteCinema(id) {
      let param = {};
      if (id != null) {
        param = { data: [id] };
      } else {
        param = { data: this.cinemaIdList };
      }
      this.axios.delete("/api/cinema", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getCinemaList();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.isDelete = false;
      });
    },
    deleteServe(id) {
      let param = { data: [id] };
      this.axios.delete("/api/cinema/serve", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getServeTable();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
      });
    },
    deleteHall(id) {
      let param = { data: [id] };
      this.axios.delete("/api/hall", param).then(({ data }) => {
        if (data.code === 200) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.getHallList();
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
        this.cinemaForm.image = response.data;
      } else {
        this.$notify.error({
          title: "失败",
          message: response.message
        });
      }
    },
    pressSeat(key, index) {
      this.$set(this.seat[key], index, this.seat[key][index] === 0 ? 1 : 0);
    }
  }
};
</script>

<style scoped>
.row {
  white-space: nowrap;
  margin-top: 10px;
  padding: 0 10px;
  text-align: center;
  display: flex;
  justify-content: space-between;
}
.seat {
  display: inline-block;
  width: 30px;
  height: 26px;
  margin: 0 10px;
  background-position: 0 1px;
}
.seat-default {
  background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAHKSURBVEhLxZfbysIwDMezKeJUVAR9A/H9X0FQZMOLeem14sWc4AnP9muybM4557eT/mCYdLT/tknaqQgJ/ACVf7/Oz4TfbvVisYDlcgm1Wg2SRON0OoGqqtDr9bglAAoHGY1GQgqzl5zz+SyGwyF7z7wITyYTtrJD13W2HrzEuFqtspUdnU4Hbrcbew5fSa5SqfQbYbmzoCgKew5fK6disciWgyd8vV5hPB5DoVAA27bpSct6vQbLsmjFhmFwK0MpJjFNky2H3W4nZEf24rPZbMTlcmFPiPv9LgaDAXu+rNY0jS0HzG5Zh+zFRwo9bS/GuNvtgpwM+SQsVwetVosa/GDnpMhFsfUAJ3I4HMgmYRQIZl1awsbzTyYyqzHRkhK2Yj+RwklwBYMHRpDMhd0tTrXiT52jwCsxCrqPZc3RARLM7O1266V/XMrlMlQqFfYcVqsVZXa9Xo8Wzhq/cOYx/i+e8KeYZIFfgyyMxWw2o4Y8mc/nXty9jz08NqfTKTSbTapBLAt8kh6buDocGh+3xNrtNjQaDbLxRSj7/f7pNolLv98Xx+ORvVfeBla+S3VJ4K7hGO/I7S8MDht2UbjklspRokj+NRQKwB/pWISi3oSUQQAAAABJRU5ErkJggg==")
    no-repeat;
}
.seat-choose {
  background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAKVSURBVEhLxZXPThpRFMY/hhFBG4okbdiYxgXpxmJi0phi4sKlL+HWlSsfwMSFr+DKjSufwMSFiyakaaagQaOxW1txUUjDHwVh5vacmdtxgGEsA1N/yYHLvdzzzT33nDMhQeAFUOT3f+fFhAeGutRs4tfpKV5dXECoqpz9R8hlKxqFsrqK96mUnOzGVfhrsYh3+/tIXV8Dk5Nydkh0HW3a+21zE59WVuTkE33C5/k8PmxvW4ITE/SPkFzxQacDUOS0nR18XFiQkxZ9dzx9dARwaCOR0UQZ9kP29vAQupz6S39y8UmVMeZcOIwInfp54QAQdJDe2LkLt9tAq2Vmp294L/vhe6Zxb13YwrSMvKZRZMIoLy2hvLYG3N/7E+c9FN7f2SzK8/MQiQS0szO5aGFndfHkBJndXSAeNzc2ZmehUw3GCwUru4eBTlpbXETs6grqwwNgGBBkX7a2kF1eNv9inziWy1minFxU/NM3N2jHYr5PbJAPtdGwHpp8hiiS6YMDUPBNTOE6WfL21sxAGx7Xav5KivaIx0fy7kghGqv0QHR+6yd/GGQUcx52M0Idu+0UDn+ORxovLp24i8CEO9SrvQhM+LlL8hQWnJHcBHxYiKvDA7OOqzTobGwgWalYjZ2hjlObm0N7Zmb4kqIkipZKmLq7e6oU8ldJJqHu7YGK1kOYke3OF1xKzvLsEfa+Y34IDrcfc4q6YAsrfDcBozgy3RSeIvuRyVidinsrNfixW7WKn+m0qcXYLwlum9+Pj5G4vITO709KEDaDmrsfFPLBrtnMrkhvqDfr63gt13nBlYZhiFyhIH8Nz2dNE005dmNgcgl6Fxv8dvGJXq9DcIgHYId63LBbvqpBeJfTCHiJMoEJewP8Afy6sw903o8jAAAAAElFTkSuQmCC")
    no-repeat;
}
</style>
