<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<title>企业会员中心 - 人才系统</title>
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
当前位置：<a href="//">首页</a>&nbsp;>>&nbsp;<a href="">会员中心</a>
</div>
<table width="985" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:8px;" >
  <tr>
    <td width="173" valign="top" class="link_bk">
		<jsp:include page="${pageContext.request.contextPath}/c_left.jsp"></jsp:include>
	</td>
    <td valign="top" class="link_lan">
		<div class="com_user_box">
  <div class="titbox">
  	<div class="lefttit"><u>欢迎：${info.company_name}</u>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
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
				  <img src="" border="0"  width="100" height="100" /></a>
				  <div class="avatars_edit">修改头像</div>
				  </div>				  </td>
                </tr>
              </table>			  </td>
              <td valign="top">
			  
			  <table width="100%" border="0" cellspacing="0" cellpadding="0"  style="color:#666666">

                <tr>
                  <td  style=" padding-top:12px;" class="butimglink">


                </tr>

              </table></td>
              <td width="180" valign="top"><table width="100%" border="0" cellspacing="16" cellpadding="0">
                <tr>
                  <td><a href="/company/addPosition"><img src="${pageContext.request.contextPath}/images/71.gif" alt="发布职位"  border="0"  /></a></td>
                </tr>
                <tr>
                  <td><a href="/company/queryPositionInfoByCom"><img src="${pageContext.request.contextPath}/images/81.gif" alt="管理职位"  border="0"  /></a></td>
                </tr>
              </table></td>
          </tr>
      </table>	
</div>

	<div class="com_user_box" style="margin-top:10px;">
  <div class="titbox">
  	<div class="lefttit" ><u>企业信息</u></div>
	<div class="rightip" ></div>
	<div class="clear"></div>
  </div>
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="9">
            <tr>
                <td>公司名称：${info.company_name}</td>
                <td>企业性质：${info.c_type}</td>
                <td >公司规模：${info.c_scale}</td>
            </tr>
            <tr>
                <td>联系电话：${info.c_phone}</td>
                <td >公司官网：${info.c_websize}</td>
            </tr>
            <tr>

                <td >通讯地址：${info.c_address}</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
  </div>

<div class="footer">
<div class="link_bk"><a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://localhost');" href="javascript:">设为首页</a>&nbsp;|&nbsp;<a href="javascript:" onclick="window.external.addFavorite(parent.location.href,document.title);">加入收藏</a>
&nbsp;|&nbsp;<a href="//explain/explain-show.php?id=1" target="_blank">自定义栏目</a>&nbsp;|&nbsp;<a href="//explain/explain-show.php?id=2" target="_blank">自定义栏目</a></div>
<div class="link_bk">
联系地址：00省00市00路00号0大厦00楼 联系电话：000-00000000 网站备案：<a href="http://www.miibeian.gov.cn/" target="_blank">icp000000000</a>  </div>
<div class="link_bk">Copyright @ 2010 .com All Right Reserved </div>
<div class="link_bk" style="font-size:10px;"> Powered by <a href="http://www..com/" target="_blank" style="color:#009900"><em>  v3.3</em></a></div>
</div>
</body>
</html>
