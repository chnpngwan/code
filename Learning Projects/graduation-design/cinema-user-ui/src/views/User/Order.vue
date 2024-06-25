<template>
  <div class="bill-list-container">
    <div class="profile-title">我的订单</div>
    <div class="order-box" v-for="item in orderList" :key="item.id">
      <div class="order-header">
        <span class="order-date">{{ item.createTime }}</span>
        <span class="order-id">狗眼订单号: {{ item.orderId }} </span>
        <span class="del-order" @click="deleteBill(item.Id)">
          <i class="el-icon-delete"></i>
        </span>
      </div>
      <div class="order-body">
        <div class="poster">
          <img :src="item.lamination.movie.image" />
        </div>
        <div class="order-content">
          <div class="movie-name">《{{ item.lamination.movie.nameCn }}》</div>
          <div class="cinema-name">{{ item.lamination.cinema.name }}</div>
          <div class="hall-ticket">
            <span>{{ item.lamination.hall.name }}</span>
            <span></span>
          </div>
          <div class="show-time">
            {{ item.lamination.startDate + " " + item.lamination.startTime }}
          </div>
        </div>
        <div class="order-price">￥{{ item.totalPrice }}</div>
        <div class="order-status" v-if="item.orderStatus === 1">
          已支付
        </div>
        <div class="order-status" v-else-if="item.orderStatus === 0">
          未支付
        </div>
        <div class="order-status" v-else-if="item.orderStatus === 2">
          超时关闭
        </div>
        <div class="actions">
          <div>
            <router-link :to="'/order/' + item.id">
              查看详情
            </router-link>
          </div>
        </div>
      </div>
    </div>
    <div class="no-cinema" v-if="orderList.length === 0">
      <p>抱歉，没有找到相关结果，请尝试用其他条件筛选。</p>
    </div>
    <div class="pageHelper" v-if="orderList.length !== 0">
      <el-pagination
        class="pagination-container"
        background
        @size-change="sizeChange"
        @current-change="currentChange"
        :current-page="current"
        :page-size="size"
        :total="total"
        :page-sizes="[5, 10, 20]"
        layout="total, sizes, prev, pager, next, jumper"
      />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      orderList: [],
      size: 5,
      current: 1,
      total: null,
    };
  },
  created() {
    this.getOrderList();
  },
  methods: {
    sizeChange(size) {
      this.size = size;
      this.getOrderList();
    },
    currentChange(current) {
      this.current = current;
      this.getOrderList();
    },
    getOrderList() {
      this.axios
        .get("/api/order/user", {
          params: {
            current: this.current,
            size: this.size,
            userId: this.$store.state.userId,
          },
        })
        .then(({ data }) => {
          if (data.code === 200) {
            this.orderList = data.data.recordList;
            this.total = data.data.count;
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
.bill-list-container {
  min-height: 900px;
}

.profile-title {
  padding: 26px 0;
  color: #ec443f;
  font-size: 18px;
  border-bottom: 1px solid #e1e1e1;
  margin-bottom: 30px;
}

.order-box {
  border: 1px solid #e5e5e5;
  margin: 0 40px 30px 0;
}

.order-box .order-header {
  background-color: #f7f7f7;
  font-size: 14px;
  padding: 16px 20px;
}

.order-box .order-header .order-date {
  color: #333;
  display: inline-block;
  margin-right: 30px;
}

.order-box .order-header .order-id {
  color: #999;
}

.del-order {
  float: right;
}

.order-box .order-body {
  padding: 20px;
  padding-right: 0;
  display: flex;
}

.order-box .order-body .poster {
  width: 66px;
  height: 91px;
  margin-right: 11px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
}

.poster img {
  width: 100%;
  height: 100%;
}

.order-content {
  width: 49%;
}

.movie-name {
  font-size: 16px;
  font-weight: 700;
  color: #333;
  margin: 4px 0 7px -6px;
}

.cinema-name,
.hall-ticket {
  font-size: 12px;
  color: #999;
  margin-bottom: 4px;
}

.show-time {
  font-size: 12px;
  color: #f03d37;
}

.order-price,
.order-status,
.actions {
  font-size: 14px;
  color: #333;
  width: 12%;
  line-height: 95px;
}

a {
  text-decoration: none;
  cursor: pointer;
  color: #333;
}

.no-cinema {
  display: flex;
  justify-content: center;
  margin-top: 40px;
  margin-bottom: 40px;
  font-size: 16px;
  color: #333;
}

.pageHelper {
  display: flex;
  justify-content: center;
  margin: 40px 0;
}
</style>
