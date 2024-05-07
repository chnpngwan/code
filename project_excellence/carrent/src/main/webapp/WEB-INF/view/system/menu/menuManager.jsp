<%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%
	String path = request.getContextPath();
%>
<html>
<head>
    <title>菜单管理</title>
</head>
    <frameset cols="200,*" border="1">
        <frame src="<%=path%>/sys/toMenuLeft.action" name="left">
        <frame src="<%=path%>/sys/toMenuRight.action" name="right">
    </frameset>
</html>
