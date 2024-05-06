<template>
  <div id="water-level-chart">
    <div class="water-level-chart-details">
      应付<span>50</span>万元，已付<span>20</span>万元
    </div>
    <div class="chart-container">
      <dv-water-level-pond :config="config" />
    </div>
  </div>
</template>

<script>
export default {
  name: "TopMiddlePay",
  data() {
    return {
      config: {
        data: [40],
        shape: "round",
        waveHeight: 18,
        waveNum: 2,
      },
    };
  },
};
</script>

<style lang="less" scoped>
#water-level-chart {
  width: 25%;
  box-sizing: border-box;
  margin-left: 10px;
  background-color: rgba(6, 30, 93, 0.5);
  border-top: 2px solid rgba(1, 153, 209, 0.5);
  display: flex;
  flex-direction: column;

  .water-level-chart-title {
    font-weight: bold;
    height: 100px;
    line-height: 100px;
    display: flex;
    align-items: center;
    font-size: 20px;
    justify-content: center;
  }

  .water-level-chart-details {
    height: 22%;
    display: flex;
    justify-content: center;
    font-size: 16px;
    align-items: flex-end;

    span {
      font-size: 40px;
      font-weight: bold;
      color: #00c0ff;
      margin: 0 5px;
      margin-bottom: -6px;
    }
  }

  .chart-container {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .dv-water-pond-level {
    max-width: 90%;
    width: 180px;
    height: 180px;
    border: 3px solid #00c0ff;
    border-radius: 50%;

    ellipse {
      stroke: transparent !important;
    }
  }
}
</style>
