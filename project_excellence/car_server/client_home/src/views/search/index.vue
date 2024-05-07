<template>
  <div class="page_search">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>
				<!-- 文章搜索结果 -->
			  <list_result_search
				:list="result_article"
				title="汽车资讯"
				source_table="article"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/buyers/list', 'get')"
				:list="result_buyers_buyer_name"
				title="买家买家姓名"
				source_table="buyers"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/seller/list', 'get')"
				:list="result_seller_seller_name"
				title="卖家卖家姓名"
				source_table="seller"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/automobile_brand/list', 'get')"
				:list="result_automobile_brand_brand"
				title="汽车品牌品牌"
				source_table="automobile_brand"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/secondhand_car/list', 'get')"
				:list="result_secondhand_car_title"
				title="二手汽车标题"
				source_table="secondhand_car"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/secondhand_car/list', 'get')"
				:list="result_secondhand_car_brand"
				title="二手汽车品牌"
				source_table="secondhand_car"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/secondhand_car/list', 'get')"
				:list="result_secondhand_car_auction_mode"
				title="二手汽车拍卖方式"
				source_table="secondhand_car"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/auction_order/list', 'get')"
				:list="result_auction_order_auction_number"
				title="拍卖订单拍卖单号"
				source_table="auction_order"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/auction_order/list', 'get')"
				:list="result_auction_order_title"
				title="拍卖订单标题"
				source_table="auction_order"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/auction_order/list', 'get')"
				:list="result_auction_order_buyer_name"
				title="拍卖订单买家姓名"
				source_table="auction_order"
			  ></list_result_search>
			</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
	  "result_article": [],
			"result_buyers_buyer_name":[],
			"result_seller_seller_name":[],
			"result_automobile_brand_brand":[],
			"result_secondhand_car_title":[],
			"result_secondhand_car_brand":[],
			"result_secondhand_car_auction_mode":[],
			"result_auction_order_auction_number":[],
			"result_auction_order_title":[],
			"result_auction_order_buyer_name":[],
	};
  },
  methods: {
	/**
	 * 获取文章
	 */
	get_article() {
	  this.$get("~/api/article/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_article = json.result.list;
		}
	  });
	},
	/**
	 * 获取buyer_name
	 */
	get_buyers_buyer_name(){
		this.$get("~/api/buyers/get_list?like=0", { page: 1, size: 10, "buyer_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_buyers_buyer_name = json.result.list;
			result_buyers_buyer_name.map(o => o.title = o['buyer_name'])
	  			this.result_buyers_buyer_name = result_buyers_buyer_name
		 	}
		});
	},
	/**
	 * 获取seller_name
	 */
	get_seller_seller_name(){
		this.$get("~/api/seller/get_list?like=0", { page: 1, size: 10, "seller_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_seller_seller_name = json.result.list;
			result_seller_seller_name.map(o => o.title = o['seller_name'])
	  			this.result_seller_seller_name = result_seller_seller_name
		 	}
		});
	},
	/**
	 * 获取brand
	 */
	get_automobile_brand_brand(){
		this.$get("~/api/automobile_brand/get_list?like=0", { page: 1, size: 10, "brand": this.query.word }, (json) => {
		  if (json.result) {
			var result_automobile_brand_brand = json.result.list;
			result_automobile_brand_brand.map(o => o.title = o['brand'])
	  			this.result_automobile_brand_brand = result_automobile_brand_brand
		 	}
		});
	},
	/**
	 * 获取title
	 */
	get_secondhand_car_title(){
		this.$get("~/api/secondhand_car/get_list?like=0", { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_secondhand_car_title = json.result.list;
			result_secondhand_car_title.map(o => o.title = o['title'])
	  			this.result_secondhand_car_title = result_secondhand_car_title
		 	}
		});
	},
	/**
	 * 获取brand
	 */
	get_secondhand_car_brand(){
		this.$get("~/api/secondhand_car/get_list?like=0", { page: 1, size: 10, "brand": this.query.word }, (json) => {
		  if (json.result) {
			var result_secondhand_car_brand = json.result.list;
			result_secondhand_car_brand.map(o => o.title = o['brand'])
	  			this.result_secondhand_car_brand = result_secondhand_car_brand
		 	}
		});
	},
	/**
	 * 获取auction_mode
	 */
	get_secondhand_car_auction_mode(){
		this.$get("~/api/secondhand_car/get_list?like=0", { page: 1, size: 10, "auction_mode": this.query.word }, (json) => {
		  if (json.result) {
			var result_secondhand_car_auction_mode = json.result.list;
			result_secondhand_car_auction_mode.map(o => o.title = o['auction_mode'])
	  			this.result_secondhand_car_auction_mode = result_secondhand_car_auction_mode
		 	}
		});
	},
	/**
	 * 获取auction_number
	 */
	get_auction_order_auction_number(){
		this.$get("~/api/auction_order/get_list?like=0", { page: 1, size: 10, "auction_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_auction_order_auction_number = json.result.list;
			result_auction_order_auction_number.map(o => o.title = o['auction_number'])
	  			this.result_auction_order_auction_number = result_auction_order_auction_number
		 	}
		});
	},
	/**
	 * 获取title
	 */
	get_auction_order_title(){
		this.$get("~/api/auction_order/get_list?like=0", { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_auction_order_title = json.result.list;
			result_auction_order_title.map(o => o.title = o['title'])
	  			this.result_auction_order_title = result_auction_order_title
		 	}
		});
	},
	/**
	 * 获取buyer_name
	 */
	get_auction_order_buyer_name(){
		this.$get("~/api/auction_order/get_list?like=0", { page: 1, size: 10, "buyer_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_auction_order_buyer_name = json.result.list;
			result_auction_order_buyer_name.map(o => o.title = o['buyer_name'])
	  			this.result_auction_order_buyer_name = result_auction_order_buyer_name
		 	}
		});
	},

  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
	this.get_article();
		this.get_buyers_buyer_name();
		this.get_seller_seller_name();
		this.get_automobile_brand_brand();
		this.get_secondhand_car_title();
		this.get_secondhand_car_brand();
		this.get_secondhand_car_auction_mode();
		this.get_auction_order_auction_number();
		this.get_auction_order_title();
		this.get_auction_order_buyer_name();
  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_article();
	  this.get_buyers_buyer_name();
	  this.get_seller_seller_name();
	  this.get_automobile_brand_brand();
	  this.get_secondhand_car_title();
	  this.get_secondhand_car_brand();
	  this.get_secondhand_car_auction_mode();
	  this.get_auction_order_auction_number();
	  this.get_auction_order_title();
	  this.get_auction_order_buyer_name();
	},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
