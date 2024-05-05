<template>
  <div>
    <div style="border-bottom: #b9bbbe 1px solid">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="line-height: 20px;margin-bottom: 20px;font-size: 15px">
        <el-breadcrumb-item>商品管理</el-breadcrumb-item>
        <el-breadcrumb-item>商品列表</el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div style="margin-top: 15px;display: flex;margin-left: 20%;margin-right: 20%;margin-bottom: 40px">
      <el-select v-model="value" filterable placeholder="输入分类名称" @change="selectChanged">
        <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value">
        </el-option>
      </el-select>
      <el-input v-model="input" placeholder="输入商品名称">
        <el-button slot="append" @click="handleQuery">查询</el-button>
      </el-input>
    </div>

    <el-table :data="tableData">
        <el-table-column type="selectioin" width="55"></el-table-column>
        <el-table-column prop="id" label="ID" width="80" align="center">
          <template slot-scope="scope">
            {{ (scope.$index+1)+(page-1)*pageSize }}
          </template>
        </el-table-column>
        <el-table-column prop="name" label="商品名称" width="150" align="center">
        </el-table-column>
        <el-table-column prop="categoryName" label="分类名称" width="100" align="center">
        </el-table-column>
        <el-table-column prop="image" label="外观" width="100" align="center">
          <template slot-scope="{ row }">
            <el-image :src="getImage(row.image)"
                      :preview-src-list="[`http://localhost:8090/common/download?name=${row.image}`]"
                      style="width: 50px; height: 50px">
            </el-image>
          </template>
        </el-table-column>
        <el-table-column prop="price" label="价格" width="80" align="center">
        </el-table-column>
        <el-table-column prop="description" label="商品描述" width="180" align="center">
        </el-table-column>
        <el-table-column prop="sellerId" label="商家ID" width="150" align="center">
        </el-table-column>
        <el-table-column prop="status" label="状态" width="80" align="center">
          <template slot-scope="scope">
            <el-tag :type="String(scope.row.status)==='0'?'danger':String(scope.row.status)==='1'?'primary':'success'">
              {{ String(scope.row.status)==='0'?'已停售':String(scope.row.status)==='1'?'售卖中':'已售出' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-button
                size="mini" type="success"
                @click="handleList(scope.row)">查看详情</el-button>
            <el-button
                size="mini" type="primary"
                @click="edit(scope.row)">编辑</el-button>
            <el-button
                size="mini" type="danger" @click="Delete(scope.row)">删除</el-button>
            <el-dialog title="商品详情" :visible.sync="detail_dialogVisible" width="40%">
              <div style="display: flex;margin-left: 5%;margin-right: 5%">
                <div style="margin: 5px">
                  <el-table :show-header="false" :data="detail_table" style="width:380px;margin-top: 10px">
                    <el-table-column label="a" width="100px" prop="head_col"></el-table-column>
                    <el-table-column label="b" width="280px" prop="content_col"></el-table-column>
                  </el-table>
                </div>
                <div :data="detail" style="margin: 10px;width: 30%">
                  <div style="margin-top: 10px">
                    <el-image style="width: 100px;height: 100px"
                              :src="getImage(detail.image)"
                              :preview-src-list="[`http://localhost:8090/common/download?name=${detail.image}`]">
                    </el-image>
                  </div>
                </div>
              </div>
              <span slot="footer" class="dialog-footer">
                <el-button @click="detail_dialogVisible=false">返回</el-button>
              </span>
            </el-dialog>
            <el-dialog title="编辑商品" :visible.sync="edit_dialogVisible" width="40%">
              <el-form ref="edit_form" :model="edit_form" label-width="80px" :rules="edit_rules">
                <div style="display: flex;margin-left: 5%;margin-right: 5%">
                  <div style="margin: 5px">
                    <el-form-item label="商品名称" style="alignment: left" prop="name">
                      <el-input v-model="edit_form.name"></el-input>
                    </el-form-item>
                    <el-form-item label="所属分类" style="alignment: left" prop="categoryName">
                      <el-input v-model="edit_form.categoryName"></el-input>
                    </el-form-item>
                    <el-form-item label="价格" style="alignment: left" prop="price">
                      <el-input v-model="edit_form.price"></el-input>
                    </el-form-item>
                    <el-form-item label="商品描述" style="alignment: left" prop="description">
                      <el-input v-model="edit_form.description"></el-input>
                    </el-form-item>
                  </div>
                  <div style="margin: 5px;width: 30%">
                    <el-form-item >
                      <el-upload
                          class="image-uploader"
                          action="http://localhost:8090/common/upload"
                          :show-file-list="true"
                          :on-success="handleImageSuccess"
                          ref="upload"
                          v-model="edit_form.image">
                        <img v-if="imageUrl" :src="imageUrl" style="width: 100px;height: 100px">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                      </el-upload>
                    </el-form-item>
                  </div>
                </div>
              </el-form>
              <span slot="footer" class="dialog-footer">
                <el-button @click="edit_dialogVisible=false">取消</el-button>
                <el-button type="primary" @click="handleEdit">确定</el-button>
              </span>
            </el-dialog>
            <el-dialog title="确定删除吗？" :visible.sync="delete_dialogVisible" width="20%">
              <span slot="footer" class="dialog-footer">
                <el-button @click="delete_dialogVisible=false">取消</el-button>
                <el-button type="primary" @click="handleDelete">确定</el-button>
              </span>
            </el-dialog>
          </template>
        </el-table-column>
      </el-table>

    <div class="block">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="page"
          :page-sizes="[5,10]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          align="center">
      </el-pagination>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "Commodity",
  data(){
    // 校验数字输入只能为数字或两位小数
    const validateNum=(rule,value,callback)=>{
      const reg=/^\d+(\.\d{0,2})?$/
      if(!reg.test(value)){
          callback(new Error('价格只能为数字且最多保留两位小数！'))
        }else{
          callback()
        }
    }

    return{
      tableData:[],
      page:1,
      pageSize:5,
      total:0,
      input:'',
      detail_dialogVisible:false,
      edit_dialogVisible:false,
      delete_dialogVisible:false,
      add_dialogVisible:false,
      imageUrl:'',
      delete_id:'',
      value:'全部',
      options:[{
        value: '全部',
        label: '全部'
      }, {
        value: '书籍',
        label: '书籍'
      }, {
        value: '食品',
        label: '食品'
      }, {
        value: '电子数码',
        label: '电子数码'
      }, {
        value: '美妆',
        label: '美妆'
      }, {
        value: '日用洗护',
        label: '日用洗护'
      }, {
        value: '其他',
        label: '其他'
      }],
      form_status:{
        id:'',
        status:''
      },
      detail:{
        id:'',
        name:'',
        categoryName:'',
        price:'',
        image:'',
        description:'',
        sellerId:'',
        status:''
      },
      edit_form:{
        id:'',
        name:'',
        categoryId:'',
        categoryName:'',
        price:'',
        image:'',
        description:'',
        status:'',
        sellerId: ''
      },
      edit_rules:{
        name:[
          {required:true,message:'商品名称不能为空',trigger:'blur'}
        ],
        categoryName:[
          {required:true,message:'所属分类名称不能为空',trigger:'blur'}
        ],
        price:[
          {required:true,message:'价格不能为空',trigger:'blur'},
          {validator:validateNum,trigger:'blur'}
        ],
        description:[
          {required:false}
        ]
      }
    }
  },
  computed:{
    detail_table() {
      return[
        {
          head_col:"ID",
          content_col:this.detail.id
        },
        {
          head_col:"商品名称",
          content_col:this.detail.name
        },
        {
          head_col:"分类名称",
          content_col:this.detail.categoryName
        },
        {
          head_col:"价格",
          content_col:this.detail.price
        },
        {
          head_col:"商品描述",
          content_col:this.detail.description
        },
        {
          head_col:"商家ID",
          content_col:this.detail.sellerId
        },
        {
          head_col:"状态",
          content_col:this.detail.status
        },
      ]
    }
  },
  methods:{
    getImage(image){
      return `http://localhost:8090/common/download?name=${image}`
    },
    handleList(row) {
      request.get(this.$httpUrl+'/commodity/'+row.id).then(res=>{
        // console.log(res.data.data)
        this.detail.id=res.data.data.id
        this.detail.name=res.data.data.name
        this.detail.categoryName=res.data.data.categoryName
        this.detail.price=res.data.data.price
        this.detail.description=res.data.data.description
        this.detail.sellerId=res.data.data.sellerId
        if(res.data.data.status===1){
          this.detail.status="售卖中"
        }else{
          this.detail.status="已停售"
        }
        this.detail.image=res.data.data.image
        this.detail_dialogVisible=true
      })
    },
    edit(row){
      request.get(this.$httpUrl+'/commodity/'+row.id).then(res=>{
        this.edit_form.id=res.data.data.id
        this.edit_form.name=res.data.data.name
        this.edit_form.categoryId=res.data.data.categoryId
        this.edit_form.categoryName=res.data.data.categoryName
        this.edit_form.price=res.data.data.price
        this.edit_form.description=res.data.data.description
        this.edit_form.sellerId=res.data.data.sellerId
        this.edit_form.image=res.data.data.image
        if(res.data.data.image!=null){
          this.imageUrl=`http://localhost:8090/common/download?name=${res.data.data.image}`
        }
        if(res.data.data.status===1){
          this.edit_dialogVisible=true
        }else{
          alert("商品已停售，无法编辑！")
          this.loadGet()
        }
      })
    },
    handleEdit(){
      this.$refs.edit_form.validate((valid)=>{
        if(valid){
          request.put(this.$httpUrl+'/commodity',this.edit_form).then(res=>{
            if(res.data.code===1){
              alert(res.data.data)
              this.edit_dialogVisible=false
              this.loadGet()
            }else{
              alert(res.data.msg)
            }
          })
        }else{
          console.log('error submit')
          return false
        }
      })
    },
    handleImageSuccess(res){
      this.imageUrl=`http://localhost:8090/common/download?name=${res.data}`
      this.edit_form.image=res.data
    },
    Delete(row){
      this.delete_id=row.id
      this.delete_dialogVisible=true
    },
    handleDelete() {
      request.delete(this.$httpUrl+'/commodity?id='+this.delete_id).then(res=>{
        if(res.data.code===1){
          this.delete_dialogVisible=false
          this.$message.success('删除成功！')
          this.loadGet()
        }else{
          this.$message.error('删除失败！')
        }
      })
    },
    selectChanged(value) {
      this.loadGet()
    },
    handleQuery(){
      this.loadGet()
    },
    handleSizeChange(val) {
      // console.log(`每页 ${val} 条`);
      this.pageSize = val
      this.loadGet()
    },
    handleCurrentChange(val) {
      // console.log(`当前页: ${val}`);
      this.page = val
      this.loadGet()
    },
    loadGet(){
      if(this.value=='全部'){
        request.get(this.$httpUrl + '/commodity/pageByCategoryManagement?page=' + this.page + '&pageSize=' + this.pageSize+'&categoryName='+'&name='+this.input).then(res => {
          //console.log(res.data.data)
          this.tableData = res.data.data.records
          this.total = res.data.data.total
        })
      }else{
        request.get(this.$httpUrl + '/commodity/pageByCategoryManagement?page=' + this.page + '&pageSize=' + this.pageSize+'&categoryName='+this.value+'&name='+this.input).then(res => {
          //console.log(res.data.data)
          this.tableData = res.data.data.records
          this.total = res.data.data.total
        })
      }
    }
  },
  beforeMount() {
    //自动获取数据
    this.loadGet();
  }
}
</script>

<style scoped>

</style>