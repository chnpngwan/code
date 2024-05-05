<template>
  <div>
    <div style="margin-top: 15px;display: flex;margin-left: 20%;margin-right: 20%;margin-bottom: 40px">
      <el-select v-model="value" filterable placeholder="请选择" @change="selectChanged">
        <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value">
        </el-option>
      </el-select>
      <el-input placeholder="请输入内容" v-model="input" class="input-with-select">
        <el-button slot="append" icon="el-icon-search" @click="search"></el-button>
      </el-input>
    </div>

    <div style="margin-top: 15px;display: flex;margin-left: 15%;margin-right: 15%">
      <el-dialog
          title="请选择付款方式" :visible.sync="buy_dialogVisible"
          width="30%"
          style="margin-top: 10%">
        <div style="display: inline-block;margin-bottom: 30px">
            <img src="../../assets/wx.png" style="width: 27%;height: 50%;margin-right: 20px">
            <img src="../../assets/zfb.png" style="width: 27%;height: 50%;margin-right: 20px">
            <img src="../../assets/cn.png" style="width: 27%;height: 50%">
        </div>
        <el-button @click="submit">确认</el-button>
      </el-dialog>
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
            width="120"
            align="center">
        </el-table-column>
        <el-table-column
            prop="description"
            label="描述"
            width="300"
            align="center">
        </el-table-column>
        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-button
                size="mini"
                @click="getInformation(scope.row)">查看详情</el-button>
            <el-button
                size="mini"
                type="danger"
                @click="handleBuy(scope.row)">购买</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-dialog title="商品详情" :visible.sync="detail_dialogVisible" width="40%">
        <div style="display: flex;margin-left: 5%;margin-right: 5%">
          <div style="margin: 10px;width: 30%">
            <div style="margin-top: 10px">
              <el-image style="width:100px;height: 100px"
                        :src="getImage(detail.image)"
                        :preview-src-list="[`http://localhost:8090/common/download?name=${detail.image}`]">
              </el-image>
            </div>
          </div>
          <div style="margin: 5px">
            <el-table :show-header="false" :data="detail_table" style="width:380px;margin-top: 10px">
              <el-table-column label="a" width="100px" prop="column1"></el-table-column>
              <el-table-column label="b" width="280px" prop="column2"></el-table-column>
            </el-table>
          </div>
        </div>
        <span slot="footer">
                <el-button @click="detail_dialogVisible = false">返回</el-button>
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
  name: "Shopping",
  data(){
    return{
      input:'',
      select:"all",
      options: [{
        value: '全部分类',
        label: '全部分类'
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
      value: '全部分类',
      tableData:[],
      page: 1,
      pageSize: 20,
      total: 0,
      buy_dialogVisible:false,
      row:'',
      detail_dialogVisible:false,
      detail:{
        id:'',
        name:'',
        categoryId: '',
        categoryName:'',
        price:'',
        image:'',
        description:'',
        sellerId:'',
        sellerName: ''
      }
    }
  },
  computed:{
    detail_table(){
      return[
        {
          column1:"商品ID",
          column2:this.detail.id
        },
        {
          column1:"商品名称",
          column2:this.detail.name
        },
        {
          column1:"所属分类",
          column2:this.detail.categoryName
        },
        {
          column1:"价格",
          column2:this.detail.price
        },
        {
          column1:"商品描述",
          column2:this.detail.description
        },
        {
          column1:"商家名称",
          column2:this.detail.sellerName
        },
      ]
    }
  },
  methods:{
    getInformation(row){
      request.get(this.$httpUrl+'/commodity/'+row.id).then(res=>{
        this.detail.id=res.data.data.id
        this.detail.name=res.data.data.name
        this.detail.categoryName=res.data.data.categoryName
        this.detail.price=res.data.data.price
        this.detail.description=res.data.data.description
        request.get(this.$httpUrl+'/user/'+res.data.data.sellerId).then(r=>{
          this.detail.sellerName=r.data.data.nickname
        })
        this.detail.image=res.data.data.image
        this.detail_dialogVisible=true
      })
    },
    handleBuy(row){
      // console.log(row.id)
      this.buy_dialogVisible = true
      this.row = row
    },
    submit(){
      this.buy_dialogVisible = false
      // console.log('submit')
      request.get(this.$httpUrl+'/order?id='+this.row.id).then(res=>{
        // console.log(res)
        if(res.data.code===1){
          alert('购买商品成功！')
        }else{
          alert(res.data.data.msg)
        }
      })
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
      if (this.value == '全部分类'){
        request.get(this.$httpUrl + '/commodity/pageByCategory?page='
            + this.page + '&pageSize=' + this.pageSize + '&categoryName=' + '&name=' + this.input).then(res => {
          console.log(res.data.data.records)
          this.tableData = res.data.data.records
          this.total = res.data.data.total
        })
      }else {
        // console.log(this.value)
        request.get(this.$httpUrl + '/commodity/pageByCategory?page='
            + this.page + '&pageSize=' + this.pageSize + '&categoryName=' + this.value + '&name=' + this.input).then(res => {
          // console.log(res.data.data.records)
          this.tableData = res.data.data.records
          this.total = res.data.data.total
        })
      }
    },
    selectChanged(value){
      // console.log("change:" + this.value)
      this.loadGet()
    },
    search(){
      // console.log(this.input)
      this.loadGet()
    },
    getImage(image){
      if (image == null)
        image="暂无图片.jpg"
      // console.log("表格头像"+image)
      return `http://localhost:8090/common/download?name=${image}`
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