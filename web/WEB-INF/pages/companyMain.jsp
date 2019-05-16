<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <base href="${base}"/>
    <meta charset="UTF-8"/>
    <title>企业会员中心 - 人才系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/styles/user.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<!--导航 -->
<div class="floatnav">
    <jsp:include page="${pageContext.request.contextPath}/c_nav.jsp"></jsp:include>
</div>
<!--导航end -->
<div class="page_location link_bk">
    当前位置：首页&nbsp;>>&nbsp;会员中心
</div>
<table width="985" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:8px;">
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
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="5">
                    <tr>
                        <td width="120">
                            <table border="0" cellpadding="0" cellspacing="1" bgcolor="#CDE6F3"
                                   style="margin:3px; padding:3px;">
                                <tr>
                                    <td bgcolor="#FFFFFF">
                                        <div style=" position:relative" id="show_avatars_url">

                                                <img src="${pageContext.request.contextPath}/images/default.jpg" border="0" width="100" height="100"/>

                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">

                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="color:#666666">

                                <tr>
                                    <td style=" padding-top:12px;" class="butimglink">


                                </tr>

                            </table>
                        </td>
                        <td width="180" valign="top">
                            <table width="100%" border="0" cellspacing="16" cellpadding="0">
                                <tr>
                                    <td><a href="/company/addPosition"><img
                                            src="${pageContext.request.contextPath}/images/71.gif" alt="发布职位"
                                            border="0"/></a></td>
                                </tr>
                                <tr>
                                    <td><a href="/company/queryPositionInfoByCom"><img
                                            src="${pageContext.request.contextPath}/images/81.gif" alt="管理职位"
                                            border="0"/></a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="com_user_box" style="margin-top:10px;">
                <div class="titbox">
                    <div class="lefttit"><u>企业信息</u></div>
                    <div class="rightip"></div>
                    <div class="clear"></div>
                </div>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="9">
                    <tr>
                        <td>公司名称：${info.company_name}</td>
                        <td>企业性质：${info.c_type}</td>
                        <td>公司规模：${info.c_scale}</td>
                    </tr>
                    <tr>
                        <td>联系电话：${info.c_phone}</td>
                        <td>公司官网：${info.c_websize}</td>
                    </tr>
                    <tr>

                        <td>通讯地址：${info.c_address}</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>


</body>
</html>
