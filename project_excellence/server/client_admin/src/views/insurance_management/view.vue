<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','car_number') || $check_field('add','car_number') || $check_field('set','car_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车编号" prop="car_number">
					<el-input id="car_number" v-model="form['car_number']" placeholder="请输入汽车编号"
							  v-if="user_group === '管理员' || (form['insurance_management_id'] && $check_field('set','car_number')) || (!form['insurance_management_id'] && $check_field('add','car_number'))" :disabled="disabledObj['car_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_number')">{{form['car_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','automobile_brand') || $check_field('add','automobile_brand') || $check_field('set','automobile_brand')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车品牌" prop="automobile_brand">
					<el-input id="automobile_brand" v-model="form['automobile_brand']" placeholder="请输入汽车品牌"
							  v-if="user_group === '管理员' || (form['insurance_management_id'] && $check_field('set','automobile_brand')) || (!form['insurance_management_id'] && $check_field('add','automobile_brand'))" :disabled="disabledObj['automobile_brand_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','automobile_brand')">{{form['automobile_brand']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','car_model') || $check_field('add','car_model') || $check_field('set','car_model')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车型号" prop="car_model">
					<el-input id="car_model" v-model="form['car_model']" placeholder="请输入汽车型号"
							  v-if="user_group === '管理员' || (form['insurance_management_id'] && $check_field('set','car_model')) || (!form['insurance_management_id'] && $check_field('add','car_model'))" :disabled="disabledObj['car_model_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_model')">{{form['car_model']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','car_type') || $check_field('add','car_type') || $check_field('set','car_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车类型" prop="car_type">
					<el-select id="car_type" v-model="form['car_type']"
						v-if="user_group === '管理员' || (form['insurance_management_id'] && $check_field('set','car_type')) || (!form['insurance_management_id'] && $check_field('add','car_type'))">
						<el-option v-for="o in list_car_type" :key="o['car_type']" :label="o['car_type']"
							:value="o['car_type']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','car_type')">{{form['car_type']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','car_year') || $check_field('add','car_year') || $check_field('set','car_year')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车年份" prop="car_year">
					<el-input id="car_year" v-model="form['car_year']" placeholder="请输入汽车年份"
							  v-if="user_group === '管理员' || (form['insurance_management_id'] && $check_field('set','car_year')) || (!form['insurance_management_id'] && $check_field('add','car_year'))" :disabled="disabledObj['car_year_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_year')">{{form['car_year']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','insurance_type') || $check_field('add','insurance_type') || $check_field('set','insurance_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="保险类型" prop="insurance_type">
					<el-input id="insurance_type" v-model="form['insurance_type']" placeholder="请输入保险类型"
							  v-if="user_group === '管理员' || (form['insurance_management_id'] && $check_field('set','insurance_type')) || (!form['insurance_management_id'] && $check_field('add','insurance_type'))" :disabled="disabledObj['insurance_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','insurance_type')">{{form['insurance_type']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','insurance_company') || $check_field('add','insurance_company') || $check_field('set','insurance_company')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="保险公司" prop="insurance_company">
					<el-input id="insurance_company" v-model="form['insurance_company']" placeholder="请输入保险公司"
							  v-if="user_group === '管理员' || (form['insurance_management_id'] && $check_field('set','insurance_company')) || (!form['insurance_management_id'] && $check_field('add','insurance_company'))" :disabled="disabledObj['insurance_company_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','insurance_company')">{{form['insurance_company']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','date_of_purchase') || $check_field('add','date_of_purchase') || $check_field('set','date_of_purchase')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="购买保险日期" prop="date_of_purchase">
					<el-date-picker :disabled="disabledObj['date_of_purchase_isDisabled']" v-if="user_group === '管理员' || (form['insurance_management_id'] && $check_field('set','date_of_purchase')) || (!form['insurance_management_id'] && $check_field('add','date_of_purchase'))" id="date_of_purchase"
						v-model="form['date_of_purchase']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','date_of_purchase')">{{form['date_of_purchase']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','insurance_expiration_date') || $check_field('add','insurance_expiration_date') || $check_field('set','insurance_expiration_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="保险到期日期" prop="insurance_expiration_date">
					<el-date-picker :disabled="disabledObj['insurance_expiration_date_isDisabled']" v-if="user_group === '管理员' || (form['insurance_management_id'] && $check_field('set','insurance_expiration_date')) || (!form['insurance_management_id'] && $check_field('add','insurance_expiration_date'))" id="insurance_expiration_date"
						v-model="form['insurance_expiration_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','insurance_expiration_date')">{{form['insurance_expiration_date']}}</div>
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
				field: "insurance_management_id",
				url_add: "~/api/insurance_management/add?",
				url_set: "~/api/insurance_management/set?",
				url_get_obj: "~/api/insurance_management/get_obj?",
				url_upload: "~/api/insurance_management/upload?",

				query: {
					"insurance_management_id": 0,
				},

				form: {
					"car_number":'', // 汽车编号
					"automobile_brand":'', // 汽车品牌
					"car_model":'', // 汽车型号
					"car_type":'', // 汽车类型
					"car_year":'', // 汽车年份
					"insurance_type":'', // 保险类型
					"insurance_company":'', // 保险公司
					"date_of_purchase":'', // 购买保险日期
					"insurance_expiration_date":'', // 保险到期日期
					"insurance_management_id": 0, // ID

				},
				disabledObj:{
					"car_number_isDisabled": false,
					"automobile_brand_isDisabled": false,
					"car_model_isDisabled": false,
					"car_type_isDisabled": false,
					"car_year_isDisabled": false,
					"insurance_type_isDisabled": false,
					"insurance_company_isDisabled": false,
					"date_of_purchase_isDisabled": false,
					"insurance_expiration_date_isDisabled": false,
				},
				//汽车类型选项列表
				list_car_type: [],
			}
		},
		methods: {
			/**
			 * 获取汽车类型列表
			 */
			async get_list_car_type() {
				var json = await this.$get("~/api/vehicle_classification/get_list?");
				if(json.result && json.result.list){
					this.list_car_type = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
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
        if (this.form["date_of_purchase"].indexOf("-")===-1){
          this.form["date_of_purchase"] = this.$toTime(parseInt(this.form["date_of_purchase"]),"yyyy-MM-dd")
        }
        if (this.form["insurance_expiration_date"].indexOf("-")===-1){
          this.form["insurance_expiration_date"] = this.$toTime(parseInt(this.form["insurance_expiration_date"]),"yyyy-MM-dd")
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
        if(this.form["date_of_purchase"]=="0000-00-00"){
          this.form["date_of_purchase"] = null;
        }
				if(parseInt(this.form["date_of_purchase"]) > 9999){
					this.form["date_of_purchase"] = this.$toTime(parseInt(this.form["date_of_purchase"]),"yyyy-MM-dd")
				}
        if(this.form["insurance_expiration_date"]=="0000-00-00"){
          this.form["insurance_expiration_date"] = null;
        }
				if(parseInt(this.form["insurance_expiration_date"]) > 9999){
					this.form["insurance_expiration_date"] = this.$toTime(parseInt(this.form["insurance_expiration_date"]),"yyyy-MM-dd")
				}
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/insurance_management/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/insurance_management/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/insurance_management/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/insurance_management/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/insurance_management/view','get');
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
			this.get_list_car_type();
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
