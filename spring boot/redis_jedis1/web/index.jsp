<%--
  Created by IntelliJ IDEA.
  User: Chnpng Wng
  Date: 2023/5/16
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>登录</title>
</head>
<body>
<div>
  <form id="codeform">
    <input type="text" placeholder="填写手机号" name="phone_no">
    <button type="button" id="sendCode">发送验证码</button><br>
    <font id="countdown" color="red"></font><br>
    <input type="text" placeholder="填写验证码" name="verify_code">
    <button type="button" id="verifyCode">确定</button>
    <font id="result" color="green"></font>
    <font id="error" color="red"></font>
  </form>
</div>
</body>
<script type="text/javascript">
  var t = 60;
  var interval;
  function refer() {
    $("#countdown").text("请于"+t+"秒内填写验证码");
    t--;
    if (t<=0) {
      clearInterval(interval);
      $("#countdown").text("验证码已失效，请重新发送！");
    }
  }
  $(function() {
    $("#sendCode").click(function() {
      $.post("<%=request.getContextPath()%>/SendCodeServlet",
              $("#codeform").serialize(),function(data){
                if (data == "true") {
                  t = 60;
                  clearIntervcal(interval);
                  interval = setInterval("refer()",1000);
                }else if (data == "limit") {
                  clearIntervcal(interval);
                  $("#countdown").text("单日超过发送次数！");
                }
              });
    });
    $("#verifyCode").click(function () {
      $.post("<%=request.getContextPath()%>/CheckCodeServlet",
              $("#codeform").serialize(),function(data){
                if (data == "true") {
                  $("#result").attr("color","green");
                  $("#result").text("验证成功");
                  clearIntervcal(interval);
                  $("#countdown").text("");
                }else {
                  $("#result").attr("color","red");
                  $("#result").text("验证失败");
                }
              });
    });
  });
</script>
</html>
