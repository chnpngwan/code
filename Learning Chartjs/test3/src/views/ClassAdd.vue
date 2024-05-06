<template>
    <div id="classAddrChart" style="width:800px;height:600px"></div>
</template>

<script>
import { onMounted } from '@vue/runtime-core'
import axios from 'axios'
import * as echarts from 'echarts'

export default({
    setup() {
        onMounted(()=>{
            axios.get('/api/getStudent').then((res)=>{
                let jsonArr = res.data
                let class_arr = []
                let left = 10
                for(let i = 0;i<jsonArr.length;i++){
                    let cname = jsonArr[i].c_name   //班级名称
                    let addr = jsonArr[i].s_addr    //地区
                    let flag = false
                    for(let j = 0;j<class_arr.length;j++){
                        if(class_arr[j].name==cname){
                            //该班级已经有字典，加入合适数据即可
                            flag = true
                            let curr_data = class_arr[j]['data']
                            let flag2 = false
                            for(let k = 0;k<curr_data.length;k++){
                                if(curr_data[k].name == addr){
                                    let count = curr_data[k].value
                                    class_arr[j]['data'][k].value = count+1
                                    flag2 = true
                                }
                            }
                            if(flag2==false){
                                let dict2 = {}
                                dict2['name'] = addr
                                dict2['value'] = 1
                                class_arr[j]['data'].push(dict2)
                            }
                        }
                    }
                    if(flag==false){
                        let dict = {}
                        dict['name'] = cname
                        dict['type'] = 'pie'
                        dict['radius'] = [60]
                        dict['center'] = [left+'%','50%']
                        dict['data'] = []
                        let dict2 = {}
                        dict2['name'] = addr
                        dict2['value'] = 1
                        dict['data'].push(dict2)
                        class_arr.push(dict)
                        left+=20
                    }
                }

                let dom = document.getElementById('classAddrChart')
                let myChart = echarts.init(dom)
                const option = {
                    title:{
                        text:'各个班级饼图'
                    },
                    series:class_arr
                }
                myChart.setOption(option)
            })

        })
    },
})
</script>
