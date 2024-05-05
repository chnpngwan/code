<template>
  <div>
    <h3 model="username">{{ username }}的小店</h3>
  <div align="right" style="margin-right: 260px">
    <el-button type="primary" icon="el-icon-edit" @click="addCommodity"></el-button>
    <el-button type="primary" icon="el-icon-share" @click="showUrl"></el-button>
    <el-dialog title="新增商品" :visible.sync="addVisible" width="40%" style="text-align: center">
      <el-form ref="form_add" :model="form_add" label-width="80px" :rules="add_rules">
        <div style="display: flex;margin-left: 5%;margin-right: 5%">
          <div>
            <el-form-item label="商品名称" prop="name">
              <el-input v-model="form_add.name"></el-input>
            </el-form-item>
            <el-form-item label="所属分类" prop="categoryName">
              <el-select v-model="form_add.categoryName" filterable placeholder="输入分类名称">
                <el-option
                    v-for="item in options"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="价格" prop="price">
              <el-input v-model="form_add.price"></el-input>
            </el-form-item>
            <el-form-item label="描述" prop="description">
              <el-input v-model="form_add.description"></el-input>
            </el-form-item>
          </div>
          <div>
            <el-form-item>
              <el-upload
                  class="avatar-uploader"
                  action="http://localhost:8090/common/upload"
                  :show-file-list="true"
                  :on-success="handleAvatarSuccess"
                  ref="upload"
                  v-model="form_add.image">
                <img v-if="imageUrl" :src="imageUrl" class="avatar" style="width: 100px; height: 100px">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>
            </el-form-item>
          </div>
        </div>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="addVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </span>
    </el-dialog>
  </div>
  <div style="margin-top: 15px;display: flex;margin-left: 15%;margin-right: 15%">
    <el-table
        :data="tableData"
        style="width: 100%;text-align: center">
      <el-table-column
          fixed
          prop="categoryName"
          label="分类"
          width="120"
          align="center">
      </el-table-column>
      <el-table-column
          prop="name"
          label="名称"
          width="150"
          align="center">
      </el-table-column>
      <el-table-column
          prop="image"
          label="图片"
          width="120"
          align="center">
        <template slot-scope="{ row }">
          <el-image :src="getImage(row.image)"
                    :preview-src-list="[`http://localhost:8090/common/download?name=${row.image}`]"
                    style="width: 50px; height: 50px">
          </el-image>
        </template>
      </el-table-column>
      <el-table-column
          prop="price"
          label="售价"
          width="100"
          align="center">
      </el-table-column>
      <el-table-column
          prop="description"
          label="描述"
          width="200"
          align="center">
      </el-table-column>
      <el-table-column
          prop="status"
          label="状态"
          width="100"
          align="center">
        <template slot-scope="scope">
          <el-tag :type="String(scope.row.status) === '0' ? 'danger' : (String(scope.row.status) === '1' ? 'primary' : 'success')">
            {{ String(scope.row.status) === '0' ? '已停售' : (String(scope.row.status) === '1' ? '售卖中' : '已售出') }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button
              size="mini"
              @click="getInformation(scope.row)">查看详情</el-button>
          <el-button
              size="mini"
              type="primary"
              @click="edit(scope.row)">编辑</el-button>
          <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog title="商品详情" :visible.sync="detailVisible1" width="40%">
      <div style="display: flex;margin-left: 5%;margin-right: 5%">
        <div style="margin: 10px;width: 30%">
          <div style="margin-top: 10px">
            <el-image style="width:100px;height: 100px"
                      :src="getImage(detail1.image)"
                      :preview-src-list="[`http://localhost:8090/common/download?name=${detail1.image}`]">
            </el-image>
          </div>
        </div>
        <div style="margin: 5px">
          <el-table :show-header="false" :data="detail_table1" style="width:380px;margin-top: 10px">
            <el-table-column label="a" width="100px" prop="column1"></el-table-column>
            <el-table-column label="b" width="280px" prop="column2"></el-table-column>
          </el-table>
        </div>
      </div>
      <span slot="footer">
        <el-button @click="detailVisible1 = false">返回</el-button>
      </span>
    </el-dialog>
    <el-dialog title="订单详情" :visible.sync="detailVisible2" width="40%">
      <div style="display: flex;margin-left: 5%;margin-right: 5%">
        <el-steps :space="150" :active="active" finish-status="success" align-center process-status="process" direction="vertical">
          <el-step title="待发货"></el-step>
          <el-step title="待收货"></el-step>
          <el-step title="已收货"></el-step>
        </el-steps>
        <div style="margin: 5px">
          <el-table :show-header="false" :data="detail_table2" style="width:380px;margin-top: 10px">
            <el-table-column label="a" width="100px" prop="column1"></el-table-column>
            <el-table-column label="b" width="280px" prop="column2"></el-table-column>
          </el-table>
        </div>
      </div>
      <span slot="footer">
        <el-button @click="detailVisible2 = false">返回</el-button>
      </span>
    </el-dialog>
    <el-dialog title="修改商品" :visible.sync="editVisible1" width="40%">
      <el-form ref="editForm1" :model="editForm1" label-width="80px" :rules="edit_rules1">
        <div style="display: flex;margin-left: 5%;margin-right: 5%">
          <div>
            <el-form-item label="商品名称" prop="name">
              <el-input v-model="editForm1.name"></el-input>
            </el-form-item>
            <el-form-item label="所属分类" prop="categoryName">
              <el-input v-model="editForm1.categoryName"></el-input>
            </el-form-item>
            <el-form-item label="价格" prop="price">
              <el-input v-model="editForm1.price"></el-input>
            </el-form-item>
            <el-form-item label="商品描述" prop="description">
              <el-input v-model="editForm1.description" type="textarea" autosize></el-input>
            </el-form-item>
            <el-form-item label="是否开售" prop="status">
              <el-switch v-model="editForm1.status" active-value="1" inactive-value="0"></el-switch>
            </el-form-item>
          </div>
          <div>
            <el-form-item>
              <el-upload
                  class="avatar-uploader"
                  action="http://localhost:8090/common/upload"
                  :show-file-list="true"
                  :on-success="handleSuccess"
                  ref="upload"
                  v-model="editForm1.image">
                <img v-if="edit_imageUrl" :src="edit_imageUrl" style="width: 100px; height: 100px">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>
            </el-form-item>
          </div>
        </div>
      </el-form>
      <span slot="footer">
        <el-button @click="editVisible1 = false">取消</el-button>
        <el-button @click="handleEdit1">确认</el-button>
      </span>
    </el-dialog>
    <el-dialog title="修改订单" :visible.sync="editVisible2" width="40%">
      <el-steps :space="150" :active="active_order" finish-status="success" align-center process-status="process">
        <el-step title="待发货"></el-step>
        <el-step title="待收货"></el-step>
        <el-step title="已收货"></el-step>
      </el-steps>
      <el-form ref="editForm2" :model="editForm2" label-width="80px">
        <el-form-item label="订单号">
          <el-input v-model="editForm2.id" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="商品ID">
          <el-input v-model="editForm2.commodityId" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="商品名称">
          <el-input v-model="editForm2.commodityName" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="分类ID">
          <el-input v-model="editForm2.categoryId" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="所属分类">
          <el-input v-model="editForm2.categoryName" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="买家ID">
          <el-input v-model="editForm2.buyerId" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="买家昵称">
          <el-input v-model="editForm2.buyerName" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="商品描述">
          <el-input v-model="editForm2.description" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="价格">
          <el-input v-model="editForm2.price" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="是否发货">
          <el-switch v-model="editForm2.status" activie-value="true" inactive-value="false" :disabled="flag"></el-switch>
        </el-form-item>
      </el-form>
      <span slot="footer">
        <el-button @click="editVisible2 = false">返回</el-button>
        <el-button @click="handleEdit2">确认</el-button>
      </span>
    </el-dialog>
  </div>

  <div class="block">
    <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="page"
        :page-sizes="[20,40,60,80,100]"
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
  name: "MyShop",
  data(){
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
      page: 1,
      pageSize: 20,
      total: 0,
      username:'XXX',
      shopUrl:'url',
      active:0,
      active_order:0,
      imageUrl:'',
      edit_imageUrl:'',
      detailVisible1:false,
      detailVisible2:false,
      editVisible1:false,
      editVisible2:false,
      addVisible:false,
      flag:false,
      options:[
        {
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
        }
      ],
      detail1:{
        id:'',
        name:'',
        categoryId: '',
        categoryName:'',
        price:'',
        image:'',
        description:'',
        status:''
      },
      detail2:{
        id:'',
        commodityId: '',
        commodityName:'',
        categoryId: '',
        categoryName:'',
        price:'',
        description:'',
        status:'',
        buyerName: '',
        buyerId: ''
      },
      editForm1:{
        id:'',
        name:'',
        categoryId: '',
        categoryName:'',
        price:'',
        image:'',
        description:'',
        status:'',
        sellerId: ''
      },
      editForm2:{
        id:'',
        commodityId: '',
        commodityName:'',
        categoryId: '',
        categoryName:'',
        price:'',
        description:'',
        status:'',
        buyerName: '',
        buyerId: ''
      },
      form_add:{
        name: '',
        categoryName:'',
        categoryId: '',
        image: '',
        price:'',
        description:'',
        status:'',
        sellerId:''
      },
      add_rules:{
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
      },
      edit_rules1:{
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
    detail_table1(){
      return[
        {
          column1:"商品ID",
          column2:this.detail1.id
        },
        {
          column1:"商品名称",
          column2:this.detail1.name
        },
        {
          column1:"所属分类",
          column2:this.detail1.categoryName
        },
        {
          column1:"价格",
          column2:this.detail1.price
        },
        {
          column1:"商品描述",
          column2:this.detail1.description
        },
        {
          column1:"状态",
          column2:this.detail1.status
        },
      ]
    },
    detail_table2(){
      return[
        {
          column1:"订单号",
          column2:this.detail2.id
        },
        {
          column1:"商品ID",
          column2:this.detail2.commodityId
        },
        {
          column1:"商品名称",
          column2:this.detail2.commodityName
        },
        {
          column1:"所属分类",
          column2:this.detail2.categoryName
        },
        {
          column1:"买家名称",
          column2:this.detail2.buyerName
        },
        {
          column1:"商品描述",
          column2:this.detail2.description
        },
        {
          column1:"价格",
          column2:this.detail2.price
        },
      ]
    }
  },
  methods:{
    getInformation(row){
      request.get(this.$httpUrl+'/commodity/'+row.id).then(res=>{
        if(res.data.data.status===0||res.data.data.status===1){
          this.detail1.id=res.data.data.id
          this.detail1.name=res.data.data.name
          this.detail1.categoryId=res.data.data.categoryId
          this.detail1.categoryName=res.data.data.categoryName
          this.detail1.description=res.data.data.description
          this.detail1.price=res.data.data.price
          this.detail1.image=res.data.data.image
          this.detail1.status=(res.data.data.status===0)?'已停售':'售卖中'
          this.detailVisible1=true
        }else{
          request.get(this.$httpUrl+'/order/getByCommodityId/'+res.data.data.id).then(r=>{
            this.detail2.id=r.data.data.id
            this.detail2.commodityId=r.data.data.commodityId
            this.detail2.commodityName=r.data.data.commodityName
            this.detail2.categoryId=r.data.data.categoryId
            this.detail2.categoryName=r.data.data.categoryName
            this.detail2.buyerId=r.data.data.buyerId
            this.detail2.buyerName=r.data.data.buyerName
            this.detail2.description=r.data.data.description
            this.detail2.price=r.data.data.price
            this.active=(r.data.data.status===0)?1:(r.data.data.status===1)?2:3
            this.detailVisible2=true
          })
        }
      })
    },
    handleDelete(row){
      this.$confirm('确认删除吗？','操作确认',{
        confirmButtonText:'确定',
        cancelButtonText:'取消',
        type:'warning',
      }).then(async ()=> {
        request.delete(this.$httpUrl + '/commodity?id=' + row.id).then(res => {
          //console.log(res)
          if (res.data.code === 1) {
            alert('删除成功！')
            this.loadGet()
          } else if (res.data.code === 2) {
            alert('已关联订单，不允许删除！')
          } else {
            alert('系统错误，删除失败！')
          }
        })
        this.loadGet();
      })
    },
    save(){
      var userId = JSON.parse(localStorage.getItem("user")).user.id
      this.form_add.sellerId=userId
      this.form_add.status=1
      this.$refs.form_add.validate((valid)=>{
        if(valid){
          request.post(this.$httpUrl+'/commodity',this.form_add).then(res=>{
            if(res.data.code===1){
              alert(res.data.data)
              this.addVisible = false
              this.initAddForm()
              this.loadGet()
            }else if(res.data.code===2){
              alert(res.data.msg)
            }else{
              alert(res.data.msg)
            }
          })
        }else{
          alert('error submit!')
          return false
        }
      })
    },
    edit(row){
      request.get(this.$httpUrl+'/commodity/'+row.id).then(res=>{
        if(res.data.data.status===2){//已售出，进入订单修改界面
          request.get(this.$httpUrl+'/order/getByCommodityId/'+res.data.data.id).then(r=>{
            this.editForm2.id=r.data.data.id
            this.editForm2.commodityId=r.data.data.commodityId
            this.editForm2.commodityName=r.data.data.commodityName
            this.editForm2.categoryId=r.data.data.categoryId
            this.editForm2.categoryName=r.data.data.categoryName
            this.editForm2.buyerId=r.data.data.buyerId
            this.editForm2.buyerName=r.data.data.buyerName
            this.editForm2.description=r.data.data.description
            this.editForm2.price=r.data.data.price
            if(r.data.data.status===0){
              this.editForm2.status=false
              this.active_order=1
            }else if(r.data.data.status===1){
              this.editForm2.status=true
              this.active_order=2
              this.flag=true
            }else{
              this.editForm2.status=true
              this.active_order=3
              this.flag=true
            }
            this.editVisible2=true
          })
        }else{//停售或售卖中，可修改商品信息
          this.editForm1.id=res.data.data.id
          this.editForm1.name=res.data.data.name
          this.editForm1.categoryId=res.data.data.categoryId
          this.editForm1.categoryName=res.data.data.categoryName
          this.editForm1.price=res.data.data.price
          this.editForm1.sellerId=res.data.data.sellerId
          this.editForm1.description=res.data.data.description
          this.editForm1.image=res.data.data.image
          if(res.data.data.status===0){
            this.editForm1.status="0"
          }else{
            this.editForm1.status="1"
          }
          if(res.data.data.image!=null) {
            this.edit_imageUrl=`http://localhost:8090/common/download?name=${res.data.data.image}`
          }else{
            this.edit_imageUrl=''
          }
          this.editVisible1=true
        }
      })
    },
    handleEdit1(){
      this.$refs.editForm1.validate((valid)=>{
        if(valid){
          request.put(this.$httpUrl+'/commodity',this.editForm1).then(res=>{
            if(res.data.code===1){
              alert(res.data.data)
              this.editVisible1 = false
              this.loadGet()
            }else if(res.data.code===2){
              alert(res.data.msg)
            }else{
              alert(res.data.msg)
            }
          })
        }else{
          alert('error submit!')
          return false
        }
      })
    },
    handleEdit2(){
      this.editForm2.status=(this.editForm2.status===true)?1:0
      // console.log(this.editForm2)
      request.put(this.$httpUrl+'/order',this.editForm2).then(res=>{
        if(res.data.code===1){
          alert(res.data.data)
          this.editVisible2 = false
          this.loadGet()
        }else{
          alert(res.data.msg)
        }
      })
    },
    handleAvatarSuccess(res){
      // console.log("handleAvatarSuccess:"+res.data)
      this.imageUrl=`http://localhost:8090/common/download?name=${res.data}`
      this.form_add.image=res.data
      // console.log(this.form_edit.avatar)
    },
    handleSuccess(res){
      // console.log("handleAvatarSuccess:"+res.data)
      this.imageUrl=`http://localhost:8090/common/download?name=${res.data}`
      this.editForm1.image=res.data
      // console.log(this.form_edit.avatar)
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
    },loadGet(){
      var userid = JSON.parse(localStorage.getItem("user")).user.id
      this.username = JSON.parse(localStorage.getItem("user")).user.username
        request.get(this.$httpUrl + '/commodity/pageByShop?page='
            + this.page + '&pageSize=' + this.pageSize + '&sellerId=' + userid).then(res => {
          // console.log(res.data.data.records)
          this.tableData = res.data.data.records
          this.total = res.data.data.total
          this.shopUrl = this.$httpUrl + '/commodity/pageByShop?page='
              + this.page + '&pageSize=' + this.pageSize + '&sellerId=' + userid
        })
    },
    getImage(image){
      if (image == null)
        image="暂无图片.jpg"
      // console.log("表格头像"+image)
      return `http://localhost:8090/common/download?name=${image}`
    },
    addCommodity(){
      this.addVisible=true
    },
    initAddForm(){
      this.form_add.name= ''
      this.form_add.categoryName=''
      this.form_add.image=''
      this.form_add.price=''
      this.form_add.description=''
    },
    showUrl() {
      this.$alert('复制以下链接，快向朋友们分享我的小店吧！'+ this.shopUrl, '分享我的小店', {
        confirmButtonText: '确定'
      });
    }
  },beforeMount() {
    //自动获取数据
    this.loadGet();
  }
}
</script>

<style scoped>

</style>