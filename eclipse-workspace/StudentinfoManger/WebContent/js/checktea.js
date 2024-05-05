let vm = new Vue({
	el: "#userinfo",
	data:{
		isLogin: false,
		name:"未知",
		memberInfo: {},
	},
	mounted(){
		axios.post("../mem/checktea").then(result=>{
			if(result.status == 200 && result.data.code == 200){
				this.memberInfo = result.data.data;
				this.name = result.data.data.t_name;
				this.isLogin = true;
				return;
			}
			this.isLogin = false;
		})
	}
})