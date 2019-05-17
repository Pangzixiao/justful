<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UYF-8" />
<title>我的申请</title>
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

</div>
<table width="985" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:8px;" >
  <tr>
      <td width="173" valign="top" class="link_bk">
          <jsp:include page="${pageContext.request.contextPath}/u_left.jsp"></jsp:include>
      </td>
      <td valign="top" class="link_lan">
          <div class="com_user_box">
              <div class="titbox"><div class="lefttit"><u>申请管理</u></div>
                  <div class="rightip"></div>
                  <div class="clear"></div>
              </div>
              <div class="com_user_box" style="margin-top:10px;">
                  <div class="titbox">
                      <div class="lefttit">

                      </div>
                      <div class="rightip"></div>
                      <div class="clear"></div>
                  </div>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  class="link_lan">
                      <tr>
                          <td width="15%" height="28"  class="us_list_title" style="padding-left:10px;">职位名称</td>
                          <td width="15%" height="28"  class="us_list_title" style="padding-left:10px;">所属企业</td>
                          <td  width="15%"  class="us_list_title">工作地区</td>
                          <td width="10%"  class="us_list_title">月薪</td>
                          <td width="10%" align="center" class="us_list_title">申请状态</td>
                          <td width="10%" align="center" class="us_list_title">职位状态</td>
                          <td width="10%" align="center" class="us_list_title">该公司其他职位</td>
                      </tr>
                      <tbody>
                      <c:forEach var="m" items="${info.list}">
                      <tr>
                          <td width="15%"  height="28" class="us_list" style="padding-left:10px;"> ${m.p_name}</td>
                          <td width="15%"  height="28" class="us_list" style="padding-left:10px;">${m.p_cname}</td>
                          <td  width="15%"  class="us_list">${m.p_address}</td>
                          <td width="10%"  class="us_list">${m.salary}</td>
                          <td width="10%" align="center" class="us_list">${m.apply_status}</td>
                          <td width="10%" align="center" class="us_list">${m.position_status}</td>
                          <td width="10" align="center" class="us_list">
                              该公司其他职位
                          </td>
                      </tr>
                      </c:forEach>
                      </tbody>
                  </table>
                  <table border="0" align="center" cellpadding="0" cellspacing="0" class="link_bk">
                      <tr>
                          <td height="50" align="center">
                              <div class="page link_bk">
                                  <a href="${pageContext.request.contextPath}/user/showMyoutdateApply">首页</a>

                                  <c:if test="${info.pageNum <= 1}">
                                      <a href="javascript:void(0)">上一页</a>
                                  </c:if>

                                  <c:if test="${info.pageNum > 1}">
                                      <a href="${pageContext.request.contextPath}/user/showMyoutdateApply?page=${info.pageNum -1}">上一页</a>
                                  </c:if>

                                  <c:if test="${info.pageNum >= info.pages}">
                                      <a href="javascript:void(0)">下一页</a>
                                  </c:if>

                                  <c:if test="${info.pageNum < info.pages}">
                                      <a href="${pageContext.request.contextPath}/user/showMyoutdateApply?page=${info.pageNum +1}">下一页</a>
                                  </c:if>
                                  <a  href="${pageContext.request.contextPath}/user/showMyoutdateApply?page=${info.pages}">尾页</a>
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