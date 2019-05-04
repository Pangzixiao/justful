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
当前位置：<a href="//">首页</a>&nbsp;>>&nbsp;<a href="personal_index.php">会员中心</a> 
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
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="5" >
            <tr>
              <td width="120">
			  <table border="0" cellpadding="0" cellspacing="1" bgcolor="#CDE6F3" style="margin:3px; padding:3px;" >
                <tr>
                  <td bgcolor="#FFFFFF"  >
				  <div style=" position:relative"  id="show_avatars_url">
				  <a href="">
				  <img src="${pageContext.request.contextPath}/images/no_photo.gif" border="0"  width="100" height="100" /></a>
				  <div class="avatars_edit">修改头像</div>
				  </div>				  </td>
                </tr>
              </table>			  </td>
              <td valign="top">
			  
			  <table width="100%" border="0" cellspacing="0" cellpadding="0"  style="color:#666666">
                <tr>

                </tr>

              </table></td>
              <td width="150" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td  style="padding-top:15px;"><a href=""><img src="${pageContext.request.contextPath}/images/83.gif" alt="创建简历"  border="0"  /></a></td>
                </tr>
                <tr>
                  <td style="padding-top:15px;"><a href=""><img src="${pageContext.request.contextPath}/images/82.gif" alt="管理简历"  border="0"  /></a></td>
                </tr>
              </table></td>
              
          </tr>
      </table>	
</div>
	
<div class="com_user_box" style="margin-top:10px;">
  <div class="titbox">
  	<div class="lefttit"><u>您可能感兴趣的职位</u></div>
	<div class="rightip"><a href=""  target="_blank">更多</a></div>
	<div class="clear"></div>
  </div>
  
  	  																								 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  class="link_lan">
                        <tr>
                          <td width="150" height="28" class="us_list_title" style="padding-left:10px;">职位名称</td>
                          <td class="us_list_title">公司名称</td>
                          <td width="120" align="center" class="us_list_title">薪资</td>
                          <td width="120" align="center" class="us_list_title">更新日期</td>
                        </tr>
					  </table>
				
											  			<div class="us_list_no_content">没有匹配的信息</div><br />
		  
</div>
	
	</td>
  </tr>
</table>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>