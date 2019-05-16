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

</div>
<table width="985" border="0" align="center" cellpadding="0"
       cellspacing="0" style="margin-top:8px;">
    <tr>
        <td width="173" valign="top" class="link_bk">
            <jsp:include
                    page="${pageContext.request.contextPath}/c_left.jsp"></jsp:include>
        </td>
        <td valign="top">
            <div class="user_right_box">
                <div class="user_right_top_tit_bg">
                    <h1> <a href="/company/queryPositionInfoByCom"> 所有职位</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="/company/queryPositionInfoByCom?p_state=有效"> 有效的职位</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="/company/queryPositionInfoByCom?p_state=失效"> 失效的职位</a></h1>
                </div>

                <form id="form1" name="form1" method="post"
                      action="">
                    <table width="100%" border="0" align="center" cellpadding="0"
                           cellspacing="0" bgcolor="#FFFFFF" class="link_lan">
                        <tr>
                            <td align="center" class="us_list_title">职位id</td>
                            <td align="center" class="us_list_title">职位名称</td>
                            <td align="center" class="us_list_title">状态</td>
                            <td align="center" class="us_list_title">发布时间</td>
                            <td align="center" class="us_list_title">查看详细</td>
                            <td align="center" class="us_list_title">修改</td>
                            <td align="center" class="us_list_title">删除</td>
                            <td align="center" class="us_list_title">查看申请</td>
                            <td align="center" class="us_list_title">失效</td>
                        </tr>
                        <c:forEach var="m" items="${info.list}">
                            <tr>
                                <td align="center" class="us_list">${m.position_id}</td>
                                <td align="center" class="us_list">${m.p_name}</td>
                                <td align="center" class="us_list">${m.p_state}</td>
                                <td align="center" class="us_list">${m.p_date}</td>
                                <td align="center" class="us_list"><a
                                        href="/company/showPositionById?position_id=${m.position_id}">查看详细</a>&nbsp;
                                </td>
                                <td align="center" class="us_list"><a
                                        href="/company/queryPositionById?position_id=${m.position_id}&p_cname=${m.comany_name}">修改</a>&nbsp;
                                </td>
                                <td align="center" class="us_list">
                                    <a href="/company/delPositionById?position_id=${m.position_id}"
                                       onclick="return confirm('您确定删除吗?')">删除</a></td>
                                <td align="center" class="us_list">
                                    <a href="/company/queryApplyByPositionId?position_id=${m.position_id}">查看申请</a>
                                </td>
                                <td align="center" class="us_list">
                                    <a href="/company/outdate?position_id=${m.position_id}">失效</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                    <table border="0" align="center" cellpadding="0" cellspacing="0" class="link_bk">
                        <tr>
                            <td height="50" align="center">
                                <div class="page link_bk">
                                    <a href="${pageContext.request.contextPath}/company/queryPositionInfoByCom?p_state=${p_state}">首页</a>

                                    <c:if test="${info.pageNum <= 1}">
                                        <a href="javascript:void(0)">上一页</a>
                                    </c:if>

                                    <c:if test="${info.pageNum > 1}">
                                        <a href="${pageContext.request.contextPath}/company/queryPositionInfoByCom?page=${info.pageNum -1}&p_state=${p_state}">上一页</a>
                                    </c:if>

                                    <c:if test="${info.pageNum >= info.pages}">
                                        <a href="javascript:void(0)">下一页</a>
                                    </c:if>

                                    <c:if test="${info.pageNum < info.pages}">
                                        <a href="${pageContext.request.contextPath}/company/queryPositionInfoByCom?page=${info.pageNum +1}&p_state=${p_state}">下一页</a>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/company/queryPositionInfoByCom?page=${info.size}&p_state=${p_state}">尾页</a>
                                    <div class="clear"></div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </td>
    </tr>
</table>

</body>
</html>