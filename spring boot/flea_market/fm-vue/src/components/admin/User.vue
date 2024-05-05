<template>
  <div>
    <div style="border-bottom: #b9bbbe 1px solid">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="line-height: 20px;margin-bottom: 20px;font-size: 15px">
        <el-breadcrumb-item>用户管理</el-breadcrumb-item>
        <el-breadcrumb-item>用户列表</el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div style="display: flex">
      <el-input v-model="form_query.name" placeholder="输入用户名" style="margin-left:30%;margin-right: 10px;margin-top: 20px;margin-bottom:20px;width: 360px">
        <el-button slot="append" type="primary" @click="handleQuery(form_query.name)">查询</el-button>
      </el-input>
      <el-button type="primary"  icon="el-icon-edit" @click="add" style="margin-right: 30%;margin-top: 20px;margin-bottom: 20px"></el-button>
      <el-dialog
          title="新增用户" :visible.sync="dialogVisible" width="30%" style="text-align: center">
        <el-form ref="form_add" :model="form_add" label-width="80px" :rules="add_rules">
          <el-form-item label="用户名" :required="true" prop="username">
            <el-input v-model="form_add.username"></el-input>
          </el-form-item>
          <el-form-item label="昵称" :required="true" prop="nickname">
            <el-input v-model="form_add.nickname"></el-input>
          </el-form-item>
          <el-form-item label="电话号码" :required="true" prop="phone">
            <el-input v-model="form_add.phone"></el-input>
          </el-form-item>
          <el-form-item label="性别" :required="true"  prop="sex">
            <el-radio-group v-model="form_add.sex">
              <el-radio label="男"></el-radio>
              <el-radio label="女"></el-radio>
            </el-radio-group>
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
      <el-table-column prop="id" label="ID" width="60" align="center">
        <template slot-scope="scope">
          {{ (scope.$index+1)+(page-1)*pageSize }}
        </template>
      </el-table-column>
      <el-table-column prop="username" label="用户名" width="120" align="center">
      </el-table-column>
      <el-table-column prop="nickname" label="昵称" width="120" align="center">
      </el-table-column>
      <el-table-column prop="avatar" label="头像" align="center">
        <template slot-scope="{ row }">
          <el-image :src="getImage(row.avatar)"
                    :preview-src-list="[`http://localhost:8090/common/download?name=${row.avatar}`]"
                    style="width: 50px; height: 50px">
          </el-image>
        </template>
      </el-table-column>
      <el-table-column prop="point" label="信誉积分" width="80" align="center">
      </el-table-column>
      <el-table-column prop="phone" label="电话号码" width="150" align="center">
      </el-table-column>
      <el-table-column prop="role" label="角色" width="150" align="center">
        <template slot-scope="scope">
          <el-tag :type="String(scope.row.role) === '0' ? 'danger' : 'primary'">
            {{ String(scope.row.role) === '0' ? '系统管理员' : '普通用户' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="status" label="状态" width="80" align="center">
        <template slot-scope="scope">
          <el-switch :value="scope.row.status" :active-value="1" :inactive-value="0" @change="handleChangeStatus($event,scope.row)"></el-switch>
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
          <el-dialog
              title="编辑用户" :visible.sync="edit_dialogVisible"
              width="40%" >
            <el-form ref="form_edit" :model="form_edit" :rules="edit_rules" label-width="80px">
              <div>
                <div style="display: inline-block;margin-left: 5px">
                  <el-form-item label="用户名" style="alignment: left" prop="username">
                    <el-input v-model="form_edit.username"></el-input>
                  </el-form-item>
                  <el-form-item label="密码" style="alignment: left" prop="password">
                    <el-input v-model="form_edit.password"></el-input>
                  </el-form-item>
                </div>
                <div style="display: inline-block">
                  <el-form-item>
                    <el-upload
                        class="avatar-uploader"
                        action="http://localhost:8090/common/upload"
                        :show-file-list="true"
                        :on-success="handleAvatarSuccess"
                        ref="upload"
                        v-model="form_edit.avatar">
                      <img v-if="imageUrl" :src="imageUrl" class="avatar" style="width: 100px; height: 100px">
                      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    </el-upload>
                  </el-form-item>
                </div>
              </div>
              <div>
                <el-form-item label="昵称" prop="nickname">
                  <el-input v-model="form_edit.nickname"></el-input>
                </el-form-item>
                <el-form-item label="性别" prop="sex">
                  <el-radio-group v-model="form_edit.sex">
                    <el-radio label="男"></el-radio>
                    <el-radio label="女"></el-radio>
                  </el-radio-group>
                </el-form-item>
                <el-form-item label="生日" prop="birthday">
                  <el-date-picker
                      v-model="form_edit.birthday" type="date" placeholder="选择日期">
                  </el-date-picker>
                </el-form-item>
                <el-form-item label="电话号码" prop="phone">
                  <el-input v-model="form_edit.phone"></el-input>
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                  <el-input v-model="form_edit.email"></el-input>
                </el-form-item>
                <el-form-item label="信誉积分" prop="point">
                  <el-input v-model="form_edit.point"></el-input>
                </el-form-item>
                <el-form-item label="状态" prop="status">
                  <el-radio-group v-model="form_edit.status">
                    <el-radio label="1">启用</el-radio>
                    <el-radio label="0">禁用</el-radio>
                  </el-radio-group>
                </el-form-item>
              </div>
            </el-form>
            <span slot="footer" class="dialog-footer">
              <el-button @click="edit_dialogVisible = false">取 消</el-button>
              <el-button type="primary" @click="handleEdit">确 定</el-button>
          </span>
          </el-dialog>
          <el-dialog title="用户详情" :visible.sync="detail_dialogVisible" width="40%" >
            <div style="display: flex;margin-left: 5%;margin-right: 5%">
              <div style="margin: 5px">
                <el-table :show-header="false" :data="detail_table" style="width:380px;margin-top: 10px">
                  <el-table-column label="a" width="100px" prop="column1"></el-table-column>
                  <el-table-column label="b" width="280px" prop="column2"></el-table-column>
                </el-table>
              </div>
              <div :data="detail" style="margin: 10px;width: 30%">
                <div style="margin-top: 10px">
                  <el-image style="width:100px;height: 100px"
                            :src="getImage(detail.avatar)"
                            :preview-src-list="[`http://localhost:8090/common/download?name=${detail.avatar}`]">
                  </el-image>
                </div>
              </div>
            </div>
            <span slot="footer" class="dialog-footer">
              <el-button @click="detail_dialogVisible = false">返回</el-button>
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
  name: "User",
  data() {
    //校验手机号
    const validatePhone=(rule,value,callback)=>{
      const r1=/^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])[0-9]{8}$/
      if(!r1.test(value)){
        callback(new Error('手机号码格式错误'))
      }else{
        callback()
      }
    }

    //校验邮箱
    const validateMail = (rule,value,callback) => {
      if(value!=null){
        const r2=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/
        if(!r2.test(value)){
          callback(new Error('邮箱格式错误'))
        }else{
          callback()
        }
      }else{
        callback()
      }
    }

    //校验信誉积分
    const validatePoint = (rule,value,callback) => {
      if(value!=null){
        if(value<0||value>100){
          callback(new Error('信誉积分需在0-100之间'))
        }else{
          callback()
        }
      }else{
        callback()
      }
    }

    return {
      tableData: [],
      page: 1,
      pageSize: 5,
      total: 0,
      dialogVisible:false,
      edit_dialogVisible:false,
      detail_dialogVisible:false,
      imageUrl:'',
      form_status:{
        id:'',
        username:'',
        password:'',
        status:''
      },
      form_query:{
        name:''
      },
      form_add:{
        nickname:'',
        phone:'',
        username:'',
        sex:''
      },
      add_rules:{
        username:[
          { required:true,message:'用户名不能为空',trigger:'blur'}
        ],
        nickname:[
          { required:true,message:'昵称不能为空',trigger:'blur'},
        ],
        sex:[
          { required:true,message:'请选择性别',trigger:'change'}
        ],
        phone:[
          { required:true,message:'手机号码不能为空',trigger:'blur'},
          { validator:validatePhone,trigger:'blur'}
        ]
      },
      form_edit:{
        id:'',
        username:'',
        password:'',
        nickname:'',
        sex:'',
        birthday:'',
        phone:'',
        email:'',
        point:'',
        status:'',
        avatar:''
      },
      edit_rules:{
        username:[
          { required:true,message:'用户名不能为空',trigger:'blur'}
        ],
        password:[
          { required:true,message:'密码不能为空',trigger:'blur'},
          { min:5,message: '长度需大于4位',trigger: 'blur'}
        ],
        nickname:[
          { required:true,message:'昵称不能为空',trigger:'blur'},
        ],
        sex:[
          { required:true,message:'请选择性别',trigger:'change'}
        ],
        birthday:[
          { required:false},
          { type:'date',message:'请选择日期',trigger:'change'},
        ],
        phone:[
          { required:true,message:'手机号码不能为空',trigger:'blur'},
          { validator:validatePhone,trigger:'blur'}
        ],
        email:[
          { validator:validateMail,trigger:'blur'}
        ],
        point:[
          { validator:validatePoint,trigger: 'blur'}
        ],
        status:[
          {required:true,message:'请选择状态',trigger:'change'}
        ]
      },
      detail:{
        id:'',
        username:'',
        password:'',
        nickname:'',
        sex:'',
        birthday:'',
        phone:'',
        email:'',
        point:'',
        status:'',
        avatar:''
      }
    }
  },
  computed:{
    detail_table(){
      return[
        {
          column1:"ID",
          column2:this.detail.id
        },
        {
          column1:"用户名",
          column2:this.detail.username
        },
        {
          column1:"密码",
          column2:this.detail.password
        },
        {
          column1:"昵称",
          column2:this.detail.nickname
        },
        {
          column1:"性别",
          column2:this.detail.sex
        },
        {
          column1:"生日",
          column2:this.detail.birthday
        },
        {
          column1:"手机号码",
          column2:this.detail.phone
        },
        {
          column1:"邮箱",
          column2:this.detail.email
        },
        {
          column1:"信誉积分",
          column2:this.detail.point
        },
        {
          column1:"状态",
          column2:this.detail.status
        }
      ]
    }
  },
  methods:{
    handleChangeStatus($event,row){
      request.get(this.$httpUrl+'/user/'+row.id).then(res=>{
        this.form_status.id=res.data.data.id
        this.form_status.username=res.data.data.username
        this.form_status.password=res.data.data.password
        this.form_status.status=res.data.data.status
      })
      if($event == 1){
        //启用
        this.$confirm('确认启用吗？','操作确认',{
          confirmButtonText:'确定',
          cancelButtonText:'取消',
          type:'warning',
        }).then(async ()=>{
          this.form_status.status=$event
          await request.put(this.$httpUrl+'/user',this.form_status).then(res=>{
            row.status=(String)(res.data.data.status)
          })
          this.$message.success('启用成功')
          this.loadGet()
        }).catch(()=>{})
      }else{
        //禁用
        this.$confirm('确认禁用吗？','操作确认',{
          confirmButtonText:'确定',
          cancelButtonText:'取消',
          type:'warning',
        }).then(async ()=>{
          this.form_status.status=$event
          await request.put(this.$httpUrl+'/user',this.form_status).then(res=>{
            row.status=(String)(res.data.data.status)
          })
          this.$message.success('禁用成功')
          this.loadGet()
        }).catch(()=>{})
      }
    },
    add(){
      this.dialogVisible=true
    },
    save(){
      this.$refs.form_add.validate((valid)=>{
        if(valid){
          request.post(this.$httpUrl+'/user',this.form_add).then(res=>{

            //console.log(res.data.code)
            if(res.data.code===1){
              alert(res.data.data)
              this.dialogVisible = false
              this.initForm()
              this.loadGet()
            }else if(res.data.code===2){
              alert(res.data.msg)
            }else{
              alert(res.data.msg)
            }
          })
        }else{
          console.log('error submit!')
          return false
        }
      })
    },
    handleQuery(name) {
      if(name!=null){
        request.get(this.$httpUrl+'/user/page?page='+this.page+'&pageSize='+this.pageSize+'&name='+name).then(res=>{
          this.tableData = res.data.data.records
          this.total = res.data.data.total
        })
      }else{
        this.loadGet()
      }
    },
    edit(row){
      request.get(this.$httpUrl+'/user/'+row.id).then(res=>{
        // console.log(this.form_edit.birthday)
        this.form_edit.id=res.data.data.id
        this.form_edit.username=res.data.data.username
        this.form_edit.password=res.data.data.password
        this.form_edit.nickname=res.data.data.nickname
        this.form_edit.sex=res.data.data.sex
        this.form_edit.birthday=res.data.data.birthday
        this.form_edit.phone=res.data.data.phone
        this.form_edit.email=res.data.data.email
        this.form_edit.point=res.data.data.point
        this.form_edit.status=(String)(res.data.data.status)
        console.log(res.data.data.avatar)
        this.form_edit.avatar=res.data.data.avatar
        if(res.data.data.avatar!=null)
        {
          this.imageUrl=`http://localhost:8090/common/download?name=${res.data.data.avatar}`
        }else{
          this.imageUrl=''
        }
        this.edit_dialogVisible=true

      })
    },
    handleEdit() {
      this.$refs.form_edit.validate((valid)=>{
        if(valid){
          request.put(this.$httpUrl+'/user',this.form_edit).then(res=>{
            if(res.data.code===1){
              alert(res.data.data)
              this.edit_dialogVisible=false
              // console.log("hh"+this.form_edit.avatar)
              this.loadGet()
            }else {
              alert(res.data.msg)
            }
          })
        }else {
          console.log(this.form_edit.birthday)
          console.log('error submit!')
          return false
        }
      })

    },
    handleAvatarSuccess(res){
      // console.log("handleAvatarSuccess:"+res.data)
      this.imageUrl=`http://localhost:8090/common/download?name=${res.data}`
      this.form_edit.avatar=res.data
      // console.log(this.form_edit.avatar)
    },
    getImage(avatar){
      return `http://localhost:8090/common/download?name=${avatar}`
    },
    handleList(row){
      request.get(this.$httpUrl+'/user/'+row.id).then(res=>{
        this.detail.id=res.data.data.id
        this.detail.username=res.data.data.username
        this.detail.password=res.data.data.password
        this.detail.nickname=res.data.data.nickname
        this.detail.sex=res.data.data.sex
        this.detail.birthday=res.data.data.birthday
        this.detail.phone=res.data.data.phone
        this.detail.email=res.data.data.email
        this.detail.point=res.data.data.point
        if(res.data.data.status===1){
          this.detail.status="启用"
        }else{
          this.detail.status="禁用"
        }
        this.detail.avatar=res.data.data.avatar
        this.detail_dialogVisible=true
      })
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
      request.get(this.$httpUrl + '/user/page?page=' + this.page + '&pageSize=' + this.pageSize).then(res => {
        console.log(res.data.data)
        this.tableData = res.data.data.records
        this.total = res.data.data.total
      })
    },
    initForm(){
      this.form_add.nickname=""
      this.form_add.phone=''
      this.form_add.sex=''
      this.form_add.username=''
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