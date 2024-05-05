<template>
  <div>
    <div style="border-bottom: #b9bbbe 1px solid">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="line-height: 20px;margin-bottom: 20px;font-size: 15px">
        <el-breadcrumb-item>分类管理</el-breadcrumb-item>
        <el-breadcrumb-item>分类列表</el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div style="display: flex;margin-top: 20px">
        <el-input v-model="formInline.name" placeholder="输入分类名称" style="width: 30%;margin-right: 10px;margin-left: 400px;margin-bottom: 20px">
          <el-button slot="append" type="primary" icon="el-icon-search" @click="handleQuery(formInline.name)"></el-button>
        </el-input>
        <el-button type="primary" icon="el-icon-edit" @click="add" style="margin-bottom: 20px"></el-button>

        <el-dialog
            title="新增分类" :visible.sync="dialogVisible"
            width="30%" >
          <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="分类名称" :required="true">
              <el-input v-model="form.name"></el-input>
            </el-form-item>
            <el-form-item label="顺序" :required="true">
              <el-input v-model="form.sort"></el-input>
            </el-form-item>
            <el-form-item label="描述" :required="false">
              <el-input v-model="form.description" type="textarea"></el-input>
            </el-form-item>
          </el-form>
          <span slot="footer" class="dialog-footer">
              <el-button @click="dialogVisible = false">取 消</el-button>
              <el-button type="primary" @click="save">确 定</el-button>
          </span>
        </el-dialog>
    </div>

    <el-table :data="tableData">
      <el-table-column
          type="selection"
          width="55">
      </el-table-column>
      <el-table-column prop="id" label="ID" width="80" align="center">
        <template slot-scope="scope">
          {{ (scope.$index+1)+(page-1)*pageSize }}
        </template>
      </el-table-column>
      <el-table-column prop="name" label="分类名称" width="200" align="center">
      </el-table-column>
      <el-table-column prop="sort" label="顺序" width="120" align="center">
      </el-table-column>
      <el-table-column prop="status" label="状态" width="120" align="center">
        <template slot-scope="scope">
          <el-tag :type="String(scope.row.status) === '0' ? 'danger' : 'primary'">
            {{ scope.row.status===0?"禁用":"正常" }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="description" label="描述" width="500" align="center">
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button
              size="mini" type="primary" style="margin-right: 5px"
              @click="edit(scope.row)">编辑</el-button>
          <el-dialog
              title="修改分类" :visible.sync="edit_dialogVisible" width="30%">
            <el-form ref="form1" :model="form1" label-width="80px">
              <el-form-item label="分类名称" :required="true">
                <el-input v-model="form1.name"></el-input>
              </el-form-item>
              <el-form-item label="顺序" :required="true">
                <el-input v-model="form1.sort"></el-input>
              </el-form-item>
              <el-form-item label="描述" :required="false">
                <el-input v-model="form1.description" type="textarea"></el-input>
              </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
              <el-button @click="edit_dialogVisible = false">取 消</el-button>
              <el-button type="primary" @click="handleEdit">确 定</el-button>
          </span>
          </el-dialog>
          <el-popconfirm
              title="确定删除吗？" @confirm="handleDelete(scope.row.id)">
            <el-button slot="reference" size="mini" type="danger" margin_left="5px">删除</el-button>
          </el-popconfirm>
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
  name: "Category",
  data() {
    return {
      tableData: [],
      page: 1,
      pageSize: 5,
      total: 0,
      input: '',
      dialogVisible:false,
      edit_dialogVisible:false,
      form:{
        name:'',
        sort:'',
        description:''
      },
      form1:{
        id:'',
        name:'',
        sort:'',
        description: ''
      },
      formInline:{
        name:''
      }
    }
  },
  methods:{
    add(){
      this.dialogVisible=true
    },
    save(){
      request.post(this.$httpUrl + '/category/save',this.form).then(res=>{
        //console.log(res)
        if(res.data.code===1){
          alert('新增分类成功！')
          this.dialogVisible=false
          this.initForm()
          this.loadGet()
        }else{
          alert('新增分类失败！')
        }
      })
    },
    handleDelete(id){
      //console.log(id)
      request.delete(this.$httpUrl+'/category?id='+id).then(res=>{
         //console.log(res)
         if(res.data.code===1){
           console.log('删除成功！')
           this.loadGet()
         }else {
           alert('已关联商品，不允许删除！')
         }
      })
      this.loadGet();
    },
    edit(row){
      //console.log(row)
      //给表单赋值
      request.get(this.$httpUrl+'/category/'+row.id).then(res=>{
        this.form1.id=res.data.data.id
        this.form1.name=res.data.data.name
        this.form1.sort=res.data.data.sort
        this.form1.description=res.data.data.description
        this.edit_dialogVisible=true
      })
    },
    handleEdit(){
      request.put(this.$httpUrl + '/category',this.form1).then(res=>{
        //console.log(res)
        if(res.data.code===1){
          alert('修改分类成功！')
          this.edit_dialogVisible=false
          this.loadGet()
        }else{
          alert('修改分类失败！')
        }
      })
    },
    handleQuery(name){
      //console.log(name)
      if(name!=null){
        request.get(this.$httpUrl+'/category/page?page='+this.page+'&pageSize='+this.pageSize+'&name='+name).then(res=>{
          //console.log(res.data.data)
          this.tableData = res.data.data.records
          this.total = res.data.data.total
        })
      }else{
        this.loadGet()
      }
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
      request.get(this.$httpUrl + '/category/page?page=' + this.page + '&pageSize=' + this.pageSize).then(res => {
        //console.log(res.data.data)
        this.tableData = res.data.data.records
        this.total = res.data.data.total
      })
    },
    initForm() {
      this.form.description=''
      this.form.sort=''
      this.form.name=''
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
