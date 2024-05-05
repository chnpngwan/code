<%--
  Created by IntelliJ IDEA.
  User: Chnpng Wng
  Date: 4/24/2023
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>展示</title>
  <style type="text/css">
    h1 {
      text-align: center;
    }
    #head{
      background-color: blue;
      color: white;
      text-align: center;
      font-weight: bold;
      font-size: 25px;
    }
    #content{
      text-align: center;
    }
    #content:hover{
      background-color: aqua;
    }
  </style>
</head>
<body>
  <h1>超市会员管理系统</h1>
  <fieldset>
    <label>搜索</label>
    <form action="/list.do" method="post">
      姓名：<input type="text" name="name"/>
          <input type="submit" value="查询">
    </form>
  </fieldset>
  <table border="1" cellspacing="0" width="100%">
    <tr id="head">
      <td>序号</td>
      <td>会员卡号</td>
      <td>姓名</td>
      <td>性别</td>
      <td>出生日期</td>
      <td>会员等级</td>
      <td>会员积分</td>
      <td>登记时间</td>
      <td>操作</td>
    </tr>
    <c:forEach var="good" items="${goodList}">
      <tr id="content">
        <td><c:out value="${good.id}"/></td>
        <td><c:out value="${good.card_no}"></c:out></td>
        <td><c:out value="${good.name}"/></td>
        <td>
          <c:if test="${good.sex==0}">男</c:if>
          <c:if test="${good.sex==1}">女</c:if>
        </td>
        <td>
            <fmt:formatDate value="${good.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>
            <%--<c:out value="${good.birthday}"/>--%>
        </td>
        <td><c:out value="${good.grade}"/></td>
        <td><c:out value="${good.integral}"/></td>
        <td>
            <fmt:formatDate value="${good.write_time}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
            <%--<c:out value="${good.writeTime}"/>--%>
        </td>
        <td>
          <a href="/deleteById.do?id=${good.id}" onclick="return confirm('确定删除此数据嘛？')">删除</a>
        </td>
      </tr>
    </c:forEach>
    <tr>
      <td colspan="9">共有${ goodList.size() }个会员 </td>
      <span><a href="/insert.do">添加会员</a></span>
    </tr>
  </table>
</body>
</html>
