<template>
  <div id="body">
    <div id="info">
      <div class="avatar"><img :key="user.avatar" :src="user.avatar"/></div>
      <p class="name">{{ user.nickname }}</p>
      <p class="description">
        {{ user.description }}
      </p>
    </div>
    <div class="aboutme">
      <RouterLink class="button" :to="`/works/${user.id}`">视频{{ user.works }}</RouterLink>
      <RouterLink class="button" :to="`/works/${user.id}`">班级{{ user.collections }}</RouterLink>
      <RouterLink class="button" :to="{ path: `/account/chat`, query: { id: user.id,nickname:user.nickname }}">私信</RouterLink>
    </div>
  </div>
</template>

<script>
import {getInfo} from "@/api/userApi.js"
export default {
    data(){
        return {
            user:{}
        }
    },
    mounted(){
        let uid = this.$route.params.id
        getInfo(uid).then(
            res=>{this.user = res}
        )
    }
}
</script>


<style scoped lang="less">
a,
a:link,
a:visited,
a:hover,
a:active,
a:focus {
  text-decoration: none;
  color: black;
}

#body {
  padding-top: 60px;
  width: 100vw;
  height: 100vh;
  #info {
    width: 100vw;
    height: fit-content;
    text-align: center;
    .avatar {
      margin: 0 auto;

      width: 15vw;
      height: 15vw;
      border-radius: 50%;
      img{
        height: 100%;
        width: 100%;
        object-fit: cover;
        border-radius: 50%;
      }
    }

    .name {
      padding-top: 2vw;
      color: black;
      font-size: 35px;
    }

    .description {
      font-size: 20px;
      padding-top: 3.5vw;
    }
  }
  .aboutme {
    margin: 0 auto;
    padding-top: 3.5vh;
    font-size: 20px;
    color: black;
    display: flex;
    width: 30%;
    justify-content: space-between;

    .button {
      line-height: 5vh;
      height: 5vh;
      padding: 0 40px;
      width: fit-content;
      text-align: center;
      display: inline-block;
      border: 1px solid black;
      border-radius: 3vw;
    }
  }
}
</style>