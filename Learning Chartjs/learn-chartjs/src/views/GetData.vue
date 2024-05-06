<template>
  <div class="GetData">
    <h1>{{ data }}</h1>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue'
import axios from 'axios'

export default {
  name: 'GetData',
  // setup() {
  //   const data = ref(null)

  //   onMounted(async () => {
  //     const ps = {
  //       start: '2019-01-01',
  //       end: '2022-01-01'
  //     }
  //     try {
  //       console.log('Sending HTTP request...')
  //       // 发送 GET 请求并等待响应
  //       const response = await axios.post('/api/getBrowserByDate2',ps)
  //       // 将获取的数据存储在 data 变量中
  //       data.value = response.data
  //       console.log(data)
  //     } catch (error) {
  //       // 如果请求失败，打印错误信息
  //       console.error('Error fetching data:', error)
  //     }
  //   })

  //   // 将 data 变量暴露给模板
  //   return { data }
  // }
}

</script>
