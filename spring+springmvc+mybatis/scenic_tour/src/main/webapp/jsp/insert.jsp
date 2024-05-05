<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加页面</title>

  <script type="text/javascript">
   function checkNull() {
	var name=document.getElementById("name").value;
	var sex=document.getElementById("sex").value;
	var id_no=document.getElementById("idNo").value;
	var age=document.getElementById("age").value;
	var type=document.getElementById("type").value;
	
	if(name==null || name==''){
		alert'请输入姓名！';
		return false;
	}else if(sex==null || sex==''){
		alert'请输入性别！';
		return false;
	}else if(idNo==null || idNo==''){
		alert'请输入身份证号码！';
		return false;
	}else if(age==null || age==''){
		alert'请输入年龄！';
		return false;
	}else if(type==null || type==''){
		alert'请输入类别！';
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
<h1>添加登记信息</h1>
<form action="doadd.do" method="post">
<p>
姓名：<input type="text" name="name" id="name">
</p>
<p>
性别：<input type="radio" name="sex" id="sex"  value="男">男
<input type="radio" name="sex" id="sex" value="女">女
</p>
<p>
身份证号：<input type="text" name="id_no" id="id_no">
</p>

<p>
年龄：<input type="text" name="age" id="age">
</p>
<p>
类别：<select name="type"  id="type">
  <option value="0">非会员</option>
  <option value="1">普通会员</option>
  <option value="2">VIP会员</option>
  <option value="3">钻石会员</option>
  <option value="4">年卡会员</option>
  </select>
</p>
<p>
日期：<input type="date" name="visit_date">
</p>
<input type="submit" value="提交" onclick="return checkNull()">
<input type="reset" value="重置">

</form>
</body>
</html>