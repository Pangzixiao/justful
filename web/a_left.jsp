<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/avicon.ico" />
<title>Powered by gxaedu</title>
<link href="${pageContext.request.contextPath}/admin/styles/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">


</script>
</head>
<body>
	<div class="admin_left_box">
		<ul>
			<li><a href="adm/getIndex"  target="mainFrame">管理中心首页</a></li>
			<li><a href="adm/type1" target="mainFrame">职位类别列表</a></li>
			<li><a href="adm/queryCompanys" target="mainFrame">企业列表 </a>
			<li><a href="adm/queryUsers" target="mainFrame">用户列表 </a></li>
			<li><a href="common/preChangeUser"  target="mainFrame">修改用户密码 </a></li>
			<li><a href="common/preChangeCom"  target="mainFrame">修改企业密码 </a></li>
		</ul>
	</div>
</body>
</html>