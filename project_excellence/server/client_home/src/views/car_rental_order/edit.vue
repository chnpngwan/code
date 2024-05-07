<template>
	<div class="diy_edit page_car_rental_order" id="car_rental_order_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
					<div v-if="$check_field('set','user_name') || $check_field('add','user_name') || $check_field('get','user_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>用户名:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_user_name" :disabled="disabledObj['user_name_isDisabled']" v-model="form['user_name']" v-if="(form['user_name'] && $check_field('set','user_name')) || (!form['user_name'] && $check_field('add','user_name'))" >
								<option v-for="o in list_user_user_name" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','user_name')">{{ form['user_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','full_name') || $check_field('add','full_name') || $check_field('get','full_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>姓名:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_full_name" v-model="form['full_name']" placeholder="请输入姓名" v-if="(form['full_name'] && $check_field('set','full_name')) || (!form['full_name'] && $check_field('add','full_name'))"  :disabled="disabledObj['full_name_isDisabled']"/>
							<span v-else-if="$check_field('get','full_name')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','contact_information') || $check_field('add','contact_information') || $check_field('get','contact_information')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>联系方式:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_contact_information" v-model="form['contact_information']" placeholder="请输入联系方式" v-if="(form['contact_information'] && $check_field('set','contact_information')) || (!form['contact_information'] && $check_field('add','contact_information'))"  :disabled="disabledObj['contact_information_isDisabled']"/>
							<span v-else-if="$check_field('get','contact_information')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','car_number') || $check_field('add','car_number') || $check_field('get','car_number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>汽车编号:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_car_number" v-model="form['car_number']" placeholder="请输入汽车编号" v-if="(form['car_number'] && $check_field('set','car_number')) || (!form['car_number'] && $check_field('add','car_number'))"  :disabled="disabledObj['car_number_isDisabled']"/>
							<span v-else-if="$check_field('get','car_number')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','automobile_brand') || $check_field('add','automobile_brand') || $check_field('get','automobile_brand')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>汽车品牌:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_automobile_brand" v-model="form['automobile_brand']" placeholder="请输入汽车品牌" v-if="(form['automobile_brand'] && $check_field('set','automobile_brand')) || (!form['automobile_brand'] && $check_field('add','automobile_brand'))"  :disabled="disabledObj['automobile_brand_isDisabled']"/>
							<span v-else-if="$check_field('get','automobile_brand')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','car_model') || $check_field('add','car_model') || $check_field('get','car_model')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>汽车型号:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_car_model" v-model="form['car_model']" placeholder="请输入汽车型号" v-if="(form['car_model'] && $check_field('set','car_model')) || (!form['car_model'] && $check_field('add','car_model'))"  :disabled="disabledObj['car_model_isDisabled']"/>
							<span v-else-if="$check_field('get','car_model')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','car_type') || $check_field('add','car_type') || $check_field('get','car_type')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>汽车类型:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_car_type" v-model="form['car_type']" placeholder="请输入汽车类型" v-if="(form['car_type'] && $check_field('set','car_type')) || (!form['car_type'] && $check_field('add','car_type'))"  :disabled="disabledObj['car_type_isDisabled']"/>
							<span v-else-if="$check_field('get','car_type')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','rental_price') || $check_field('add','rental_price') || $check_field('get','rental_price')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>租赁价格:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_rental_price" v-model="form['rental_price']" placeholder="请输入租赁价格" v-if="(form['rental_price'] && $check_field('set','rental_price')) || (!form['rental_price'] && $check_field('add','rental_price'))"  :disabled="disabledObj['rental_price_isDisabled']"/>
							<span v-else-if="$check_field('get','rental_price')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','lease_duration') || $check_field('add','lease_duration') || $check_field('get','lease_duration')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>租赁时长:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_lease_duration" v-model="form['lease_duration']" placeholder="请输入租赁时长" v-if="(form['lease_duration'] && $check_field('set','lease_duration')) || (!form['lease_duration'] && $check_field('add','lease_duration'))"  :disabled="disabledObj['lease_duration_isDisabled']"/>
							<span v-else-if="$check_field('get','lease_duration')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="user_group === '管理员' || $check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核状态:
							</span>
						</div>
						<div class="diy_field diy_select" v-if="$check_action('/car_rental_order/edit','examine')">
							<!--<span> {{ form['examine_state'] }} </span>-->
							<select v-model="form['examine_state']">
								<option value="未审核">
									未审核
								</option>
								<option value="已通过">
									已通过
								</option>
								<option value="未通过">
									未通过
								</option>
							</select>
						</div>
						<div class="diy_field diy_text" v-else>
							<span>
								{{ form['examine_state'] }}
							</span>
						</div>
					</div>
					<div v-if="user_group === '管理员' || $check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核回复:
							</span>
						</div>
						<div class="diy_field diy_desc" v-if="$check_action('/car_rental_order/edit','examine')">
							<textarea v-model="form['examine_reply']"></textarea>
						</div>
						<div class="diy_field diy_text" v-else>
							<span>
								{{ form['examine_reply'] }}
							</span>
						</div>
					</div>
				</div>
				<div class="diy_edit_submit_box row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/car_rental_order/get_obj?",
				url_add: "~/api/car_rental_order/add?",
				url_set: "~/api/car_rental_order/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
					"user_name": 0,
					"full_name": "",
					"contact_information": "",
					"car_number": "",
					"automobile_brand": "",
					"car_model": "",
					"car_type": "",
					"rental_price": "",
					"lease_duration": "",
					"car_rental_order_id": 0,
				},

				obj: {
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
					"car_rental_order_id": 0,
				},

				// 表单字段
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
					"car_rental_order_id": 0,
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

				// ID字段
				field: "car_rental_order_id",
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
			async get_user_session_user_name(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=会员用户");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["user_name"] = user_id
								_this.disabledObj['user_name' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "user_name") {
                          _this.form[arrForm[j]] = res.result.obj[arr[i]]
                          _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                          break;
                        }
                      }
                    }
                  }
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},

			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/car_rental_order/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
        //   this.obj = $.push(this.obj ,form);
				// 	this.form = $.push(this.form ,form);
				// }
				// var arr = []
				// for (let key in form) {
				// 	arr.push(key)
				// }
				// for (var i=0;i<arr.length;i++){
				// 	this.disabledObj[arr[i] + '_isDisabled'] = true
				// }
        if (form) {
          var arr = []
          for (let key in form) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arrForm[j] === arr[i]) {
                  this.form[arrForm[j]] = form[arr[i]]
                  this.obj[arrForm[j]] = form[arr[i]]
                  this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  break;
                }
              }
            }
          }
        }

        $.db.del("form");
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				// var form = $.db.get("form");
				// var obj = Object.assign({} ,form ,this.obj);
				// if (obj) {
        //   delete(obj.examine_state)
        //   delete(obj.examine_reply)
				// 	this.obj = $.push(this.obj ,obj);
				// }
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
				// 	this.form = $.push(this.form ,form);
				// }
				if(func){
					func(json);
				}
			},

		},
		created() {
			this.get_user_session_user_name();
			this.get_list_user_user_name();
		},
	}
</script>

<style>
</style>
