<template>
<!--  黄色-->
  <div style="display: flex;line-height: 60px;color:#5B58A5" >
    <div style="margin-top: 5px;collapse: #F5E952">
<!--  黄色-->
      <i :class="icon_fold" style="font-size: 24px;color:#ffffff;cursor: pointer" @click="collapse"></i>

    </div>
    <div style="flex: 1;font-size: 30px;text-align: center;color: #f5ede4;font-family: '思源宋体 CN Medium';letter-spacing: 4px">
      <span >欢迎来到跳蚤市场后台管理系统</span>
    </div>
    <el-dropdown>
      <span style="margin-bottom: 10px;color: #fff;cursor: pointer" model="user">{{ user }}<i class="el-icon-arrow-down" style="margin-left: 15px;color: #eef2fd"></i>
      </span>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item  @click.native="drawer = true">个人中心</el-dropdown-item>
        <el-dropdown-item @click.native="logout">退出</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
    <el-drawer
        title="个人中心"
        style="text-align: center;font-family: '思源宋体 CN Medium';font-size: 30px"
        :visible.sync="drawer"
        :direction="direction"
        :before-close="handleClose">
      <div style="margin: 5px">
        <el-image :src="getImage()"
                  style="width: 150px; height: 150px">
        </el-image>
        <el-table :show-header="false" :data="detail_table" style="width:380px;margin-top: 30px;margin-left: 30px" >
          <el-table-column label="a" width="100px" prop="column1"></el-table-column>
          <el-table-column label="b" width="280px" prop="column2"></el-table-column>
        </el-table>
      </div>
    </el-drawer>
  </div>
</template>

<script>
export default {
  name: "Header",
  data(){
    return{
      user: '',
      detail:{
        username:'',
        nickname:'',
        sex:'',
        birthday:'',
        phone:'',
        email:'',
        point:''
      }
    }
  },
  computed:{
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
    logout(){
      // console.log("click...logout")
      localStorage.clear()
      this.$router.replace('/')
    },
    collapse(){
      this.$emit('doCollapse')
    },
    loadGet(){
      var _user = JSON.parse(localStorage.getItem("user")).user
      this.user = _user.username
      this.detail.username = _user.username
      this.detail.nickname = _user.nickname
      this.detail.sex = _user.sex
      this.detail.birthday = _user.birthday
      this.detail.phone = _user.phone
      this.detail.email = _user.email
    },
    getImage(){
      // console.log(localStorage.getItem("user"))
      var user = JSON.parse(localStorage.getItem("user")).user
      // console.log(user.avatar)
      return `http://localhost:8090/common/download?name=${user.avatar}`
    }
  },mounted() {
    this.loadGet()
  }
}
</script>

<style scoped>

</style>