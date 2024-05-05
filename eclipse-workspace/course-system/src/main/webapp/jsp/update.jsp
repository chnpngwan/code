<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改</title>
</head>
<body>
	<div>
		<h1>修改课程信息</h1>
		<form action="update.do" method="post">
		<label>
			课程编码：<input type="text" name="id" value="${ courseByIdList.id }">
		</label><br/><br/>
		<label>
			课程名称：<input type="text" name="name" value="${ courseByIdList.name }">
		</label><br/><br/>
		<label>
			课程类型：
				<c:if test="${ courseByIdList.type=='公共课' }">
					<input type="radio" class="type" name="type" value="公共课" checked="checked"/>公共课
					<input type="radio" class="type" name="type" value="专业课" />专业课
				</c:if>
				<c:if test="${ courseByIdList.type=='专业课' }">
					<input type="radio" class="type" name="type" value="公共课" />公共课
					<input type="radio" class="type" name="type" value="专业课" checked="checked"/>专业课
				</c:if>
		</label><br/><br/>
		<label>
			课程学分：<input type="text" name="credit" value="${ courseByIdList.credit }">
		</label><br/><br/>
		<label>
			课程学时：<input type="text" name="class_hour" value="${ courseByIdList.class_hour }">
		</label><br/><br/>
		<input type="submit" value="修改" />
		</form>
	</div>
</body>
</html>