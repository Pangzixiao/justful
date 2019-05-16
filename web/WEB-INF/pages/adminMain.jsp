<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
<title>网站后台管理中心</title>
<link href="${pageContext.request.contextPath}/styles/common.css" rel="stylesheet" type="text/css" />
</head>
</head>
<frameset rows="70,*" frameborder="no" border="0" framespacing="0" >
        <frame src="${pageContext.request.contextPath}/a_header.jsp" name="topFrame" id="topFrame" scrolling="no" frameborder="NO" border="0" framespacing="0">
        <frameset cols="200,*"  name="bodyFrame" id="bodyFrame" frameborder="no" border="0" framespacing="0">
            <frame src="${pageContext.request.contextPath}/a_left.jsp" name="leftFrame" frameborder="no" scrolling="no" noresize id="leftFrame">
            <frame src="${pageContext.request.contextPath}/a_body.jsp" name="mainFrame" frameborder="no" scrolling="auto" noresize id="mainFrame">
        </frameset>
</frameset>
    <noframes>
        <body>你的浏览器不支持框架</body>
    </noframes>
</html>