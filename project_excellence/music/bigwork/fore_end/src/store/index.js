import { createStore } from "vuex"
import { status } from "@/api/userApi.js"

export default createStore({
  state: {
    user: {
      id: null
    },
    chatHistory: {
    },
  },
  mutations: {
    updateUser(state, user) {
      console.log("updateUser mutation");
      state.user = user
    },
    updateAvatar(state, avatar) {
      console.log("updateAvatar mutation");
      state.user.avatar = avatar
    },
    refreshUser(state) {
      state.user = {
        id: null
      }
    },
    // 将chatHistory存储在localStorage中
    saveChatHistory(state) {
      localStorage.setItem("chatHistory", JSON.stringify(state.chatHistory));
    },

    // 将chatHistory从localStorage中取出
    getChatHistory(state) {
      const savedChatHistory = localStorage.getItem("chatHistory");
      if (savedChatHistory) {
        state.chatHistory = JSON.parse(savedChatHistory);
      }
    },
    flushChatHistory(state){
      localStorage.setItem("chatHistory", JSON.stringify([]));
      state.chatHistory = []
    },
    addChatUser(state, { userId, nickname }) {
      console.log("添加聊天用户", nickname);
      state.chatHistory[userId] = {
        userId: userId,
        nickname: nickname,
        chatData: [],
      };
    },
    addChatLog(state, { userId, data: { senderId, message, nickname } }) {
      if (!(userId in state.chatHistory)) {
        state.chatHistory[userId] = {
          userId: userId,
          nickname: nickname,
          chatData: [],
        };
      }
      state.chatHistory[userId].chatData.push({ senderId, message })
    }
  },
  actions: {
    updateUser(content, user) {
      status().then(res => {
        content.commit("updateUser", res)
      })

    },
    updateAvatar(content, avatar) {
      console.log("updateAvatar action");
      content.commit("updateAvatar", avatar)
    },
    refreshUser(content) {
      content.commit("refreshUser")
    },
    addChatUser(content, info) {
      let userId = info.userId
      let nickname = info.nickname
      console.log(info);
      console.log("actions,", nickname);
      console.log("actions,", userId);
      content.commit("addChatUser", info)
    },
    addChatLog(content, info) {
      content.commit("addChatLog", info)
    },
    // 异步调用，将 chatHistory 保存到本地存储
    saveChatHistory(context) {
      context.commit("saveChatHistory");
    },

    // 异步调用，从本地存储中获取 chatHistory
    getChatHistory(context) {
      context.commit("getChatHistory");
    }


  }
})