<template>
  <div class="LineBar">
    <div id="LineBar" style="width:800px;height:600px"/>
  </div>
</template>

<script>
import { onMounted } from '@vue/runtime-core'
import axios from 'axios'
import * as echarts from 'echarts'

export default {
  name: 'LineBar',
  setup () {
    onMounted(() => {
      const ps = new URLSearchParams()
      ps.append('year', '1992')
      axios.post('/api/getNationRegionAvg', ps).then((res) => {
        const results = res.data.results
        console.log(results)

        const gj_arr = [] // 国家
        const gj_money = [] // 国家消费额
        const gj_num = [] // 国家数量
        const gj_dq = [] // 国家对应的地区
        const dq_arr = [] // 地区
        const dq_money = [] // 地区消费额
        const dq_num = [] 	// 地区数量
        for (let i = 0; i < results.length; i++) {
          const gj = results[i].gj
          const dq = results[i].dq
          const money = parseFloat(results[i].totalprice)
          if (dq_arr.indexOf(dq) == -1) {
            dq_arr.push(dq)
          }
          const idx = dq_arr.indexOf(dq)
          if (gj_arr.indexOf(gj) == -1) {
            gj_arr.push(gj)
            gj_dq.push(idx)
          }
          // 国家的消费额和数量
          const idx1 = gj_arr.indexOf(gj)
          if (gj_money[idx1]) {
            gj_money[idx1] += money
            gj_num[idx1] += 1
          } else {
            gj_money[idx1] = money
            gj_num[idx1] = 1
          }
          // 地区的消费额和数量
          if (dq_money[idx]) {
            dq_money[idx] += money
            dq_num[idx] += 1
          } else {
            dq_money[idx] = money
            dq_num[idx] = 1
          }
        }
        console.log(gj_arr)
        console.log(gj_money)
        console.log(dq_arr)
        console.log(dq_money)
        // 计算国家的平均值
        const gj_avg = []
        for (let i = 0; i < gj_money.length; i++) {
          gj_avg[i] = gj_money[i] / gj_num[i]
        }
        // 国家对应的地区的平均值
        const dq_avg = []
        for (let i = 0; i < dq_money.length; i++) {
          dq_avg[i] = dq_money[i] / dq_num[i]
        }
        // 排序，取前五
        const c = gj_arr.map((a, i) => {
          return [a, gj_avg[i], gj_dq[i]]
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

        const gj5 = []
        const gj_avg5 = []
        const dq_avg5 = []
        for (let i = 0; i < 5; i++) {
          gj5[i] = c[i][0]
          gj_avg5[i] = c[i][1]
          dq_avg5[i] = dq_avg[c[i][2]]
        }
        console.log(gj5)
        console.log(gj_avg5)
        console.log(dq_avg5)

        const dom = document.getElementById('LineBar')
        const chart = echarts.init(dom)
        const option = {
          title: {
            text: '1992年地区平均消费额和国家平均消费额的对比情况',
            x: 'center'
          },
          legend: {
            top: 'bottom'
          },
          xAxis: {
            type: 'category',
            data: gj5,
            axisLabel: {
              rotate: 30
            }
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              name: '国家平均消费额',
              type: 'bar',
              data: gj_avg5,
              label: {
                show: true,
                position: 'top'
              }
            },
            {
              name: '国家所在的地区的平均消费额',
              type: 'line',
              data: dq_avg5,
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
