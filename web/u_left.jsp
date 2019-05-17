<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="left_menu_home"><a href="/user/getIndex" style="color:#990000">中心首页</a>
<a href="/user/showIntroduce" style="color:#990000" id="preview">预览简历</a>
</div>
<div id="previewbox" style="display:none">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
</table>
</div>
<div class="left_menu_box">
	<div class="left_menu_bg">
		<div class="left_menu_tit">简历管理</div>
		<div class="left_menu_img"><img src="${pageContext.request.contextPath}/images/07.gif" border="0"></div>
		<div class="clear"></div>
	</div>
	<div class="left_menu_btop">
	<ul>
			<li><a href="/user/showIntroduce">我的简历</a></li>
		<li><a href="/user/queryIntroduce">编辑旧简历</a></li>
			<div class="clear"></div>
	  </ul>
	</div>
</div>
<div class="left_menu_box">
	<div class="left_menu_bg">
		<div class="left_menu_tit">求职管理</div>
		<div class="left_menu_img"><img src="${pageContext.request.contextPath}/images/07.gif" border="0"></div>
		<div class="clear"></div>
	</div>
	<div class="left_menu_btop">
	<ul>
			<li><a href="/user/selectPositionPre" target="_blank">搜索职位</a></li>
			<li><a href="/user/showMyApplay">申请管理</a></li>
			<div class="clear"></div>
	  </ul>
		<ul>
			<li><a href="/user/showMyoutdateApply">失效申请</a></li>
			<div class="clear"></div>
		</ul>
	</div>
</div>
<div class="left_menu_box" style="border-bottom:1px;">
	<div class="left_menu_bg">
		<div class="left_menu_tit">账户管理</div>
		<div class="left_menu_img"><img src="${pageContext.request.contextPath}/images/07.gif" border="0"></div>
		<div class="clear"></div>
	</div>
	<div class="left_menu_btop">
	<ul>
			<li><a href="/u_updateInfo">密码修改</a></li>
			<li><a href="/user/layout">安全退出</a></li>
		<div class="clear"></div>
	  </ul>
	</div>
</div>	