<template>
	<div class="login-container">
		<!-- <el-alert
        v-if="nodeEnv !== 'development'"
        title="beautiful boys and girls欢迎加入vue-admin-beautifulQQ群：972435319"
        type="success"
        :closable="false"
      ></el-alert>-->
		<el-row>
			<el-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
				<el-form ref="loginForm" :model="loginForm" :rules="loginRules" auto-complete="off" class="login-form"
					label-position="left">
					<div class="title"></div>
					<div class="title-tips" style="color:#fff;text-align: center;">{{ title }}</div>
					<el-form-item style="margin-top: 40px;" prop="userName">
						<span class="svg-container svg-container-admin">
							<vab-icon :icon="['fas', 'user']" />
						</span>
						<el-input v-model.trim="loginForm.userName" v-focus auto-complete="off" placeholder="请输入用户名"
							tabindex="1" type="text" />
					</el-form-item>
					<el-form-item prop="password">
						<span class="svg-container svg-container-pass">
							<vab-icon :icon="['fas', 'lock']" />
						</span>
						<el-input :key="passwordType" ref="password" v-model.trim="loginForm.password"
							:type="passwordType" auto-complete="off" placeholder="请输入密码" tabindex="1" />
						<span v-if="passwordType === 'password'" class="show-pwd" @click="showPwd">
							<vab-icon :icon="['fas', 'eye-slash']" />
						</span>
						<span v-else class="show-pwd" @click="showPwd">
							<vab-icon :icon="['fas', 'eye']" />
						</span>
					</el-form-item>
					<el-form-item>
						<span class="svg-container svg-container-admin">
							<vab-icon :icon="['fas', 'qrcode']" />
						</span>
						<el-input ref="username" v-model.trim="loginForm.code" placeholder="请输入验证码" name="code"
							type="text" tabindex="2" auto-complete="on" @keyup.enter.native="handleLogin" />
						<!-- <img :src="img" alt="" @click="getCode()" /> -->
						<span class="show-pwd">
							<img :src="img" alt @click="getCode()" />
							<!-- <vab-icon :icon="['fas', 'eye']" /> -->
							<!-- 123 -->
						</span>
					</el-form-item>
					<el-button :loading="loading" class="login-btn" type="primary" @click="handleLogin">登录</el-button>
					<!-- <router-link to="/register">
              <div style="margin-top: 20px;">注册</div>
            </router-link>-->
				</el-form>
			</el-col>
		</el-row>
		<!-- <div style="position: absolute;
      left: 0;
      bottom: 10px;
      width: 100%;
      text-align: center;font-size:16px;color:#fff">
        中国国际海运集装箱(集团)股份有限公司 版权所有 粤ICP备05147540号 停车充电管理平台V2.0
      </div> -->
	</div>
</template>

<script>
	import {
		isPassword
	} from "@/utils/validate";
	import md5 from 'js-md5';
	import {
		userCode,
		login,
		getInfo
	} from "../../api/user";
	import qs from "qs";
	import {
		Loading,
		Message
	} from "element-ui";
	export default {
		name: "Login",
		directives: {
			focus: {
				inserted(el) {
					el.querySelector("input").focus();
				},
			},
		},
		data() {
			const validateUserName = (rule, value, callback) => {
				if ("" == value) {
					callback(new Error("用户名不能为空"));
				} else {
					callback();
				}
			};
			const validatePassword = (rule, value, callback) => {
				if (!isPassword(value)) {
					callback(new Error("密码不能少于6位"));
				} else {
					callback();
				}
			};
			return {
				nodeEnv: process.env.NODE_ENV,
				title: "誉能充新能源充电管理平台",
				img: "",
				codeId: "",
				loginForm: {
					userName: "",
					password: "",
					code: "",
				},
				loginRules: {
					userName: [{
						required: true,
						trigger: "blur",
						validator: validateUserName,
					}, ],
					password: [{
						required: true,
						trigger: "blur",
						validator: validatePassword,
					}, ],
				},
				loading: false,
				passwordType: "password",
				redirect: undefined,
			};
		},
		watch: {
			$route: {
				handler(route) {
					this.redirect = (route.query && route.query.redirect) || "/";
				},
				immediate: true,
			},
		},
		created() {
			this.getCode();
		},
		mounted() {
			//项目上线时记得去掉
			// this.loginForm.userName = "admin";
			// this.loginForm.password = "111111";
		},
		methods: {
			getCode() {
				userCode().then((res) => {
					// console.log(res);
					// this.img = "/captcha/" + res.data + ".png";
					this.img = "/api/captcha/" + res.data + ".png";
					this.codeId = res.data;
				});
			},
			showPwd() {
				this.passwordType === "password" ?
					(this.passwordType = "") :
					(this.passwordType = "password");
				this.$nextTick(() => {
					this.$refs.password.focus();
				});
			},
			handleLogin() {
				this.$refs.loginForm.validate(async (valid) => {
					if (valid) {
						let data = {
							UserPwd: md5(this.loginForm.password),
							UserName: this.loginForm.userName,
							captcha: this.loginForm.code,
							captchaId: this.codeId,
						};
						// login(data).then((res) => {
						//   console.log(res);
						//   if (res.code == 0) {
						//     Message({
						//       message: res.msg,
						//       type: "success",
						//     });
						//   } else {
						//     Message({
						//       message: res.msg,
						//       type: "error",
						//     });
						//     this.getCode();
						//   }
						// });

						// console.log(this.loginForm);

						// this.loading = true;
						this.getCode();
						await this.$store.dispatch("user/login", data);
						const routerPath =
							this.redirect === "/404" || this.redirect === "/401" ?
							"/" :
							this.redirect;
						await this.$router.push(routerPath).catch(() => {});

						// this.loading = false;
					} else {
						return false;
					}
				});
			},
		},
	};
