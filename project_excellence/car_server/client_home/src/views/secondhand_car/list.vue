<template>
	<div class="diy_list page_secondhand_car" id="secondhand_car_list">
		<div class="warp">
			<div class="container diy_list_container">
				<div class="diy_list_title">
					<div class="col">
						<span class="title">二手汽车列表</span>
					</div>
				</div>
				<div class="row diy_list_search">
					<div class="col">
						<!-- 搜索栏 -->
						<div class="view">
							<span class="diy_list_search_title">关键字搜索：</span>
							<b-form-input size="sm" class="mr-sm-2" placeholder="标题搜索" v-model="query['title']" />
							<b-form-input size="sm" class="mr-sm-2" placeholder="品牌搜索" v-model="query['brand']" />
							<b-form-input size="sm" class="mr-sm-2" placeholder="拍卖方式搜索" v-model="query['auction_mode']" />
							<b-button size="sm" @click="search()" >
								<b-icon icon="search"/>
							</b-button>
						</div>
						<!-- /搜索栏 -->
					</div>
				</div>
				<div class="diy_list_select_box">
					<span class="diy_list_select_title">下拉搜索：</span>
						<div class="diy_list_dropdown_box">
						<div class="col">
							<!-- 筛选 -->
							<div class="view">
								<b-dropdown text="品牌" variant="outline-dark" left>
									<b-dropdown-item @click="filter_set('全部','brand')">全部</b-dropdown-item>
										<b-dropdown-item v-for="(o, i) in list_brand" :key="i" @click="filter_set(o['brand'],'brand')" >
												{{ o['brand'] }}
										</b-dropdown-item>
								</b-dropdown>
								<b-dropdown :text="title" variant="outline-dark" left>
									<b-dropdown-item @click="filter_set('全部','auction_mode')">全部</b-dropdown-item>
										<b-dropdown-item v-for="(o,i) in list_auction_mode" @click="filter_set(o,'auction_mode')" >
										{{ o }}
										</b-dropdown-item>
								</b-dropdown>
							</div>
							<!-- /筛选 -->
						</div>
					</div>
					<div class="diy_list_sort_box">
						<div class="col">
							<!-- 排序 -->
							<div class="view">
								<b-dropdown text="排序" variant="outline-dark" left>
										<b-dropdown-item v-for="(o, i) in list_sort" :key="i" @click="set_sort(o)" >
												{{ o.name }}
										</b-dropdown-item>
								</b-dropdown>
							</div>
							<!--/排序 -->
						</div>
					</div>
				</div>
				<div class="row diy_list_box">
					<div class="col">
						<!-- 列表 -->
						<list_secondhand_car :list="list" />
						<!-- /列表 -->
					</div>
				</div>
				<div class="row diy_list_page_box">
					<div class="col overflow-auto flex_cc">
						<!-- 分页器 -->
<!--						<diy_pager v-model="query['page']" :size="query['size']" :count="count" v-on:toPage="toPage" v-on:toSize="toSize" ></diy_pager>-->
            <b-pagination
                v-model="query.page"
                :total-rows="count"
                :per-page="query.size"
                @change="goToPage"
            />
						<!-- /分页器 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import list_secondhand_car from "@/components/diy/list_secondhand_car.vue";
	import diy_pager from "@/components/diy/diy_pager";
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		components: {
			diy_pager,
			list_secondhand_car
		},
		data() {
			return {
				url_get_list: "~/api/secondhand_car/get_list?like=0",

				// 查询条件
				query: {
					keyword: "",
					page: 1,
					size: 10,
					"title": "", // 标题
					"brand": "", // 品牌
					"auction_mode": "", // 拍卖方式
					"examine_state": "已通过", // 审核状态
				},

				// 排序内容
				list_sort: [{
						name: "创建时间从高到低",
						value: "create_time desc",
					},
					{
						name: "创建时间从低到高",
						value: "create_time asc",
					},
					{
						name: "更新时间从高到低",
						value: "update_time desc",
					},
					{
						name: "更新时间从低到高",
						value: "update_time asc",
					},
					{
						name: "标题正序",
						value: "title asc",
					},
					{
						name: "标题倒序",
						value: "title desc",
					},
					{
						name: "品牌正序",
						value: "brand asc",
					},
					{
						name: "品牌倒序",
						value: "brand desc",
					},
					{
						name: "拍卖方式正序",
						value: "auction_mode asc",
					},
					{
						name: "拍卖方式倒序",
						value: "auction_mode desc",
					},
				],
				// 品牌列表
				"list_brand": [],
				// 拍卖方式列表
				"list_auction_mode": ['加价竞拍','一口价'],
			}
		},
		methods: {
      get_list_before(param) {
        var oNowDate = this.dateFormat("yyyy-MM-dd hh:mm:ss")+"";
        var url_get_list = "~/api/secondhand_car/get_list?timing_start_time_max=" + oNowDate +
            "&timing_end_time_min=" + oNowDate + "&like=0";
        this.url_get_list= url_get_list;
      },
			/**
			 * 筛选选择
			 */
			filter_set(o,key) {
			    if (o == "全部") {
			        this.query[key] = "";
			    } else {
			        this.query[key] = o;
			    }
			    this.search();
			},

			/**
			 * 排序
			 */
			set_sort(o) {
			    this.query.orderby = o.value;
			    this.search();
			},
			/**
			 * 获取品牌列表
			 */
			async get_list_brand() {
				var json = await this.$get("~/api/automobile_brand/get_list?");
				if (json.result) {
					this.list_brand = json.result.list;
				} else if (json.error) {
					console.log(json.error);
				}
			},

			/**
			 * 筛选
			 */
			filter_brand(o) {
				if (o == "全部") {
					this.query["brand"] = "";
				} else {
					this.query["brand"] = o;
				}
				this.search();
			},
			filter_auction_mode(o) {
				if (o == "全部") {
					this.query["auction_mode"] = "";
				} else {
					this.query["auction_mode"] = o;
				}
				this.search();
			},

			/**
			 * 重置
			 */
			reset() {
				this.query.title = ""
				this.query.brand = ""
				this.query.auction_mode = ""
				this.search();
			},

			// 返回条数
			toSize(i){
				this.query.size = i;
				this.first();
			},

			// 返回页数
			toPage(i){
				this.query.page = i;
				this.first();
			},

      goToPage(v){
        this.query.page = v;
        this.goToNew(v)
      },
			dateFormat(fmt) {
				var myDate = new Date();
				var o = {
					"M+": myDate.getMonth() + 1, // 月份
					"d+": myDate.getDate(), // 日
					"h+": myDate.getHours(), // 小时
					"m+": myDate.getMinutes(), // 分
					"s+": myDate.getSeconds(), // 秒
					"q+": Math.floor((myDate.getMonth() + 3) / 3), // 季度
					"S": myDate.getMilliseconds() // 毫秒
				};
				if (/(y+)/.test(fmt))
					fmt = fmt.replace(RegExp.$1, (myDate.getFullYear() + "").substr(4 - RegExp.$1.length));
				for (var k in o)
					if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
						return fmt;
			},
		},
		computed: {
		},
		created() {
			/**
			 * 获取品牌列表
			 */
			this.get_list_brand();
		}
	}
</script>

<style>
</style>
