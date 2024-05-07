<template>
	<div class="diy_home diy_list diy_secondhand_car" id="diy_secondhand_car_list">
		<!-- 列表 -->
		<div class="diy_view_list list list-x" v-if="show">
			<router-link class="diy_card goods diy_list_box_wrap" v-for="(o, i) in list" :key="i"
				:to="'/secondhand_car/details?secondhand_car_id=' + o['secondhand_car_id']">
				<!-- 图片 -->
				<div class="diy_list_img_box" v-if="imgList.length" >
					<div class="diy_row" v-for="(item,index) in imgList" :key="item+index" v-show="$check_field('get',item.name,'/secondhand_car/details') && +item.is_img_list">
						<div class="diy_title diy_list_img_title">
							<span>{{item.title}}:</span>
						</div>
						<div class="diy_field diy_img">
							<img :src="$fullUrl(o[item.name])" style="width:100%;height:100%" />
						</div>
					</div>
				</div>
				<!-- 内容 -->
				<div class="diy_list_item_box">
					<div class="diy_list_item_content" v-for="(item,index) in showItemList" :key="item+index">
						<div class="diy_row" :class="{[item.name]:true}" v-if="$check_field('get',item.name,'/secondhand_car/details') && +item.is_img_list">
							<div class="diy_title">
								<span>{{item.title}}:</span>
							</div>
							<div class="diy_field diy_text">
								<span v-if="item.type == 'UID'" v-text="get_user_name(o[item.name])"></span>
								<span v-else-if="item.type == '日期'" v-text="$toTime(o[item.name],'yyyy-MM-dd')"></span>
								<span v-else-if="item.type == '时间'" v-text="$toTime(o[item.name],'hh:mm:ss')"></span>
								<span v-else-if="item.type == '日长'" v-text="$toTime(o[item.name],'yyyy-MM-dd hh:mm:ss')"></span>
								<span v-else v-text="o[item.name]"></span>
							</div>
						</div>
					</div>
				</div>
			</router-link>
		</div>
		<!-- 表格 -->
		<div class="diy_view_table" v-else>
			<table class="diy_table">
				<tr class="diy_row">
					<th class="diy_title" v-if="$check_field('get','auction_number')">拍卖单号
					</th>
					<th class="diy_title" v-if="$check_field('get','seller_number')">卖家编号
					</th>
					<th class="diy_title" v-if="$check_field('get','seller_name')">卖家姓名
					</th>
					<th class="diy_title" v-if="$check_field('get','title')">标题
					</th>
					<th class="diy_title" v-if="$check_field('get','brand')">品牌
					</th>
					<th class="diy_title" v-if="$check_field('get','photo')">照片
					</th>
					<th class="diy_title" v-if="$check_field('get','year_of_purchase')">购入年份
					</th>
					<th class="diy_title" v-if="$check_field('get','kilometers_traveled')">行驶公里数
					</th>
					<th class="diy_title" v-if="$check_field('get','starting_price')">起拍价
					</th>
					<th class="diy_title" v-if="$check_field('get','current_price')">当前价
					</th>
					<th class="diy_title" v-if="$check_field('get','auction_mode')">拍卖方式
					</th>
					<th class="diy_title" v-if="$check_field('get','vehicle_parameters')">汽车参数
					</th>
				</tr>
				<tr class="diy_row" v-for="(o,i) in list" :key="o+i">
					<td class="diy_field diy_text" v-if="$check_field('get','auction_number')">
						<span>
							{{ o["auction_number"] }}
						</span>
					</td>
					<td class="diy_field diy_uid" v-if="$check_field('get','seller_number')">
						<span>
							{{ get_user_name(o['seller_number']) }}
						</span>
					</td>
					<td class="diy_field diy_text" v-if="$check_field('get','seller_name')">
						<span>
							{{ o["seller_name"] }}
						</span>
					</td>
					<td class="diy_field diy_text" v-if="$check_field('get','title')">
						<span>
							{{ o["title"] }}
						</span>
					</td>
					<td class="diy_field diy_text" v-if="$check_field('get','brand')">
						<span>
							{{ o["brand"] }}
						</span>
					</td>
					<td class="diy_field" v-if="$check_field('get','photo')">
						<img class="diy_img" :src="o['photo']" />
					</td>
					<td class="diy_field diy_text" v-if="$check_field('get','year_of_purchase')">
						<span>
							{{ o["year_of_purchase"] }}
						</span>
					</td>
					<td class="diy_field diy_text" v-if="$check_field('get','kilometers_traveled')">
						<span>
							{{ o["kilometers_traveled"] }}
						</span>
					</td>
					<td class="diy_field diy_number" v-if="$check_field('get','starting_price')">
						<span>
							{{ o["starting_price"] }}
						</span>
					</td>
					<td class="diy_field diy_number" v-if="$check_field('get','current_price')">
						<span>
							{{ o["current_price"] }}
						</span>
					</td>
					<td class="diy_field diy_text" v-if="$check_field('get','auction_mode')">
						<span>
							{{ o["auction_mode"] }}
						</span>
					</td>
					<td class="diy_field diy_text" v-if="$check_field('get','vehicle_parameters')">
						<span>
							{{ o["vehicle_parameters"] }}
						</span>
					</td>
				</tr>
			</table>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
			list: {
				type: Array,
				default: function() {
					return [];
				},
			},
			show: {
				type: Boolean,
				default: function(){
					return true;
				}
			}
		},
		data() {
			return {
						imgList: [
						{
							title: "照片",
							name: "photo",
							type: "图片",
							is_img_list: "1"
						},
						],
						itemList: [
								{
									title: "拍卖单号",
									name: "auction_number",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "卖家编号",
									name: "seller_number",
									type: "UID",
									is_img_list: "0"
								},
								{
									title: "卖家姓名",
									name: "seller_name",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "标题",
									name: "title",
									type: "文本",
									is_img_list: "1"
								},
								{
									title: "品牌",
									name: "brand",
									type: "下寻",
									is_img_list: "1"
								},
								{
									title: "购入年份",
									name: "year_of_purchase",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "行驶公里数",
									name: "kilometers_traveled",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "起拍价",
									name: "starting_price",
									type: "数字",
									is_img_list: "1"
								},
								{
									title: "当前价",
									name: "current_price",
									type: "数字",
									is_img_list: "1"
								},
								{
									title: "拍卖方式",
									name: "auction_mode",
									type: "下拉",
									is_img_list: "0"
								},
						],
						richList: [
								{
									title: "汽车参数",
									name: "vehicle_parameters",
									type: "多文本"
								},
								{
									title: "详情",
									name: "details",
									type: "编辑"
								},
						],
				// 用户列表
				list_user_seller_number: [],
			};
		},
		methods: {
			/**
			 * 获取卖家用户列表
			 */
			async get_list_user_seller_number() {
				var json = await this.$get("~/api/user/get_list?user_group=卖家");
				if(json.result && json.result.list){
					this.list_user_seller_number = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_name(id){
				var obj = this.list_user_seller_number.getObj({"user_id":id});
				var ret = "";
				if(obj){
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
				}
				return ret;
			},
		},
		created() {
			this.get_list_user_seller_number();
		},
		computed:{
			showItemList(){
				let arr = [];
				let _type = ["视频","音频","文件"];
				this.itemList.forEach(item => {
					if(_type.indexOf(item.type) === -1 && !!+item.is_img_list){
						arr.push(item)
					}
				})
				return arr.slice(0,4);
			}
		}
	};
</script>

<style scoped>
	.media {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		flex-basis: 75%;
		min-height: 10rem;
	}

	.goods {
		display: flex;
		width: calc(25% - 1rem);
		margin: 0.5rem;
		padding: 0.5rem;
		flex-direction: column;
		justify-content: space-between;
		background-color: white;
		border-radius: 0.5rem;
	}

	.goods:hover {
		border: 0.2rem solid #909399;
		box-shadow: 0 0.1rem 0.3rem rgba(0, 0, 0, 0.15);
	}

	.goods:hover img {
		filter: blur(1px);
	}

	.price {
		font-size: 1rem;
		margin-right: 3px;
	}

	.price_ago {
		text-decoration: line-through;
		font-size: 0.5rem;
		color: #999;

	}

	.title {
		word-break: break-all;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		font-weight: 700;
		padding: .25rem;
	}

	.icon_cart {
		color: #FF5722;
		float: right;
	}

	@media (max-width: 992px) {

		.goods {
			width: calc(33% - 1rem);
			;
		}

	}

	@media (max-width: 768px) {

		.goods {
			width: calc(50% - 1rem);
			;
		}

	}
</style>

