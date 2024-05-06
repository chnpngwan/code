<template>
  <div id="chart2" style="width:800px;height:600px;margin:0px auto"></div>
</template>

<script>
import {onMounted} from '@vue/runtime-core'
import axios from 'axios'
import * as echarts from 'echarts'

export default {
  setup(){
      onMounted(()=>{
        //发出请求获取数据
        axios.get('/api/getStudent').then((res)=>{
          let jsonArr = res.data
          //先找出不重复的班级
          let class_arr = []
          let class_dict = []
          for(let i = 0;i<jsonArr.length;i++){
            let class_name = jsonArr[i].c_name  //取出每条数据中的班级名称
            if(class_arr.indexOf(class_name)==-1){
              class_arr.push(class_name)
              // let dict = {}
              // dict.name = class_name
              // dict.stus = []  //该数组用来 存储该班级对应的学生id
              // class_dict.push(dict)
            }
          }
          //[1901,1902,1903,1904,1905]
          let stu_counts = [] //装各个班级下总人数
          let score_counts = [] //装各个班级下总分数
          let age_counts = []  //装各个班级下总年龄
          for(let i = 0;i<jsonArr.length;i++){
            let sid = jsonArr[i].s_id //拿出当前学生的id
            let score = jsonArr[i].sc_score //拿出当前数据的成绩
            let class_name = jsonArr[i].c_name  //拿出当前学生的班级名称
            let birthdayYear = jsonArr[i].s_birthday.substring(0,4)  //拿出生日
            let currYear = new Date().getFullYear() //获取当前年份
            let age = parseInt(currYear) - parseInt(birthdayYear) //得到年龄
            let idx = class_arr.indexOf(class_name) //找出该学生班级对应的存储下标位置
            if(score_counts[idx]==null){
              score_counts[idx] = score
            }
            else{
              score_counts[idx] += score
            }
            //找到当前字典中对应的下标位
            // for(let j = 0;j<class_dict.length;j++){
            //   if(class_dict[j].name==class_name){
                //判断学生id是否存在该班级中学生id数组中
                // if(class_dict[j].stus.indexOf(sid)==-1){
                if(class_dict.indexOf(sid)==-1){
                  //class_dict[j].stus.push(sid)
                  class_dict.push(sid)
                  if(age_counts[idx]==null){
                    age_counts[idx] = age
                  }
                  else{
                    age_counts[idx] += age
                  }
                  if(stu_counts[idx]==null){
                    stu_counts[idx] = 1
                  }
                  else{
                    stu_counts[idx] += 1
                  }
                }
            //   }
            // }
          }

          let mydict = []
          for(let i = 0;i<class_arr.length;i++){
            let dict = {}
            dict['name'] = class_arr[i]
            mydict.push(dict)
          }

          //经过上面的循环，我们计算出了班级下的总人数，是对应班级数组的
          //还算出了班级下的总年龄、总分数
          //图表数据生成
          let avgAge = age_counts.map((x,i)=>{
            return Math.round(age_counts[i] / stu_counts[i])
          })
          let avgScore = score_counts.map((x,i)=>{
            return Math.round(score_counts[i]/stu_counts[i])
          })
          
          //图表开始操作
          let domObj = document.getElementById('chart2')
          let mychart = echarts.init(domObj)
          const option = {
              title:{
                text:'各个班级下人数/平均年龄/平均分数雷达图'
              },
              legend:{
                data:class_arr
              },
              radar:{
                indicator:mydict
              },
              series:[
                {
                    name:'各个班级数据',
                    type:'radar',
                    data:[
                      {
                        name:'总人数',
                        value:stu_counts
                      },
                       {
                        name:'平均年龄',
                        value:avgAge
                      },
                       {
                        name:'平均分',
                        value:avgScore
                      }
                    ]
                }
              ]
          }
          mychart.setOption(option)

        })

      })
  }
}
</script>
