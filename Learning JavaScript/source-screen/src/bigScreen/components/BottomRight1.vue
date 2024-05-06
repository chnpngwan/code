<template>
  <div id="rose-chart">
    <div class="rose-chart-title">账户总额<span>60</span>万元</div>
    <dv-capsule-chart class="lc1-chart" :config="config" />
    <dv-decoration-2 style="height: 10px" />
  </div>
</template>

<script>
export default {
  name: "BottomRight1",
  data() {
    return {
      config: {
        data: [
          {
            name: "吕个人江南银行",
            value: 17,
          },
          {
            name: "吕微信",
            value: 3,
          },
          {
            name: "吕支付宝",
            value: 15,
          },
          {
            name: "微信",
            value: 5,
          },
          {
            name: "招商银行",
            value: 5,
          },
          {
            name: "支付宝",
            value: 4,
          },
          {
            name: "江南银行",
            value: 1,
          },
          {
            name: "江苏银行",
            value: 7,
          },
          {
            name: "现金",
            value: 3,
          },
        ],
        unit: "万元",
        showValue: true,
      },
    };
  },
};
</script>

<style lang="less">
#rose-chart {
  width: 30%;
  height: 100%;
  background-color: rgba(6, 30, 93, 0.5);
  border-top: 2px solid rgba(1, 153, 209, 0.5);
  box-sizing: border-box;

  .rose-chart-title {
    margin-left: 10px;
    height: 40px;
    font-size: 16px;
    display: flex;
    align-items: flex-end;
    span {
      font-size: 40px;
      font-weight: bold;
      color: #00c0ff;
      margin: 0 5px;
      margin-bottom: -6px;
    }
  }

  .dv-charts-container {
    height: 100%;
  }

  .dv-capsule-chart .label-column div {
    line-height: 40px;
  }

  .dv-capsule-chart .capsule-item {
    margin: 15.8px 0px;
  }
}
</style>
