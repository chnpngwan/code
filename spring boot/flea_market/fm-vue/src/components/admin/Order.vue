<template>
  <div>
    <div style="border-bottom: #b9bbbe 1px solid">
      <el-breadcrumb separator-class="el-icon-arrow-right" style="line-height: 20px;margin-bottom: 20px;font-size: 15px">
        <el-breadcrumb-item>订单管理</el-breadcrumb-item>
        <el-breadcrumb-item>订单列表</el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div style="margin-top:15px;margin-left:20%;margin-right:20%;margin-bottom:40px">
      <el-input v-model="input" placeholder="输入商品名称">
        <el-button slot="append" @click="handleQuery">查询</el-button>
      </el-input>
    </div>

    <el-table :data="tableData" width="800" align="center">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="订单号" width="150" align="center">
      </el-table-column>
      <el-table-column prop="commodityName" label="商品名称" width="250" align="center">
      </el-table-column>
      <el-table-column prop="sellerId" label="卖家ID" width="150" align="center">
      </el-table-column>
      <el-table-column prop="buyerId" label="买家ID" width="150" align="center">
      </el-table-column>
      <el-table-column prop="status" label="状态" width="80" align="center">
        <template slot-scope="scope">
          <el-tag :type="String(scope.row.status)==='0'?'danger':String(scope.row.status)==='1'?'primary':'success'">
            {{ String(scope.row.status)==='0'?'待发货':String(scope.row.status)==='1'?'待收货':'已收货' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="120">
        <template slot-scope="scope">
          <el-button size="mini" type="success" @click="handleList(scope.row.id)">显示详情</el-button>
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
  name: "Order",
  data(){

    return{
      tableData:[],
      page:1,
      pageSize:5,
      total:0,
      input:'',
      detail_dialogVisible:false,
      active:0,
      collapse:['0'],
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
        status:''
      }
    }
  },
  computed:{
    detail_table(){
      return[
        {
          head_col:'ID',
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
          head_col:'卖家ID',
          content_col:this.detail.sellerId
        },
        {
          head_col:'买家名称',
          content_col:this.detail.buyerName
        },
        {
          head_col:'买家ID',
          content_col:this.detail.buyerId
        }
      ]
    }
  },
  methods:{
    handleQuery(){
      this.loadGet()
    },
    handleList(id){
      request.get(this.$httpUrl+'/order/'+id).then(res=>{
        console.log(res)
        this.detail.id=res.data.data.id
        this.detail.commodityName=res.data.data.commodityName
        this.detail.categoryName=res.data.data.categoryName
        this.detail.commodityId=res.data.data.commodityId
        this.detail.sellerId=res.data.data.sellerId
        this.detail.sellerName=res.data.data.sellerName
        this.detail.buyerId=res.data.data.buyerId
        this.detail.buyerName=res.data.data.buyerName
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
      request.get(this.$httpUrl + '/order/page?page=' + this.page + '&pageSize=' + this.pageSize+'&name='+this.input).then(res => {
          console.log(res.data.data)
          this.tableData = res.data.data.records
          this.total = res.data.data.total
      })
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