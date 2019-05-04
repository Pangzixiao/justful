<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>人才系统</title>
<base href="${base}" />
<link rel="shortcut icon" href="favicon.ico" />
<link href="styles/common.css" rel="stylesheet" type="text/css" />
<link href="styles/default.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<!--导航 -->
	<div class="floatnav">
		<jsp:include page="nav.jsp"></jsp:include>
	</div>
	<!--导航end -->
	<div class="page_location link_bk">
		当前位置：<a href="">网站首页</a>
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
			<div class="but">
				<a href="company/job_add.jsp" target="_blank"></a> <a
					href="personal/resume_1.jsp" target="_blank" class="resumebut"></a>
			</div>

			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="d3">
		<div class="left">
			<div class="box">
				<div class="tit">
					<div class="tbox">
						<strong>推荐职位</strong>
					</div>
					<div class="morebox link_bk">
						<a href="jobs/jobs_list.jsp" target="_blank">更多职位</a>
					</div>
					<div class="clear"></div>
					<c:forEach begin="1" end="24">
						<div class="list link_lan">
							<a href="company/comp_view.jsp" target="_blank">中软国际</a><span
								style="color: #666666">(08-12)</span> <br /> <span
								style="color:#009900">聘:</span><span class="link_bk"> <a
								href="jobs/jobs_view.jsp" target="_blank">Java程序员</a>
							</span>
						</div>
					</c:forEach>

				</div>

				<div class="clear"></div>
			</div>
		</div>

		<div class="clear"></div>


	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>