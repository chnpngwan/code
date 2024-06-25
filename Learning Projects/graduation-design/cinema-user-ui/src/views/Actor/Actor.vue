<template>
  <div class="actor-container">
    <div class="header">
      <div class="header-inner clearfix">
        <div class="movie-info-left">
          <div class="avatar-shadow">
            <img class="avatar" :src="actorInfo.image" />
          </div>
        </div>
        <div class="movie-info-right">
          <div class="movie-info-msg">
            <h1 class="movie-name">{{ actorInfo.name }}</h1>
            <ul>
              <li>
                {{
                  actorInfo.dutyNameList.join(" | ") +
                  (actorInfo.age ? " | " + actorInfo.age + "岁" : "") +
                  (actorInfo.height
                    ? " | " + actorInfo.height.toFixed(0) + "cm"
                    : "")
                }}
              </li>
            </ul>
          </div>
          <div class="major-movie">
            <div>代表作</div>
            <div class="major-movie-list">
              <img
                :src="item.image"
                v-for="item in actorInfo.movieList"
                :key="item.id"
              />
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="movie-info-detail-container">
      <div class="movie-info-detail clearfix">
        <div class="main-content">
          <div class="module">
            <div class="mod-title">
              <h2>介绍</h2>
            </div>
            <div class="mod-content">
              <span class="dra">
                {{ actorInfo.information }}
              </span>
            </div>
            <!-- 详细信息 -->
            <div class="actorInfo-list">
              <dl class="dl-left">
                <dt class="basicInfo-item name" v-if="actorInfo.age">年龄</dt>
                <dd class="basicInfo-item value" v-if="actorInfo.age">
                  {{ actorInfo.age }}
                </dd>
                <dt class="basicInfo-item name" v-if="actorInfo.nation">
                  出生地
                </dt>
                <dd class="basicInfo-item value" v-if="actorInfo.nation">
                  {{ actorInfo.nation }}
                </dd>
                <dt class="basicInfo-item name" v-if="actorInfo.dutyNameList">
                  身份
                </dt>
                <dd class="basicInfo-item value" v-if="actorInfo.dutyNameList">
                  {{ actorInfo.dutyNameList.join(" | ") }}
                </dd>
                <dt class="basicInfo-item name" v-if="actorInfo.gender">
                  性别
                </dt>
                <dd class="basicInfo-item value" v-if="actorInfo.gender">
                  {{ actorInfo.gender ? "男" : "女" }}
                </dd>
                <dt class="basicInfo-item name" v-if="actorInfo.nation">
                  国&nbsp;&nbsp;&nbsp;&nbsp;籍
                </dt>
                <dd class="basicInfo-item value" v-if="actorInfo.nation">
                  {{ actorInfo.nation }}
                </dd>
              </dl>
              <dl class="dl-right">
                <dt class="basicInfo-item name" v-if="actorInfo.race">民族</dt>
                <dd class="basicInfo-item value" v-if="actorInfo.race">
                  {{ actorInfo.race }}
                </dd>
                <dt class="basicInfo-item name" v-if="actorInfo.bloodType">
                  血型
                </dt>
                <dd class="basicInfo-item value" v-if="actorInfo.bloodType">
                  {{ actorInfo.bloodType }}
                </dd>
                <dt class="basicInfo-item name" v-if="actorInfo.height">
                  身高
                </dt>
                <dd class="basicInfo-item value" v-if="actorInfo.height">
                  {{ actorInfo.height ? actorInfo.height + "cm" : "" }}
                </dd>
                <dt class="basicInfo-item name" v-if="actorInfo.constellation">
                  星座
                </dt>
                <dd class="basicInfo-item value" v-if="actorInfo.constellation">
                  {{ actorInfo.constellation }}
                </dd>
                <dt class="basicInfo-item name" v-if="actorInfo.school">
                  毕业学校
                </dt>
                <dd class="basicInfo-item value" v-if="actorInfo.school">
                  {{ actorInfo.school }}
                </dd>
              </dl>
            </div>
          </div>

          <div class="module">
            <div class="mod-title">
              <h2>作品</h2>
            </div>
            <div class="mod-content">
              <movie-item
                v-for="item in actorInfo.movieList"
                :movieItem="item"
                :key="item.id"
                class="movie-item-style"
              >
              </movie-item>
            </div>
          </div>
        </div>

        <!-- 相关影人 -->
        <div class="aside">
          <div class="relationship">
            <div class="module">
              <div class="mod-title">
                <h2>相关影人</h2>
              </div>
              <div class="mod-content relational-actors">
                <div
                  class="relational-actor"
                  v-for="item in actorInfo.relationshipList"
                  :key="item.id"
                >
                  <router-link :to="'/actor/' + item.id">
                    <el-image :src="item.image" class="relational-actor-photo" />
                  </router-link>
                  <router-link :to="'/actor/' + item.id">
                    <span>{{ item.name }}</span>
                  </router-link>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import movieItem from "../../components/movie-item";

