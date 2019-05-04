<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>会员登录 - 人才系统</title>
<base href="${base}" />
<link rel="shortcut icon" href="../../favicon.ico" />
<link href="${pageContext.request.contextPath}/styles/user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

<div class="login_bg">
	<div class="login_box">
			  <div class="login_boxin">
			<form  action="/user/login"  method="post">
			<div class="tit">我要找工作</div>
		  <div class="login_err"></div>
			<table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
			 
			<tr><td width="55" align="right" id="account">帐号：</td>
			<td>
			  <input name="username" type="text"    maxlength="30" value="用户名" style="color:#999999"/>    </td>
		  </tr>
		  <tr>
			<td align="right">密码：</td>
			<td>
			  <input name="password" type="password"  class="login_input" id="password"  maxlength="20"/>    </td>
		  </tr>
		  		  <tr>
			<td align="right">&nbsp;</td>
			<td><div style="position:relative;"><label><input type="checkbox" name="expire" id="expire" value="7" />
			  一周内自动登录</label></div></td>
		  </tr>
		  </table>
		  		  <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >  
		  <tr>
			<td align="right" width="50">&nbsp;</td>
			<td height="40" valign="top">
			<div style="position:relative;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td width="100">
				<input type="submit" name="submitlogin"  id="login" class="but80" value="登录" />
				</td>
				<td class="link_bk"><a href="">忘记密码？</a></td>
			  </tr>
			</table>
			</div>
			</td>
			</tr>
		  <tr>
			<td align="right" style="border-top:1px  #E8E8E8 solid">&nbsp;</td>
			<td height="20" class="link_lan" style="border-top:1px  #E8E8E8 solid">还没有账号？<a href="users/register.jsp">免费注册</a></td>
		  </tr>
		  		</table>
		</form>
		</div>
  </div>
  <div class="clear"></div>
</div>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
