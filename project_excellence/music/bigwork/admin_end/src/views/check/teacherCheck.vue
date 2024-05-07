<template>
  <div class="manage-title">教师审核</div>
  <div class="manage-main">
    <el-table :data="auths" stripe style="width: 100%">
      <el-table-column prop="id" align="center" label="id" width="50" />
      <el-table-column label="申请时间" width="100">
        <template #default="scope">
          {{ long2DateStr(scope.row.createTime) }}
        </template>
      </el-table-column>
      <el-table-column label="申请ID" prop="uid"></el-table-column>

      <el-table-column align="center" label="个人介绍" width="130">
        <template #default="scope">
          <el-text truncated>{{ scope.row.description }}</el-text>
        </template>
      </el-table-column>
      <el-table-column label="证书">
        <template #default="scope">
          <el-button link type="primary" @click="showDetail(scope.row)">
            详情</el-button
          >
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center">
        <template #default="scope">
          <el-button
            link
            type="primary"
            @click="pass(scope.row.id, scope.$index)"
          >
            通过
          </el-button>
          <el-button
            link
            type="primary"
            @click="unpass(scope.row.id, scope.$index)"
          >
            不通过
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
  <popup :hidden="hiddenPop" :show="showPop">
    <template #main>
          <ul class="showImage">
            <template v-for="detailImg in Detail.images" :key="detailImg">
              <li><img :src="detailImg" /></li>
            </template>
          </ul>
          <div class="showDescription">个人介绍 : {{ Detail.description }}</div>

    </template>
  </popup>
</template>

<script>
import {
  getTeacherCheckInfo,
  passApi,
  unpassApi,
  exit,
} from "@/api/check/teacherCheckApi.js";
import popup from "../../components/popup.vue";
export default {
  components: { popup },
  data() {
    return {
      auths: [
      ],
      Detail:{
        images:[],
        description:""
      },
      showPop: false,
    };
  },
  methods: {
    refreshAuths() {
      getTeacherCheckInfo().then((res) => {
        this.auths = res;
      });
    },
    pass(id, index) {
      passApi(id).then((res) => {
        this.auths.splice(index, 1);
      });
    },
    unpass(id, index) {
      unpassApi(id).then((res) => {
        this.auths.splice(index, 1);
      });
    },
    showDetail(auth) {
      this.Detail.images = auth.images;
      this.Detail.description = auth.description;
      this.showPop = true
    },
    hiddenPop() {
      this.showPop = false;
    },
  },
  mounted() {
    this.refreshAuths();
  },
  beforeRouteLeave() {
    exit();
  },
};
</script>

<style scoped lang="less">
.showImage{
  width: 900px;
  display: flex;
  padding: 10px 20px;
  justify-content: space-between;
  li{
    width: 30%;

    img{
      width: 100% !important;
      height: auto !important;
    }
  }

}

.showDescription{
  padding: 10px 20px;
  width: 900px;
  font-weight: 600;
  font-size: large;
}
</style>