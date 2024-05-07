<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','car_number') || $check_field('add','car_number') || $check_field('set','car_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车编号" prop="car_number">
					<el-input id="car_number" v-model="form['car_number']" placeholder="请输入汽车编号"
							  v-if="user_group === '管理员' || (form['car_information_id'] && $check_field('set','car_number')) || (!form['car_information_id'] && $check_field('add','car_number'))" :disabled="disabledObj['car_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_number')">{{form['car_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','automobile_brand') || $check_field('add','automobile_brand') || $check_field('set','automobile_brand')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车品牌" prop="automobile_brand">
					<el-input id="automobile_brand" v-model="form['automobile_brand']" placeholder="请输入汽车品牌"
							  v-if="user_group === '管理员' || (form['car_information_id'] && $check_field('set','automobile_brand')) || (!form['car_information_id'] && $check_field('add','automobile_brand'))" :disabled="disabledObj['automobile_brand_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','automobile_brand')">{{form['automobile_brand']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','car_model') || $check_field('add','car_model') || $check_field('set','car_model')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车型号" prop="car_model">
					<el-input id="car_model" v-model="form['car_model']" placeholder="请输入汽车型号"
							  v-if="user_group === '管理员' || (form['car_information_id'] && $check_field('set','car_model')) || (!form['car_information_id'] && $check_field('add','car_model'))" :disabled="disabledObj['car_model_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_model')">{{form['car_model']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','car_type') || $check_field('add','car_type') || $check_field('set','car_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车类型" prop="car_type">
					<el-select id="car_type" v-model="form['car_type']"
						v-if="user_group === '管理员' || (form['car_information_id'] && $check_field('set','car_type')) || (!form['car_information_id'] && $check_field('add','car_type'))">
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
							  v-if="user_group === '管理员' || (form['car_information_id'] && $check_field('set','car_year')) || (!form['car_information_id'] && $check_field('add','car_year'))" :disabled="disabledObj['car_year_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_year')">{{form['car_year']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','car_pictures') || $check_field('add','car_pictures') || $check_field('set','car_pictures')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车图片" prop="car_pictures">
					<el-upload :disabled="disabledObj['car_pictures_isDisabled']" id="car_pictures" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_car_pictures"
						:show-file-list="false" v-if="user_group === '管理员' || (form['car_information_id'] && $check_field('set','car_pictures')) || (!form['car_information_id'] && $check_field('add','car_pictures'))">
						<img v-if="form['car_pictures']" :src="$fullUrl(form['car_pictures'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','car_pictures')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['car_pictures'])" :preview-src-list="[$fullUrl(form['car_pictures'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','rental_price') || $check_field('add','rental_price') || $check_field('set','rental_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="租赁价格" prop="rental_price">
					<el-input id="rental_price" v-model="form['rental_price']" placeholder="请输入租赁价格"
							  v-if="user_group === '管理员' || (form['car_information_id'] && $check_field('set','rental_price')) || (!form['car_information_id'] && $check_field('add','rental_price'))" :disabled="disabledObj['rental_price_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','rental_price')">{{form['rental_price']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','car_introduction') || $check_field('add','car_introduction') || $check_field('set','car_introduction')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="汽车介绍" prop="car_introduction">
					<el-input type="textarea" id="car_introduction" v-model="form['car_introduction']" placeholder="请输入汽车介绍"
						v-if="user_group === '管理员' || (form['car_information_id'] && $check_field('set','car_introduction')) || (!form['car_information_id'] && $check_field('add','car_introduction'))" :disabled="disabledObj['car_introduction_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','car_introduction')">{{form['car_introduction']}}</div>
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
				field: "car_information_id",
				url_add: "~/api/car_information/add?",
				url_set: "~/api/car_information/set?",
				url_get_obj: "~/api/car_information/get_obj?",
				url_upload: "~/api/car_information/upload?",

				query: {
					"car_information_id": 0,
				},

				form: {
					"car_number":'', // 汽车编号
					"automobile_brand":'', // 汽车品牌
					"car_model":'', // 汽车型号
					"car_type":'', // 汽车类型
					"car_year":'', // 汽车年份
					"car_pictures":'', // 汽车图片
					"rental_price":'', // 租赁价格
					"car_introduction":'', // 汽车介绍
					"car_information_id": 0, // ID

				},
				disabledObj:{
					"car_number_isDisabled": false,
					"automobile_brand_isDisabled": false,
					"car_model_isDisabled": false,
					"car_type_isDisabled": false,
					"car_year_isDisabled": false,
					"car_pictures_isDisabled": false,
					"rental_price_isDisabled": false,
					"car_introduction_isDisabled": false,
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
			 * 上传汽车图片
			 * @param {Object} param图片参数
			 */
			upload_car_pictures(param){
				this.uploadFile(param.file, "car_pictures");
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
					bl = this.$check_action('/car_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/car_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/car_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/car_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/car_information/view','get');
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
