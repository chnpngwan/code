<template>
  <div class="manage-title">视频管理</div>
  <div class="manage-main">
    <div class="selector">
      <el-form :model="selector" label-position="left" :inline="true">
        <el-form-item>
          <el-input v-model="selector.id" placeholder="ID选择" />
        </el-form-item>

        <el-form-item style="width: 100px">
          <el-select v-model="selector.baned" placeholder="封禁查询">
            <el-option label="未封禁" :value="0" />
            <el-option label="封禁" :value="1" />
          </el-select>
        </el-form-item>
        <el-form-item style="width: 100px">
          <el-select v-model="selector.show" placeholder="是否展示">
            <el-option label="不展示" :value="0" />
            <el-option label="展示" :value="1" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="getVideoBySelector">查询</el-button>
        </el-form-item>
        <el-form-item style="width: 100px">
          <el-button @click="clearSelector">清空查询条件</el-button>
        </el-form-item>
      </el-form>
    </div>
    <el-table :data="videos" stripe style="width: 100%">
      <el-table-column prop="id" align="center" label="id" width="50" />
      <el-table-column
        prop="title"
        align="center"
        label="视频标题"
        width="100"
      />
      <el-table-column
        prop="description"
        align="center"
        label="视频简介"
        width="100"
      />
      <el-table-column align="center" label="发布时间" width="130">
        <template #default="scope">
          {{ long2DateStr(scope.row.createTime) }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="封面" width="130">
        <template #default="scope">
          <div class="cover-container" @click="handleCoverClick(scope.row)">
            <img :src="scope.row.cover" class="cover-image img" />
          </div>
        </template>
      </el-table-column>
      <el-table-column align="center" label="视频" width="130">
        <template #default="scope">
          <el-button
            type="text"
            size="small"
            @click="showVideoPopup(scope.row.video)"
          >
            查看视频
          </el-button>
        </template>
      </el-table-column>
      <el-table-column align="center" label="视频时长" width="130">
        <template #default="scope">
          {{ long2MinStr(scope.row.duration) }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="是否被封" width="130">
        <template #default="scope"> {{ getBoolStr(scope.row.baned) }}</template>
      </el-table-column>
      <el-table-column align="center" label="是否展示" width="130">
        <template #default="scope">
          {{ getBoolStr(scope.row.show) }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template #default="scope">
          <el-button
            link
            type="primary"
            size="small"
            @click="handleBan(scope.row)"
            v-if="!scope.row.baned"
          >
            封禁
          </el-button>
          <el-button
            link
            type="primary"
            size="small"
            @click="handleUnban(scope.row)"
            v-if="scope.row.baned"
          >
            解封
          </el-button>
          <el-button
            link
            type="primary"
            size="small"
            @click="handleDelete(scope.row)"
            v-if="scope.row.show"
          >
            删除
          </el-button>
          <el-button
            link
            type="primary"
            size="small"
            @click="handleUndelete(scope.row)"
            v-if="!scope.row.show"
          >
            恢复
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
  <!-- 视频弹出层组件 -->
  <popup :show="videoPopupVisible" :hidden="closeVideoPopup">
    <template #main>
      <div class="video-container">
        <video ref="videoPlayer" class="video" controls></video>
      </div>
    </template>
  </popup>
  <!-- 图片 -->
  <popup :show="imagePopupVisible" :hidden="closeImagePopup">
    <template #main>
      <div class="image-container">
        <img :src="currentImageSrc" class="image" />
      </div>
    </template>
  </popup>
</template>

<script>
import {
  getBySelectorApi,
  banApi,
  unbanApi,
  deleteApi,
  undeleteApi,
} from "@/api/videoManage";
import popup from "../components/popup.vue";
import Hls from "hls.js"
export default {
  data() {
    return {
      selector: {
        // 筛选条件
        id: null,
        baned: null,
        show: null,
      },
      videos: [
        {
          id: 0,
          title: "title",
          description: "1234567",
          createTime: 1234567890000,
          creator: {
            id: 0,
            username: "username",
          },
          cover: "",
          video: "",
          duration: 100,
          playCount: 0,
          collect_count: 0,
          baned: false,
          show: true,
        },
        {
          id: 0,
          title: "title",
          description: "1234567",
          createTime: 1234567890000,
          creator: {
            id: 0,
            username: "username",
          },
          cover: "",
          video: "",
          duration: 100,
          playCount: 0,
          collect_count: 0,
          baned: false,
          show: true,
        },
      ],
      page: 1,
      videoPopupVisible: false, // 控制视频弹出层的显示与隐藏
      currentVideoUrl: "", // 当前显示的视频链接
      imagePopupVisible: false, // 控制图片弹出层的显示与隐藏
      currentImageSrc: "", // 当前显示的图片链接
      hls:null
    };
  },
  methods: {
    getVideoBySelector() {
      getBySelectorApi(this.selector, this.page).then((res) => {
        this.videos.splice(0, this.videos.length, ...res);
      });
    },
    getBoolStr(val) {
      if (val) return "是";
      return "否";
    },
    clearSelector() {
      this.selector = {
        // 筛选条件
        id: null,
        baned: null,
        show: null,
      };
    },
    handleBan(row) {
      banApi(row.id).then(() => {
        row.baned = true; // 更新baned属性
      });
    },
    handleUnban(row) {
      unbanApi(row.id).then(() => {
        row.baned = false; // 更新baned属性
      });
    },
    handleDelete(row) {
      deleteApi(row.id).then(() => {
        row.show = false; // 更新show属性
      });
    },
    handleUndelete(row) {
      undeleteApi(row.id).then(() => {
        row.show = true; // 更新show属性
      });
    },
    showVideoPopup(videoUrl) {
      this.currentVideoUrl = videoUrl;
      this.setupVideoPlayer()
      this.videoPopupVisible = true;
    },

    closeVideoPopup() {
      this.currentVideoUrl = "";
      this.videoPopupVisible = false;
    },
    handleCoverClick(row) {
      this.currentImageSrc = row.cover; // 设置要展示的图片链接
      this.imagePopupVisible = true; // 显示图片弹出层
    },

    closeImagePopup() {
      this.currentImageSrc = ""; // 清空图片链接
      this.imagePopupVisible = false; // 隐藏图片弹出层
    },
    // HLS播放M3U8
    setupVideoPlayer() {
      const video = this.$refs.videoPlayer;
      console.log(video," -- HLS适配");
      if(this.hls){
          this.hls.destroy();
        }
      if(this.currentVideoUrl.endsWith("m3u8")){
        console.log("m3u8视频");
        if (Hls.isSupported()) {
          this.hls = new Hls();
          this.hls.loadSource(this.currentVideoUrl); // 替换为你的M3U8文件路径
          this.hls.attachMedia(video);
          console.log("m3u8配置");
        } else if (video.canPlayType('application/vnd.apple.mpegurl')) {
          video.src = this.currentVideoUrl; // 替换为你的M3U8文件路径
        }
      }else{
        video.src = this.currentVideoUrl; 
      }
    }
  },
  mounted() {
    this.getVideoBySelector();
  },
  components: { popup },
};
</script>

<style scope lang="less">
.video-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 90%;
  .video {
    max-height: 70vh;
  }
}
.cover-container {
  cursor: pointer;
}

.cover-image {
  max-width: 100%;
  height: auto;
}
.image-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 60vh;
  max-height: 100%;

  .image {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
  }
}
</style>