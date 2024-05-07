<template>
	<el-main class="bg table_wrap">
		<el-form label-position="right" :model="query" class="form p_4" label-width="120">
			<el-row>
				<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="标题">
						<el-input v-model="query.title"></el-input>
					</el-form-item>
				</el-col>
				<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="品牌">
						<el-select v-model="query.brand">
							<el-option v-for="o in list_brand" :key="o.brand" :label="o.brand"
								:value="o.brand">
							</el-option>
						</el-select>
					</el-form-item>
				</el-col>
				<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="拍卖方式">
						<el-select v-model="query.auction_mode">
                            <el-option v-for="o in list_auction_mode" :key="o" :label="o"
                            	:value="o">
                            </el-option>
						</el-select>
					</el-form-item>
				</el-col>
				<el-col :xs="24" :sm="10" :lg="8" class="search_btn_wrap_1">
					<el-form-item>
						<el-button type="primary" @click="search()" class="search_btn_find">查询</el-button>
						<el-button @click="reset()" style="margin-right: 74px;" class="search_btn_reset">重置</el-button>
						<router-link v-if="user_group == '管理员' || $check_action('/secondhand_car/table','add') || $check_action('/secondhand_car/view','add')" class="el-button el-button--default el-button--primary search_btn_add" to="./view?">添加
						</router-link>
            <el-button v-if="user_group == '管理员' || $check_action('/secondhand_car/table','del') || $check_action('/secondhand_car/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
					</el-form-item>
				</el-col>

			</el-row>
		</el-form>
		<el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
			<el-table-column fixed type="selection" tooltip-effect="dark" width="55">
			</el-table-column>
			<el-table-column prop="auction_number" label="拍卖单号"
				v-if="user_group == '管理员' || $check_field('get','auction_number')" min-width="200">
			</el-table-column>
			<el-table-column prop="seller_number" label="卖家编号"
				v-if="user_group == '管理员' || $check_field('get','seller_number')" min-width="200">
				<template slot-scope="scope">
					{{ get_user_seller_number(scope.row['seller_number']) }}
				</template>
			</el-table-column>
			<el-table-column prop="seller_name" label="卖家姓名"
				v-if="user_group == '管理员' || $check_field('get','seller_name')" min-width="200">
			</el-table-column>
			<el-table-column prop="title" label="标题"
				v-if="user_group == '管理员' || $check_field('get','title')" min-width="200">
			</el-table-column>
			<el-table-column prop="brand" label="品牌"
				v-if="user_group == '管理员' || $check_field('get','brand')" min-width="200">
			</el-table-column>
			<el-table-column prop="photo" label="照片"
				v-if="user_group == '管理员' || $check_field('get','photo')" min-width="200">
				<template slot-scope="scope">
					<el-image style="width: 100px; height: 100px" :src="$fullUrl(scope.row['photo'])"
						:preview-src-list="[$fullUrl(scope.row['photo'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
				</template>
			</el-table-column>
			<el-table-column prop="year_of_purchase" label="购入年份"
				v-if="user_group == '管理员' || $check_field('get','year_of_purchase')" min-width="200">
			</el-table-column>
			<el-table-column prop="kilometers_traveled" label="行驶公里数"
				v-if="user_group == '管理员' || $check_field('get','kilometers_traveled')" min-width="200">
			</el-table-column>
			<el-table-column prop="starting_price" label="起拍价"
				v-if="user_group == '管理员' || $check_field('get','starting_price')" min-width="200">
			</el-table-column>
			<el-table-column prop="current_price" label="当前价"
				v-if="user_group == '管理员' || $check_field('get','current_price')" min-width="200">
			</el-table-column>
			<el-table-column prop="auction_mode" label="拍卖方式"
				v-if="user_group == '管理员' || $check_field('get','auction_mode')" min-width="200">
			</el-table-column>
			<el-table-column prop="vehicle_parameters" label="汽车参数"
				v-if="user_group == '管理员' || $check_field('get','vehicle_parameters')" min-width="200">
			</el-table-column>
			<el-table-column label="审核状态" prop="examine_state">
			</el-table-column>
			<el-table-column label="审核回复" prop="examine_reply">
			</el-table-column>

            <el-table-column sortable prop="create_time" label="创建时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["create_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
            </el-table-column>

			<el-table-column sortable prop="update_time" label="更新时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["update_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
			</el-table-column>
			<el-table-column prop="timer_title" label="计时器标题"
				v-if="user_group == '管理员' || $check_field('get','timer_title')" min-width="200">
			</el-table-column>
			<el-table-column sortable prop="timing_start_time" label="计时开始时间" min-width="200">
				<template slot-scope="scope">
					{{ $toTime(scope.row["timing_start_time"],"yyyy-MM-dd hh:mm:ss") }}
				</template>
			</el-table-column>
			<el-table-column sortable prop="timing_end_time" label="计时结束时间" min-width="200">
				<template slot-scope="scope">
					{{ $toTime(scope.row["timing_end_time"],"yyyy-MM-dd hh:mm:ss") }}
				</template>
			</el-table-column>
			<el-table-column fixed="right" label="操作" min-width="120" v-if="user_group == '管理员' || $check_action('/secondhand_car/table','set') || $check_action('/secondhand_car/view','set') || $check_action('/secondhand_car/view','get') || $check_action('/竞拍/table','add') || $check_action('/竞拍/view','add')" >


				<template slot-scope="scope">
					<router-link class="el-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
					v-if="user_group == '管理员' || $check_action('/secondhand_car/table','set') || $check_action('/secondhand_car/view','set') || $check_action('/secondhand_car/view','get')"
						:to="'./view?' + field + '=' + scope.row[field]"
						 size="small">
						<span>详情</span>
					</router-link>
					<router-link v-if="user_group == '管理员' || $check_comment('/secondhand_car/table')" class="el-button el-button--small is-plain el-button--primary"
								 :to="'../comment/table?size=10&page=1&source_table=secondhand_car&source_field=' + field + '&source_id=' + scope.row[field]" size="small">
						查看评论
					</router-link>
				</template>
			</el-table-column>

		</el-table>

		<!-- 分页器 -->
		<div class="mt text_center">
			<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
				:current-page="query.page" :page-sizes="[7, 10, 30, 100]" :page-size="query.size"
				layout="total, sizes, prev, pager, next, jumper" :total="count">
			</el-pagination>
		</div>
		<!-- /分页器 -->

		<div class="modal_wrap" v-if="showModal">
			<div class="modal_box">
				<!-- <div class="modal_box_close" @click="closeModal">X</div> -->
				<p class="modal_box_title">重要提醒</p>
				<p class="modal_box_text">当前有数据达到预警值！</p>
				<div class="btn_box">
					<span @click="closeModal">取消</span>
					<span @click="closeModal">确定</span>
				</div>
			</div>
		</div>


	</el-main>
