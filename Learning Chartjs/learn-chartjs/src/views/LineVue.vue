<template>
  <div class="LineVue">
    <div id="LineVue" style="width:800px;height:600px"/>
  </div>
</template>

<script>
import { onMounted } from '@vue/runtime-core'
import axios from 'axios'
import * as echarts from 'echarts'

export default {
  name: 'LineVue',
  setup () {
    onMounted(() => {
      // 请求数据
      const ps = {
        year: '1992'
      }
      axios.post('/api/getTotalByYear', ps).then((res) => {
        const results = res.data.results
        // console.log(results)

        const month_arr = [] // 月份
        const money_arr = []
        for (let i = 0; i < results.length; i++) {
          const month = parseInt(results[i].orderdate.substring(5, 7))
          const money = parseFloat(results[i].totalprice)

          if (month_arr.indexOf(month) == -1) {
            month_arr.push(month)
          }
          // 上半年消费额
          if (month <= 6) {
            const idx = month_arr.indexOf(month)
            if (money_arr[idx]) {
              money_arr[idx] += money
            } else {
              money_arr[idx] = money
            }
          }
        }
        // console.log(month_arr)
        // console.log(money_arr)
        // 根据月份排序
        const c = month_arr.map((a, i) => {
          return [a, money_arr[i]]
        })
        c.sort((x, y) => {
          if (x[0] > y[0]) {
            return 1
          } else if (x[0] < y[0]) {
            return -1
          } else {
            return 0
          }
        })

        const month6 = []
        const money6 = []
        for (let i = 0; i < 6; i++) {
          month6[i] = c[i][0]
          money6[i] = c[i][1]
        }
        console.log(month6)
        console.log(money6)
        // 画图
        const dom = document.getElementById('LineVue')
        const chart = echarts.init(dom)
        const option = {
          title: {
            text: '1992年上半年商城总消费额的变化情况',
            x: 'center'
          },
          xAxis: {
            type: 'category',
            data: month6
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              name: 'aada',
              type: 'line',
              data: money6,
              label: {
                show: true,
                position: 'top'
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
