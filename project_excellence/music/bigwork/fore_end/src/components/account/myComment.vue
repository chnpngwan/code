<template>
  <div class="commentItem" v-for="(comment, index) in comments" :key="comment">
    <div class="top">
      <span>{{ comment.video.title }}</span>
      <span>{{ getDateStr(comment.createTime) }}</span>
      <div class="options">
        <el-button link @click="removeComment(comment.id, index)"
          >删除</el-button
        >
        <commentEditPopup
          :submit="editComment(comment.id,index)"
          :content="comment.content"
        ></commentEditPopup>
      </div>
    </div>
    <div class="center">
      <p>{{ comment.content }}</p>
    </div>
  </div>
</template>

<script>
import getDateStr from "@/utils/getDateStr.js";
import commentEditPopup from "@/components/popup/commentEditPopup.vue";
import { getMyCommentApi, deleteApi, modifyContent } from "@/api/commentApi.js";
export default {
  data() {
    return {
      comments: [],
      page: 1,
    };
  },
  methods: {
    getDateStr(time) {
      return getDateStr(time);
    },
    refreshComments() {
      getMyCommentApi(this.page).then((res) => {
        this.comments = res;
      });
    },
    removeComment(id, index) {
      deleteApi(id).then((res) => {
        this.comments.splice(index, 1);
      });
    },
    editComment(id, index) {
      return (newContent) => {
        modifyContent(id, newContent).then((res) => {
          this.comments.splice(index,1,res)
        });
      };
    },
  },
  components: { commentEditPopup },
  mounted() {
    this.refreshComments();
  },
};
</script>

<style scope lang="less">
.commentItem {
  width: 100%;
  height: fit-content;
  padding: 5px 10px;
  .top {
    display: flex;
    span {
      font-size: 14px;
      font-weight: 700;
      margin: 0 10px;
    }
    .options {
      margin-left: 10px;
    }
  }
  .center {
    padding-left: 10px;
    font-size: 16px;
  }
}
</style>