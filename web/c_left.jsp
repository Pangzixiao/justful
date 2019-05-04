<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="left_menu_home"><a href="/company/getIndex" style="color:#990000">中心首页</a>
<a href="/company/showCompanyInfo" style="color:#990000" target="_blank">预览企业</a>
</div>
<div class="left_menu_box" id="index">
	<div class="left_menu_bg">
		<div class="left_menu_tit">职位管理</div>
		<div class="left_menu_img"><img src="${pageContext.request.contextPath}/images/07.gif"  border="0" /></div>
		<div class="clear"></div>
	</div>
	<div class="left_menu_btop">
	<ul>
			<li><a href="/company/addPosition" >发布职位</a></li>
			<li><a href="/company/queryPositionInfoByCom">职位管理</a></li>
			<div class="clear"></div>		
	  </ul>
	</div>
</div>



<div class="left_menu_box" id="recruitment">
<div class="left_menu_bg">
	<div class="left_menu_tit">招聘管理</div>
	<div class="left_menu_img"><img src="${pageContext.request.contextPath}/images/07.gif"  border="0" /></div>
	<div class="clear"></div>
</div>
<div class="left_menu_btop">
<ul>
		<li><a href="company/resume_received.jsp">收到的简历</a></li>
		<div class="clear"></div>
	</ul>
</div>
</div>

<div class="left_menu_box" id="info">
<div class="left_menu_bg">
	<div class="left_menu_tit">公司信息</div>
	<div class="left_menu_img"><img src="${pageContext.request.contextPath}/images/07.gif"  border="0" /></div>
	<div class="clear"></div>
</div>
<div class="left_menu_btop">
		<ul>
		<li><a href="/company/showCompanyInfo">基本信息</a></li>
		<li><a href="/company/queryCompanyInfo">完善信息</a></li>
		<div class="clear"></div>
		</ul>
</div>
</div>	
<div class="left_menu_box" id="user" style="border-bottom:1px;">
	<div class="left_menu_bg">
		<div class="left_menu_tit">账户管理</div>
		<div class="left_menu_img"><img src="${pageContext.request.contextPath}/images/07.gif"  border="0" /></div>
		<div class="clear"></div>
	</div>
	<div class="left_menu_btop">
		<ul>
		<li><a href="company/user_password.jsp">密码修改</a></li>
		<li><a href="users/logout.jsp">安全退出</a></li>
		<div class="clear"></div>
		</ul>
	</div>
</div>	