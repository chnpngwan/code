<template>
  <!-- 上方标题 -->
  <div class="top">
    <p class="title">{{ video.title }}</p>
  </div>
  <!-- 视频主体 -->
  <div class="main">
    <video ref="videoPlayer" controls @play="handlePlay" @ended="handleEnded" @pause="handleEnded">
      <source :src="video.video" :key="video.video" />
    </video>
  </div>
  <!-- 视频下方信息展示 -->
  <div class="buttom">
    <div class="primart-btn"></div>
    <p class="description">{{ video.description }}</p>
    <div class="tags">
      <el-tag v-for="tag in video.tags" :key="tag">{{ tag.name }}</el-tag>
    </div>
  </div>
  <!-- 评论部分 -->
  <div class="comment">
    <div class="publishBox">
      <div class="avatar"><img :src="$store.state.user.avatar" /></div>
      <div class="commentInput">
        <el-input
          class="contentInput"
          type="textarea"
          :rows="4"
          v-model="sendComment"
          placeholder="发表评论"
          :autosize="{ minRows: 4, maxRows: 5 }"
        ></el-input>
      </div>
      <div class="sendButton">
        <el-button type="primary" style="height: 100%" @click="publishComment">
          发送
        </el-button>
      </div>
    </div>
    <template v-for="(comment, index) in comments" :key="comment">
      <commentItem
        :comment="comment"
        :delete="removeComment(index)"
        :editComment="editComment(index)"
        :isOwner="this.video.creator.id === comment.user.id"
      ></commentItem>
    </template>
  </div>
  <!-- 悬浮: 班级相关信息 -->
  <div class="clazzInfo" v-if="video.cid != 0">
    <myClassItem :clazz="clazz" :key="clazz"></myClassItem>
    <div class="clazzVideo">
      <p>视频列表</p>
      <el-table
        class="clazzVideosInfo"
        :data="clazzVideos"
        height="200px"
        :row-style="{ height: '1rem', cursor: 'pointer' }"
      >
        <el-table-column width="20">
          <template #default="scope">
            {{ scope.$index }}
          </template>
        </el-table-column>
        <el-table-column>
          <template #default="scope">
            <template v-if="vid == scope.row.id">
              <el-text type="primary">{{ scope.row.title }}</el-text>
            </template>
            <template v-else><p @click="jump(scope.row.id)">{{ scope.row.title }}</p></template>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>

  <!-- 作者信息 -->
  <div class="userDetailCard-wrapper">
    <p>作者：</p>
    <userDetailCard :user="creator"></userDetailCard>
  </div>
</template>

