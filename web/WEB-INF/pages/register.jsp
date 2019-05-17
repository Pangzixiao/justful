<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<title>会员注册 - 人才系统</title>
<link rel="shortcut icon" href="favicon.ico" />
<link href="${pageContext.request.contextPath}/styles/user.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/header.jsp" />
	<div class="reg_box">
		<div class="reg_box_tit">
			<strong>您要注册成为哪种会员？</strong>
		</div>

		<div class="item">
			<table width="100%" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td width="100" align="right"><img
						src="images/39.png" border="0" />
					</td>
					<td class="itemtit">注册企业会员</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="itemtxt">发布招聘信息<br />  查看简历 <br />
						邀请面试<br />......</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td height="50"><input type="button" name="Submit" id="login"
						class="but100" value="免费注册"
						onclick="window.location='/c_regist'" />
					</td>
				</tr>
			</table>
		</div>
		<div class="item" style="border-right:0px;">
			<table width="100%" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td width="100" align="right"><img
						src="images/40.png" border="0" />
					</td>
					<td class="itemtit">注册个人会员</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="itemtxt">创建简历<br /> 搜索职位<br /> 在线申请职位 <br />
						......</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td height="50"><input type="button" name="Submit" id="login"
						class="but100" value="免费注册"
						onclick="window.location='/u_regist'" />
					</td>
				</tr>
			</table>
		</div>
		<div class="clear"></div>
	</div>
</body>
</html>
