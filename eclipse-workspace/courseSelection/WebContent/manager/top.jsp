<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>'top.jsp'</title>
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
    -->
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>
  
  <body>
  <center><img src="../images/topM.gif" border="0" usemap="#Map" />
<map name="Map">
  	<area shape="rect" coords="376,39,455,66" href="${pageContext.request.contextPath}/specialty.do?method=findAll" target="main">
	<area shape="rect" coords="461,39,544,65" href="${pageContext.request.contextPath}/course.do?method=findBySearch" target="main">
	<area shape="rect" coords="551,40,633,65" href="${pageContext.request.contextPath}/statInfo.do?method=findBySearch" target="main">
	<area shape="rect" coords="641,39,721,64" href="../updatePwd.jsp" target="main">
	<area shape="rect" coords="730,40,806,65" href="exit.jsp" target="_top">
</map></center>
  </body>
</html>
