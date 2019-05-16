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
                    <h1>申请管理</h1>
                </div>


                <form id="form1" name="form1" method="post"
                      action="">
                    <table width="100%" border="0" align="center" cellpadding="0"
                           cellspacing="0" bgcolor="#FFFFFF" class="link_lan">
                        <tr>
                            <td width="10%" align="center" class="us_list_title">职位名称</td>
                            <td width="15%" align="center" class="us_list_title">职位状态</td>
                            <td width="15%" align="center" class="us_list_title">工作地点</td>
                            <td width="15%" align="center" class="us_list_title">月薪</td>
                            <td width="15%" align="center" class="us_list_title">查看简历</td>
                            <td width="10%" align="center" class="us_list_title">抱歉</td>
                            <td width="10%" align="center" class="us_list_title">邀请面试</td>
                        </tr>
                        <c:forEach var="m" items="${info.list}">
                            <tr>
                                <td align="center" class="us_list"> ${m.p_name}</td>
                                <td align="center" class="us_list">${m.apply_status}</td>
                                <td align="center" class="us_list">${m.p_address}</td>
                                <td align="center" class="us_list">${m.salary}</td>
                                <td align="center" class="us_list"><a href="/adm/showIntroduce?id=${m.user_id}">查看简历</a>&nbsp;
                                </td>
                                <td align="center" class="us_list"><a
                                        href="/company/updateApplay?apply_id=${m.apply_id}">抱歉</a>&nbsp;
                                </td>
                                <td align="center" class="us_list">
                                    <a href="/company/mianshi?apply_id=${m.apply_id}">邀请面试</a></td>

                            </tr>
                        </c:forEach>
                    </table>

                    <table border="0" align="center" cellpadding="0" cellspacing="0"
                           class="link_bk">
                        <tr>
                            <td height="50" align="center">
                                <div class="page link_bk">
                                    <a href="${pageContext.request.contextPath}/company/queryApplyByPositionId?position_id=${id}">首页</a>

                                    <c:if test="${info.pageNum <= 1}">
                                        <a href="javascript:void(0)">上一页</a>
                                    </c:if>

                                    <c:if test="${info.pageNum > 1}">
                                        <a href="${pageContext.request.contextPath}/company/queryApplyByPositionId?page=${info.pageNum -1}&position_id=${id}">上一页</a>
                                    </c:if>

                                    <c:if test="${info.pageNum >= info.pages}">
                                        <a href="javascript:void(0)">下一页</a>
                                    </c:if>

                                    <c:if test="${info.pageNum < info.pages}">
                                        <a href="${pageContext.request.contextPath}/company/queryApplyByPositionId?page=${info.pageNum +1}&position_id=${id}">下一页</a>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/company/queryApplyByPositionId?page=${info.size}&position_id=${id}">尾页</a>
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
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>