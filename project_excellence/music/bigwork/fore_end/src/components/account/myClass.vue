<template>
  <ul class="option">
    <li >
      <el-button type="primary" @click="showCreateClassPopup = true" v-if="user.teacher == true">
        创建班级
      </el-button>
      <el-button type="primary" @click="showAddClassPopup = true">
        加入班级
      </el-button>
    </li>
  </ul>
  <!-- 创建班级表单 -->
  <popup :show="showCreateClassPopup" :hidden="hiddenCreateClassPopup">
    <template #main>
      <div class="createClassTable">
        <el-form label-width="120px" v-model="newClass">
          <el-form-item label="班级名称">
            <el-input v-model="newClass.name" style="width: 120px" />
          </el-form-item>
          <el-form-item label="班级头像">
            <el-upload
              class="avatar-uploader"
              action=""
              :file-list="fileList"
              :show-file-list="false"
              :on-change="changeFile"
              :auto-upload="false"
            >
              <img v-if="newClass.avatar" :src="img" class="avatar" />

              <el-icon
                v-if="!newClass.avatar"
                class="avatar-uploader-icon"
                :size="50"
                ><Plus
              /></el-icon>
            </el-upload>
          </el-form-item>
          <el-form-item label="班级简介">
            <el-input type="textarea" v-model="newClass.description" />
          </el-form-item>
          <el-form-item>
            <el-button type="success" @click="createClass">提交</el-button>
            <el-button type="danger" @click="hiddenCreateClassPopup"
              >取消</el-button
            >
          </el-form-item>
        </el-form>
      </div>
    </template>
  </popup>
  <!-- 加入班级表单 -->
  <popup
    :show="showAddClassPopup"
    :hidden="
      () => {
        showAddClassPopup = false;
      }
    "
  >
    <template #main>
      <el-form>
        <el-form-item label="班级ID" label-width="60px">
          <el-input v-model="addClassId"></el-input>
        </el-form-item>
        <el-form-item label-width="60px">
          <el-button type="primary" @click="add2Class">加入</el-button>
          <el-button
            type="default"
            @click="
              () => {
                showAddClassPopup = false;
              }
            "
            >取消</el-button
          >
        </el-form-item>
      </el-form>
    </template>
  </popup>
  <template v-if="$store.state.user.teacher == true">
    <div>我的班级</div>
    <el-space wrap class="classList">
      <template v-for="clazz in classes" :key="clazz">
        <div v-if="clazz.creator == $store.state.user.id">
          <editClassPopup :clazz="clazz" :submit="editClass" />
          <myClass :clazz="clazz"></myClass>
        </div>
      </template>
    </el-space>
  </template>

  <div>我加入的班级</div>
  <el-space wrap class="classList">
    <template v-for="clazz in classes" :key="clazz">
        <div v-if="clazz.creator != $store.state.user.id">
          <myClass :clazz="clazz"></myClass>
        </div>
      </template>
  </el-space>
</template>

<script>
import myClass from "../global/myClassItem.vue";
import { mapState } from "vuex";
import popup from "../global/popup.vue";
import getFormData from "@/utils/getFormData.js";
import {
  createClassApi,
  getMyClassApi,
  midifyInfoApi,
  add2ClassApi,
} from "@/api/classApi.js";
import { Plus } from "@element-plus/icons";
import editClassPopup from "../class/editClassPopup.vue";
import { ElMessage } from "element-plus";
export default {
  data() {
    return {
      classes: [],
      showCreateClassPopup: false,
      showAddClassPopup: false,
      fileList: [],
      img: "",
      newClass: {
        name: "",
        avatar: null,
        description: "",
      },
      joinClasses: [],
      addClassId: null,
    };
  },
  methods: {
    hiddenCreateClassPopup() {
      this.newClass = {
        name: "",
        avatar: null,
        description: "",
      };
      this.showCreateClassPopup = false;
    },
    changeFile(file, fileList) {
      if (fileList.length > 1) {
        fileList.splice(0, 1);
      }
      this.newClass.avatar = file.raw;
      let reader = new FileReader();
      let that = this;
      reader.onload = function () {
        that.img = this.result;
      };
      reader.readAsDataURL(file.raw);
    },
    refreshClasses() {
      getMyClassApi().then((res) => {
        this.classes.splice(1, this.classes.length);
        this.classes = res;
      });
    },
    createClass() {
      createClassApi(getFormData(this.newClass)).then((res) => {
        this.refreshClasses();
        this.hiddenCreateClassPopup();
      });
    },
    editClass(newclass) {
      midifyInfoApi(newclass).then((res) => {
        this.refreshClasses();
      });
    },
    add2Class() {
      // 加入班级
      add2ClassApi(this.addClassId).then(
        (res) => {
          ElMessage.success("添加成功");
          this.refreshClasses();
          this.showAddClassPopup = false;
        },
        (err) => {
          ElMessage.error(err);
        }
      );
    },
  },
  computed: {
    ...mapState(["user"]),
  },
  mounted() {
    this.refreshClasses();
  },
  components: { myClass, popup, Plus, editClassPopup },
};
</script>

<style scoped lang="less">
.option {
  display: flex;
  justify-content: end;
  li {
    margin: 0 20px;
  }
}
.createClassTable {
  width: 50vw;
  height: 50vh;
  .avatar-uploader {
    @avatar-size: 20vh;
    width: @avatar-size;
    height: @avatar-size;
    display: flex;
    align-items: center;
    justify-content: center;
    img {
      object-fit: cover;
      width: @avatar-size;
      height: @avatar-size;
      border-radius: @avatar-size;
    }
  }
}
</style>