<script>
import { getVideo, getByClassApi } from "@/api/videoApi.js";
import {
  getVideoCommentApi,
  publishApi,
  modifyContent,
} from "@/api/commentApi.js";
import { getByCidApi } from "@/api/classApi.js";
import commentItem from "../components/commentItem.vue";
import myClassItem from "../components/global/myClassItem.vue";
import { ElMessage } from 'element-plus';
import { updateApi,getByVidApi } from "@/api/historyApi.js";
import Hls from 'hls.js';
import userDetailCard from '../components/global/userDetailCard.vue';
export default {
  data() {
    return {
      vid: 0,
      video: {},
      creator : {id:0,username:"",nickname:"",avatar:""},
      comments: [],
      commentPage: 1,
      sendComment: "",
      clazz: {},
      clazzVideos: [],
      timer: null,
      history:null,
    };
  },
  inject: ["reload"],
  methods: {
    publishComment() {
      publishApi(this.vid, this.sendComment).then((res) => {
        this.comments.push(res);
        this.sendComment = "";
      });
    },
    removeComment(index) {
      let that = this;
      return function () {
        that.comments.splice(index, 1);
      };
    },
    editComment(index) {
      return (id) => {
        return (newContent) => {
          modifyContent(id, newContent).then((res) => {
            this.comments.splice(index, 1, res);
          });
        };
      };
    },
    async jump(id) {
      let t = await this.$router.push(`/video/${id}`);
      this.reload();
    },
    handlePlay() {
      // 视频播放事件处理逻辑
      if(this.timer != null){
        this.handleEnded();
      }
      this.timer = setInterval(this.updateApi, 5000);
    },
    handleEnded() {
      // 视频结束时停止定时器
      clearInterval(this.timer); 
      this.timer = null;
      this.updateApi();
    },
    updateApi(){
      // 每隔 5 秒调用的方法
      // 在这里可以访问视频的播放进度
      const videoElement = this.$refs.videoPlayer;
      const data = {
        id:this.history.id,
        vid:this.vid,
        time:videoElement.currentTime
      }
      updateApi(data).then(res=>{},
      error=>{console.log("this.updateApi error",error);})
    },
    // HLS播放M3U8
    setupVideoPlayer() {
      const video = this.$refs.videoPlayer;
      console.log(video," -- HLS适配");
      if(this.video.video.endsWith("m3u8")){
        if (Hls.isSupported()) {
          const hls = new Hls();
          hls.loadSource(this.video.video); // 替换为你的M3U8文件路径
          hls.attachMedia(video);
        } else if (video.canPlayType('application/vnd.apple.mpegurl')) {
          video.src = this.video.video; // 替换为你的M3U8文件路径
        }
      }
    }
  },
  mounted() {
    this.vid = this.$route.params["id"];
    getVideo(this.vid).then((res) => {
      this.video = res;
      if(this.video.video == ""){
        ElMessage.error("没有访问权限，请加入班级");
      }else{
        this.setupVideoPlayer()
        this.creator = this.video.creator
      }
      // 获取历史记录，跳转历史时间
      getByVidApi(this.video.id).then(
        res=>{
          this.history = res;
          const videoElement = this.$refs.videoPlayer;
          videoElement.currentTime = this.history.time;
        }
      )
      if (this.video.cid != 0) {
        getByCidApi(this.video.cid).then((res) => {
          this.clazz = res;
        });
        getByClassApi(this.video.cid).then((res) => {
          this.clazzVideos = res;
        });
      }

    });
    getVideoCommentApi(this.vid, this.commentPage).then((res) => {
      this.comments = res;
    });
    

  },
  beforeDestroy() {
    // 停止定时器
    this.handleEnded();
  },
  components: { commentItem, myClassItem,userDetailCard },
};
</script>

<style scoped lang="less">
.top {
  font-size: 20px;
  padding: 10px 15vw;
  .title {
    font-size: 24px;
    font-weight: 750;
  }
}

.main {
  width: 100%;
  height: fit-content;
  padding: 10px 15vw;
  video {
    width: 100%;
  }
}

.buttom {
  padding: 10px 15vw;
  .description {
    font-size: 16px;
  }
}

.comment {
  min-height: 80vh;
  width: 70vw;
  margin: 30px auto 0 auto;
  padding: 0 0 0 10px;
  .publishBox {
    @avatar-size: 100px;
    display: flex;
    width: 80%;
    height: @avatar-size;
    align-items: center;

    .avatar {
      img {
        width: @avatar-size;
        height: @avatar-size;
        border-radius: 50%;
      }
    }
    .commentInput {
      flex: 7;
      margin: 0 0 0 20px;
      .contentInput {
        height: @avatar-size;
        resize: none;
      }
    }
    .sendButton {
      height: @avatar-size;
      button {
        height: 100%;
      }
    }
  }
}

.clazzInfo {
  position: absolute;
  right: 15px;
  top: 120px;
  .clazzVideo {
    margin-top: 10px;
    .el-form-item {
      margin: 0;
    }
  }
}

.userDetailCard-wrapper {
  position: absolute;
  left: 15px;
  top: 50%;
  transform: translateY(-50%);
}
</style>