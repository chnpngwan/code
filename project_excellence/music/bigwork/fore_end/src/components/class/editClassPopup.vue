<template>
    <el-icon class="icon" color="black"  size="20">
        <Edit @click="show = true" />
    </el-icon>
  <!-- 修改班级信息表单 -->
  <popup :show="show" :hidden="hidden">
    <template #main>
      <div class="editClassTable">
        <el-form label-width="120px" v-model="newClass">
          <el-form-item label="班级名称">
            <el-input v-model="newClass.name" style="width: 120px" />
          </el-form-item>
          <el-form-item label="班级简介">
            <el-input type="textarea" v-model="newClass.description" />
          </el-form-item>
          <el-form-item>
            <el-button type="success" @click="editClass">提交</el-button>
            <el-button type="danger" @click="hidden"
              >取消</el-button
            >
          </el-form-item>
        </el-form>
      </div>
    </template>
  </popup>
</template>

<script>
import {Edit} from "@element-plus/icons"
import popup from "../global/popup.vue";
export default {
  data() {
    return {
      show: false,
      newClass:{id:"",name:"",description:""}
    };
  },
  props:["clazz","submit"],
  methods: {
    hidden() {
      this.show = false;
    },
    editClass(){
        this.submit(this.newClass)
        this.hidden()
    }
  },
  mounted(){
    this.newClass.id = this.clazz.id
    this.newClass.name = this.clazz.name;
    this.newClass.description = this.clazz.description;
  },
  components:{Edit,popup}
};
</script>

<style scoped lang="less">
.icon{
  cursor: pointer;
  &:hover{
    color: rgba(0,0,0, 0.5);
  }
}
.editClassTable {
  width: 50vw;
  height: 30vh;
}
</style>