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
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/messages_zh.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/additional-methods.js"></script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

<div class="login_bg">
	<div class="login_box">
			  <div class="login_boxin">
			<form id="Formlogin" action="/adm/login" name="Formlogin" method="post">
			<div class="tit">管理员登录</div>
		  <div class="login_err"></div>
			<table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" >
			 
			<tr><td width="55" align="right" id="account">帐号：</td>${msg}
			<td>
			  <input name="username" type="text"  class="login_input" id="username"   maxlength="30" value="用户名" style="color:#999999"/>    </td>
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

			  </tr>
			</table>
			</div>
			</td>
			</tr>

		  		</table>
		</form>
		</div>
  </div>
  <div class="clear"></div>
</div>
<script>

    $().ready(function() {

        $("#Formlogin").validate({

            rules: {

                username: {

                    required: true

                },
                password: {

                    required: true,

                    minlength: 6

                }
            },

            messages: {

                username: {

                    required: "用户名不能为空"

                },
                password: {

                    required: "密码不能为空",

                    minlength: "密码长度不能小于6位"

                }

            }

        });

    });

</script>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
