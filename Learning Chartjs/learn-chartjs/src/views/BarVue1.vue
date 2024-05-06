<template>
  <div class="BarVue1">
    <div id="BarVue1" style="width:800px;height:600px"/>
  </div>
</template>

<script>
import { onMounted } from '@vue/runtime-core'
import axios from 'axios'
import * as echarts from 'echarts'

export default {
  name: 'BarVue1',
  setup () {
    onMounted(() => {
      const ps = {
        year: '1992'
      }
      axios.post('/api/getNationAvgByYear', ps).then((res) => {
        const results = res.data.results
        // console.log(results)

        const name_arr = []
        const num_arr = []
        const money_arr = []
        for (let i = 0; i < results.length; i++) {
          const name1 = results[i].name
          const money = parseFloat(results[i].totalprice)

          if (name_arr.indexOf(name1) == -1) {
            name_arr.push(name1)
          }
          const idx = name_arr.indexOf(name1)
          // 计算
          if (money_arr[idx]) {
            money_arr[idx] += money
          } else {
            money_arr[idx] = money
          }
          if (num_arr[idx]) {
            num_arr[idx] += 1
          } else {
            num_arr[idx] = 1
          }
        }
        // console.log(name_arr)
        // console.log(money_arr)
        const avg = []
        for (let i = 0; i < money_arr.length; i++) {
          avg[i] = money_arr[i] / num_arr[i]
        }
        // console.log(avg)
        // 排序
        const c = name_arr.map((a, i) => {
          return [a, avg[i]]
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

        const name5 = []
        const num5 = []
        for (let i = 0; i < 10; i++) {
          name5[i] = c[i][0]
          num5[i] = c[i][1]
        }
        console.log(name5)
        console.log(num5)
        const dom = document.getElementById('BarVue1')
        const chart = echarts.init(dom)
        const option = {
          title: {
            text: '1992年平均消费总额最高的10个国家',
            x: 'center'
          },
          xAxis: {
            type: 'value'
          },
          yAxis: {
            type: 'category',
            data: name5,
            axisLabel: {
              rotate: 30
            }
          },
          series: [
            {
              name: 'aada',
              type: 'bar',
              data: num5,
              label: {
                show: true
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
