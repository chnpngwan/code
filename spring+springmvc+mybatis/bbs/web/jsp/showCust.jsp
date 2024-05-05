<%--
  Created by IntelliJ IDEA.
  User: Chnpng Wng
  Date: 5/8/2023
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户消息管理</title>
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <script type="text/javascript" src="static/layui/layui.js"></script>
  <style type="text/css">
    h2 {
      text-align: center;
    }
    #app {
      text-align: center;
      font-size: 20px;
    }
  </style>
</head>
<body>
  <h2>用户消息管理</h2>
  <form action="/showCust.do" method="post" style="float: left">
    <div class="layui-form-item">
      <div class="layui-input-group">
        <div class="layui-input-split layui-input-prefix">
          手机号
        </div>
        <input type="text" name="tel" placeholder="请输入手机号" class="layui-input">
          <div class="layui-input-split layui-input-prefix">
            用户名
          </div>
          <input type="text" name="account" placeholder="请输入用户名" class="layui-input">
        <div class="layui-input-suffix">
          <button class="layui-btn layui-btn-primary">搜索</button>
        </div>
      </div>
    </div>
  </form>
  <table class="layui-table" lay-even>
    <colgroup>
      <col width="150">
      <col width="150">
      <col>
    </colgroup>
    <thead>
    <tr>
      <th>编号</th>
      <th>账号</th>
      <th>昵称</th>
      <th>密码</th>
      <th>电话</th>
      <th>等级</th>
      <th>积分</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="custom" items="${ selectedCustomerList }">
      <tr>
        <td>${ custom.cid }</td>
        <td>${ custom.account }</td>
        <td>${ custom.nickName }</td>
        <td>${ custom.password }</td>
        <td>${ custom.tel }</td>
        <td>
          <c:if test="${ custom.level==0 }">
            普通用户
          </c:if>
          <c:if test="${ custom.level==1 }">
            VIP
          </c:if>
        </td>
        <td>${ custom.code }</td>
        <td>
          <a href="/selectById.do?cid=${custom.cid}">
            <button type="button" class="layui-btn layui-btn-sm">
              <i class="layui-icon layui-icon-edit"></i> 编辑
            </button>
          </a>
          <a href="/deleteById.do?cid=${custom.cid}" onclick="return confirm('确认删除此数据吗？')">
            <button type="button" class="layui-btn layui-btn-sm">
              <i class="layui-icon layui-icon-edit"></i> 删除
            </button>
          </a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
    <tfoot id="app">
      <tr>
        <td colspan="8">
          <!-- 首页 -->
          <a href="showCust.do?page=1">首页</a>
          &nbsp;&nbsp;&nbsp;
          <!-- 上一页 -->
          <c:if test="${pageInfo.pageNum>1 }">
            <a href="showCust.do?page=${pageInfo.pageNum-1 }">上一页</a>
          </c:if>
          <c:if test="${pageInfo.pageNum<=1 }">
            <a href="javascript:void()">上一页</a>
          </c:if>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <!-- 导航页 -->
          <c:forEach var="p" items="${ pageInfo.navigatepageNums }">
            <a href="showCust.do?page=${p }">${p }</a>
          </c:forEach>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <!-- 下一页 -->
          <c:if test="${pageInfo.pageNum<pageInfo.pages }">
            <a href="showCust.do?page=${pageInfo.pageNum+1 }">下一页</a>
          </c:if>
          <c:if test="${pageInfo.pageNum>=pageInfo.pages }">
            <a href="javascript:void()">下一页</a></c:if>
          &nbsp;&nbsp;&nbsp;
          <!-- 尾页 -->
          <a href="showCust.do?page=${pageInfo.pages }">尾页
          </a>
        </td>
      </tr>
    </tfoot>
  </table>
</body>
</html>
