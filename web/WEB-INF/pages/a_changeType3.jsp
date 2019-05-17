<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<title>修改类名</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
<link href="${pageContext.request.contextPath}/admin/styles/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/comp.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:#E0F0FE">
	<div class="admin_main_nr_dbox">
		<div class="pagetit">
			<div class="ptit">修改类名</div>
			<div class="clear"></div>
		</div>

		<form  method="post" action="/adm/updateType3" >
			<table width="100%" border="0" cellpadding="4" cellspacing="0" style="margin-top:20px; margin-bottom:20px;" >

				<td width="150" height="30" align="right" bgcolor="#FFFFFF"  ><span style="color:#FF3300; font-weight:bold">*</span>原类名：</td>
				<td  ><input name="p3name"   class="input_text_200"   maxlength="20" value="${type.pname}" /></td>
				</tr>
				<tr>
					<td height="30" align="right" bgcolor="#FFFFFF" ><span style="color:#FF3300; font-weight:bold">*</span>新类名：</td>
					<td   ><input name="pname" type="text" class="input_text_200"  maxlength="18"  /></td>
					<input type="hidden" name="p3" value="${type.p3}"/>
					<input type="hidden" name="p2" value="${p2}"/>
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
