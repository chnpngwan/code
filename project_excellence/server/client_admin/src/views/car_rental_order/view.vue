<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户名" prop="user_name">
						<div v-if="user_group !== '管理员'">
							{{ get_user_session_user_name(form['user_name']) }}
							<!--<el-input id="business_name" v-model="form['user_name']" placeholder="请输入用户名"-->
							<!--v-if="user_group === '管理员' || (form['car_rental_order_id'] && $check_field('set','user_name')) || (!form['car_rental_order_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['car_rental_order_id'] && $check_field('set','user_name')) || (!form['car_rental_order_id'] && $check_field('add','user_name'))" id="user_name" v-model="form['user_name']" :disabled="disabledObj['user_name_isDisabled']">
								<el-option v-for="o in list_user_user_name" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','user_name')" id="user_name" v-model="form['user_name']" :disabled="true">
								<el-option v-for="o in list_user_user_name" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="user_name" v-model="form['user_name']" :disabled="disabledObj['user_name_isDisabled']">
							<el-option v-for="o in list_user_user_name" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','full_name') || $check_field('add','full_name') || $check_field('set','full_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="姓名" prop="full_name">
					<el-input id="full_name" v-model="form['full_name']" placeholder="请输入姓名"
							  v-if="user_group === '管理员' || (form['car_rental_order_id'] && $check_field('set','full_name')) || (!form['car_rental_order_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','full_name')">{{form['full_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','contact_information') || $check_field('add','contact_information') || $check_field('set','contact_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系方式" prop="contact_information">
					<el-input id="contact_information" v-model="form['contact_information']" placeholder="请输入联系方式"
							  v-if="user_group === '管理员' || (form['car_rental_order_id'] && $check_field('set','contact_information')) || (!form['car_rental_order_id'] && $check_field('add','contact_information'))" :disabled="disabledObj['contact_information_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_information')">{{form['contact_information']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','car_number') || $check_field('add','car_number') || $check_field('set','car_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车编号" prop="car_number">
					<el-input id="car_number" v-model="form['car_number']" placeholder="请输入汽车编号"
							  v-if="user_group === '管理员' || (form['car_rental_order_id'] && $check_field('set','car_number')) || (!form['car_rental_order_id'] && $check_field('add','car_number'))" :disabled="disabledObj['car_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_number')">{{form['car_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','automobile_brand') || $check_field('add','automobile_brand') || $check_field('set','automobile_brand')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车品牌" prop="automobile_brand">
					<el-input id="automobile_brand" v-model="form['automobile_brand']" placeholder="请输入汽车品牌"
							  v-if="user_group === '管理员' || (form['car_rental_order_id'] && $check_field('set','automobile_brand')) || (!form['car_rental_order_id'] && $check_field('add','automobile_brand'))" :disabled="disabledObj['automobile_brand_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','automobile_brand')">{{form['automobile_brand']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','car_model') || $check_field('add','car_model') || $check_field('set','car_model')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车型号" prop="car_model">
					<el-input id="car_model" v-model="form['car_model']" placeholder="请输入汽车型号"
							  v-if="user_group === '管理员' || (form['car_rental_order_id'] && $check_field('set','car_model')) || (!form['car_rental_order_id'] && $check_field('add','car_model'))" :disabled="disabledObj['car_model_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_model')">{{form['car_model']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','car_type') || $check_field('add','car_type') || $check_field('set','car_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车类型" prop="car_type">
					<el-input id="car_type" v-model="form['car_type']" placeholder="请输入汽车类型"
							  v-if="user_group === '管理员' || (form['car_rental_order_id'] && $check_field('set','car_type')) || (!form['car_rental_order_id'] && $check_field('add','car_type'))" :disabled="disabledObj['car_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_type')">{{form['car_type']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','rental_price') || $check_field('add','rental_price') || $check_field('set','rental_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="租赁价格" prop="rental_price">
					<el-input id="rental_price" v-model="form['rental_price']" placeholder="请输入租赁价格"
							  v-if="user_group === '管理员' || (form['car_rental_order_id'] && $check_field('set','rental_price')) || (!form['car_rental_order_id'] && $check_field('add','rental_price'))" :disabled="disabledObj['rental_price_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','rental_price')">{{form['rental_price']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','lease_duration') || $check_field('add','lease_duration') || $check_field('set','lease_duration')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="租赁时长" prop="lease_duration">
					<el-input id="lease_duration" v-model="form['lease_duration']" placeholder="请输入租赁时长"
							  v-if="user_group === '管理员' || (form['car_rental_order_id'] && $check_field('set','lease_duration')) || (!form['car_rental_order_id'] && $check_field('add','lease_duration'))" :disabled="disabledObj['lease_duration_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','lease_duration')">{{form['lease_duration']}}</div>
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
				field: "car_rental_order_id",
				url_add: "~/api/car_rental_order/add?",
				url_set: "~/api/car_rental_order/set?",
				url_get_obj: "~/api/car_rental_order/get_obj?",
				url_upload: "~/api/car_rental_order/upload?",

				query: {
					"car_rental_order_id": 0,
				},

				form: {
					"user_name": 0, // 用户名
					"full_name":'', // 姓名
					"contact_information":'', // 联系方式
					"car_number":'', // 汽车编号
					"automobile_brand":'', // 汽车品牌
					"car_model":'', // 汽车型号
					"car_type":'', // 汽车类型
					"rental_price":'', // 租赁价格
					"lease_duration":'', // 租赁时长
					"examine_state": "未审核",
					"examine_reply": "",
					"car_rental_order_id": 0, // ID

				},
				disabledObj:{
					"user_name_isDisabled": false,
					"full_name_isDisabled": false,
					"contact_information_isDisabled": false,
					"car_number_isDisabled": false,
					"automobile_brand_isDisabled": false,
					"car_model_isDisabled": false,
					"car_type_isDisabled": false,
					"rental_price_isDisabled": false,
					"lease_duration_isDisabled": false,
				},
				// 用户列表
				list_user_user_name: [],
				// 用户组
				group_user_user_name: "",
			}
		},
		methods: {
			/**
			 * 获取会员用户用户列表
			 */
			async get_list_user_user_name() {
                // if(this.user_group !== "管理员" && this.form["user_name"] === 0) {
                //     this.form["user_name"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=会员用户");
                if(json.result && json.result.list){
                    this.list_user_user_name = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
			/**
			 * 获取会员用户用户组
			 */
			async get_group_user_user_name() {
				this.form["user_name"] = this.user.user_id;
				var json = await this.$get("~/api/user_group/get_obj?name=会员用户");
				if(json.result && json.result.obj){
					this.group_user_user_name = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_user_name(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_user_name.source_table+"/get_obj?"
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
                    if (arr[i] !== "user_name") {
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
			get_user_user_name(id){
				var obj = this.list_user_user_name.getObj({"user_id":id});
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
						case "用户名":
							if(param["user_name"] > 0){
								param["user_name"] = this.user.user_id;
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
					bl = this.$check_action('/car_rental_order/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/car_rental_order/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/car_rental_order/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/car_rental_order/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/car_rental_order/view','get');
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
			this.get_list_user_user_name();
			this.get_group_user_user_name();
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
