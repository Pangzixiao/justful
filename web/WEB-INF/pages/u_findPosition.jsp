<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>职位检索</title>
<base href="${base}" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
<link href="${pageContext.request.contextPath}/styles/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/default.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
	<!--导航 -->
	<div class="floatnav">
		<jsp:include page="${pageContext.request.contextPath}/nav.jsp"></jsp:include>
	</div>
	<!--导航end -->
	<div class="page_location link_bk">

	</div>
	<form method="post" action="/user/findPosition">
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
								<input type="submit" id="index-search-button" value="搜职位" />
							</div>

						</div>
							<div class="clear"></div>
						</div>
					</div>

			</div>
		</div>

		<div class="clear"></div>
	</div>
	<div class="d2">
		<div class="left">
			<div class="box">
				<div class="tit">
					<h3>附加条件</h3>
					<div class="clear"></div>
				</div>
				<div class="list link_lan">
					类型1<select name="p_type1">
					<option value="">不限</option>
					<option value="技术">技术</option>
					<option value="产品">产品</option>
					<option value="设计">设计</option>
					<option value="运营">运营</option>
					<option value="销售">销售</option>
					<option value="职能">职能</option>
					<option value="其他">其他</option>
				</select>
				</div>
				<div class="list link_lan">
					类型2<select name="p_type2" >
					<option value="">不限</option>
					<option value="前端">前端</option>
					<option value="后端">后端</option>
					<option value="DBA">DBA</option>
					<option value="人工智能">人工智能</option>
					<option value="测试">测试</option>
					<option value="运维">运维</option>
					<option value="高端管理">高端管理</option>
					<option value="硬件">硬件</option>
					<option value="其他">其他</option>
				</select>
				</div>
				<div class="list link_lan">
					类型3<select name="p_type3" >
					<option value="">不限</option>
					<option value="java">java</option>
					<option value="python">python</option>
					<option value="全栈">全栈</option>
					<option value="web前端">web前端</option>
					<option value="html5">html5</option>
					<option value="flash">flash</option>
					<option value="其他">其他</option>
				</select>
				</div>
				<div class="list link_lan">
					工作地点<select name="p_address" >
					<option value="">不限</option>
					<option value="北京">北京</option>
					<option value="上海">上海</option>
					<option value="郑州">郑州</option>
					<option value="其他">其他</option>
				</select>
				</div>
				<div class="list link_lan">
					工作经验<select name="required_work" >
					<option value="">不限</option>
					<option value="无要求">无要求</option>
					<option value="有经验">有经验</option>
				</select>
				</div>
			</div>
		</div>
	</div>
	</form>
	<div class="d3">
		<div class="left">
			<div class="box">
				<div class="tit">
					<div class="tbox">
						<strong>推荐职位</strong>
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
	<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>