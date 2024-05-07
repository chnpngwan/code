<template>
  <div>
    <div class="chat-card">
        <p class="title">{{ username }}</p>
      <div
        v-for="message in chatHistory"
        :key="message"
        class="chat-message"
      >
      <template  v-if="$store.state.user.id != message.senderId">
        <p class="sender"><span>{{ username }}:</span>
            {{ message.message }}
        </p>
    </template>
    <template  v-if="$store.state.user.id == message.senderId">
        <p class="mine" >
            {{ message.message }}
        <span >:我</span>
    </p>
        
    </template>
      </div>
    </div>

    <el-input
      v-model="newMessage"
      type="text"
      placeholder="Type your message..."
      class="chat-input"
    ></el-input>

    <el-button type="primary" @click="sendMessage">Send</el-button>
  </div>
</template>
  
  <script>
export default {
  props: {
    chatHistory: Array,
    userId: String,
    username: String,
  },
  data() {
    return {
      newMessage: "",
    };
  },
  methods: {
    sendMessage() {
      this.$emit("sendMessage", this.userId, this.newMessage);
      this.newMessage = "";
    },
  },
};
</script>

<style lang="less" scoped>
@card-margin: 20px;
@card-padding: 20px;
@card-max-width: 600px;
@card-min-height: 400px;
@message-margin-bottom: 10px;
@sender-font-weight: bold;
@input-margin: 20px;
@input-width: 400px;
@button-margin-left: 20px;

.chat-card {
  max-width: @card-max-width;
  min-height: @card-min-height;
.title{
    width: 100%;
    height: 30px;
    line-height: 30px;
    text-align: center;
    font-weight: 700;
    font-size: 24px;
}
  .chat-message {
    margin-bottom: @message-margin-bottom;

    .sender {
      font-weight: @sender-font-weight;
      text-align: left;
      width: 100%;
    }

    .mine{
        width: 100%;
        text-align: right;
    }
  }
}

.chat-input {
  margin: @input-margin;
  width: @input-width;
}

.send-button {
  margin-left: @button-margin-left;
}
</style>