export default {
  components: {
    movieItem,
  },
  data() {
    return {
      actorId: this.$route.params.actorId,
      actorInfo: {},
    };
  },
  created() {
    this.getActorDetail();
  },
  watch: {
    $route() {
      this.actorId = this.$route.params.actorId;
    },
    actorId() {
      this.getActorDetail();
    },
  },
  methods: {
    getActorDetail() {
      this.axios
        .get("/api/actor/detail", {
          params: {
            actorId: this.actorId,
          },
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.actorInfo = data.data;
            this.actorInfo.dutyNameList = [];
            this.actorInfo.dutyList.forEach((item) => {
              this.actorInfo.dutyNameList.push(item.name);
            });
          } else {
            this.$notify.error({
              title: "失败",
              message: data.message,
            });
          }
        });
    },
  },
};
</script>

<style scoped>
a {
  text-decoration: none;
  cursor: pointer;
}

.header {
  padding: 0;
  width: 100%;
  min-width: 1300px;
  background: url("../../assets/movie-info-background.jpg");
}

.header-inner {
  width: 1200px;
  margin: 0 auto;
  position: relative;
}

.clearfix::before,
.clearfix::after {
  content: " ";
  display: table;
}

.clearfix::after {
  clear: both;
}

.movie-info-left {
  width: 300px;
  height: 370px;
  float: left;
  position: relative;
  top: 70px;
  overflow: hidden;
}

.avatar-shadow {
  position: relative;
  margin: 0 30px;
  width: 240px;
  height: 330px;
  padding-bottom: 40px;
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPAAAAAyAgMAAAAfG76+AAAADFBMVEUAAAAAAAAAAAAAAAA16TeWAAAABHRSTlMOAgoGQ0SIeAAAADpJREFUSMdjGAWjYBRgAasoAAwdFACKbB7VPEI076YAUGbzfwrAqOYRormcAjCANodSAEY1j2oexJoBlx1+yE7RXIIAAAAASUVORK5CYII=)
    no-repeat bottom;
}

.avatar {
  border: 4px solid #fff;
  height: 322px;
  width: 232px;
}

.movie-info-msg {
  position: absolute;
  color: #fff;
  font-size: 14px;
  z-index: 1;
}

.movie-name {
  width: 900px;
  margin-top: 0;
  font-size: 26px;
  line-height: 32px;
  font-weight: 700;
  margin-bottom: 0;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  max-height: 64px;
}

.movie-ename {
  width: 340px;
  font-size: 18px;
  line-height: 1.3;
  margin-bottom: 14px;
}

ul {
  width: 250px;
  list-style: none;
  padding-left: 0;
  margin-bottom: 20px;
}

ul li {
  margin: 12px 0;
  line-height: 100%;
}

.movie-info-right {
  height: 300px;
  position: relative;
  margin-right: 30px;
  margin-left: 300px;
  margin-top: 70px;
}

.major-movie {
  color: #ffffff;
  position: absolute;
  bottom: 20px;
}

.major-movie-list {
  display: flex;
  margin-top: 10px;
}

.major-movie-list img {
  width: 100px;
  height: 138px;
  margin-right: 10px;
}

.movie-info-detail-container {
  width: 1200px;
  margin: 0 auto;
}

.movie-info-detail {
  margin-top: 80px;
  display: flex;
}

.main-content {
  width: 730px;
  float: left;
  margin-bottom: 20px;
}

.crumbs-nav-container {
  margin-bottom: 25px;
  color: #333;
}

.crumbs-nav-container a {
  color: inherit;
}

.module {
  position: relative;
  margin-bottom: 60px;
}

.mod-title h2 {
  display: inline-block;
  margin: 0;
  padding: 0;
  font-weight: 400;
  font-size: 18px;
  color: #333;
  line-height: 18px;
}

.mod-title h2:before {
  float: left;
  content: "";
  display: inline-block;
  width: 4px;
  height: 18px;
  margin-right: 6px;
  background-color: #409eff;
}

.mod-content {
  margin-top: 20px;
  color: #333;
}

.mod-content .dra {
  font-size: 14px;
  line-height: 26px;
}

.actorInfo-list {
  margin-top: 20px;
  overflow: hidden;
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAiAQMAAABCyuoWAAAABlBMVEUAAAAAAAClZ7nPAAAAAnRSTlMAGovxNEIAAAAMSURBVAjXY6AcHAAAAQQAwWwcvxcAAAAASUVORK5CYII=)
    repeat;
}

.actorInfo-list dl {
  margin: 0;
  padding: 0;
  width: 50%;
  display: inline-block;
  float: left;
  margin-bottom: -1px;
}

.basicInfo-item {
  line-height: 34px;
  font-size: 14px;
}

.basicInfo-item.name {
  float: left;
  width: 96px;
  color: #999;
}

.basicInfo-item.value {
  margin-left: 90px;
}

.movie-item-style {
  margin-left: 0;
  margin-right: 20px;
}

.aside {
  margin-left: 100px;
  width: 360px;
}

.relational-actors {
  display: flex;
  flex-wrap: wrap;
}

.relational-actor {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-right: 30px;
  margin-top: 10px;
}

.relational-actor-photo {
  width: 80px;
  border-radius: 10px;
}
</style>
