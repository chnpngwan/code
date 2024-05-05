$(function() {
	$.ajax({
		type: "POST",//请求方式（POST/GET）
		url: "UserJson.do",//请求的Servlet的地址
		dataType: "json",
		data: { "name": "张三", "price": 100 },
		beforeSend: function() {

		},
		success: function(result) {
			$("#userHead").attr("src",result[0].userHeadimg)
		}

	})
	

})