</template>
<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				// 弹框
				showModal: false,
				// 获取数据地址
				url_get_list: "~/api/secondhand_car/get_list?like=0",
				url_del: "~/api/secondhand_car/del?",

				// 字段ID
				field: "secondhand_car_id",

				// 查询
				query: {
					"size": 7,
					"page": 1,
					"title": "",
					"brand": "",
					"auction_mode": "",
					"login_time": "",
					"create_time": "",
					"orderby": `create_time desc`
				},
				// 数据
				list: [],
				// 用户列表
				list_user_seller_number: [],
				// 品牌列表
				list_brand: [],
				// 拍卖方式列表
				list_auction_mode: ['加价竞拍','一口价'],
			}
		},
		methods: {
			// 关闭弹框
			closeModal(){
				this.showModal = false;
				},
			get_list_before(param){
				var user_group = this.user.user_group;
				if(user_group != "管理员"){
					switch(user_group){
						case "卖家":
						param["seller_number"] = this.user.user_id;
						break;
					}
				}
				return param;
			},
			/**
			 * 获取品牌列表
			 */
			async get_list_brand() {
				var json = await this.$get("~/api/automobile_brand/get_list?");
				if(json.result){
					this.list_brand = json.result.list;
				}else if (json.error){
					console.log(json.error);
				}
			},

			open_tip() {
				const h = this.$createElement;

				var message = "";
				var list = this.list;

				var ifs = [ ];
				for (var n = 0; n < ifs.length; n++) {
					var o = ifs[n];
					for (var i = 0; i < list.length; i++) {
						var lt = list[i];
						if (o.type == "数内") {
							if ((o.start || o.start === 0) && (o.end || o.end === 0)) {
								if (lt[o.factor] > o.start && lt[o.factor] < o.end) {
									o["idx"] = o["idx"] + 1;
								}
							} else if (o.start || o.start === 0) {
								if (lt[o.factor] > o.start) {
									o["idx"] = o["idx"] + 1;
								}
							} else if (o.end || o.end === 0) {
								if (lt[o.factor] < o.end) {
									o["idx"] = o["idx"] + 1;
								}
							}
						} else if (o.type == "数外") {
							if ((o.start || o.start === 0) && (o.end || o.end === 0)) {
								if (lt[o.factor] < o.start || lt[o.factor] > o.end) {
									o["idx"] = o["idx"] + 1;
								}
							} else if (o.start || o.start === 0) {
								if (lt[o.factor] < o.start) {
									o["idx"] = o["idx"] + 1;
								}
							} else if (o.end || o.end === 0) {
								if (lt[o.factor] > o.end) {
									o["idx"] = o["idx"] + 1;
								}
							}
						} else if (o.type == "日内") {
							if ((o.start) && (o.end)) {
								if (lt[o.factor] > o.start && lt[o.factor] < o.end) {
									o["idx"] = o["idx"] + 1;
								}
							} else if (o.start) {
								if (lt[o.factor] < o.start) {
									o["idx"] = o["idx"] + 1;
								}
							} else if (o.end) {
								if (lt[o.factor] > o.end) {
									o["idx"] = o["idx"] + 1;
								}
							}
						} else if (o.type == "日外") {
							if (o.start && o.end) {
								if (lt[o.factor] < o.start || lt[o.factor] > o.end) {
									o["idx"] = o["idx"] + 1;
								}
							} else if (o.start) {
								if (lt[o.factor] < o.start) {
									o["idx"] = o["idx"] + 1;
								}
							} else if (o.end) {
								if (lt[o.factor] > o.end) {
									o["idx"] = o["idx"] + 1;
								}
							}
						}
					}

					if (o["idx"]) {
						message += o.title;
						if (o["type"] == "数内") {
							if (o.start || o.start === 0) {
								message += "大于" + o.start;
							}
							if ((o.start || o.start === 0) && (o.end || o.end === 0)) {
								message += "并且";
							}
							if (o.end || o.end === 0) {
								message += "小于" + o.end;
							}
						} else if (o["type"] == "数外") {
							if (o.start || o.start === 0) {
								message += "小于" + o.start;
							}
							if ((o.start || o.start === 0) || (o.end || o.end === 0)) {
								message += "或者";
							}
							if (o.end || o.end === 0) {
								message += "大于" + o.end;
							}
						} else if (o["type"] == "日内") {
							if (o.start) {
								message += "在" + o.start + "之后";
							}
							if (o.start && o.end) {
								message += "并且";
							}
							if (o.end) {
								message += "在" + o.end + "之前";
							}
						} else if (o["type"] == "日外") {
							if (o.start) {
								message += "在" + o.start + "之前";
							}
							if (o.start || o.end) {
								message += "或者";
							}
							if (o.end) {
								message += "在" + o.end + "之后";
							}
						}
						message += "的有" + o["idx"] + "条";
					}
				}

				if (message) {
					message += "，需要处理、请尽快处理。";
					this.showModal = true;
					// this.$notify({
					// 	title: '提醒',
					// 	dangerouslyUseHTMLString: true,
					// 	message: h('i', {
					// 		style: 'color: teal'
					// 	}, message)
					// });
				}
			},
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

			get_user_seller_number(id){
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
			deleteRow(index, rows) {
				rows.splice(index, 1);
			}

		},
		created() {
			this.get_list_user_seller_number();
			// 初始化品牌列表
			this.get_list_brand();
			setTimeout(() => {
				this.open_tip();
			}, 1000)
		}
	}
