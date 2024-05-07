<template>
  <div class="container">
    <div class="className">{{ classInfo.name }}</div>
    <div class="classAvatar">
      <img
        v-if="$store.state.user.id != classInfo.creator.id"
        :src="classInfo.avatar"
      />
      <div class="avatar" v-if="$store.state.user.id == classInfo.creator.id">
        <el-upload
          class="avatar-uploader"
          action=""
          :file-list="fileList"
          :show-file-list="false"
          :on-change="changeFile"
          :auto-upload="false"
        >
          <img :src="img" class="avatar" title="点击修改班级头像" />
        </el-upload>
        <editClassPopup :clazz="classInfo" :submit="editClass" />
      </div>
    </div>
    <div class="classDescription">{{ classInfo.description }}</div>
    <div class="studenList">
      <p>
        人数:{{ classInfo.studentNum }}
        <el-button link @click="showAllStus">查看全部</el-button>
      </p>
      <div class="userList">
        <template v-for="user in classInfo.stu" :key="user.id">
          <router-link to="#">
            <div class="userInfo">
              <RouterLink :to="'/user/' + user.id">
                <img :src="user.avatar" />
                <p>{{ user.nickname }}</p>
              </RouterLink>
            </div>
          </router-link>
        </template>
      </div>
    </div>
  </div>
  <!-- 展示所有成员名称 -->
  <popup
    :show="showStus"
    :hidden="
      () => {
        showStus = false;
      }
    "
  >
    <template #main>
      <div class="stuAllList">
        <p><el-text type="primary">学生名单</el-text></p>
        <template v-for="(user, index) in stus" :key="user.id">
          <template v-if="index != 0 && index % 10 == 0"><br /></template>
          <RouterLink :to="`/user/${user.id}`">
            <el-button link>{{ user.nickname }}</el-button>
          </RouterLink>
        </template>
      </div>
    </template>
  </popup>
  <!-- 悬浮组件1 班主任信息展示-->
  <div class="userCard">
    <p>班主任</p>
    <userDetailCard :user="classInfo.creator"></userDetailCard>
  </div>
  <!-- 悬浮组件2 退出班级按钮 -->
  <div class="options">
    <p>班级号 : {{ classInfo.id }}</p>
    <el-button
    type="primary"
    v-if="classInfo.creator.id != $store.state.user.id"
    @click="add2ClassApi"
    >
    加入班级
    </el-button>
    <el-button
      v-if="classInfo.creator.id != $store.state.user.id"
      type="danger"
      @click="outClass"
      >退出班级</el-button
    >
    <el-button
      v-if="classInfo.creator.id == $store.state.user.id"
      type="danger"
      @click="ownerOutClass"
      >退出班级</el-button
    >
  </div>

  <!-- 悬浮组件3  班级课程列表 -->
  <div class="clazzInfo">
    <div class="clazzVideo">
      <p>视频列表</p>
      <el-table
        class="clazzVideosInfo"
        :data="clazzVideos"
        height="200px"
        :row-style="{ height: '1rem', cursor: 'pointer' }"
      >
        <el-table-column width="80" label="序号">
          <template #default="scope">
            {{ scope.$index }}
          </template>
        </el-table-column>
        <el-table-column label="标题">
          <template #default="scope">
            <template v-if="vid == scope.row.id">
              <el-text type="primary">{{ scope.row.title }}</el-text>
            </template>
            <template v-else
              ><p @click="jump(scope.row.id)">
                {{ scope.row.title }}
              </p></template
            >
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
import {
  getByCidApi,
  modifyAvatarApi,
  midifyInfoApi,
  getStuListApi,
  removeClassApi,
  deleteClassApi,
} from "@/api/classApi.js";
import userDetailCard from "../components/global/userDetailCard.vue";
import editClassPopup from "../components/class/editClassPopup.vue";
import { ElMessage } from "element-plus";
import popup from "../components/global/popup.vue";
import { getByClassApi } from "@/api/videoApi.js";
import { add2ClassApi } from  "@/api/classApi.js";
export default {
  data() {
    return {
      classInfo: {
        id: 0,
        name: "",
        description: "",
        creator: { avatar: "", nickname: "", description: "" },
      },
      clazzVideos:[],
      img: "",
      fileList: [],
      stus: [],
      page: 1,
      showStus: false,
    };
  },
  methods: {
    changeFile(file, fileList) {
      modifyAvatarApi(this.classInfo.id, file.raw).then((res) => {
        if (fileList.length > 1) {
          fileList.splice(0, 1);
        }
        this.avatar = file.raw;
        let reader = new FileReader();
        let that = this;
        reader.onload = function () {
          that.img = this.result;
        };
        reader.readAsDataURL(file.raw);
      });
    },
    refreshClass() {
      getByCidApi(this.classInfo.id).then((res) => {
        this.classInfo = res;
      });
    },
    editClass(newClass) {
      midifyInfoApi(newClass).then((res) => {
        this.refreshClass();
      });
    },
    outClass() {
      this.$confirm("是否退出班级", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          let data = {
            cid: this.classInfo.id,
            uid: this.$store.state.user.id,
          };
          removeClassApi(data).then((res) => {
            ElMessage.success("退出成功");
            this.$router.back();
          });
        })
        .then(() => {});
    },
    ownerOutClass() {
      this.$confirm("您是班主任退出班级即为解散班级", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          deleteClassApi(this.classInfo.id).then((res) => {
            ElMessage.success("退出成功");
            this.$router.back();
          });
        })
        .then(() => {});
    },
    showAllStus() {
      getStuListApi(this.classInfo.id, this.page).then((res) => {
        this.stus = res;
      });
      this.showStus = true;
    },
    async jump(id) {
      let t = await this.$router.push(`/video/${id}`);
    },
    add2ClassApi(){
      add2ClassApi(this.classInfo.id).then(
        res=>{
          ElMessage.success("添加成功")
        }
      )
    }
  },
  beforeMount() {
    this.classInfo.id = this.$route.params.cid;
    getByCidApi(this.classInfo.id).then((res) => {
      this.classInfo = res;
      this.img = this.classInfo.avatar;
    });
  },
  mounted(){
    if(this.classInfo.id != 0){
    getByClassApi(this.classInfo.id).then(res=>{
      this.clazzVideos = res;
    })
    }
  },
  components: { userDetailCard, editClassPopup, popup },
};
</script>

