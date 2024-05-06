<template>
	<div class="wrap_index">
		<button @click="test">获取test接口数据</button>
		<textarea :maxlength="-1" :auto-height="true" v-model="responseText" />
	</div>
</template>

<script>
	import {
		mapState
	} from "vuex"
	export default {
		data() {
			return {
				responseText: "{}"
			}
		},
		mounted() {

		},
		computed: {
			...mapState({
				mdapi: state => state.zionMdapi.mdapi,
			})
		},
		methods: {
			async test() {
				const response = await this.mdapi.callActionflow({
					actionflow_name: "test"
				})
				this.responseText = JSON.stringify(response, null, "    ")
			}
		}
	}
</script>

<style lang="scss">
</style>