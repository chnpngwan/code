<template>
  <div id="ranking-board1">
    <div class="ranking-board-title">客户收款排行</div>
    <dv-scroll-ranking-board :config="config" color="#00c0ff" />
  </div>
</template>

<script>
export default {
  name: "BottomLeft1",
  data() {
    return {
      config: {
        data: [
          {
            name: "苏州xx生态环境科技有限公司",
            value: "255万",
          },
          {
            name: "苏州xx生物医药科技有限公司",
            value: "120万",
          },
          {
            name: "苏州xx科技数据有限公司",
            value: "78万",
          },
          {
            name: "中建xx集团安装工程有限公司",
            value: "66万",
          },
          {
            name: "江苏xx资产管理经营有限公司",
            value: "40万",
          },
          {
            name: "佛山市顺德区xx瓦克有机硅有限公司张家港分公司",
            value: "20万",
          },
        ],
        rowNum: 6,
      },
    };
  },
};
</script>

<style lang="less" scoped>
#ranking-board1 {
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
