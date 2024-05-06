<template>
   <div id="linecharts" style="width:800px;height:600px;">折线图</div>
   <div id="barchart" style="width:800px;height:600px;margin-left: 850px;margin-top: -600px;">柱状图</div>
   <div id="multiBarChart" style="width:800px;height:600px;margin-top: 80px;">多柱状图</div>
   <div id="pieChart" style="width:800px;height:600px;margin-top: -600px;margin-left: 850px;">饼图</div>
   <div id="barcharts" style="width:800px;height:600px;">雷达图</div>
   <div id="chart1" style="width:800px;height:600px;margin-top: -600px;margin-left: 850px;">散点图</div>
   <div id="barchar" style="width:800px;height:600px;">折柱混合图</div>
   <div id="classScoreChart" style="width:800px;height:600px;margin-top: -600px;margin-left: 850px;">多折线图</div>
   <div id="classAddrChart" style="width:800px;height:600px">多饼图</div>
   <div id="classSexChart" style="width:800px;height:600px">堆叠柱状图</div>
</template>

<script>
import * as echarts from 'echarts'
import axios from 'axios'
import {onMounted} from '@vue/runtime-core'

export default ({
  setup() {
    onMounted(()=>{
//折线图
//发出网络请求获取数据
axios.get('/api/getWeekInfo').then((res)=>{
      let jsonObj = eval(res.data)
      let curr_tltle = jsonObj.title
      let infos = jsonObj.infos //取出infos属性对应的数组  
      var weeks = []
      var data = []
      for(var i = 0;i<infos.length;i++){
        weeks.push(infos[i].week)
        data.push(infos[i].data)
      }
      //升序排列
      let c = weeks.map((x,i) =>{
        return [x,data[i]]
      })
      console.log(c)
      c.sort((a,b) =>{
        if(a[1]>b[1]){
          return 1
        }
        else if(a[1]<b[1]){
          return -1
        }else{
          return 0
        }
      })
      //将排序的数据输出
      let new_weeks = []
      let new_data =[]
      c.map(x =>{
        new_weeks.push(x[0])
        new_data.push(x[1])
      })

      //图表
      let obj = document.getElementById('linecharts')
      let mychart = echarts.init(obj)
      const option = {
        title:{
          text:curr_tltle,
          x:'center',
          textStyle:{
             fontSize:30,
             color:'red'
          }
        },
        tooltip:{
          formatter:'{b}--{c}   '
        },
        legenh:{
          x:'left',
          y:'top'
        },
        toolbox: {
            feature: {
              saveAsImage: {}
            }
        },
        xAxis:{
          type:'category',
          data:new_weeks,
          axisLabel:{
             textStyle:{
              color:'red',
              fontSize:16
              }
          }
        },
        yAxis:{
            type:'value'
        },
        series:[{
          name:'test1',
          type:'line',
          data:new_data,
          itemStyle:{
            normal:{
              color:'red',
              lineStyle:{
                color:'blue'
              },
              label:{
                show:true
              }
            }
          }
      }]
     }
      mychart.setOption(option)
      })
 
//柱状图
//发出网络请求获取数据
axios.get('/api/getWeekInfo').then((res)=>{
      let jsonObj = eval(res.data)
      let curr_tltle = jsonObj.title
      let infos = jsonObj.infos //取出infos属性对应的数组  
      var weeks = []
      var data = []
      for(var i = 0;i<infos.length;i++){
        weeks.push(infos[i].week)
        data.push(infos[i].data)
      }

      //升序排列
      let c = weeks.map((x,i) =>{
        return [x,data[i]]
      })
      c.sort((a,b) =>{
        if(a[1]>b[1]){
          return 1
        }
        else if(a[1]<b[1]){
          return -1
        }else{
          return 0
        }
      })
      //将排序的数据输出
      let new_weeks = []
      let new_data =[]
      c.map(x =>{
        new_weeks.push(x[0])
        new_data.push(x[1])
      })

      //图表
      let obj = document.getElementById('barchart')
      let mychart = echarts.init(obj)
      const option = {
        title:{
          text:curr_tltle,
          x:'center',
          textStyle:{
             fontSize:30,
             color:'red'
          }
        },
        tooltip:{
          formatter:'{b}--{c}   '
        },
        legenh:{
          x:'left',
          y:'top'
        },
        toolbox: {
        feature: {
          saveAsImage: {}
        }
        },
         xAxis:{
            type:'category',
            data:new_weeks,
            axisLabel:{
              textStyle:{
                color:'red',
                fontSize:16
              }
            }
        },
        yAxis:{
            type:'value'
        },
        series:[{
          name:'test1',
          type:'bar',
          data:new_data,
          itemStyle:{
            normal:{
              // color:'red',
              lineStyle:{
                color:'blue'
              },
              label:{
                show:true
              }
            }
          }
      }]
     }
      mychart.setOption(option)
      })
     
//多柱状图
axios.post('/api/product').then((res)=>{
    let types = []  //装类别的数组
    let areas = []  //装地区的数组
    for(let i = 0;i<res.data.length;i++){
        let type = res.data[i].p_type   //类别拿到
        let area = res.data[i].p_addr   //地区拿到
        if(types.indexOf(type)==-1){
            types.push(type)    //将类别装入types数组中
        }
        let flag = false
        for(let j=0;j<areas.length;j++){
            if(areas[j].name==area){
                flag = true
            }
        }
        if(flag==false){
            let dict = {}
            dict['name'] = area
            dict['data'] = []
            dict['type'] = 'bar'
            dict['itemStyle'] = {'normal':{'label':{'show':true}}}
            areas.push(dict)
        }
    }
    for(let j = 0;j<res.data.length;j++){
        let type = res.data[j].p_type   //类别拿到
        let area = res.data[j].p_addr   //地区拿到
        let num = res.data[j].p_number  //库存拿到
        let idx = types.indexOf(type)   //当前应该存入的对应类别下标位置
        for(let k = 0;k<areas.length;k++){
            if(areas[k].name==area){
                let dict = areas[k]
                if(dict.data[idx]==null){
                    dict.data[idx] = num
                }
                else{
                    dict.data[idx] += num
                }
            }
        }
    }
    //图表
    let domObj = document.getElementById('multiBarChart')
    let multiBarChart = echarts.init(domObj)
    const option = {
        title:{
            text:'各个类别及产地下库存量',
            x:'center'
        },
        toolbox: {
          feature: {
            saveAsImage: {}
          }
        },
        xAxis:{
            type:'category',
            data:types
        },
        yAxis:{
            type:'value'
        },
        series:areas
    }
    multiBarChart.setOption(option)
})
    
 //饼图
 //请求服务端获取数据
axios.get('/api/product').then(function(res){
     //装地区数组
     let areas = []
     //装库存的数组
     let numbers = []
     //提取数据
     for(let i = 0;i<res.data.length;i++){
         let area = res.data[i].p_addr //地区
         let num = res.data[i].p_number  //库存
         let idx = areas.indexOf(area) //找当前区域在区域数组中的下标
         if(idx==-1){  //查找当前区域是否在数组中存在
           areas.push(area)  //将区域放入区域数组中
           numbers.push(num) //直接放入库存数量
         }
         else{
           let nums = numbers[idx] //取出这个区域对应的库存值
           numbers[idx] = nums+num //累加该区域的库存，重新放入数组中对应
         }
     }
     var mydata = []
     for(let i = 0;i<areas.length;i++){
         let dict = {}
         dict['name'] = areas[i]
         dict['value'] = numbers[i]
         mydata.push(dict)
     }
     //图表开始
     let domObj = document.getElementById('pieChart')
     let pieChart = echarts.init(domObj)
     const option = {
       title:{
         text:'各个区域下库存总量',
         x:'center',
         textStyle:{
           color:'blue',
           fontSize:25
         }
       },
       tooltip:{
       },
       legend:{
           x:'center',
           y:'bottom'
       },
       toolbox: {
  feature: {
    saveAsImage: {}
  }
},
       series:[
         {
           type:'pie',
           data:mydata,
           itemStyle:{
             normal:{
               label:{
                 show:true,
                 position:'outer',
                 formatter:'{b}-{c}-{d}%',
                 color:'red'
               }
             }
           }
         }
       ]}
     pieChart.setOption(option)
    })

//雷达图
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
       let dict = {}
       dict.name = class_name
       dict.stus = []  //该数组用来 存储该班级对应的学生id
       class_dict.push(dict)
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
     for(let j = 0;j<class_dict.length;j++){
       if(class_dict[j].name==class_name){
         //判断学生id是否存在该班级中学生id数组中
        //  if(class_dict[j].stus.indexOf(sid)==-1){
        //  if(class_dict.indexOf(sid)==-1){
           class_dict[j].stus.push(sid)
          //  class_dict.push(sid)
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
        //}
      }
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
   let domObj = document.getElementById('barcharts')
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

//散点图
 //发出请求获取数据
 axios.get('/api/getSex').then((res) => {
     let obj = eval(res.data)
     let woman = obj.datas[0].data
     let man = obj.datas[1].data
     let dom = document.getElementById('chart1')
     let chart1 = echarts.init(dom)
     const option = {
         title: {
             text: '男女身高体重散点图',
             subtext: '身高体重'
         },
         xAxis: { scale: true },
         yAxis: { scale: true },
         series: [
             {
                 type: 'scatter',
                 symbolSize: 10,
                 color: 'red',
                 data: woman
             },
             {
                 type: 'scatter',
                 symbolSize: 10,
                 color: 'blue',
                 data: man
             }
         ]
     }
     chart1.setOption(option)
 })
      
//折柱混合图
      let domObr = document.getElementById('barchar')
      let piechartr = echarts.init(domObr)
      const optionr ={
        tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross',
      crossStyle: {
        color: '#999'
      }
    }
  },
  toolbox: {
    //转换下载
    feature: {
      dataView: { show: true, readOnly: false },
      magicType: { show: true, type: ['line', 'bar'] },
      restore: { show: true },
      saveAsImage: { show: true }
    }
  },
  legend: {
    data: ['Evaporation', 'Precipitation', 'Temperature']
  },
  xAxis: [
    {
      type: 'category',
      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      axisPointer: {
        type: 'shadow'
      }
    }
  ],
  yAxis: [
    {
      type: 'value',
      name: 'Precipitation',
      min: 0,
      max: 250,
      interval: 50,
      axisLabel: {
        formatter: '{value} ml'
      }
    },
    {
      type: 'value',
      name: 'Temperature',
      min: 0,
      max: 25,
      interval: 5,
      axisLabel: {
        formatter: '{value} °C'
      }
    }
  ],
  series: [
    {
      name: 'Evaporation',
      type: 'bar',
      data: [
        2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3
      ]
    },
    {
      name: 'Precipitation',
      type: 'bar',
      data: [
        2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3
      ]
    },
    {
      name: 'Temperature',
      type: 'line',
      yAxisIndex: 1,
      data: [2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
    }
  ]
      }
piechartr.setOption(optionr)

//多折线图
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
 })

//多饼图
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

//堆叠柱状图
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
        let idx = class_names.indexOf(cname)    //找出在班级数组中对应
        if(sid_arr.indexOf(sid)==-1){
            //统计该学生性别属于哪个数组，丢进去
            sid_arr.push(sid)   //将该学生id放入数组中，作为下次不计算
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

    })
   },
})
</script>

