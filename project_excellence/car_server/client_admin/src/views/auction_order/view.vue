<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','auction_number') || $check_field('add','auction_number') || $check_field('set','auction_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="拍卖单号" prop="auction_number">
					<el-input id="auction_number" v-model="form['auction_number']" placeholder="请输入拍卖单号"
							  v-if="user_group === '管理员' || (form['auction_order_id'] && $check_field('set','auction_number')) || (!form['auction_order_id'] && $check_field('add','auction_number'))" :disabled="disabledObj['auction_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','auction_number')">{{form['auction_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','seller_number') || $check_field('add','seller_number') || $check_field('set','seller_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="卖家编号" prop="seller_number">
						<el-select v-if="user_group === '管理员' || (form['auction_order_id'] && $check_field('set','seller_number')) || (!form['auction_order_id'] && $check_field('add','seller_number'))" id="seller_number" v-model="form['seller_number']" :disabled="disabledObj['seller_number_isDisabled']">
							<el-option v-for="o in list_user_seller_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','seller_number')" id="seller_number" v-model="form['seller_number']" :disabled="true">
							<el-option v-for="o in list_user_seller_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','seller_name') || $check_field('add','seller_name') || $check_field('set','seller_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="卖家姓名" prop="seller_name">
					<el-input id="seller_name" v-model="form['seller_name']" placeholder="请输入卖家姓名"
							  v-if="user_group === '管理员' || (form['auction_order_id'] && $check_field('set','seller_name')) || (!form['auction_order_id'] && $check_field('add','seller_name'))" :disabled="disabledObj['seller_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','seller_name')">{{form['seller_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
					<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['auction_order_id'] && $check_field('set','title')) || (!form['auction_order_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','current_price') || $check_field('add','current_price') || $check_field('set','current_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="当前价" prop="current_price">
					<el-input id="current_price" v-model="form['current_price']" placeholder="请输入当前价"
							  v-if="user_group === '管理员' || (form['auction_order_id'] && $check_field('set','current_price')) || (!form['auction_order_id'] && $check_field('add','current_price'))" :disabled="disabledObj['current_price_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','current_price')">{{form['current_price']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','mark_up_amount') || $check_field('add','mark_up_amount') || $check_field('set','mark_up_amount')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="加价金额" prop="mark_up_amount">
					<el-input-number id="mark_up_amount" v-model.number="form['mark_up_amount']"
						v-if="user_group === '管理员' || (form['auction_order_id'] && $check_field('set','mark_up_amount')) || (!form['auction_order_id'] && $check_field('add','mark_up_amount'))" :disabled="disabledObj['mark_up_amount_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','mark_up_amount')">{{form['mark_up_amount']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','buyer_number') || $check_field('add','buyer_number') || $check_field('set','buyer_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="买家编号" prop="buyer_number">
						<div v-if="user_group !== '管理员'">
							{{ get_user_session_buyer_number(form['buyer_number']) }}
							<!--<el-input id="business_name" v-model="form['buyer_number']" placeholder="请输入买家编号"-->
							<!--v-if="user_group === '管理员' || (form['auction_order_id'] && $check_field('set','buyer_number')) || (!form['auction_order_id'] && $check_field('add','buyer_number'))" :disabled="disabledObj['buyer_number_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','buyer_number')">{{form['buyer_number']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['auction_order_id'] && $check_field('set','buyer_number')) || (!form['auction_order_id'] && $check_field('add','buyer_number'))" id="buyer_number" v-model="form['buyer_number']" :disabled="disabledObj['buyer_number_isDisabled']">
								<el-option v-for="o in list_user_buyer_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','buyer_number')" id="buyer_number" v-model="form['buyer_number']" :disabled="true">
								<el-option v-for="o in list_user_buyer_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="buyer_number" v-model="form['buyer_number']" :disabled="disabledObj['buyer_number_isDisabled']">
							<el-option v-for="o in list_user_buyer_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','buyer_name') || $check_field('add','buyer_name') || $check_field('set','buyer_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="买家姓名" prop="buyer_name">
					<el-input id="buyer_name" v-model="form['buyer_name']" placeholder="请输入买家姓名"
							  v-if="user_group === '管理员' || (form['auction_order_id'] && $check_field('set','buyer_name')) || (!form['auction_order_id'] && $check_field('add','buyer_name'))" :disabled="disabledObj['buyer_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','buyer_name')">{{form['buyer_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','contact_number') || $check_field('add','contact_number') || $check_field('set','contact_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系电话" prop="contact_number">
					<el-input id="contact_number" v-model="form['contact_number']" placeholder="请输入联系电话"
							  v-if="user_group === '管理员' || (form['auction_order_id'] && $check_field('set','contact_number')) || (!form['auction_order_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_number')">{{form['contact_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核回复" prop="examine_reply">
					<el-input id="examine_reply" v-model="form['examine_reply']" placeholder="请输入审核回复"
						v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())"></el-input>
					<div v-else>{{form["examine_reply"]}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "auction_order_id",
				url_add: "~/api/auction_order/add?",
				url_set: "~/api/auction_order/set?",
				url_get_obj: "~/api/auction_order/get_obj?",
				url_upload: "~/api/auction_order/upload?",

				query: {
					"auction_order_id": 0,
				},

				form: {
					"auction_number":'', // 拍卖单号
					"seller_number": 0, // 卖家编号
					"seller_name":'', // 卖家姓名
					"title":'', // 标题
					"current_price":'', // 当前价
					"mark_up_amount":0, // 加价金额
					"buyer_number": 0, // 买家编号
					"buyer_name":'', // 买家姓名
					"contact_number":'', // 联系电话
					"examine_state": "未审核",
					"examine_reply": "",
					"auction_order_id": 0, // ID

				},
				disabledObj:{
					"auction_number_isDisabled": false,
					"seller_number_isDisabled": false,
					"seller_name_isDisabled": false,
					"title_isDisabled": false,
					"current_price_isDisabled": false,
          "mark_up_amount_isDisabled": false,
					"buyer_number_isDisabled": false,
					"buyer_name_isDisabled": false,
					"contact_number_isDisabled": false,
				},
				// 用户列表
				list_user_seller_number: [],
				// 用户列表
				list_user_buyer_number: [],
				// 用户组
				group_user_buyer_number: "",
			}
		},
		methods: {
			/**
			 * 获取卖家用户列表
			 */
			async get_list_user_seller_number() {
                // if(this.user_group !== "管理员" && this.form["seller_number"] === 0) {
                //     this.form["seller_number"] = this.user.user_id;
                // }
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
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			/**
			 * 获取买家用户列表
			 */
			async get_list_user_buyer_number() {
                // if(this.user_group !== "管理员" && this.form["buyer_number"] === 0) {
                //     this.form["buyer_number"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=买家");
                if(json.result && json.result.list){
                    this.list_user_buyer_number = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
			/**
			 * 获取买家用户组
			 */
			async get_group_user_buyer_number() {
				this.form["buyer_number"] = this.user.user_id;
				var json = await this.$get("~/api/user_group/get_obj?name=买家");
				if(json.result && json.result.obj){
					this.group_user_buyer_number = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_buyer_number(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_buyer_number.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
						for (let key in _this.form) {
							arrForm.push(key)
						}
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                for (var j = 0; j < arrForm.length; j++) {
                  if (arr[i] === arrForm[j]) {
                    if (arr[i] !== "buyer_number") {
                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                      break;
                    } else {
                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                    }
                  }
                }
              }
						}
					}
				});
			},
			get_user_buyer_number(id){
				var obj = this.list_user_buyer_number.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
				// 获取缓存数据附加
				form = $.db.get("form");
				$.push(this.form ,form);
				/**
				* 请求列表前
				* @param {Object} param
				*/
				var user_group = this.user.user_group;
				if (user_group !== "管理员") {
					switch (user_group) {
						case "卖家编号":
							if(param["seller_number"] > 0){
								param["seller_number"] = this.user.user_id;
							}
							break;
						case "买家编号":
							if(param["buyer_number"] > 0){
								param["buyer_number"] = this.user.user_id;
							}
							break;
					}
				}
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/auction_order/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/auction_order/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/auction_order/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/auction_order/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/auction_order/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
			this.get_list_user_seller_number();
			this.get_list_user_buyer_number();
			this.get_group_user_buyer_number();
		},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
</style>
