<template>
  <div class="BarVue">
    <div id="BarVue" style="width:800px;height:600px"/>
  </div>
</template>

<script>
import { onMounted } from '@vue/runtime-core'
import axios from 'axios'
import * as echarts from 'echarts'

export default {
  name: 'BarVue',
  setup () {
    onMounted(() => {
      // 请求数据
      const ps = {
        year: '1992',
        month: '5'
      }
      axios.post('/api/getNationByMonth', ps).then((res) => {
        const results = res.data.results
        // console.log(results)

        const name_arr = [] // 国家
        const money_arr = [] // 消费额
        for (let i = 0; i < results.length; i++) {
          const name1 = results[i].name
          const money = parseFloat(results[i].totalprice)

          if (name_arr.indexOf(name1) == -1) {
            name_arr.push(name1)
          }
          const idx = name_arr.indexOf(name1) // 国家下标

          // 国家消费额
          if (money_arr[idx]) {
            money_arr[idx] += money
          } else {
            money_arr[idx] = money
          }
        }
        // console.log(name_arr)
        // console.log(money_arr)
        // 排序
        const c = name_arr.map((a, i) => {
          return [a, money_arr[i]]
        })
        c.sort((x, y) => {
          if (x[1] > y[1]) {
            return -1
          } else if (x[1] < y[1]) {
            return 1
          } else {
            return 0
          }
        })
        // 取前五
        const name5 = []
        const money5 = []
        for (let i = 0; i < 5; i++) {
          name5[i] = c[i][0]
          money5[i] = c[i][1]
        }
        // console.log(name5)
        // console.log(money5)
        // 画图
        const dom = document.getElementById('BarVue')
        const chart = echarts.init(dom)
        const option = {
          title: {
            text: '1992年5月消费额最高的5个国家',
            x: 'center'
          },
          xAxis: {
            type: 'category',
            data: name5,
            axisLabel: {
              rotate: 30
            }
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              name: 'aada',
              type: 'bar',
              data: money5,
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
