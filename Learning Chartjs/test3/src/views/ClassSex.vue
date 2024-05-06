<template>
    <div id="classSexChart" style="width:800px;height:600px"></div>
    <div id="classScoreChart" style="width:1400px;height:600px"></div>
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
                let class_names = []
                let nan_arr = []
                let nv_arr = []
                for(let i = 0;i<jsonArr.length;i++){
                    let cname = jsonArr[i].c_name
                    if(class_names.indexOf(cname)==-1){
                        class_names.push(cname)
                        nan_arr.push(0)
                        nv_arr.push(0)
                    }
                }
                
                //如果该学生已经算过一次个数，则不进行第二次计算
                let sid_arr = []
                for(let i = 0;i<jsonArr.length;i++){
                    let sid = jsonArr[i].s_id   //取出学生的ID
                    let sex = jsonArr[i].s_sex  //取出学生的性别
                    let cname = jsonArr[i].c_name   //取出学生所在班级
                    let idx = class_names.indexOf(cname)    //找出在班级数组中对应下标位置
                    if(sid_arr.indexOf(sid)==-1){
                        //统计该学生性别属于哪个数组，丢进去
                        sid_arr.push(sid)   //将该学生id放入数组中，作为下次不计算这个学生的标志
                        if(sex=='男'){
                             nan_arr[idx] += 1
                        }
                        else{
                            nv_arr[idx] += 1
                        }
                    }
                }
                
                //图表开始
                let domObj1 = document.getElementById('classSexChart')
                let classSexChart = echarts.init(domObj1)
                const option = {
                    title:{
                        text:'各个班级男女人数对比'
                    },
                    xAxis:{
                        type:'category',
                        data:class_names
                    },
                    yAxis:{
                        type:'value'
                    },
                    tooltip:{
                        formatter:'{b}-{c}人'
                    },
                    series:[
                        {
                            name:'男',
                            type:'bar',
                            stack:'sex',
                            data:nan_arr,
                            itemStyle:{
                                normal:{
                                    label:{
                                        show:true
                                    }
                                }
                            }
                        },
                        {
                            name:'女',
                            type:'bar',
                            stack:'sex',
                            data:nv_arr,
                             itemStyle:{
                                normal:{
                                    label:{
                                        show:true
                                    }
                                }
                            }
                        }
                    ]
                }
                classSexChart.setOption(option)
            })

            //下一个图
            axios.get('/api/getStudent').then((res)=>{
                let jsonArr = res.data
                let course_arrs = []
                
                for(let i = 0;i<jsonArr.length;i++){
                    let course_name = jsonArr[i].sc_course
                    if(course_arrs.indexOf(course_name)==-1){
                        course_arrs.push(course_name)
                    }
                }
                //上面的for循环找出所有的课程名称了
                let student_arr = []
                for(let i = 0;i<jsonArr.length;i++){
                    let cname = jsonArr[i].c_name //学生的班级名称
                    let stu_name = jsonArr[i].s_name    //学生的姓名
                    let score = jsonArr[i].sc_score //成绩
                    let course = jsonArr[i].sc_course   //科目
                    let idx = course_arrs.indexOf(course) //找到应该存储对应的下标位
                    if(cname=='1904班'){
                        let flag = false
                        for(let j=0;j<student_arr.length;j++){
                            if(student_arr[j].name==stu_name){
                                flag = true
                                student_arr[j]['data'][idx] = score
                            }
                        }
                        if(flag==false){
                            let dict = {}
                            dict['name'] = stu_name
                            dict['type'] = 'line'
                            // dict['stack'] = 'score'
                            dict['data'] = []
                            dict['data'][idx] = score
                            student_arr.push(dict)
                        }
                    }
                }
                
                //图表开始
                let domObj2 = document.getElementById('classScoreChart')
                let classScoreChart = echarts.init(domObj2)
                const option = {
                    title:{
                        text:'各个科目成绩展示'
                    },
                    xAxis:{
                        type:'category',
                        data:course_arrs
                    },
                    yAxis:{
                        type:'value'
                    },
                    tooltip:{

                    },
                    series:student_arr
                }
                classScoreChart.setOption(option)
            });

        })
    },
})
</script>
