<template>
  <div id="data-view">
    <dv-loading v-if="loading">Loading...</dv-loading>
    <dv-full-screen-container v-else>
      <div id="top-header">
        <dv-decoration-8 class="header-left-decoration" />
        <dv-decoration-5 class="header-center-decoration" />
        <dv-decoration-8 class="header-right-decoration" :reverse="true" />
        <div class="center-title">CSM 驾驶舱</div>
      </div>

      <dv-border-box-1 class="main-container">
        <div class="mc-top">
          <Top-Left />
          <Top-Middle-Receive />
          <Top-Middle-Pay />
          <Top-right />
        </div>
        <div class="mc-bottom">
          <dv-border-box-6 class="bottom-left-container">
            <dv-decoration-4
              class="mcb-decoration-1"
              style="width: 5px; height: 45%"
            />
            <dv-decoration-4
              class="mcb-decoration-2"
              style="width: 5px; height: 45%"
            />
            <Bottom-Left-1 />
            <Bottom-Left-2 />
          </dv-border-box-6>

          <div class="bottom-right-container">
            <Bottom-Right-1 />
            <Bottom-Right-2 />
          </div>
        </div>
      </dv-border-box-1>
    </dv-full-screen-container>
  </div>
</template>

<script>
import TopLeft from "./components/TopLeft";
import TopMiddleReceive from "./components/TopMiddleReceive";
import TopMiddlePay from "./components/TopMiddlePay";
import TopRight from "./components/TopRight";
import BottomLeft1 from "./components/BottomLeft1";
import BottomLeft2 from "./components/BottomLeft2";
import BottomRight1 from "./components/BottomRight1";
import BottomRight2 from "./components/BottomRight2";

export default {
  name: "DataView",
  components: {
    TopLeft,
    TopMiddleReceive,
    TopMiddlePay,
    TopRight,
    BottomLeft1,
    BottomLeft2,
    BottomRight1,
    BottomRight2,
  },
  data() {
    return {
      loading: true,
    };
  },
  mounted() {
    this.cancelLoading();
  },
  methods: {
    cancelLoading() {
      setTimeout(() => {
        this.loading = false;
      }, 500);
    },
  },
};
</script>

<style lang="less">
#top-header {
  position: relative;
  width: 100%;
  height: 100px;
  display: flex;
  justify-content: space-between;
  flex-shrink: 0;

  .header-center-decoration {
    width: 40%;
    height: 60px;
    margin-top: 30px;
  }

  .header-left-decoration,
  .header-right-decoration {
    width: 25%;
    height: 60px;
  }

  .center-title {
    position: absolute;
    font-size: 30px;
    font-weight: bold;
    left: 50%;
    top: 15px;
    transform: translateX(-50%);
  }
}

#data-view {
  width: 100%;
  height: 100%;
  background-color: #030409;
  color: #fff;
  background-image: url("../assets/img/bg.png");
  background-size: 100% 100%;
  box-shadow: 0 0 3px blue;
  display: flex;
  flex-direction: column;

  .main-container {
    height: calc(~"100% - 80px");

    .mc-top,
    .mc-bottom {
      box-sizing: border-box;
      padding: 0 30px 30px 30px;
      display: flex;
    }

    .mc-top {
      height: 40%;
    }

    .mc-bottom {
      height: 60%;
    }

    .top-left-cmp {
      width: 32%;
    }

    .top-middle-cmp,
    .top-right-cmp {
      width: 34%;
    }

    .bottom-left-container {
      width: 32%;
      position: relative;

      .border-box-content {
        display: flex;
      }

      .mcb-decoration-1,
      .mcb-decoration-2 {
        position: absolute;
        left: 50%;
        margin-left: -2px;
      }

      .mcb-decoration-1 {
        top: 5%;
        transform: rotate(180deg);
      }

      .mcb-decoration-2 {
        top: 50%;
      }

      .bottom-left-chart-1,
      .bottom-left-chart-2 {
        width: 50%;
        height: 100%;
      }
    }

    .bottom-right-container {
      width: 68%;
      padding-left: 10px;
      box-sizing: border-box;
      display: flex;
    }
  }
}
</style>
