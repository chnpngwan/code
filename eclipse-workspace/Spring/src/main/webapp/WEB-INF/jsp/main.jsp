<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>学生信息管理系统</h1>
  <a href="gotoAdd.do">新增学生信息</a>
 <table border="1" cellspacing="0">
    <tr>
       <td>学号</td>
       <td>姓名</td>
       <td>性别</td>
       <td>年龄</td>
       <td>操作</td>
    </tr>
    <c:forEach var="stu" items="${allStu}">
     <tr>
       <td><c:out value="${stu.id }"/></td>
       <td><c:out value="${stu.name }"/></td>
       <td><c:out value="${stu.sex }"/></td>
       <td><c:out value="${stu.age }"/></td>
    </tr>
      <a href="">修改</a>
      <a href="delById?id=${stu.id }" onclick="return confirm('确定要删除数据吗？')"></a>
    </c:forEach>
 </table>
</body>
</html>