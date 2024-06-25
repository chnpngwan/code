<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="资产编号" prop="num">
        <el-input
          v-model="queryParams.num"
          placeholder="请输入资产编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="资产状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择资产状态" clearable>
          <el-option
            v-for="dict in dict.type.asset_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="资产名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入资产名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="资产类别" prop="classifyId">
        <el-select v-model="queryParams.classifyId" placeholder="请选择资产类别" clearable>
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="产品序列号" label-width="100"  prop="snNum">
        <el-input
          v-model="queryParams.snNum"
          placeholder="请输入产品序列号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="来源" label-width="60" prop="sourceId">
        <el-select v-model="queryParams.sourceId" placeholder="请选择来源" clearable>
          <el-option
            v-for="dict in dict.type.asset_source"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="购入时间">
        <el-date-picker
          v-model="daterangePurchaseTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['asset:assetinfo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['asset:assetinfo:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['asset:assetinfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['asset:assetinfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="assetinfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="资产编号" align="center" prop="num" />
      <el-table-column label="资产状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.asset_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="资产名称" align="center" prop="name" />
      <el-table-column label="资产类别" align="center" prop="classifyId">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.classifyId"/>
        </template>
      </el-table-column>
      <el-table-column label="资产照片" align="center" prop="photo" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.photo" :width="50" :height="50"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="规格型号" align="center" prop="type" />-->
      <el-table-column label="金额" align="center" prop="amount" />
<!--      <el-table-column label="计量单位" align="center" prop="unit" />-->
      <el-table-column label="产品序列号"  width="100" align="center" prop="snNum" />
      <el-table-column label="所属公司" align="center" prop="companyId">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.companyId"/>
        </template>
      </el-table-column>
      <el-table-column label="所属部门" align="center" prop="deptId">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.deptId"/>
        </template>
      </el-table-column>
      <el-table-column label="存放地点" align="center" prop="place" />
      <el-table-column label="来源" align="center" prop="sourceId">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.asset_source" :value="scope.row.sourceId"/>
        </template>
      </el-table-column>
      <el-table-column label="购入时间" align="center" prop="purchaseTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.purchaseTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建人" align="center" prop="createUser" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="区域" align="center" prop="region">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.region"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['asset:assetinfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['asset:assetinfo:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改资产入库对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="900px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">

        <el-row>
          <el-col :span="24" style="font-size: 17px;font-weight: bold;">基本信息</el-col>
        </el-row>
        <el-row style="padding-bottom: 20px;">
          <el-col :span="24"><hr/></el-col>
        </el-row>

        <el-row>
          <el-col :span="8">
            <el-form-item label="资产名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入资产名称" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="资产类别" prop="classifyId">
              <el-select v-model="form.classifyId" placeholder="请选择资产类别">
                <el-option
                  v-for="dict in classifys"
                  :key="dict.id"
                  :label="dict.name"
                  :value="parseInt(dict.id)"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="资产编号" prop="num">
              <el-input v-model="form.num" placeholder="请输入资产编号" />
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="8">
            <el-form-item label="规格型号" prop="type">
              <el-input v-model="form.type" placeholder="请输入规格型号" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="SN型号" prop="snNum">
              <el-input v-model="form.snNum" placeholder="请输入产品序列号" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="计量单位" prop="unit">
              <el-input v-model="form.unit" placeholder="请输入计量单位" />
            </el-form-item>
          </el-col>
        </el-row>


        <el-row>
          <el-col :span="8">
            <el-form-item label="来源" prop="sourceId">
              <el-select v-model="form.sourceId" placeholder="请选择来源">
                <el-option
                  v-for="dict in dict.type.asset_source"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="购入时间" prop="purchaseTime">
              <el-date-picker clearable
                              v-model="form.purchaseTime"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="请选择购入时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="金额" prop="amount">
              <el-input v-model="form.amount" placeholder="请输入金额" />
            </el-form-item>
          </el-col>
        </el-row>



        <el-row>
          <el-col :span="8">
            <el-form-item label="区域" prop="region">
<!--            v-model: 数据绑定
                :options ： 动态显示的数据
    -->
              <el-cascader
                v-model="form.region"
                :options="regions"></el-cascader>

<!--              <el-select v-model="form.region" placeholder="请选择区域">-->
<!--                <el-option-->
<!--                  v-for="dict in regions"-->
<!--                  :key="dict.id"-->
<!--                  :label="dict.name"-->
<!--                  :value="dict.id"-->
<!--                ></el-option>-->
<!--              </el-select>-->

            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="所属公司" prop="companyId">
              <el-select v-model="form.companyId" placeholder="请选择所属公司">
                <el-option
                  v-for="dict in dict.type.sys_user_sex"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="创建人" prop="createUser">
              <el-input v-model="form.createUser" placeholder="请输入创建人" />
            </el-form-item>
          </el-col>

        </el-row>


        <el-row>
          <el-col :span="8">
            <el-form-item label="资产状态" prop="status">
              <el-select v-model="form.status" placeholder="请选择资产状态">
                <el-option
                  v-for="dict in dict.type.asset_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>

          </el-col>
          <el-col :span="8">
            <el-form-item label="所属部门" prop="deptId">
              <el-select v-model="form.deptId" placeholder="请选择所属部门">
                <el-option
                  v-for="dict in dict.type.sys_user_sex"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>

          </el-col>
          <el-col :span="8">
            <el-form-item label="存放地点" prop="place">
              <el-input v-model="form.place" placeholder="请输入存放地点" />
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="24" style="font-size: 17px;font-weight: bold;">其他信息</el-col>
        </el-row>
        <el-row style="padding-bottom: 20px;">
          <el-col :span="24"><hr/></el-col>
        </el-row>

        <el-form-item label="资产照片" prop="photo">
          <image-upload v-model="form.photo"/>
        </el-form-item>

        <el-form-item label="备注">
          <editor v-model="form.remark" :min-height="192"/>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAssetinfo, getAssetinfo, delAssetinfo, addAssetinfo, updateAssetinfo } from "@/api/asset/assetinfo";