</script>

<style type="text/css">
	.bg {
		background: white;
	}

	.form.p_4 {
		padding: 1rem;
	}

	.form .el-input {
		width: initial;
	}

	.mt {
		margin-top: 1rem;
	}

	.text_center {
		text-align: center;
	}

	.float-right {
		float: right;
	}


	.modal_wrap{
		width: 100vw;
		height: 100vh;
		position: fixed;
		top: 0;
		left: 0;
		background: rgba(0,0,0,0.5);
		z-index: 9999999999;
	}
	.modal_wrap .modal_box{
		width: 400px;
		height: 200px;
		background: url("../../assets/modal_bg.jpg") no-repeat center;
		background-size: cover;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-left: -200px;
		margin-top: -100px;
		border-radius: 10px;
		}
	.modal_wrap .modal_box .modal_box_close{
		font-size: 20px;
		position: absolute;
		top: 10px;
		right: 10px;
		cursor: pointer;
		}
	.modal_wrap .modal_box .modal_box_title{
	  text-align: center;
    font-size: 18px;
    margin: 16px auto;
    color: #fff;
    border-bottom: 1px solid rgba(117, 116, 116,0.5);
    padding-bottom: 16px;
    width: 356px;
		}
	.modal_wrap .modal_box .modal_box_text{
			text-align: center;
		font-size: 15px;
		color: #fff;
		margin-top: 25px;
		}
	.modal_wrap .modal_box .btn_box{
		display: flex;
		flex-direction: row;
		justify-content: center;
		margin-top: 42px;
		}
			.modal_wrap .modal_box .btn_box span{
				display: inline-block;
				width: 80px;
				height: 30px;
				line-height: 30px;
				text-align: center;
				border: 1px solid #ccc;
				font-size: 14px;
				cursor: pointer;
				color: #fff;
			}
	.modal_wrap .modal_box .btn_box span:nth-child(2){
		background: #409EFF;
		color: #fff;
		border-color: #409EFF;
		margin-left: 15px;
	}
</style>
