function showg(order) {
	if (!$(".data1").length > 0) {
		let str = `
			<div class="data1">
			<table>
			<thead>
			<tr>
			<td id="admin">ID</td>
			<td>姓名</td>
			<td>邮箱</td>
			<td>密码</td>
			</tr>
			</thead>
			<tbody v-for="(order, i) in orders">
			<tr>
			<td><input type="text" name="textid" id="textid" value="" disabled="true"/></td>
			<td><input type="text" name="textName" id="textName" value="" /></td>
			<td><input type="text" name="textEmail" id="textEmail" value="" /></td>
			<td><input type="text" name="textPwd" id="textPwd" value="" /></td>
			</tr>
			</tbody>
			</table>
			<input type="button" name="Ent" id="Ent" value="确认" onclick="ent()"/>
			<input type="button" name="End" id="End" value="取消" onclick="end()"/>
			</div>
			`;
		$(document.body).append($(str));
	}
	document.getElementById("textid").value = order.a_id;
	document.getElementById("textName").value = order.a_user;
	document.getElementById("textEmail").value = order.a_email;
	document.getElementById("textPwd").value = order.a_pwd;
}


function end() {
	$('.data1').fadeIn('fast', function() {
		setTimeout(function() {
			$('.data1').remove();
		})
	});
}

function ent() {
	let id = document.getElementById("textid").value
	let user = document.getElementById("textName").value;
	let email = document.getElementById("textEmail").value;
	let pwd = document.getElementById("textPwd").value;
	let uname = document.getElementById("admin").innerHTML;
	axios.post("../mem/transform", qs.stringify({
		id: id,
		user: user,
		email: email,
		pwd: pwd,
		uname: uname
	})).then(result => {
		if (result.data.code == 200) {
			alert("修改成功");
			app.fasong();
		}else{
			alert("修改失败");
		}
	})
}
