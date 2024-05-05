let vm = new Vue({
	el: "#userinfo",
	data:{
		isLogin: false,
		name:"未知",
		memberInfo: {},
	},
	mounted(){
		axios.post("../mem/checkstu").then(result=>{
			if(result.status == 200 && result.data.code == 200){
				this.memberInfo = result.data.data;
				this.name = result.data.data.s_name;
				this.isLogin = true;
				return;
			}
			this.isLogin = false;
		})
	}
})