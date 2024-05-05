<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>客户信息修改</title>
        <style>
            .container{
                width: 300px;
                margin: 0 auto;
            }
            h1,th,td{
                text-align: center;
            }
            .update{
                margin-left: 40%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>修改客户信息</h1>
            <c:forEach items="${list }" var="cus">
                <form action="${pageContext.request.contextPath}/updateCustomer.do" method="post">
                    客户编号：&emsp;&emsp;
                    <input type="text" name="customerId" value="${cus.customerId }" readonly="readonly"/>
                    <br><br>
                    客户姓名：&emsp;&emsp;
                    <input type="text" name="customerName" value="${cus.customerName }"/>
                    <br><br>
                    负责人姓名：&emsp;
                    <input type="text" name="userName" value="${cus.userName }"/>
                    <br><br>
                    客户来源：&emsp;&emsp;
                    <input type="text" name="source" value="${cus.source }"/>
                    <br><br>
                    客户所属行业：
                    <input type="text" name="industry" value="${cus.industry }"/>
                    <br><br>
                    创建日期：&emsp;&emsp;
                    <input type="text" name="createDate" value="${cus.createDate }"/>
                    <br><br>
                    <input type="submit" value="修改" class="update"/>
                </form>
            </c:forEach>
        </div>
    </body>
</html>