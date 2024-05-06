<template>
  <div class="PieVue">
    <div id="PieVue" style="width:800px;height:600px"/>
  </div>
</template>

<script>
import { onMounted } from '@vue/runtime-core'
import axios from 'axios'
import * as echarts from 'echarts'

export default {
  name: 'PieVue',
  setup () {
    onMounted(() => {
      // 请求数据
      const ps = {
        year: '1992',
        quarter: '1'
      }
      axios.post('/api/getNationByQuarter', ps).then((res) => {
        const results = res.data.results
        // console.log(results)

        const dq_arr = [] // 地区
        const money_arr = []
        for (let i = 0; i < results.length; i++) {
          const dq = results[i].name
          const money = parseFloat(results[i].totalprice)

          if (dq_arr.indexOf(dq) == -1) {
            dq_arr.push(dq)
          }
          const idx = dq_arr.indexOf(dq)// 地区下标
          if (money_arr[idx]) {
            money_arr[idx] += money
          } else {
            money_arr[idx] = money
          }
        }
        // 数据在组合
        const finaArr = []
        for (let i = 0; i < dq_arr.length; i++) {
          const dict = {}
          dict.name = dq_arr[i]
          dict.value = money_arr[i]
          finaArr.push(dict)
        }
        // console.log(dq_arr)
        // console.log(money_arr)
        console.log(finaArr)
        // 画图
        const dom = document.getElementById('PieVue')
        const chart = echarts.init(dom)
        const option = {
          title: {
            text: '1992年第一季度各地区的消费总额占比',
            x: 'center'
          },
          tooltip: {
            trigger: 'item',
            formatter: '{d}%'
          },
          legend: {
            top: 'bottom'
          },
          series: [
            {
              name: 'aada',
              type: 'pie',
              data: finaArr,
              roseType: 'radidus',
              label: {
                show: true,
                position: 'inner'
              }
            }
          ]
        }
        chart.setOption(option)
      })
    })
  }
}
</script>