import { listClassify } from "@/api/asset/classify";
import { listRegion } from "@/api/asset/region";
export default {
  name: "Assetinfo",
  dicts: ['asset_source', 'sys_user_sex', 'asset_status'],
  data() {
    return {
      // 资产分类集合对象
      classifys:[],
      // 素有的区域集合对象
      regions:[],

      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 资产入库表格数据
      assetinfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 区域时间范围
      daterangePurchaseTime: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        num: null,
        status: null,
        name: null,
        classifyId: null,
        snNum: null,
        sourceId: null,
        purchaseTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        num: [
          { required: true, message: "资产编号不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "资产状态不能为空", trigger: "change" }
        ],
        name: [
          { required: true, message: "资产名称不能为空", trigger: "blur" }
        ],
        classifyId: [
          { required: true, message: "资产类别不能为空", trigger: "change" }
        ],
        type: [
          { required: true, message: "规格型号不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "金额不能为空", trigger: "blur" }
        ],
        unit: [
          { required: true, message: "计量单位不能为空", trigger: "blur" }
        ],
        snNum: [
          { required: true, message: "产品序列号不能为空", trigger: "blur" }
        ],
        companyId: [
          { required: true, message: "所属公司不能为空", trigger: "change" }
        ],
        deptId: [
          { required: true, message: "所属部门不能为空", trigger: "change" }
        ],
        place: [
          { required: true, message: "存放地点不能为空", trigger: "blur" }
        ],
        sourceId: [
          { required: true, message: "来源不能为空", trigger: "change" }
        ],
        purchaseTime: [
          { required: true, message: "购入时间不能为空", trigger: "blur" }
        ],
        createUser: [
          { required: true, message: "创建人不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        region: [
          { required: true, message: "区域不能为空", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    //  定义一个函数，从数据库中查询所有的资产分类信息
    getClassifys(){
      listClassify().then(response => {
       // console.log(response.data)
        this.classifys = response.data;
      });
    },
    // 定义一个函数，从数据库中动态的获取区域信息
    getRegions(){
      listRegion().then(response => {
        // this.regions = response.data;
        // console.log(this.regions)
        // console.log(this.handleTree(response.data, "id", "parentId"))

        const options = response.data;
        const map = new Map();
        for (const { id, name, parentId } of options) {
          map.set(id, { value: name, label: name, parentId: parentId })
        }
        const top = [];
        for (const obj of map.values()) {
          const parent = map.get(obj.parentId);
          if (parent !== undefined) {
            parent.children ??= [];
            parent.children.push(obj);
          } else {
            top.push(obj);
          }
        }
        this.regions = top;
      });
    },

    /** 查询资产入库列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangePurchaseTime && '' != this.daterangePurchaseTime) {
        this.queryParams.params["beginPurchaseTime"] = this.daterangePurchaseTime[0];
        this.queryParams.params["endPurchaseTime"] = this.daterangePurchaseTime[1];
      }
      listAssetinfo(this.queryParams).then(response => {
        this.assetinfoList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        num: null,
        status: null,
        name: null,
        classifyId: null,
        photo: null,
        type: null,
        amount: null,
        unit: null,
        snNum: null,
        companyId: null,
        deptId: null,
        place: null,
        sourceId: null,
        purchaseTime: null,
        createUser: null,
        createTime: null,
        remark: null,
        region: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangePurchaseTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加资产入库";
      // 动态的获取所有的资产分类信息
      this.getClassifys()
      // 动态的获取所有的区域信息
      this.getRegions();

    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAssetinfo(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改资产入库";
        // 动态的获取所有的资产分类信息
        this.getClassifys()
        // 动态的获取所有的区域信息
        this.getRegions();
        // 把从数据库查询的数据（华北区-黑龙江）转为对应的数组[华北区,黑龙江]
        if(this.form.region){
          let regs = this.form.region.split('-');
          this.form.region= [regs[0],regs[1]];
        }

      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 把地区的值转为对应的  华北区-黑龙江
          this.form.region = this.form.region[0]+"-"+this.form.region[1];

          if (this.form.id != null) {
            updateAssetinfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAssetinfo(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除资产入库编号为"' + ids + '"的数据项？').then(function() {
        return delAssetinfo(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('asset/assetinfo/export', {
        ...this.queryParams
      }, `assetinfo_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
