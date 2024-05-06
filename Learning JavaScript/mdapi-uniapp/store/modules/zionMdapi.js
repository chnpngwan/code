import zionMdapi from "zion-mdapi"
import mdapiConfig from "@/mdapi.config.json"

// 初始化一个默认的mdapi
const mdapi = zionMdapi.init(mdapiConfig)
export default {
	state: {
		mdapi,
		mdapiConfig: mdapiConfig || {}
	},
	getters: {},
	mutations: {
		// 重新设置配置文件
		reloadConfig: (state, mdapiConfig = {}) => {
			state.mdapiConfig = mdapiConfig;
			state.mdapi = zionMdapi.init(state.mdapiConfig)
		},
		
		// 设置客户端数据
		setClientData: (state, clientData = {}) => {
			state.mdapiConfig.client_data = clientData || {};
			state.mdapi = zionMdapi.init(state.mdapiConfig)
		}
	},
	actions: {}
}