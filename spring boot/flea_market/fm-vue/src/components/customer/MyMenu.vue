<template>
  <div style="display: flex;text-align: center;margin-left: 15%;margin-right: 15%">

    <el-menu default-active="/Shopping"
              class="el-menu-demo"
              mode="horizontal"
              router
             style="position: sticky"
    >
      <el-menu-item index="/Shopping"> 市场首页</el-menu-item>
      <el-menu-item index="/MyShop">
        <template slot="title">我的小店</template>
      </el-menu-item>
      <el-menu-item index="/MyOrders" >我的订单</el-menu-item>
      <el-menu-item index="/Personal">个人中心</el-menu-item>

      <el-dropdown style="margin-left:570px;margin-right: 40px;margin-top: 13px">
        <span class="el-dropdown-link">
          <el-image v-if="avatar" :src="avatar"
                    style="width: 35px; height: 35px">
          </el-image>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item  @click.native="drawer = true">个人中心</el-dropdown-item>
          <el-dropdown-item @click.native="logout" style="color: red">退出</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </el-menu>

    <el-drawer
        title="个人中心"
        style="text-align: center;font-family: '思源宋体 CN Medium';font-size: 30px"
        :visible.sync="drawer"
        :direction="direction"
        :before-close="handleClose">
      <div style="margin: 5px">
        <el-image :src="avatar"
                  style="width: 150px; height: 150px">
        </el-image>
        <el-table :show-header="false" :data="detail_table" style="width:380px;margin-top: 30px;margin-left: 30px" >
          <el-table-column label="a" width="100px" prop="column1"></el-table-column>
          <el-table-column label="b" width="280px" prop="column2"></el-table-column>
        </el-table>
      </div>
    </el-drawer>
    <div class="line"></div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "MyMenu",
  data(){
    return{
      detail:{
        username:'',
        nickname:'',
        sex:'',
        birthday:'',
        phone:'',
        email:'',
        point:'',
        avatar:''
      }
    }
  },computed:{
    detail_table(){
      return[
        {
          column1:"用户名",
          column2:this.detail.username
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
        }
      ]
    }
  },
  props:{
    icon_fold:String,
    drawer: false,
    direction: 'rtl'
  },
  methods:{
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(_ => {
            done();
          })
          .catch(_ => {});
    },
    loadGet(){
      var user = JSON.parse(localStorage.getItem("user")).user
      request.get(this.$httpUrl+'/user/'+user.id).then(res=>{
        this.detail.username = res.data.data.username
        this.detail.nickname = res.data.data.nickname
        this.detail.sex = res.data.data.sex
        this.detail.birthday = res.data.data.birthday
        this.detail.phone = res.data.data.phone
        this.detail.email = res.data.data.email
        this.detail.point = res.data.data.point
        this.avatar=`http://localhost:8090/common/download?name=${res.data.data.avatar}`
      })
    },
    logout(){
      // console.log("click...logout")
      localStorage.clear()
      this.$router.replace('/')
    },

  },mounted() {
    this.loadGet()
  }
}
</script>

<style scoped>
body {
  margin: 0;
}

</style>