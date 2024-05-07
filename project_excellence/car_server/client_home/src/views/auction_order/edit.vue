<template>
	<div class="diy_edit page_auction_order" id="auction_order_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
					<div v-if="$check_field('set','auction_number') || $check_field('add','auction_number') || $check_field('get','auction_number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>拍卖单号:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_auction_number" v-model="form['auction_number']" placeholder="请输入拍卖单号" v-if="(form['auction_number'] && $check_field('set','auction_number')) || (!form['auction_number'] && $check_field('add','auction_number'))"  :disabled="disabledObj['auction_number_isDisabled']"/>
							<span v-else-if="$check_field('get','auction_number')">{{ form['seller_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','seller_number') || $check_field('add','seller_number') || $check_field('get','seller_number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>卖家编号:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_seller_number" :disabled="disabledObj['seller_number_isDisabled']" v-model="form['seller_number']" v-if="(form['seller_number'] && $check_field('set','seller_number')) || (!form['seller_number'] && $check_field('add','seller_number'))" >
								<option v-for="o in list_user_seller_number" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','seller_number')">{{ form['seller_number'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','seller_name') || $check_field('add','seller_name') || $check_field('get','seller_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>卖家姓名:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_seller_name" v-model="form['seller_name']" placeholder="请输入卖家姓名" v-if="(form['seller_name'] && $check_field('set','seller_name')) || (!form['seller_name'] && $check_field('add','seller_name'))"  :disabled="disabledObj['seller_name_isDisabled']"/>
							<span v-else-if="$check_field('get','seller_name')">{{ form['seller_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','title') || $check_field('add','title') || $check_field('get','title')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>标题:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_title" v-model="form['title']" placeholder="请输入标题" v-if="(form['title'] && $check_field('set','title')) || (!form['title'] && $check_field('add','title'))"  :disabled="disabledObj['title_isDisabled']"/>
							<span v-else-if="$check_field('get','title')">{{ form['seller_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','current_price') || $check_field('add','current_price') || $check_field('get','current_price')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>当前价:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_current_price" v-model="form['current_price']" placeholder="请输入当前价" v-if="(form['current_price'] && $check_field('set','current_price')) || (!form['current_price'] && $check_field('add','current_price'))"  :disabled="disabledObj['current_price_isDisabled']"/>
							<span v-else-if="$check_field('get','current_price')">{{ form['seller_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','mark_up_amount') || $check_field('add','mark_up_amount') || $check_field('get','mark_up_amount')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>加价金额:
							</span>
						</div>
						<!-- 数字 -->
						<div class="diy_field diy_number">
							<input type="number" id="form_mark_up_amount" v-model.number="form['mark_up_amount']" placeholder="请输入加价金额" v-if="(form['mark_up_amount'] && $check_field('set','mark_up_amount')) || (!form['mark_up_amount'] && $check_field('add','mark_up_amount'))" :disabled="disabledObj['mark_up_amount_isDisabled']" />
							<span v-else-if="$check_field('get','mark_up_amount')">{{ form['seller_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','buyer_number') || $check_field('add','buyer_number') || $check_field('get','buyer_number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>买家编号:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_buyer_number" :disabled="disabledObj['buyer_number_isDisabled']" v-model="form['buyer_number']" v-if="(form['buyer_number'] && $check_field('set','buyer_number')) || (!form['buyer_number'] && $check_field('add','buyer_number'))" >
								<option v-for="o in list_user_buyer_number" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','buyer_number')">{{ form['buyer_number'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','buyer_name') || $check_field('add','buyer_name') || $check_field('get','buyer_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>买家姓名:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_buyer_name" v-model="form['buyer_name']" placeholder="请输入买家姓名" v-if="(form['buyer_name'] && $check_field('set','buyer_name')) || (!form['buyer_name'] && $check_field('add','buyer_name'))"  :disabled="disabledObj['buyer_name_isDisabled']"/>
							<span v-else-if="$check_field('get','buyer_name')">{{ form['seller_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','contact_number') || $check_field('add','contact_number') || $check_field('get','contact_number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>联系电话:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_contact_number" v-model="form['contact_number']" placeholder="请输入联系电话" v-if="(form['contact_number'] && $check_field('set','contact_number')) || (!form['contact_number'] && $check_field('add','contact_number'))"  :disabled="disabledObj['contact_number_isDisabled']"/>
							<span v-else-if="$check_field('get','contact_number')">{{ form['seller_name'] }}</span>
						</div>
					</div>
					<div v-if="user_group === '管理员' || $check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核状态:
							</span>
						</div>
						<div class="diy_field diy_select" v-if="$check_action('/auction_order/edit','examine')">
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
						<div class="diy_field diy_desc" v-if="$check_action('/auction_order/edit','examine')">
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
				url_get_obj: "~/api/auction_order/get_obj?",
				url_add: "~/api/auction_order/add?",
				url_set: "~/api/auction_order/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
					"auction_number": "",
					"seller_number": 0,
					"seller_name": "",
					"title": "",
					"current_price": "",
					"mark_up_amount": 0,
					"buyer_number": 0,
					"buyer_name": "",
					"contact_number": "",
					"auction_order_id": 0,
				},

				obj: {
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
					"auction_order_id": 0,
				},

				// 表单字段
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
					"auction_order_id": 0,
				},
				disabledObj:{
					"auction_number_isDisabled": false,
					"seller_number_isDisabled": false,
					"seller_name_isDisabled": false,
					"title_isDisabled": false,
					"current_price_isDisabled": false,
					"buyer_number_isDisabled": false,
					"buyer_name_isDisabled": false,
					"contact_number_isDisabled": false,
				},
				// 用户列表
				list_user_seller_number: [],
				// 用户列表
				list_user_buyer_number: [],

				// ID字段
				field: "auction_order_id",
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
			async get_user_session_buyer_number(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=买家");
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
								_this.form["buyer_number"] = user_id
								_this.disabledObj['buyer_number' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "buyer_number") {
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
				this.$post("~/api/auction_order/upload?", form, (res) => {
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
			this.get_list_user_seller_number();
			this.get_user_session_buyer_number();
			this.get_list_user_buyer_number();
		},
	}
</script>

<style>
</style>
