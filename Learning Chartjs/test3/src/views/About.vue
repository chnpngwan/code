<template>
  <div id="chart1" style="width:800px;height:600px;"></div>
</template>

<script>
import { onMounted } from '@vue/runtime-core'
import axios from 'axios'
import * as echarts from 'echarts'

export default({
  setup() {
    onMounted(()=>{
      //发出请求获取数据
      axios.get('/api/getSex').then((res)=>{
        let obj = eval(res.data)
        let woman = obj.datas[0].data
        let man = obj.datas[1].data

        let dom = document.getElementById('chart1')
        let chart1 = echarts.init(dom)
        const option = {
          title:{
            text:'男女身高体重散点图',
            subtext:'身高体重'
          },
          xAxis:{scale:true },
          yAxis:{scale:true },
          series:[
            {
              type:'scatter',
              symbolSize:10,
              color:'red',
              data:woman
            },
            {
              type:'scatter',
              symbolSize:10,
              color:'blue',
              data:man
            }
          ]
        }
        chart1.setOption(option)
      })
    })
  },
})
</script>

