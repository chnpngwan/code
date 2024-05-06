<template>
  <div class="top-left-cmp">
    <div class="dc-left">
      <div class="dc-text">
        <span>签约客户</span>
        <dv-decoration-3 style="width: 200px; height: 20px" />
      </div>
      <dv-border-box-5>
        <div class="main-value"><span>10</span>位</div>
        <div class="compare-value"><span>在租</span>8</div>
        <div class="compare-value"><span>到期</span>2</div>
      </dv-border-box-5>
    </div>
    <div class="dc-right">
      <div class="dc-text">
        <span>设备资产</span>
        <dv-decoration-3 style="width: 200px; height: 20px" />
      </div>
      <dv-border-box-5 :reverse="true">
        <div class="main-value"><span>8</span>台</div>
        <div class="compare-value"><span>已租</span>66</div>
        <div class="compare-value"><span>在库</span>9</div>
      </dv-border-box-5>
    </div>
  </div>
</template>

<script>
export default {
  name: "TopLeft",
};
</script>

<style lang="less" scoped>
.top-left-cmp {
  display: flex;

  .dc-left,
  .dc-right {
    width: 50%;
  }

  .dv-border-box-5 {
    height: 60%;
  }

  .dc-text {
    margin-top: 20px;
    display: flex;
    flex-direction: column;
    height: 35%;
    font-size: 18px;
    box-sizing: border-box;
    span {
      margin-left: 5px;
      margin-bottom: 5px;
    }
  }

  .dc-left .dc-text {
    align-items: flex-start;
    padding-top: 20px;
  }

  .dc-right .dc-text {
    justify-content: flex-start;
    padding-top: 20px;
  }

  .dc-left .dv-border-box-5 {
    padding: 30px;
    box-sizing: border-box;
  }

  .dc-right .dv-border-box-5 {
    padding: 40px;
    padding-left: 75px;
    box-sizing: border-box;
  }

  .main-value {
    font-weight: bold;
    font-size: 30px;

    span {
      font-size: 50px;
      color: #00c0ff;
      margin-right: 15px;
    }
  }

  .compare-value {
    height: 20px;
    line-height: 20px;
    font-size: 14px;

    span {
      margin-right: 30px;
    }
  }
}
</style>
