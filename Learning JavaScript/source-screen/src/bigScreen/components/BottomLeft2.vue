<template>
  <div id="ranking-board2">
    <div class="ranking-board-title">供应商付款排行</div>
    <dv-scroll-ranking-board :config="config" />
  </div>
</template>

<script>
export default {
  name: "BottomLeft2",
  data() {
    return {
      config: {
        data: [
          {
            name: "张家港市xx托管有限公司",
            value: "65万",
          },
          {
            name: "奥xx保健品",
            value: "59万",
          },
          {
            name: "上海xx集团（张家港）变压器有限公司",
            value: "48万",
          },
          {
            name: "中建xx集团安装工程有限公司",
            value: "36万",
          },
          {
            name: "江苏xx资产管理经营有限公司",
            value: "10万",
          },
          {
            name: "佛山市顺德区xx瓦克有机硅有限公司张家港分公司",
            value: "2万",
          },
        ],
        rowNum: 6,
      },
    };
  },
};
</script>

<style lang="less" scoped>
#ranking-board2 {
  width: 50%;
  box-shadow: 0 0 3px #00c0ff;
  display: flex;
  flex-direction: column;
  background-color: rgba(6, 30, 93, 0.5);
  border-top: 1px solid rgba(1, 153, 209, 0.5);
  box-sizing: border-box;
  padding: 0px 30px;

  .ranking-board-title {
    height: 50px;
    display: flex;
    align-items: center;
    font-size: 16px;
  }

  .dv-scroll-ranking-board {
    flex: 1;
  }
}
</style>