<style scoped lang="less">
.container {
  width: 100%;
  min-height: 90vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0 30px;
  .className {
    font-size: 32px;
    font-weight: 700;
    margin-bottom: 20px;
  }
  .classAvatar {
    @avatar-size: 350px;
    width: @avatar-size;
    height: @avatar-size;
    margin-bottom: 20px;
    img {
      width: @avatar-size;
      height: @avatar-size;
      border-radius: @avatar-size;
    }
    .avatar {
      display: flex;
      align-items: center;
      .avatar-uploader {
        margin: 0 auto;
        width: @avatar-size;
        height: @avatar-size;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #eee;
        // border: 1px solid #eee;
      }
    }
  }
  .classDescription {
    font-size: 24px;
    line-height: 30px;
    height: 60px;
    max-width: 50%;
  }
  .studenList {
    width: 100vw;
    padding: 0 60px;
    text-align: left;
    .userList {
      display: flex;
      .userInfo {
        margin: 0 10px;
        width: 100px;
        height: 100px;
        display: flex;
        flex-direction: column;
        align-items: center;
        img {
          width: 100px;
          height: 100px;
          border-radius: 50%;
        }
      }
    }
  }
}
.stuAllList {
  width: 500px;
  height: 400px;
  margin: 0px 40px;
}
.userCard {
  position: fixed;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
  p {
    width: 100%;
    text-align: center;
    font-size: 24px;
    font-weight: 400;
  }
}

.options {
  position: fixed;
  bottom: 80vh;
  right: 10px;
  p {
    font-size: 24px;
    font-weight: 900;
  }
}

.clazzInfo {
  position: absolute;
  left: 15px;
  top: 120px;
  width: 300px;
  .clazzVideo {
    margin-top: 10px;

    .el-form-item {
      margin: 0;
    }
  }
}
</style>