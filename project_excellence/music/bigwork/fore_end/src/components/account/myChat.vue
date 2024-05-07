<template>
  <div class="container-chat">
    <!-- 父组件的其他内容 -->
    <ul class="chatUsers">
      <li
        class="userCard"
        v-for="user in chatHistory"
        :key="user.nickname"
        @click="openChat(user.userId, user.nickname)"
      >
        {{ user.nickname }}
      </li>
    </ul>
    <chatChild
      v-if="showChild"
      :chatHistory="showHistory"
      :userId="selectedUserId"
      :username="selectedUsername"
      @sendMessage="sendMessage"
    />
  </div>
</template>
  
  <script>
import baseUrl from "@/api/baseUrl.js";
import { mapState } from "vuex";
import chatChild from "./chatChild.vue";
export default {
  data() {
    return {
      showChild: false,
      selectedUserId: null,
      selectedUsername: null,
      showHistory: [],
      socket: null,
    };
  },
  inject: ["reload"],
  computed: {
    ...mapState(["chatHistory"]),
  },
  async mounted() {
    this.$store.dispatch("getChatHistory");
    this.socket = new WebSocket(`ws://127.0.0.1:13795/videoapi/chat`);
    // 接收消息绑定事件
    this.socket.onmessage = async (event) => {
        let data = JSON.parse(event.data);
      // const message = JSON.parse(event.data);
      if (!data.senderId in this.chatHistory) {
        let i = await this.$store.commit("addChatUser", {
            senderId:data.senderId,
            nickname: data.nickname
        });
      }
      console.log("接收消息", event);

      let i = await this.$store.commit("addChatLog", {userId:data.senderId,data});
      this.saveHistory();
      if(data.senderId == this.selectedUserId)
        this.showHistory.push(data);
    };
    let userId = this.$route.query.id;
    if (userId == null) {
      return;
    }
    let nickname = this.$route.query.nickname;
    console.log("nickname,", nickname);
    if (!(userId in this.chatHistory)) {
      let info = { userId: userId, nickname: nickname };
      this.$store.dispatch("addChatUser", info);
      this.reload();
    }
    this.openChat(userId, nickname);
  },
  methods: {
    openChat(userId, nickname) {
      this.selectedUserId = userId;
      this.selectedUsername = nickname;
      if (this.chatHistory[userId] == null) {
        this.$store.dispatch("addChatUser", { userId, nickname });
      }
      this.showHistory.splice(
        0,
        this.showHistory.length,
        ...this.chatHistory[userId].chatData
      );
      this.showChild = true;
    },
    // 发送消息方法
    sendMessage(receiveId, message) {
      const payload = {
        receiveId,
        message,
      };
      this.socket.send(JSON.stringify(payload));
      let data = {
        senderId: this.$store.state.user.id,
        message,
      }
      
        this.showHistory.push(data);
      this.$store.commit("addChatLog",{userId:receiveId,data})
      this.saveHistory();
    },
    saveHistory(){this.$store.commit("saveChatHistory");}
  },
  components: { chatChild },
  beforeDestroy(){
    this.saveHistory();
  }
};
</script>

<style scoped lang="less">
.container-chat {
  display: flex;
  .chatUsers {
    width: 150px;
    max-height: 300px;
    .userCard {
      width: 100%;
      height: 30px;
      text-align: center;
      line-height: 30px;
      background-color: pink;
      margin-bottom: 5px;
    }
  }
}
</style>