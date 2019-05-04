<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<title>招聘公司名 - 职位列表 - 人才系统</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
<link href="${pageContext.request.contextPath}/admin/styles/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/comp.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:#E0F0FE">
	<script type="text/javascript" src="js/jquery.userinfotip-min.js"></script>
	<div class="admin_main_nr_dbox">
		<div class="pagetit">
			<div class="ptit">企业管理</div>
			<div class="clear"></div>
		</div>

		<form  method="post"
			action="">
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				id="list" class="link_lan">
				<tr>
					<td align="center" class="admin_list_tit">公司id</td>
					<td align="center" class="admin_list_tit">公司名称</td>
					<td align="center" class="admin_list_tit">公司类型</td>
                    <td align="center" class="admin_list_tit">审核类型</td>
					<td align="center" width="12%" class="admin_list_tit">注册时间</td>
					<td align="center" class="admin_list_tit">删除</td>
					<td align="center" class="admin_list_tit">详细信息</td>
					<td align="center" class="admin_list_tit">通过审核</td>
				</tr>
				<c:forEach var="m" items="${info.list}">
				<tr>

					<td align="center" class="admin_list">${m.company_id}</td>
					<td align="center" class="admin_list">${m.company_name}</td>
					<td align="center" class="admin_list"><span style="color: #999999">${m.c_type}</span>
					</td>
                    <td align="center" class="admin_list"><span style="color: #999999">${m.check_type}</span>
                    </td>
					<td align="center" class="admin_list">${m.regist_date}</td>
					<td width="8%" align="center" class="admin_list"><a
							href="/adm/deleteCompanyById?id=${m.company_id}">删除</a> </td>
					<td width="8%" align="center" class="admin_list"> <a
						href="/adm/queryCompanyById?id=${m.company_id}" >详细信息</a></td>
					<td width="8%" align="center" class="admin_list"> <a
							href="/adm/checkCompanyById?id=${m.company_id}">通过审核</a></td>
				</tr>
				</c:forEach>
			</table>
			<span id="OpAudit"></span> <span id="OpDel"></span> <span
				id="Oprefresh"></span>
		</form>

		<table width="100%" border="0" cellspacing="10" cellpadding="0"
			class="admin_list_btm">
			<tr>
				<td width="305" align="right">
					<form id="formseh" name="formseh" method="get" action="/adm/mutiQueryCompany">
						<div class="seh">
							审核类型<select name = check_type>
							<option value="已审批">已审批</option>
							<option value="未审批">未审批</option>
							<option value="">所有</option>
						</select>
						</div>

						<div class="seh">
							<div class="keybox">
								<input name="key" type="text" value="" />
							</div>
							<div class="selbox">
								<input name="key_type_cn" id="key_type_cn" type="text"
									value="公司名" readonly="true" />
							</div>
							<div class="sbtbox">
								<input  type="hidden" value="company_list" /> <input
									type="submit" name="" class="sbt" id="sbt" value="搜索" />
							</div>
							<div class="clear"></div>
						</div>
					</form>
				</td>
			</tr>
		</table>
		<div class="page link_bk">
			<a href="${pageContext.request.contextPath}/adm/queryCompanys">首页</a>

			<c:if test="${info.pageNum <= 1}">
				<a href="javascript:void(0)">上一页</a>
			</c:if>

			<c:if test="${info.pageNum > 1}">
				<a href="${pageContext.request.contextPath}/adm/queryCompanys?page=${info.pageNum -1}">上一页</a>
			</c:if>

			<c:if test="${info.pageNum >= info.pages}">
				<a href="javascript:void(0)">下一页</a>
			</c:if>

			<c:if test="${info.pageNum < info.pages}">
				<a href="${pageContext.request.contextPath}/adm/queryCompanys?page=${info.pageNum +1}">下一页</a>
			</c:if>
			<a  href="${pageContext.request.contextPath}/adm/queryCompanys?page=${info.size}">尾页</a>
			<div class="clear"></div>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />
</body>
</html>
