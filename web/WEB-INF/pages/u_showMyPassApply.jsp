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
<script type="text/javascript">
$(document).ready(function()
{
	$("#tabshow li:nth-child(1)>a").addClass("selected");

	$("#show_avatars_url").mouseover(function() {
		$(".avatars_edit").show();
		$("#show_avatars_url").mouseout(function() {
		$(".avatars_edit").hide();
		});
	});
dialog("系统提示","text:<div style=\" height:150px; font-size:14px;line-height:400%;font-weight:bold;text-align:center\">您还没有创建简历，建议您立即创建简历，让好工作找上门！<br/><a href=\"personal_resume.php?act=make1\"><img src=\"//templates/default/images/83.gif\" alt=\"创建简历\"  border=\"0\"  /></a></div>","500px","auto","");

});
</script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<!--导航 -->
<div class="floatnav">
 <jsp:include page="${pageContext.request.contextPath}/nav.jsp"></jsp:include>
</div>
<!--导航end -->
<script type="text/javascript">
$(document).ready(function()
{
	var nav=$(".floatnav");
	var headHeight=nav.height()+45;
	$(window).scroll(function()
	{
	if($(this).scrollTop()>headHeight)
	{
	nav.addClass("navFix");
	}
	else
	{
	nav.removeClass("navFix");
	}
	});
});
</script><div class="page_location link_bk">
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
                      <div class="lefttit"><u>我的申请</u></div>
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
                          <td width="15%"  height="28" class="us_list" style="padding-left:10px;"><a href="/user/queryPositionById?position_id=${m.position_id}"> ${m.p_name}</a></td>
                          <td width="15%"  height="28" class="us_list" style="padding-left:10px;"><a href="/user/queryCompanyById?company_id=${m.company_id}">${m.p_cname}</td>
                          <td  width="15%"  class="us_list">${m.p_address}</td>
                          <td width="10%"  class="us_list">${m.salary}</td>
                          <td width="10%" align="center" class="us_list">${m.apply_status}</td>
                          <td width="10%" align="center" class="us_list">${m.position_status}</td>
                          <td width="10" align="center" class="us_list">
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
                                  <a href="${pageContext.request.contextPath}/user/myPassApplay">首页</a>

                                  <c:if test="${info.pageNum <= 1}">
                                      <a href="javascript:void(0)">上一页</a>
                                  </c:if>

                                  <c:if test="${info.pageNum > 1}">
                                      <a href="${pageContext.request.contextPath}/user/myPassApplay?page=${info.pageNum -1}">上一页</a>
                                  </c:if>

                                  <c:if test="${info.pageNum >= info.pages}">
                                      <a href="javascript:void(0)">下一页</a>
                                  </c:if>

                                  <c:if test="${info.pageNum < info.pages}">
                                      <a href="${pageContext.request.contextPath}/user/myPassApplay?page=${info.pageNum +1}">下一页</a>
                                  </c:if>
                                  <a  href="${pageContext.request.contextPath}/user/myPassApplay?page=${info.pages}">尾页</a>
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
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>