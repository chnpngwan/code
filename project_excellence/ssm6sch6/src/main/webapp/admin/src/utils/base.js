const base = {
    get() {
                return {
            url : "http://localhost:8080/ssm6sch6/",
            name: "ssm6sch6",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/ssm6sch6/front/index.html'
        };
            },
    getProjectName(){
        return {
            projectName: "学生成绩管理系统"
        } 
    }
}
export default base
