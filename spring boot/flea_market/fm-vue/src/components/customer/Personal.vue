<template>
  <div style="margin-top: 15px;display: flex;margin-left: 15%;margin-right: 15%;background-color: #eeeeee">
    <div style="background-color: #eeeeee;margin: 20px;width: 30%">
    <div style="margin-top: 20px;margin-bottom: 20px">
      <el-tooltip class="item" effect="dark" content="单击以更换头像" placement="bottom">
      <el-upload
            class="avatar-uploader"
            action="http://localhost:8090/common/upload"
            :show-file-list="true"
            :on-success="handleAvatarSuccess"
            ref="upload"
            v-model="form.avatar">
          <img v-if="imageUrl" :src="imageUrl" class="avatar" style="width: 220px; height: 220px">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </el-tooltip>
    </div>
    </div>
    <div style="background-color: #eeeeee;margin-left: 20px;margin-top: 40px;margin-bottom: 30px">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="用户名:">
          <el-input v-model="form.username"
                    maxlength="20"
                    show-word-limit></el-input>
        </el-form-item>
        <el-form-item label="密码:">
          <el-input v-model="form.password"
                    maxlength="40"
                    :disabled="true"
                    show-password></el-input>
        </el-form-item>
        <el-form-item label="昵称:">
          <el-input v-model="form.nickname"
                    maxlength="10"
                    show-word-limit></el-input>
        </el-form-item>
        <el-form-item label="性别:">
          <el-radio v-model="form.sex" label="男">男</el-radio>
          <el-radio v-model="form.sex" label="女">女</el-radio>
        </el-form-item>
        <el-form-item label="生日:">
          <el-date-picker type="date" placeholder="选择日期" v-model="form.birthday" style="width: 100%;"></el-date-picker>
        </el-form-item>
        <el-form-item label="电话:">
          <el-input v-model="form.phone"></el-input>
        </el-form-item>
        <el-form-item label="邮箱:">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
        <el-form-item label="信誉积分:">
          <el-input v-model="form.point" :disabled="true"></el-input>
        </el-form-item>
      </el-form>
      <el-button @click="editPassword" style="width: 120px;margin-right: 30px">修改密码</el-button>
      <el-button type="primary" @click="onSubmit" style="width: 120px;margin-right: 30px">保存信息</el-button>
      <el-button type="danger"  @click="logout" style="width: 120px;margin-right: 30px">注销</el-button>
      <el-dialog
          title="修改密码" :visible.sync="password_dialogVisible"
          width="30%" >
        <el-form label-width="80px" :rules="rules" :model="form_password">
          <el-form-item label="旧密码" prop="oldPassword">
            <el-input v-model="form_password.oldPassword" show-password></el-input>
          </el-form-item>
          <el-form-item label="新密码" prop="newPassword">
            <el-input v-model="form_password.newPassword" show-password></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="confirmPassword">
            <el-input v-model="form_password.confirmPassword" show-password></el-input>
          </el-form-item>
        </el-form>
        <el-button @click="submit">确认修改</el-button>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "Personal",
  data(){
    return{
      form: {
        id:'',
        username: '',
        password: '',
        nickname: '',
        sex:'',
        birthday:'',
        phone:'',
        email:'',
        point:'',
        avatar:'',
      },
      imageUrl:'',
      form_password:{
        oldPassword:'',
        newPassword:'',
        confirmPassword:''
      },
      password_dialogVisible:false,
      rules: {
        oldPassword: [
          { required: true, message: '请输入原密码', trigger: 'blur' },
          { min: 5, max: 20, message: '密码长度应为5-20个字符', trigger: 'blur' }
        ],
        newPassword: [
          { required: true, message: '请输入新密码', trigger: 'blur' },
          { min: 5, max: 20, message: '密码长度应为5-20个字符', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, message: '请确认密码', trigger: 'blur' },
          { min: 5, max: 20, message: '密码长度应为5-20个字符', trigger: 'blur' }
        ],
      }
    }
  },
  methods:{
    getImage(){
      // console.log(localStorage.getItem("user"))
      return `http://localhost:8090/common/download?name=${this.form.avatar}`
    },
    handleAvatarSuccess(res){
      // console.log("handleAvatarSuccess:"+res.data)
      this.imageUrl=`http://localhost:8090/common/download?name=${res.data}`
      this.form.avatar=res.data
      // console.log(this.form.avatar)
    },
    onSubmit(){
      request.put(this.$httpUrl+'/user',this.form).then(res=>{
        //console.log(res.data.data)
        if(res.data.code===1){
          alert(res.data.data)
          this.loadGet()
        }else {
          alert(res.data.msg)
        }
      })
    },
    loadGet(){
      var userid = JSON.parse(localStorage.getItem("user")).user.id
      request.get(this.$httpUrl + '/user/' + userid).then(res => {
        // console.log(res.data.data)
        this.form.id = res.data.data.id
        this.form.username = res.data.data.username
        this.form.password = res.data.data.password
        this.form.point = res.data.data.point
        this.form.sex = res.data.data.sex
        this.form.birthday = res.data.data.birthday
        this.form.email = res.data.data.email
        this.form.phone = res.data.data.phone
        this.form.nickname = res.data.data.nickname
        this.form.avatar = res.data.data.avatar
        this.imageUrl=`http://localhost:8090/common/download?name=${this.form.avatar}`
      })
    },
    editPassword(){
     this.password_dialogVisible = true
    },
    submit(){
      if (this.md5(this.form_password.oldPassword) != this.form.password){
        // console.log(this.md5(this.oldPassword))
        alert("原密码输入错误，请重试！")
      }else {
        if (this.form_password.newPassword != this.form_password.confirmPassword){
          alert("新密码与确认密码不一致，请重试！")
        }else {
          var password = this.form_password.newPassword
          request.put(this.$httpUrl + '/user/updatePassword?id='+this.form.id+'&password='+password).then(res => {
            if(res.data.code===1){
              alert(res.data.data)
              this.password_dialogVisible=false
              localStorage.clear()
              this.$router.replace('/Login')
            }else {
              alert(res.data.msg)
            }
          })
        }
      }

    },
    logout(){
      localStorage.clear()
      this.$router.replace('/Login')
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