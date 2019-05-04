<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//templates/default/js/jquery.dialog.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function()
{
//
$("#preview").click(function(){
	dialog("请选择要预览的简历","id:previewbox","400px","auto","");
});
$(".left_menu_bg").click(function(){
		var tb=$(this).next();
		var tb_display=tb.css("display");
		if (tb_display=="block")
		{
		tb.css("display","none");
		$(this).find("img").attr("src","//templates/default/images/06.gif");
		}
		else
		{
		tb.css("display","block");
		$(this).find("img").attr("src","//templates/default/images/07.gif");
		}
	});

});
</script>
<div class="left_menu_home"><a href="" style="color:#990000">中心首页</a>
<a href="" style="color:#990000" id="preview">预览简历</a>
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
			<li><a href="" target="_blank">搜索职位</a></li>
			<li><a href="">已投简历</a></li>
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
			<li><a href="">个人资料</a></li>
			<li><a href="">密码修改</a></li>
			<li><a href="">安全退出</a></li>
		<div class="clear"></div>
	  </ul>
	</div>
</div>	