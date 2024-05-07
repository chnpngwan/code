<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','car_type') || $check_field('add','car_type') || $check_field('set','car_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车类型" prop="car_type">
					<el-select id="car_type" v-model="form['car_type']"
						v-if="user_group === '管理员' || (form['lease_statistics_id'] && $check_field('set','car_type')) || (!form['lease_statistics_id'] && $check_field('add','car_type'))">
						<el-option v-for="o in list_car_type" :key="o['car_type']" :label="o['car_type']"
							:value="o['car_type']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','car_type')">{{form['car_type']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','number_of_leases') || $check_field('add','number_of_leases') || $check_field('set','number_of_leases')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="租赁次数" prop="number_of_leases">
					<el-input id="number_of_leases" v-model="form['number_of_leases']" placeholder="请输入租赁次数"
							  v-if="user_group === '管理员' || (form['lease_statistics_id'] && $check_field('set','number_of_leases')) || (!form['lease_statistics_id'] && $check_field('add','number_of_leases'))" :disabled="disabledObj['number_of_leases_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','number_of_leases')">{{form['number_of_leases']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','lease_date') || $check_field('add','lease_date') || $check_field('set','lease_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="租赁日期" prop="lease_date">
					<el-date-picker :disabled="disabledObj['lease_date_isDisabled']" v-if="user_group === '管理员' || (form['lease_statistics_id'] && $check_field('set','lease_date')) || (!form['lease_statistics_id'] && $check_field('add','lease_date'))" id="lease_date"
						v-model="form['lease_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','lease_date')">{{form['lease_date']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','statistician') || $check_field('add','statistician') || $check_field('set','statistician')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="统计人" prop="statistician">
					<el-input id="statistician" v-model="form['statistician']" placeholder="请输入统计人"
							  v-if="user_group === '管理员' || (form['lease_statistics_id'] && $check_field('set','statistician')) || (!form['lease_statistics_id'] && $check_field('add','statistician'))" :disabled="disabledObj['statistician_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','statistician')">{{form['statistician']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','remarks') || $check_field('add','remarks') || $check_field('set','remarks')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="备注" prop="remarks">
					<el-input id="remarks" v-model="form['remarks']" placeholder="请输入备注"
							  v-if="user_group === '管理员' || (form['lease_statistics_id'] && $check_field('set','remarks')) || (!form['lease_statistics_id'] && $check_field('add','remarks'))" :disabled="disabledObj['remarks_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','remarks')">{{form['remarks']}}</div>
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
				field: "lease_statistics_id",
				url_add: "~/api/lease_statistics/add?",
				url_set: "~/api/lease_statistics/set?",
				url_get_obj: "~/api/lease_statistics/get_obj?",
				url_upload: "~/api/lease_statistics/upload?",

				query: {
					"lease_statistics_id": 0,
				},

				form: {
					"car_type":'', // 汽车类型
					"number_of_leases":'', // 租赁次数
					"lease_date":'', // 租赁日期
					"statistician":'', // 统计人
					"remarks":'', // 备注
					"lease_statistics_id": 0, // ID

				},
				disabledObj:{
					"car_type_isDisabled": false,
					"number_of_leases_isDisabled": false,
					"lease_date_isDisabled": false,
					"statistician_isDisabled": false,
					"remarks_isDisabled": false,
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
        if (this.form["lease_date"].indexOf("-")===-1){
          this.form["lease_date"] = this.$toTime(parseInt(this.form["lease_date"]),"yyyy-MM-dd")
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
        if(this.form["lease_date"]=="0000-00-00"){
          this.form["lease_date"] = null;
        }
				if(parseInt(this.form["lease_date"]) > 9999){
					this.form["lease_date"] = this.$toTime(parseInt(this.form["lease_date"]),"yyyy-MM-dd")
				}
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/lease_statistics/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/lease_statistics/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/lease_statistics/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/lease_statistics/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/lease_statistics/view','get');
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
