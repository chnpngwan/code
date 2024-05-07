<template>
  <div class="manage-title">视频审核</div>
  <div class="manage-main">
    <el-table :data="videos" stripe style="width: 100%">
      <el-table-column prop="id" align="center" label="视频id" width="70" />
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
      <el-table-column align="center" label="创作者" width="130">
        <template #default="scope">
          {{ scope.row.creator.username }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="封面" width="130">
        <template #default="scope">
          <img
            :src="scope.row.cover"
            class="img"
            style="cursor: pointer"
            @click="showImagePopup(scope.row.cover)"
          />
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
      <el-table-column label="操作" align="center">
        <template #default="scope">
          <el-button
            link
            type="primary"
            @click="pass(scope.row.check_id, scope.$index)"
          >
            过审
          </el-button>
          <el-button
            link
            type="primary"
            @click="fail(scope.row.check_id, scope.$index)"
          >
            不过审
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 弹出层组件 -->
    <popup :show="imagePopupVisible" :hidden="closeImagePopup">
      <template #main>
        <div class="image-container">
          <img :src="currentImageSrc" class="image" />
        </div>
      </template>
    </popup>
    <popup :show="videoPopupVisible" :hidden="closeVideoPopup">
      <template #main>
        <div class="video-container">
          <video ref="videoPlayer"  class="video" controls></video>
        </div>
      </template>
    </popup>
  </div>
</template>

<script>
import {
  get,
  uncheck,
  pass as passApi,
  unpass,
} from "@/api/check/videoCheckApi.js";
import popup from "@/components/popup.vue";
import Hls from 'hls.js';
export default {
  data() {
    return {
      videos: [],
      imagePopupVisible: false, // 控制图片弹出层的显示与隐藏
      videoPopupVisible: false, // 控制视频弹出层的显示与隐藏
      currentImageSrc: "", // 当前显示的图片链接
      currentVideoSrc: "", // 当前显示的视频链接
      hls:null
    };
  },
  methods: {
    selectBySelector() {
      console.log(this.selector);
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
    uncheck() {
      let ids = new Array();
      this.videos.forEach((video) => {
        ids.push(video.check_id);
      });
      uncheck(ids);
    },
    pass(id, index) {
      passApi(id).then((res) => {
        this.videos.splice(index, 1);
      });
    },
    fail(id, index) {
      unpass(id).then((res) => {
        this.videos.splice(index, 1);
      });
    },
    showImagePopup(imageSrc) {
      this.currentImageSrc = imageSrc;
      this.imagePopupVisible = true;
    },

    closeImagePopup() {
      this.currentImageSrc = "";
      this.imagePopupVisible = false;
    },

    showVideoPopup(videoSrc) {
      console.log("查看视频 ");
      this.currentVideoSrc = videoSrc;
      this.setupVideoPlayer();
      this.videoPopupVisible = true;
    },

    closeVideoPopup() {
      this.currentVideoSrc = "";
      this.videoPopupVisible = false;
    },
    // HLS播放M3U8
    setupVideoPlayer() {
      const video = this.$refs.videoPlayer;
      console.log(video," -- HLS适配");
      if(this.hls){
          this.hls.destroy();
        }
      if(this.currentVideoSrc.endsWith("m3u8")){
        console.log("m3u8视频");
        if (Hls.isSupported()) {
          this.hls = new Hls();
          this.hls.loadSource(this.currentVideoSrc); // 替换为你的M3U8文件路径
          this.hls.attachMedia(video);
          console.log("m3u8配置");
        } else if (video.canPlayType('application/vnd.apple.mpegurl')) {
          video.src = this.currentVideoSrc; // 替换为你的M3U8文件路径
        }
      }else{
        video.src = this.currentVideoSrc; 
      }
    }
  },
  mounted() {
    window.addEventListener("beforeunload", (e) => this.uncheck(e));
    get().then((res) => {
      this.videos = res;
    });
  },
  beforeRouteLeave(to, from, next) {
    this.uncheck();
    next();
  },
  beforeDestroy() {
    this.uncheck();
  },
  components: { popup },
};
</script>

<style scope lang="less">
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

.video-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 60vh;
  max-height: 100%;

  .video {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
  }
}
</style>