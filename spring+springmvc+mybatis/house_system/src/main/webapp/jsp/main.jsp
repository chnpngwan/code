<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>房源信息列表</title>
</head>
<body>
   <h1 style="text-align: center;">房源信息列表</h1>
   <form action="/show" method="post">
   所在区域:<input type="text" name="location">
   面积大小:<input type="text" name="min">---<input type="text" name="max">
   <input type="submit" value="查询">
   </form>
   <br>
   <table border="1" cellspacing="0" style="width: 100%;height: 400px;">
   <tr>
   <td>编号</td>
   <td>区域</td>
   <td>面积</td>
   <td>详细地址</td>
   <td>户型</td>
   <td>联系电话</td>
   <td>登记时间</td>
   <td>操作</td>
   </tr>
   <c:forEach var="house" items="${ houseList }" >
    <tr>
   <td>${house.id }</td>
   <td>${house.location }</td>
   <td>${house.area }</td>
   <td>${house.address }</td>
   <td>${house.type }</td>
   <td>${house.mobile }</td>
   <td><fmt:formatDate value="${house.registerTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
   <td>
   <a href="deleteById?id=${house.id }" onclick="return confirm('确定删除此数据吗？')">删除</a>
   </td>
   </tr>
   </c:forEach>
   <tr>
   <td colspan="8" style="text-align: center;">
      共为您查询到${houseList.size() }条房源信息
   </td>
   </tr>
   </table>
</body>
</html>