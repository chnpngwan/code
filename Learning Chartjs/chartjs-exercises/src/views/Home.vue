<template>
	<div id="line" style="width: 800px;height: 600px;"></div>
</template>
<script>
	import * as  echarts from 'echarts'
	import axios from 'axios'
	import {onMounted} from '@vue/runtime-core'
	export default({
		setup(){
			onMounted(()=>{
				//发出网路请求
				axios.get('/api/getWeekInfo').then((res)=>{
					let obj = eval(res.data)
					let infos = obj.infos
					let curr_title = obj.title
					let week = []
					let data = []
					for(var i=0;i<infos.length;i++){
						week.push(infos[i].week)
						data.push(infos[i].data)
					}
					let obje = document.getElementById('line')
					let mychart = echarts.init(obje)
					const option= {
						title:{
							text:curr_title,
							x:'center',
							textStyle:{
								color:'red',
								fontSize:30
							}
						},
						legenh:{
							x:'left',
							y:'top'
						},
						tooltip:{
							formatter:'{b}--{a}'
						},
						toolbox:{
							feature:{
								saveAsImage:{}
							}
						},
						xAxis:{
							type:'category',
							data:week,
							
							axisLabel:{
								textStyle:{
									color:'red',
									fontSize:16
								}
							}
						},
						yAxis:{
							type:'value'
						},
						series:[{
							name:'test1',
							type:'line',
							data:data,
							itemStyle:{
								normal:{
									colcor:'red',
									lineStyle:{
										color:'blue'
									},
									label:{
										show:true
									}
								}
							}
						}]
					}
					mychart.setOption(option)
				})
			})
		}
	})
</script>