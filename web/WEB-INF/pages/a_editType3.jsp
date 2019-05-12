<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
<title> Powered by </title>
<link href="${pageContext.request.contextPath}/admin/styles/common.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:#E0F0FE">
<div class="admin_main_nr_dbox">
 <div class="pagetit">
	<div class="ptit"> 个人会员</div>
  <div class="clear"></div>
 </div>

  <form id="form1" name="form1" method="post" action="">
  <input type="hidden"  name="hiddentoken" value="b12c90e3" />
  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="list" class="link_lan">
    <tr>
        <td align="center" width="20%" class="admin_list_tit">类别id</td>
	    <td  align="center"   class="admin_list_tit">类别名</td>
		<td  align="center"   class="admin_list_tit">父类名</td>
		<td    align="center"   class="admin_list_tit">修改</td>
		<td    align="center"   class="admin_list_tit">删除</td>
    </tr>
	  <c:forEach var="m" items="${types}">
	  <tr>
		  <td align="center" class="admin_list">${m.p3}</td>
          <td name="pname" align="center" class="admin_list">${m.pname}</td>
		  <td name="pname" align="center" class="admin_list">${m.p2name}</td>

		  <td align="center" class="admin_list">
			  <a href="/adm/changType3Pre?p3=${m.p3}&p2=${p2}">修改</a>
		  </td>

		  <td align="center" class="admin_list">
			  <a href="/adm/delType3ByP3?p3=${m.p3}&p2=${p2}" >删除</a>
		  </td>

      </tr>
	  </c:forEach>
  </table>
  </form>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" class="admin_list_btm">
        <tr>
        <td width="305" align="right">
			<form  method="get" action="/adm/addtype3">
				<div class="seh">
					<div class="keybox">
						<input name="pname" type="text"   value="" />
					</div>
					<input type="hidden" name = "p2" value="${p2}"/>
					<div class="selbox">
						<input  type="text" value="类别名" readonly="true"/>
					</div>
					<div class="sbtbox">
						<input type="submit"  class="sbt" id="sbt" value="添加"/>
					</div>
					<div class="clear"></div>
				</div>
			</form>
	    </td>
      </tr>

  </table>


</div>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>