</script>

<style lang="scss" scoped>
	.login-container {
		height: 100vh;
		min-height: 600px;
		background: url("~@/assets/login_images/login.jpg") center center fixed no-repeat;
		background-size: cover;

		.title {
			height: 50px;
			font-size: 54px;
			height: 72px;
			width: 72px;
			background: url("~@/assets/login_images/icon.png");
			border-radius: 36px;
			font-weight: 500;
			color: rgba(14, 18, 26, 1);
			margin: auto;
		}

		.title-tips {
			height: 24px;
			margin-top: 29px;
			font-size: 24px;
			font-weight: 400;
			color: rgba(14, 18, 26, 1);
		}

		.login-btn {
			display: flex;
			width: 100%;
			text-align: center;
			align-items: center;
			justify-content: center;
			font-size: 24px;
			border-radius: 24px;
			background: var(--b, #0E9CFF);
			height: 50px;

			&:hover {
				opacity: 0.9;
			}
		}

		.login-form {
			transform: translateY(50%);
			width: 440px;
			height: 480px;
			border-radius: 16px;
			border: 1px;
			background: linear-gradient(0deg, rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
				linear-gradient(136.13deg, #087C84 2.18%, rgba(32, 129, 197, 0.16) 45.93%, rgba(40, 211, 222, 0.54) 92.52%);
			border-image-source: linear-gradient(136.13deg, #087C84 2.18%, rgba(32, 129, 197, 0.16) 45.93%, rgba(40, 211, 222, 0.54) 92.52%);
			position: absolute;
			left: 1200px;
			max-width: 100%;
			overflow: hidden;
			padding: 10px 20px 60px 20px;

			.forget-password {
				width: 100%;
				margin-top: 40px;
				text-align: left;

				.forget-pass {
					width: 129px;
					height: 19px;
					font-size: 20px;
					font-weight: 400;
					color: rgba(92, 102, 240, 1);
				}
			}
		}

		.tips {
			margin-bottom: 10px;
			font-size: $base-font-size-default;
			color: $base-color-white;

			span {
				&:first-of-type {
					margin-right: 16px;
				}
			}
		}

		.title-container {
			position: relative;

			.title {
				margin: 0 auto 40px auto;
				font-size: 34px;
				font-weight: bold;
				color: $base-color-blue;
				text-align: center;

			}
		}

		.svg-container {
			position: absolute;
			top: 14px;
			left: 15px;
			z-index: $base-z-index;
			font-size: 16px;
			color: #d7dee3;
			cursor: pointer;
			user-select: none;
		}

		.show-pwd {
			position: absolute;
			top: 14px;
			right: 25px;
			font-size: 16px;
			color: $base-font-color;
			cursor: pointer;
			user-select: none;
		}

		::v-deep {
			.el-form-item {
				padding-right: 0;
				margin: 20px 0;
				color: #454545;
				background: transparent;
				border: 1px solid transparent;
				border-radius: 2px;

				&__content {
					min-height: $base-input-height;
					line-height: $base-input-height;
				}

				&__error {
					position: absolute;
					top: 100%;
					left: 18px;
					font-size: $base-font-size-small;
					line-height: 18px;
					color: $base-color-red;
				}
			}

			.el-input {
				box-sizing: border-box;

				input {
					height: 58px;
					padding-left: 45px;
					font-size: $base-font-size-default;
					line-height: 58px;
					color: $base-font-color;
					background: #f6f4fc;
					border: 0;
					caret-color: $base-font-color;
				}
			}
		}
	}
</style>