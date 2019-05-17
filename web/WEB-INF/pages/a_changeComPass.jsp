<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<title>修改密码</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
<link href="${pageContext.request.contextPath}/admin/styles/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/comp.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:#E0F0FE">
	<div class="admin_main_nr_dbox">
		<div class="pagetit">
			<div class="ptit">修改密码</div>
			<div class="clear"></div>
		</div>

		<form  method="post" action="/adm/changeCompanyPass" >
			<table width="100%" border="0" cellpadding="4" cellspacing="0" style="margin-top:20px; margin-bottom:20px;" >

				<td width="150" height="30" align="right" bgcolor="#FFFFFF"  ><span style="color:#FF3300; font-weight:bold">*</span>公司名：</td>
				<td  ><input name="company_name"   class="input_text_200"   maxlength="20" /></td>
				</tr>
				<tr>
					<td height="30" align="right" bgcolor="#FFFFFF" ><span style="color:#FF3300; font-weight:bold">*</span>新密码：</td>
					<td   ><input name="c_password" type="password" class="input_text_200"  maxlength="18"  /></td>
				</tr>
				<tr>
					<td height="30" align="right" bgcolor="#FFFFFF" ><span style="color:#FF3300; font-weight:bold">*</span>再次输入新密码： </td>
					<td  ><input name="password1" type="password" class="input_text_200"  maxlength="18"  /></td>
				</tr>
				<tr>
					<td height="30" align="right" bgcolor="#FFFFFF"  >&nbsp;</td>
					<td ><input type="submit" name="Submit" value="确定修改"  class="user_submit" /></td>
				</tr>
			</table>
		</form>

		<table width="100%" border="0" cellspacing="10" cellpadding="0"
			class="admin_list_btm">

		</table>
		<div class="page link_bk">

			<div class="clear"></div>
		</div>
	</div>
</body>
</html>
