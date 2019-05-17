<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UYF-8" />
<title>个人会员中心 - 人才系统</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
<link href="${pageContext.request.contextPath}/styles/user.css" rel="stylesheet" type="text/css" />

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
<table width="985" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:8px;" >
  <tr>
      <td width="173" valign="top" class="link_bk">
          <jsp:include page="${pageContext.request.contextPath}/u_left.jsp"></jsp:include>
      </td>
      <td valign="top" class="link_lan">
          <div class="com_user_box">
              <div class="titbox">
                  <div class="clear"></div>
              </div>
              <div class="com_user_box" style="margin-top:10px;">
                  <div class="titbox">
                      <div class="lefttit"><u>您可能感兴趣的职位</u></div>
                      <div class="rightip"></div>
                      <div class="clear"></div>
                  </div>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  class="link_lan">
                      <tr>
                          <td width="150" height="28" class="us_list_title" style="padding-left:10px;">职位名称</td>
                          <td width="150" height="28" class="us_list_title" style="padding-left:10px;">公司名</td>
                          <td  height="28" class="us_list_title">工作地区</td>
                          <td width="120" align="center" class="us_list_title">薪资</td>
                          <td width="120" align="center" class="us_list_title">申请</td>
                          <td width="120" align="center" class="us_list_title">该公司其他职位</td>
                      </tr>
                      <tbody>
                      <c:forEach var="m" items="${info.list}">
                      <tr>
                          <td width="150" height="28" class="us_list" style="padding-left:10px;"><a href="/user/queryPositionById?position_id=${m.position_id}"> ${m.p_name}</a></td>
                          <td width="150" height="28" class="us_list" style="padding-left:10px;"><a href="/user/queryCompanyById?company_id=${m.company_id}">${m.p_cname}</td>
                          <td  height="28" class="us_list">${m.p_address}</td>
                          <td width="120" align="center" class="us_list">${m.salary}</td>
                          <td width="120" align="center" class="us_list">
                              <a href="/user/applyPositionById?position_id=${m.position_id}">申请</a>
                          </td>
                          <td width="120" align="center" class="us_list">
                              <a href="/user/queryPositionsByCompanyId?company_id=${m.company_id} ">该公司其他职位</a>
                          </td>
                      </tr>
                      </c:forEach>
                      </tbody>
                  </table>
                  <table border="0" align="center" cellpadding="0" cellspacing="0" class="link_bk">
                      <tr>
                          <td height="50" align="center">
                              <div class="page link_bk">
                                  <a href="${pageContext.request.contextPath}/user/findPositionPage">首页</a>

                                  <c:if test="${info.pageNum <= 1}">
                                      <a href="javascript:void(0)">上一页</a>
                                  </c:if>

                                  <c:if test="${info.pageNum > 1}">
                                      <a href="${pageContext.request.contextPath}/user/findPositionPage?page=${info.pageNum -1}">上一页</a>
                                  </c:if>

                                  <c:if test="${info.pageNum >= info.pages}">
                                      <a href="javascript:void(0)">下一页</a>
                                  </c:if>

                                  <c:if test="${info.pageNum < info.pages}">
                                      <a href="${pageContext.request.contextPath}/user/findPositionPage?page=${info.pageNum +1}">下一页</a>
                                  </c:if>
                                  <a  href="${pageContext.request.contextPath}/user/findPositionPage?page=${info.pages}">尾页</a>
                                  当前是${info.pageNum}页
                                  <div class="clear"></div>
                              </div>
                          </td>
                      </tr>
                  </table>

                  </div>
              </div>
      </td>
  </tr>
</table>
</body>
</html>