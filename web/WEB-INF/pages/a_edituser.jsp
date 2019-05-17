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
        <td align="center" width="20%" class="admin_list_tit">用户id</td>
	    <td  align="center"   class="admin_list_tit">用户名</td>
	    <td    align="center"   class="admin_list_tit">联系方式</td>
		<td    align="center"   class="admin_list_tit">审核类型</td>
		<td    align="center"   class="admin_list_tit">注册时间</td>
        <td   align="center"   class="admin_list_tit">删除</td>
		<td   align="center"   class="admin_list_tit">审核</td>
      <td width="13%"  align="center"  class="admin_list_tit" >查看简历</td>
    </tr>
	  <c:forEach var="m" items="${info.list}">
	  <tr>
		  <td align="center" class="admin_list">${m.user_id}</td>
          <td align="center" class="admin_list">${m.username}</td>
          <td align="center" class="admin_list">${m.tel}</td>
		  <td align="center" class="admin_list">${m.check_type}</td>
		  <td align="center" class="admin_list">${m.regist_date}</td>
		    
        <td align="center" class="admin_list">
		<a href="/adm/deleteUserById?id=${m.user_id}">删除</a>
		</td>
		  <td align="center" class="admin_list">
			  <a href="/adm/checkUserById?id=${m.user_id}">审核</a>
		  </td>
		<td align="center" class="admin_list">
		<a href="/adm/showIntroduce?id=${m.user_id}" >查看简历</a>
		</td>
      </tr>
	  </c:forEach>
  </table>
  </form>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" class="admin_list_btm">

        <td width="305" align="right">
		<form  method="get" action="/adm/mutilqueryUsers">

			<div class="seh">
				审核类型<select name = check_type>
				<option value="已审核">已审核</option>
				<option value="未审核">未审核</option>
				<option value="">所有</option>
			</select>
			</div>
			<div class="seh">
			    <div class="keybox">
					<input name="username" type="text"   value="" />
				</div>
			    <div class="selbox">
					<input  type="text" value="用户名" readonly="true"/>
				</div>
				<div class="sbtbox">
				    <input type="submit"  class="sbt" id="sbt" value="搜索"/>
				</div>
				<div class="clear"></div>
		  </div>
		  </form>
	    </td>
      </tr>
  </table>

    <div class="page link_bk">
		<a href="${pageContext.request.contextPath}/adm/mutilqueryUsers?check_type=${check_type}&username=${username}">首页</a>
		<c:if test="${info.pageNum <= 1}">
			<a href="javascript:void(0)">上一页</a>
		</c:if>

		<c:if test="${info.pageNum > 1}">
			<a href="${pageContext.request.contextPath}/adm/mutilqueryUsers?page=${info.pageNum -1}&check_type=${check_type}&username=${username}">上一页</a>
		</c:if>

		<c:if test="${info.pageNum >= info.pages}">
			<a href="javascript:void(0)">下一页</a>
		</c:if>

		<c:if test="${info.pageNum < info.pages}">
			<a href="${pageContext.request.contextPath}/adm/mutilqueryUsers?page=${info.pageNum +1}&check_type=${check_type}&username=${username}">下一页</a>
		</c:if>
		<a  href="${pageContext.request.contextPath}/adm/mutilqueryUsers?page=${info.pages}&check_type=${check_type}&username=${username}">尾页</a>
	</div>
</div>
</body>
</html>