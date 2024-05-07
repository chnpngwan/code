<template>
  <div class="main">
    <div v-if="auth != null">
      <div v-if="auth.status == 0">
        <el-button
          type="success"
          circle
          style="width: 20px; height: 20px"
        /><span>等待审核</span>
      </div>
      <div v-if="auth.status == 1">
        <el-button
          type="primary"
          circle
          style="width: 20px; height: 20px"
        /><span>审核中</span>
      </div>
      <div v-if="auth.status == 2">
        <el-button
          type="success"
          circle
          style="width: 20px; height: 20px"
        /><span>审核通过</span>
      </div>
      <div v-if="auth.status == -1">
        <el-button
          type="danger"
          circle
          style="width: 20px; height: 20px"
        /><span>审核未通过</span>
      </div>
      <br />
      <el-button type="danger" round @click="dropAuth">删除认证</el-button>
    </div>
    <el-form label-width="120px" :model="form" v-if="auth == null" :rules="formRules" ref="form">
      <el-form-item label="上传资格证照片" prop="fileList">
        <el-upload
          ref="upload"
          action=""
          list-type="picture-card"
          :on-change="changeFile"
          :auto-upload="false"
          :on-exceed="handleExceed"
          multiple
        >
          <el-icon><Plus /></el-icon>
          <template #tip>
            <div class="el-upload__tip text-red">最多上传{{ limit }}张图片</div>
          </template>
          <template #file="{ file }">
            <img
              class="el-upload-list__item-thumbnail"
              :src="file.url"
              alt=""
            />
          </template>
        </el-upload>
      </el-form-item>
      <el-form-item label=" 个人介绍" prop="description">
        <el-input type="textarea" v-model="form.description"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="clearForm">清空表单</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { Plus, Delete } from "@element-plus/icons";
import { ElMessage } from "element-plus";
import { send2Check, getAuth, drop } from "@/api/teacherApi.js";
export default {
  data() {
    return {
      form: {
        fileList: [],
        description: ''
      },
      limit: 3,
      auth: null,
      formRules: {
        fileList: [
          { required: true, message: '请上传资格证照片', trigger: 'change' }
        ],
        description: [
          { required: true, message: '请输入个人介绍', trigger: 'blur' }
        ]
      }
    };
  },
  components: { Plus, Delete },
  methods: {
    handleExceed() {
      ElMessage.error("最多上传3张图片");
    },
    changeFile(file, fileList) {
      this.form.fileList.push(file.raw);
    },
    clearForm() {
      this.form.fileList = [];
      this.form.description = "";
      this.$refs.upload.clearFiles();
    },
    refreshAuth() {
      getAuth().then((res) => {
        this.auth = res;
      });
    },
    upload() {
      let fd = new FormData();
      for (let i = 0; i < this.form.fileList.length; i++) {
        fd.append("imgs[]", this.form.fileList[i]);
      }
      fd.append("description", this.form.description);
      send2Check(fd).then((res) => {
        this.refreshAuth();
        this.clearForm();
      });
    },
    dropAuth() {
      drop().then((res) => {
        this.refreshAuth();
      });
    },
    submitForm() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          // 在此处进行表单提交逻辑
          this.upload();
          // 假设表单提交成功
          const successMessage = "提交成功";
          this.$message.success(successMessage);
          // 清空表单数据
          this.clearForm();
        } else {
          // 表单校验不通过，显示错误提示
          const errorMessage = "请按要求填写表单";
          this.$message.error(errorMessage);
        }
      });
    },
  },
  computed: {
    plusShow() {
      if (this.form.fileList.length < this.limit) {
        return true;
      } else {
        return false;
      }
    },
  },
  mounted() {
    this.refreshAuth();
  },
};
</script>

<style>
</style>