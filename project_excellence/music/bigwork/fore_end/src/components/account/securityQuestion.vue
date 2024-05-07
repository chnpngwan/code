<template>
  <el-form
  v-if="!hasQuestion"
    @submit="submitForm"
    :model="form"
    :rules="formRules"
    label-position="top"
  >
    <el-form-item label="安全问题" prop="question">
      <el-input v-model="form.question"></el-input>
    </el-form-item>
    <el-form-item label="答案" prop="answer">
      <el-input v-model="form.answer"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submitForm">创建安全问题</el-button>
    </el-form-item>
  </el-form>
  <div v-else>你已经设置过安全问题了</div>
</template>
  
  <script>
import { ElMessage } from "element-plus";
import {createSecurityQuestion,getSecurityQuestionByUserId} from "@/api/securityQuestionApi"
export default {
  data() {
    return {
      form: {
        question: "",
        answer: "",
      },
      hasQuestion:false,
      formRules: {
        question: [{ required: true, message: "请输入问题", trigger: "blur" }],
        answer: [{ required: true, message: "请输入答案", trigger: "blur" }],
      },
    };
  },
  methods: {
    submitForm() {
      createSecurityQuestion(this.form)
        .then((data) => {
          ElMessage.success("添加成功");
          console.log(data);
        })
        .catch((error) => {
          ElMessage.error("添加失败");
          console.error(error);
        });
    },
  },
  mounted(){
    getSecurityQuestionByUserId().then(res=>{
      this.form.question = res.question
      if(res.question.question == ""){
        this.hasQuestion = false;
      }else{
        this.hasQuestion = true;
      }
    })
  }
};
</script>