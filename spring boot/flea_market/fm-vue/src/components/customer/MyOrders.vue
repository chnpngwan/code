<template>
  <div>
  <div style="margin-top: 15px;display: flex;margin-left: 15%;margin-right: 15%">
    <el-table
        :data="tableData"
        style="width: 100%;text-align: center">
      <el-table-column
          fixed
          prop="id"
          label="订单号"
          width="150"
          align="center">
      </el-table-column>
      <el-table-column
          prop="commodityName"
          label="商品名称"
          width="120"
          align="center">
      </el-table-column>
      <el-table-column
          prop="sellerId"
          label="卖家ID"
          width="120"
          align="center">
      </el-table-column>
      <el-table-column
          prop="createTime"
          label="购买时间"
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
            {{ String(scope.row.status) === '0' ? '待发货' : (String(scope.row.status) === '1' ? '运输中' : '已收货') }}
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
              type="success"
              @click="edit(scope.row)">确认收货</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog title="订单详情" :visible.sync="detail_dialogVisible" width="40%">
      <div style="margin-left: 10%;margin-right: 10%">
        <el-steps :space="150" :active="active" finish-status="success" align-center process-status="process">
          <el-step title="待发货"></el-step>
          <el-step title="待收货"></el-step>
          <el-step title="已收货"></el-step>
        </el-steps>
        <el-table :show-header="false" :data="detail_table" style="width:380px;margin-top: 10px">
          <el-table-column label="a" width="100px" prop="head_col"></el-table-column>
          <el-table-column label="b" width="280px" prop="content_col"></el-table-column>
        </el-table>
        <el-row style="margin-top: 10px" :rowspan="2">
          <el-col :span="4">商品描述</el-col>
          <el-col :span="18" style="padding-left: 32px">
            <div :key="detail.description" style="alignment: left;text-align: left">
              {{ detail.description }}
            </div>
          </el-col>
        </el-row>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="detail_dialogVisible=false">返回</el-button>
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
  name: "MyOrders",
  data(){
    return{
      tableData:[],
      page: 1,
      pageSize: 20,
      total: 0,
      active:0,
      detail_dialogVisible:false,
      edit_confirm:false,
      detail:{
        id:'',
        categoryName:'',
        commodityName:'',
        commodityId:'',
        sellerName:'',
        sellerId:'',
        buyerName:'',
        buyerId:'',
        description:'',
        price:'',
        status:''
      },
      edit_status:{
        id:'',
        categoryName:'',
        commodityName:'',
        commodityId:'',
        sellerName:'',
        sellerId:'',
        buyerName:'',
        buyerId:'',
        description:'',
        price:'',
        status:''
      }
    }
  },
  computed:{
    detail_table(){
      return[
        {
          head_col:'订单号',
          content_col:this.detail.id
        },
        {
          head_col:'商品名称',
          content_col:this.detail.commodityName
        },
        {
          head_col:'商品ID',
          content_col:this.detail.commodityId
        },
        {
          head_col:'卖家名称',
          content_col:this.detail.sellerName
        },
        {
          head_col:'买家名称',
          content_col:this.detail.buyerName
        },
        {
          head_col:'价格',
          content_col:this.detail.price
        }
      ]
    }
  },
  methods:{
    getInformation(row){
      request.get(this.$httpUrl+'/order/'+row.id).then(res=>{
        // console.log(res)
        this.detail.id=res.data.data.id
        this.detail.commodityName=res.data.data.commodityName
        this.detail.categoryName=res.data.data.categoryName
        this.detail.commodityId=res.data.data.commodityId
        this.detail.sellerId=res.data.data.sellerId
        this.detail.sellerName=res.data.data.sellerName
        this.detail.buyerId=res.data.data.buyerId
        this.detail.buyerName=res.data.data.buyerName
        this.detail.price=res.data.data.price
        this.detail.description=res.data.data.description
        if(res.data.data.status===0){
          this.active=1
        }else if(res.data.data.status===1){
          this.active=2
        }else{
          this.active=3
        }
        this.detail_dialogVisible=true
      })
    },
    edit(row){
      request.get(this.$httpUrl+'/order/'+row.id).then(res=> {
        console.log(res)
        this.edit_status.id = res.data.data.id
        this.edit_status.commodityName = res.data.data.commodityName
        this.edit_status.categoryName = res.data.data.categoryName
        this.edit_status.commodityId = res.data.data.commodityId
        this.edit_status.sellerId = res.data.data.sellerId
        this.edit_status.sellerName = res.data.data.sellerName
        this.edit_status.buyerId = res.data.data.buyerId
        this.edit_status.buyerName = res.data.data.buyerName
        this.edit_status.price = res.data.data.price
        this.edit_status.description = res.data.data.description
        if(res.data.data.status===0){
          alert("订单未发货！")
        }else if(res.data.data.status===1){
          this.$confirm('确认收货吗？','操作确认',{
            confirmButtonText:'确定',
            cancelButtonText:'取消',
            type:'warning',
          }).then(async ()=>{
            this.edit_status.status=2
            request.put(this.$httpUrl+'/order',this.edit_status).then(r=>{
              if(r.data.code===1){
                alert(r.data.data)
                this.edit_confirm=false
                this.loadGet()
              }else{
                alert(r.data.msg)
              }
            })
          }).catch(()=>{})

        }else{
          alert("您已收货,无需再次收货！")
        }

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
    },loadGet(){
      var userid = JSON.parse(localStorage.getItem("user")).user.id
      request.get(this.$httpUrl + '/order/pageByBuyer?page='
          + this.page + '&pageSize=' + this.pageSize + '&buyerId=' + userid).then(res => {
        // console.log(res.data.data.records)
        this.tableData = res.data.data.records
        this.total = res.data.data.total
      })
    }
  },beforeMount() {
    //自动获取数据
    this.loadGet();
  }
}
</script>

<style scoped>

</style>