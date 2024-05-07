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
				title="租车资讯"
				source_table="article"
			  ></list_result_search>
				<!-- 论坛搜索结果 -->
			  <list_result_search
				:list="result_forum"
				title="租车交流论坛"
				source_table="forum"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/member_user/list', 'get')"
				:list="result_member_user_user_name"
				title="会员用户用户名"
				source_table="member_user"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_information/list', 'get')"
				:list="result_car_information_car_number"
				title="汽车信息汽车编号"
				source_table="car_information"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_information/list', 'get')"
				:list="result_car_information_automobile_brand"
				title="汽车信息汽车品牌"
				source_table="car_information"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_information/list', 'get')"
				:list="result_car_information_car_model"
				title="汽车信息汽车型号"
				source_table="car_information"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_information/list', 'get')"
				:list="result_car_information_car_type"
				title="汽车信息汽车类型"
				source_table="car_information"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/vehicle_classification/list', 'get')"
				:list="result_vehicle_classification_car_type"
				title="汽车分类汽车类型"
				source_table="vehicle_classification"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_rental_order/list', 'get')"
				:list="result_car_rental_order_car_number"
				title="租车订单汽车编号"
				source_table="car_rental_order"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_rental_order/list', 'get')"
				:list="result_car_rental_order_automobile_brand"
				title="租车订单汽车品牌"
				source_table="car_rental_order"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_rental_order/list', 'get')"
				:list="result_car_rental_order_car_model"
				title="租车订单汽车型号"
				source_table="car_rental_order"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_rental_order/list', 'get')"
				:list="result_car_rental_order_car_type"
				title="租车订单汽车类型"
				source_table="car_rental_order"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_renewal/list', 'get')"
				:list="result_car_renewal_full_name"
				title="汽车续租姓名"
				source_table="car_renewal"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_renewal/list', 'get')"
				:list="result_car_renewal_car_number"
				title="汽车续租汽车编号"
				source_table="car_renewal"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_return/list', 'get')"
				:list="result_car_return_full_name"
				title="汽车归还姓名"
				source_table="car_return"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/car_return/list', 'get')"
				:list="result_car_return_car_number"
				title="汽车归还汽车编号"
				source_table="car_return"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/lease_contract/list', 'get')"
				:list="result_lease_contract_full_name"
				title="租赁合同姓名"
				source_table="lease_contract"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/insurance_management/list', 'get')"
				:list="result_insurance_management_car_number"
				title="保险管理汽车编号"
				source_table="insurance_management"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/insurance_management/list', 'get')"
				:list="result_insurance_management_insurance_type"
				title="保险管理保险类型"
				source_table="insurance_management"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/insurance_management/list', 'get')"
				:list="result_insurance_management_date_of_purchase"
				title="保险管理购买保险日期"
				source_table="insurance_management"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/insurance_management/list', 'get')"
				:list="result_insurance_management_insurance_expiration_date"
				title="保险管理保险到期日期"
				source_table="insurance_management"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/lease_statistics/list', 'get')"
				:list="result_lease_statistics_car_type"
				title="租赁统计汽车类型"
				source_table="lease_statistics"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/lease_statistics/list', 'get')"
				:list="result_lease_statistics_lease_date"
				title="租赁统计租赁日期"
				source_table="lease_statistics"
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
	  "result_forum": [],
			"result_member_user_user_name":[],
			"result_car_information_car_number":[],
			"result_car_information_automobile_brand":[],
			"result_car_information_car_model":[],
			"result_car_information_car_type":[],
			"result_vehicle_classification_car_type":[],
			"result_car_rental_order_car_number":[],
			"result_car_rental_order_automobile_brand":[],
			"result_car_rental_order_car_model":[],
			"result_car_rental_order_car_type":[],
			"result_car_renewal_full_name":[],
			"result_car_renewal_car_number":[],
			"result_car_return_full_name":[],
			"result_car_return_car_number":[],
			"result_lease_contract_full_name":[],
			"result_insurance_management_car_number":[],
			"result_insurance_management_insurance_type":[],
			"result_insurance_management_date_of_purchase":[],
			"result_insurance_management_insurance_expiration_date":[],
			"result_lease_statistics_car_type":[],
			"result_lease_statistics_lease_date":[],
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
	 * 获取租车交流论坛
	 */
	get_forum() {
	  this.$get("~/api/forum/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_forum = json.result.list;
		}
	  });
	},
	/**
	 * 获取user_name
	 */
	get_member_user_user_name(){
		this.$get("~/api/member_user/get_list?like=0", { page: 1, size: 10, "user_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_member_user_user_name = json.result.list;
			result_member_user_user_name.map(o => o.title = o['user_name'])
	  			this.result_member_user_user_name = result_member_user_user_name
		 	}
		});
	},
	/**
	 * 获取car_number
	 */
	get_car_information_car_number(){
		this.$get("~/api/car_information/get_list?like=0", { page: 1, size: 10, "car_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_information_car_number = json.result.list;
			result_car_information_car_number.map(o => o.title = o['car_number'])
	  			this.result_car_information_car_number = result_car_information_car_number
		 	}
		});
	},
	/**
	 * 获取automobile_brand
	 */
	get_car_information_automobile_brand(){
		this.$get("~/api/car_information/get_list?like=0", { page: 1, size: 10, "automobile_brand": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_information_automobile_brand = json.result.list;
			result_car_information_automobile_brand.map(o => o.title = o['automobile_brand'])
	  			this.result_car_information_automobile_brand = result_car_information_automobile_brand
		 	}
		});
	},
	/**
	 * 获取car_model
	 */
	get_car_information_car_model(){
		this.$get("~/api/car_information/get_list?like=0", { page: 1, size: 10, "car_model": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_information_car_model = json.result.list;
			result_car_information_car_model.map(o => o.title = o['car_model'])
	  			this.result_car_information_car_model = result_car_information_car_model
		 	}
		});
	},
	/**
	 * 获取car_type
	 */
	get_car_information_car_type(){
		this.$get("~/api/car_information/get_list?like=0", { page: 1, size: 10, "car_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_information_car_type = json.result.list;
			result_car_information_car_type.map(o => o.title = o['car_type'])
	  			this.result_car_information_car_type = result_car_information_car_type
		 	}
		});
	},
	/**
	 * 获取car_type
	 */
	get_vehicle_classification_car_type(){
		this.$get("~/api/vehicle_classification/get_list?like=0", { page: 1, size: 10, "car_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_vehicle_classification_car_type = json.result.list;
			result_vehicle_classification_car_type.map(o => o.title = o['car_type'])
	  			this.result_vehicle_classification_car_type = result_vehicle_classification_car_type
		 	}
		});
	},
	/**
	 * 获取car_number
	 */
	get_car_rental_order_car_number(){
		this.$get("~/api/car_rental_order/get_list?like=0", { page: 1, size: 10, "car_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_rental_order_car_number = json.result.list;
			result_car_rental_order_car_number.map(o => o.title = o['car_number'])
	  			this.result_car_rental_order_car_number = result_car_rental_order_car_number
		 	}
		});
	},
	/**
	 * 获取automobile_brand
	 */
	get_car_rental_order_automobile_brand(){
		this.$get("~/api/car_rental_order/get_list?like=0", { page: 1, size: 10, "automobile_brand": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_rental_order_automobile_brand = json.result.list;
			result_car_rental_order_automobile_brand.map(o => o.title = o['automobile_brand'])
	  			this.result_car_rental_order_automobile_brand = result_car_rental_order_automobile_brand
		 	}
		});
	},
	/**
	 * 获取car_model
	 */
	get_car_rental_order_car_model(){
		this.$get("~/api/car_rental_order/get_list?like=0", { page: 1, size: 10, "car_model": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_rental_order_car_model = json.result.list;
			result_car_rental_order_car_model.map(o => o.title = o['car_model'])
	  			this.result_car_rental_order_car_model = result_car_rental_order_car_model
		 	}
		});
	},
	/**
	 * 获取car_type
	 */
	get_car_rental_order_car_type(){
		this.$get("~/api/car_rental_order/get_list?like=0", { page: 1, size: 10, "car_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_rental_order_car_type = json.result.list;
			result_car_rental_order_car_type.map(o => o.title = o['car_type'])
	  			this.result_car_rental_order_car_type = result_car_rental_order_car_type
		 	}
		});
	},
	/**
	 * 获取full_name
	 */
	get_car_renewal_full_name(){
		this.$get("~/api/car_renewal/get_list?like=0", { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_renewal_full_name = json.result.list;
			result_car_renewal_full_name.map(o => o.title = o['full_name'])
	  			this.result_car_renewal_full_name = result_car_renewal_full_name
		 	}
		});
	},
	/**
	 * 获取car_number
	 */
	get_car_renewal_car_number(){
		this.$get("~/api/car_renewal/get_list?like=0", { page: 1, size: 10, "car_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_renewal_car_number = json.result.list;
			result_car_renewal_car_number.map(o => o.title = o['car_number'])
	  			this.result_car_renewal_car_number = result_car_renewal_car_number
		 	}
		});
	},
	/**
	 * 获取full_name
	 */
	get_car_return_full_name(){
		this.$get("~/api/car_return/get_list?like=0", { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_return_full_name = json.result.list;
			result_car_return_full_name.map(o => o.title = o['full_name'])
	  			this.result_car_return_full_name = result_car_return_full_name
		 	}
		});
	},
	/**
	 * 获取car_number
	 */
	get_car_return_car_number(){
		this.$get("~/api/car_return/get_list?like=0", { page: 1, size: 10, "car_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_car_return_car_number = json.result.list;
			result_car_return_car_number.map(o => o.title = o['car_number'])
	  			this.result_car_return_car_number = result_car_return_car_number
		 	}
		});
	},
	/**
	 * 获取full_name
	 */
	get_lease_contract_full_name(){
		this.$get("~/api/lease_contract/get_list?like=0", { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_lease_contract_full_name = json.result.list;
			result_lease_contract_full_name.map(o => o.title = o['full_name'])
	  			this.result_lease_contract_full_name = result_lease_contract_full_name
		 	}
		});
	},
	/**
	 * 获取car_number
	 */
	get_insurance_management_car_number(){
		this.$get("~/api/insurance_management/get_list?like=0", { page: 1, size: 10, "car_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_insurance_management_car_number = json.result.list;
			result_insurance_management_car_number.map(o => o.title = o['car_number'])
	  			this.result_insurance_management_car_number = result_insurance_management_car_number
		 	}
		});
	},
	/**
	 * 获取insurance_type
	 */
	get_insurance_management_insurance_type(){
		this.$get("~/api/insurance_management/get_list?like=0", { page: 1, size: 10, "insurance_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_insurance_management_insurance_type = json.result.list;
			result_insurance_management_insurance_type.map(o => o.title = o['insurance_type'])
	  			this.result_insurance_management_insurance_type = result_insurance_management_insurance_type
		 	}
		});
	},
	/**
	 * 获取date_of_purchase
	 */
	get_insurance_management_date_of_purchase(){
		this.$get("~/api/insurance_management/get_list?like=0", { page: 1, size: 10, "date_of_purchase": this.query.word }, (json) => {
		  if (json.result) {
			var result_insurance_management_date_of_purchase = json.result.list;
			result_insurance_management_date_of_purchase.map(o => o.title = o['date_of_purchase'])
	  			this.result_insurance_management_date_of_purchase = result_insurance_management_date_of_purchase
		 	}
		});
	},
	/**
	 * 获取insurance_expiration_date
	 */
	get_insurance_management_insurance_expiration_date(){
		this.$get("~/api/insurance_management/get_list?like=0", { page: 1, size: 10, "insurance_expiration_date": this.query.word }, (json) => {
		  if (json.result) {
			var result_insurance_management_insurance_expiration_date = json.result.list;
			result_insurance_management_insurance_expiration_date.map(o => o.title = o['insurance_expiration_date'])
	  			this.result_insurance_management_insurance_expiration_date = result_insurance_management_insurance_expiration_date
		 	}
		});
	},
	/**
	 * 获取car_type
	 */
	get_lease_statistics_car_type(){
		this.$get("~/api/lease_statistics/get_list?like=0", { page: 1, size: 10, "car_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_lease_statistics_car_type = json.result.list;
			result_lease_statistics_car_type.map(o => o.title = o['car_type'])
	  			this.result_lease_statistics_car_type = result_lease_statistics_car_type
		 	}
		});
	},
	/**
	 * 获取lease_date
	 */
	get_lease_statistics_lease_date(){
		this.$get("~/api/lease_statistics/get_list?like=0", { page: 1, size: 10, "lease_date": this.query.word }, (json) => {
		  if (json.result) {
			var result_lease_statistics_lease_date = json.result.list;
			result_lease_statistics_lease_date.map(o => o.title = o['lease_date'])
	  			this.result_lease_statistics_lease_date = result_lease_statistics_lease_date
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
	this.get_forum();
		this.get_member_user_user_name();
		this.get_car_information_car_number();
		this.get_car_information_automobile_brand();
		this.get_car_information_car_model();
		this.get_car_information_car_type();
		this.get_vehicle_classification_car_type();
		this.get_car_rental_order_car_number();
		this.get_car_rental_order_automobile_brand();
		this.get_car_rental_order_car_model();
		this.get_car_rental_order_car_type();
		this.get_car_renewal_full_name();
		this.get_car_renewal_car_number();
		this.get_car_return_full_name();
		this.get_car_return_car_number();
		this.get_lease_contract_full_name();
		this.get_insurance_management_car_number();
		this.get_insurance_management_insurance_type();
		this.get_insurance_management_date_of_purchase();
		this.get_insurance_management_insurance_expiration_date();
		this.get_lease_statistics_car_type();
		this.get_lease_statistics_lease_date();
  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_article();
	  this.get_forum();
	  this.get_member_user_user_name();
	  this.get_car_information_car_number();
	  this.get_car_information_automobile_brand();
	  this.get_car_information_car_model();
	  this.get_car_information_car_type();
	  this.get_vehicle_classification_car_type();
	  this.get_car_rental_order_car_number();
	  this.get_car_rental_order_automobile_brand();
	  this.get_car_rental_order_car_model();
	  this.get_car_rental_order_car_type();
	  this.get_car_renewal_full_name();
	  this.get_car_renewal_car_number();
	  this.get_car_return_full_name();
	  this.get_car_return_car_number();
	  this.get_lease_contract_full_name();
	  this.get_insurance_management_car_number();
	  this.get_insurance_management_insurance_type();
	  this.get_insurance_management_date_of_purchase();
	  this.get_insurance_management_insurance_expiration_date();
	  this.get_lease_statistics_car_type();
	  this.get_lease_statistics_lease_date();
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
