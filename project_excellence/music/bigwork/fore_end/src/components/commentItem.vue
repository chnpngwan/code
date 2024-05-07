<template>
  <div class="container">
    <div class="avatar">
      <RouterLink :to="`/user/${comment.user.id}`">
        <img :src="comment.user.avatar" alt="User Avatar" />
      </RouterLink>
    </div>
    <div class="content">
      <div class="nickname">
        {{ comment.user.nickname }}
        <span v-if="isOwner" class="author-label">作者</span>
      </div>
      <div class="comment">{{ comment.content }}</div>
      <div class="info">
        <div>{{ getDateStr(comment.createTime) }}</div>
        <div class="option" v-if="comment.user.id === $store.state.user.id">
          <el-button link @click="removeComment">删除</el-button>
          <commentEditPopup
            :submit="editComment(comment.id)"
            :content="comment.content"
          ></commentEditPopup>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import commentEditPopup from "./popup/commentEditPopup.vue";
import getDateStr from "@/utils/getDateStr.js";
import { deleteApi } from "@/api/commentApi.js";

export default {
  props: {
    comment: Object,
    delete: Function,
    editComment: Function,
    isOwner: Boolean,
  },
  methods: {
    getDateStr(time) {
      return getDateStr(time);
    },
    removeComment() {
      deleteApi(this.comment.id).then((res) => {
        this.delete();
      });
    },
  },
  components: {
    commentEditPopup,
  },
};
</script>

<style scoped lang="less">
.container {
  margin: 20px 0;
  display: flex;

  .avatar {
    img {
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 50%;
    }
  }

  .content {
    display: flex;
    flex-direction: column;
    margin-left: 20px;

    .nickname {
      font-size: 16px;
      font-weight: 600;
      position: relative;
    }

    .author-label {
      font-weight: bold;
      color: red;
      margin-left: 10px;
    }
    .comment {
      font-size: 18px;
      font-weight: 600;
      height: 80%;
    }

    .info {
      font-size: 14px;
      font-weight: 600;
      display: flex;

      .option {
        margin-left: 10px;
      }
    }
  }
}
</style>