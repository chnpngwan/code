<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','auction_number') || $check_field('add','auction_number') || $check_field('set','auction_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="拍卖单号" prop="auction_number">
					<el-input id="auction_number" v-model="form['auction_number']" placeholder="请输入拍卖单号"
							  v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','auction_number')) || (!form['secondhand_car_id'] && $check_field('add','auction_number'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','auction_number')">{{form['auction_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','seller_number') || $check_field('add','seller_number') || $check_field('set','seller_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="卖家编号" prop="seller_number">
						<div v-if="user_group !== '管理员'">
							{{ get_user_session_seller_number(form['seller_number']) }}
							<!--<el-input id="business_name" v-model="form['seller_number']" placeholder="请输入卖家编号"-->
							<!--v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','seller_number')) || (!form['secondhand_car_id'] && $check_field('add','seller_number'))" :disabled="disabledObj['seller_number_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','seller_number')">{{form['seller_number']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','seller_number')) || (!form['secondhand_car_id'] && $check_field('add','seller_number'))" id="seller_number" v-model="form['seller_number']" :disabled="disabledObj['seller_number_isDisabled']">
								<el-option v-for="o in list_user_seller_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','seller_number')" id="seller_number" v-model="form['seller_number']" :disabled="true">
								<el-option v-for="o in list_user_seller_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="seller_number" v-model="form['seller_number']" :disabled="disabledObj['seller_number_isDisabled']">
							<el-option v-for="o in list_user_seller_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','seller_name') || $check_field('add','seller_name') || $check_field('set','seller_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="卖家姓名" prop="seller_name">
					<el-input id="seller_name" v-model="form['seller_name']" placeholder="请输入卖家姓名"
							  v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','seller_name')) || (!form['secondhand_car_id'] && $check_field('add','seller_name'))" :disabled="disabledObj['seller_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','seller_name')">{{form['seller_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
					<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','title')) || (!form['secondhand_car_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','brand') || $check_field('add','brand') || $check_field('set','brand')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="品牌" prop="brand">
					<el-select id="brand" v-model="form['brand']"
						v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','brand')) || (!form['secondhand_car_id'] && $check_field('add','brand'))">
						<el-option v-for="o in list_brand" :key="o['brand']" :label="o['brand']"
							:value="o['brand']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','brand')">{{form['brand']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','photo') || $check_field('add','photo') || $check_field('set','photo')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="照片" prop="photo">
					<el-upload :disabled="disabledObj['photo_isDisabled']" id="photo" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_photo"
						:show-file-list="false" v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','photo')) || (!form['secondhand_car_id'] && $check_field('add','photo'))">
						<img v-if="form['photo']" :src="$fullUrl(form['photo'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','photo')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['photo'])" :preview-src-list="[$fullUrl(form['photo'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','year_of_purchase') || $check_field('add','year_of_purchase') || $check_field('set','year_of_purchase')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="购入年份" prop="year_of_purchase">
					<el-input id="year_of_purchase" v-model="form['year_of_purchase']" placeholder="请输入购入年份"
							  v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','year_of_purchase')) || (!form['secondhand_car_id'] && $check_field('add','year_of_purchase'))" :disabled="disabledObj['year_of_purchase_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','year_of_purchase')">{{form['year_of_purchase']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','kilometers_traveled') || $check_field('add','kilometers_traveled') || $check_field('set','kilometers_traveled')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="行驶公里数" prop="kilometers_traveled">
					<el-input id="kilometers_traveled" v-model="form['kilometers_traveled']" placeholder="请输入行驶公里数"
							  v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','kilometers_traveled')) || (!form['secondhand_car_id'] && $check_field('add','kilometers_traveled'))" :disabled="disabledObj['kilometers_traveled_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','kilometers_traveled')">{{form['kilometers_traveled']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','starting_price') || $check_field('add','starting_price') || $check_field('set','starting_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="起拍价" prop="starting_price">
					<el-input-number id="starting_price" v-model.number="form['starting_price']"
						v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','starting_price')) || (!form['secondhand_car_id'] && $check_field('add','starting_price'))" :disabled="disabledObj['starting_price_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','starting_price')">{{form['starting_price']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','current_price') || $check_field('add','current_price') || $check_field('set','current_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="当前价" prop="current_price">
					<el-input-number id="current_price" v-model.number="form['current_price']"
						v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','current_price')) || (!form['secondhand_car_id'] && $check_field('add','current_price'))" :disabled="disabledObj['current_price_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','current_price')">{{form['current_price']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','auction_mode') || $check_field('add','auction_mode') || $check_field('set','auction_mode')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="拍卖方式" prop="auction_mode">
					<el-select id="auction_mode" v-model="form['auction_mode']"
						v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','auction_mode')) || (!form['secondhand_car_id'] && $check_field('add','auction_mode'))">
						<el-option v-for="o in list_auction_mode" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','auction_mode')">{{form['auction_mode']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','vehicle_parameters') || $check_field('add','vehicle_parameters') || $check_field('set','vehicle_parameters')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车参数" prop="vehicle_parameters">
					<el-input type="textarea" id="vehicle_parameters" v-model="form['vehicle_parameters']" placeholder="请输入汽车参数"
						v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','vehicle_parameters')) || (!form['secondhand_car_id'] && $check_field('add','vehicle_parameters'))" :disabled="disabledObj['vehicle_parameters_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_parameters')">{{form['vehicle_parameters']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','details') || $check_field('add','details') || $check_field('set','details')" :xs="24" :sm="24" :lg="24" class="el_form_editor_warp">
				<el-form-item label="详情" prop="details">
					<quill-editor v-model.number="form['details']"
						v-if="user_group === '管理员' || (form['secondhand_car_id'] && $check_field('set','details')) || (!form['secondhand_car_id'] && $check_field('add','details')) ">
					</quill-editor>
					<div v-else-if="$check_field('get','details')" v-html="form['details']"></div>
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
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="计时器标题" prop="timer_title">
					<el-input id="timer_title" v-model="form['timer_title']" placeholder="请输入计时器标题"
							  v-if="user_group === '管理员' || $check_action('/secondhand_car/view','set') || $check_action('/secondhand_car/view','add')" :disabled="disabledObj['timer_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','timer_title')">{{form['timer_title']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="计时开始时间" prop="timing_start_time">
					<el-date-picker id="timing_start_time" v-model="form['timing_start_time']" placeholder="选择计时器开始时间"
						v-if="user_group === '管理员' || $check_action('/secondhand_car/view','set') || $check_action('/secondhand_car/view','add')" :disabled="disabledObj['timing_start_time_isDisabled']" type="datetime" >
					</el-date-picker>
					<div v-else-if="$check_field('get','timing_start_time')">{{form['timing_start_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="计时结束时间" prop="timing_end_time">
					<el-date-picker id="timing_end_time" v-model="form['timing_end_time']" placeholder="选择计时器开始时间"
						v-if="user_group === '管理员' || $check_action('/secondhand_car/view','set') || $check_action('/secondhand_car/view','add')" :disabled="disabledObj['timing_end_time_isDisabled']" type="datetime" >
					</el-date-picker>
					<div v-else-if="$check_field('get','timing_end_time')">{{form['timing_end_time']}}</div>
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
				field: "secondhand_car_id",
				url_add: "~/api/secondhand_car/add?",
				url_set: "~/api/secondhand_car/set?",
				url_get_obj: "~/api/secondhand_car/get_obj?",
				url_upload: "~/api/secondhand_car/upload?",

				query: {
					"secondhand_car_id": 0,
				},

				form: {
					"auction_number":this.$get_stamp(), // 拍卖单号
					"seller_number": 0, // 卖家编号
					"seller_name":'', // 卖家姓名
					"title":'', // 标题
					"brand":'', // 品牌
					"photo":'', // 照片
					"year_of_purchase":'', // 购入年份
					"kilometers_traveled":'', // 行驶公里数
					"starting_price":0, // 起拍价
					"current_price":0, // 当前价
					"auction_mode":'', // 拍卖方式
					"vehicle_parameters":'', // 汽车参数
					"details":'', // 详情
					"examine_state": "未审核",
					"examine_reply": "",
					"secondhand_car_id": 0, // ID
					"timer_title":'', // 计时器标题
					"timing_start_time":'', // 计时开始时间
					"timing_end_time":'', // 计时结束时间

				},
				disabledObj:{
					"auction_number_isDisabled": false,
					"seller_number_isDisabled": false,
					"seller_name_isDisabled": false,
					"title_isDisabled": false,
					"brand_isDisabled": false,
					"photo_isDisabled": false,
					"year_of_purchase_isDisabled": false,
					"kilometers_traveled_isDisabled": false,
          "starting_price_isDisabled": false,
          "current_price_isDisabled": false,
					"auction_mode_isDisabled": false,
					"vehicle_parameters_isDisabled": false,
					"details_isDisabled": false,
					"timer_title_isDisabled": false,
					"timing_start_time_isDisabled": false,
					"timing_end_time_isDisabled": false,
				},
				// 用户列表
				list_user_seller_number: [],
				// 用户组
				group_user_seller_number: "",
				//品牌选项列表
				list_brand: [],
				//拍卖方式选项列表
				list_auction_mode: ['加价竞拍','一口价'],
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
			/**
			 * 获取卖家用户组
			 */
			async get_group_user_seller_number() {
				this.form["seller_number"] = this.user.user_id;
				var json = await this.$get("~/api/user_group/get_obj?name=卖家");
				if(json.result && json.result.obj){
					this.group_user_seller_number = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_seller_number(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_seller_number.source_table+"/get_obj?"
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
                    if (arr[i] !== "seller_number") {
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
			 * 获取品牌列表
			 */
			async get_list_brand() {
				var json = await this.$get("~/api/automobile_brand/get_list?");
				if(json.result && json.result.list){
					this.list_brand = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			/**
			 * 上传照片
			 * @param {Object} param图片参数
			 */
			upload_photo(param){
				this.uploadFile(param.file, "photo");
			},

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
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
				this.form["timing_start_time"] = this.$toTime(parseInt(this.form["timing_start_time"]),"yyyy-MM-dd hh:mm:ss")
				this.form["timing_end_time"] = this.$toTime(parseInt(this.form["timing_end_time"]),"yyyy-MM-dd hh:mm:ss")
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/secondhand_car/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/secondhand_car/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/secondhand_car/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/secondhand_car/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/secondhand_car/view','get');
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
			this.get_group_user_seller_number();
			this.get_list_brand();
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
