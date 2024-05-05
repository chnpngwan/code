let id;
function showsg(msg, color, order){
	id = order;
	if(!document.getElementById("popup_info")){
		let str = `<div class="popup_con"><div class="popup"><p id="popup_info">
			</p>
			<br/>
			<input type="button" name="Ent1" id="Ent1" value="确认" onclick="ent1()"/>
			<input type="button" name="End1" id="End1" value="取消" onclick="end1()"/></div></div>`;
		$(document.body).append($(str));
	}
	$("#popup_info").text(msg).css("color", color);
	$('.popup_con').fadeIn('fast');
}



function end1() {
	$('.popup_con').fadeIn('fast', function() {
		setTimeout(function() {
			$('.popup_con').remove();
		})
	});
}

function ent1() {
	let uname = document.getElementById("admin").innerHTML;
	axios.post("../mem/modify", qs.stringify({
		id: id,
		uname: uname
	})).then(result => {
		if (result.data.code == 200) {
			alert("删除成功");
			number = number - 1;
			end1();
			app.fasong();
			show(unnum);
		}else{
			alert("删除失败");
		}
	})
}
