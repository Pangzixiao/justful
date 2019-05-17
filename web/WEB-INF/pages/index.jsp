<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>人才系统</title>
	<base href="${base}" />
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
	<link href="${pageContext.request.contextPath}/styles/common.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/styles/default.css" rel="stylesheet" type="text/css" />
</head>
<body>

<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<!--导航 -->
<div class="floatnav">

</div>
<!--导航end -->
<div class="page_location link_bk">

</div>
<div class="d1">
	<div class="left">
		<div class="box">
			<div class="tit">
				<h3>搜索职位</h3>
				<div class="clear"></div>
			</div>
			<div class="search">
				<div class="left">
					<div class="keybox">
						<div class="keyinputbox">
							<input name="key" type="text" id="index-search-key"
								   maxlength="25" value="" style="color: #CCCCCC" />
						</div>
						<div class="subinputbox">
							<input type="button" id="index-search-button" value="搜职位" />
						</div>
						<div class="clear"></div>
					</div>
					<div class="hotkey link_bk">
						热门关键字：<a href="jobs/jobs_list.jsp" target="_blank">销售代表</a>
						&nbsp;&nbsp;&nbsp;<a href="" target="_blank">销售经理</a>
						&nbsp;&nbsp;&nbsp;<a href="" target="_blank">会计</a>
						&nbsp;&nbsp;&nbsp;<a href="" target="_blank">销售工程师</a>
						&nbsp;&nbsp;&nbsp;<a href="" target="_blank">销售助理</a>&nbsp;&nbsp;&nbsp;
					</div>
				</div>
				<div class="right link_orange">
					<div class="tipbox">
						<a href="jobs/jobs_list.jsp" target="_blank">最近更新职位</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="right">


		<div class="clear"></div>
	</div>
	<div class="clear"></div>
</div>

</body>
</html>