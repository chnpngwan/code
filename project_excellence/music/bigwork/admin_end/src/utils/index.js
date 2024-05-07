// 全局函数作为vue组件装配。

export default{
    methods:{
        long2DateStr(time){
            return new Date(time*1000).toLocaleDateString();
        },
        long2MinStr(time){
            let min = parseInt(time/60)
            let hour = parseInt(min/60)
            min %= 60;
            let sec = time % 60;
            if((min+"").length != 2){
                min = "0"+min
            }
            return `${hour!=0?hour+":":""}${min}:${sec}`
        }
    }
}