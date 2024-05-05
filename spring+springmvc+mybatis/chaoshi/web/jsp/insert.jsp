<%--
  Created by IntelliJ IDEA.
  User: Chnpng Wng
  Date: 4/26/2023
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加</title>
    <script type="text/javascript">
        function names(name) {
            if (name!=null){
                alert("名字不能为空")
                return "";
            }
        }

        function birth(birthday) {
            if (birthday!=null){
                alert("生日不能为空")
                return "";
            }
        }
    </script>
</head>
<body>
    <h1>会员添加</h1>
<form action="/insertDo.do" method="post">
    <label>
        会员姓名：<input type="text" name="name" onblur="names(this)">(必填)
    </label><br>
    <label>
        会员性别：<input type="radio" name="sex" class="sex" value="0">男
        <input type="radio" name="sex" class="sex" value="1">女
    </label><br>
    <label>
        出生日期：<input type="date" name="birthday" onblur="birth(this)">(必填)
    </label><br>
    <input type="submit" value="添加会员">
</form>
</body>
</html>
