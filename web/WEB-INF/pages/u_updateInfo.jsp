<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <base href="${base}"/>
    <meta charset="UTF-8"/>
    <title>修改密码 - 个人会员中心 - 人才系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/styles/user.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/messages_zh.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/additional-methods.js"></script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<!--导航 -->
<div class="floatnav">
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"></jsp:include>
</div>
<!--导航end -->
<div class="page_location link_bk">
</div>
<table width="985" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:8px;">
    <tr>
        <td width="173" valign="top" class="link_bk">
            <jsp:include page="${pageContext.request.contextPath}/u_left.jsp"/>
        </td>
        <td valign="top">
            <div class="user_right_box">
                <div class="user_right_top_tit_bg">
                    <h1>修改信息</h1>
                </div>
                <div class="us_tab">

                    <div class="clear"></div>
                </div>
                <form id="Form1" name="Form1" method="post" action="/user/updatePass">
                    <table width="100%" border="0" cellpadding="4" cellspacing="0"
                           style="margin-top:20px; margin-bottom:20px;">
                        ${msg}
                        <tr>
                            <td width="150" height="30" align="right" bgcolor="#FFFFFF"><span
                                    style="color:#FF3300; font-weight:bold">*</span>旧密码：
                            </td>
                            <td><input name="oldpassword" type="password" id="oldpassword" class="input_text_200"
                                       maxlength="20"/></td>
                            ${msg}
                        </tr>
                        <tr>
                            <td height="30" align="right" bgcolor="#FFFFFF"><span
                                    style="color:#FF3300; font-weight:bold">*</span>新密码：
                            </td>
                            <td><input name="password" type="password" class="input_text_200" id="password"
                                       maxlength="18"/></td>
                        </tr>
                        <tr>
                            <td height="30" align="right" bgcolor="#FFFFFF"><span
                                    style="color:#FF3300; font-weight:bold">*</span>再次输入新密码：
                            </td>
                            <td><input name="password1" type="password" class="input_text_200" id="password1"
                                       maxlength="18"/></td>
                        </tr>
                        <tr>
                            <td height="30" align="right" bgcolor="#FFFFFF">&nbsp;</td>
                            <td><input type="submit" name="Submit" value="确定修改" class="user_submit"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </td>
    </tr>
</table>
<script>

    $().ready(function() {

        $("#Form1").validate({

            rules: {

                oldpassword: {

                    required: true,

                    minlength: 3

                },
                password: {

                    required: true,

                    minlength: 3

                },
                password1: {
                    required: true,
                    minlength: 3,
                    equalTo: "#password"
                }
            },

            messages: {

                oldpassword: {

                    required: "请输入旧密码",

                    minlength: "密码至少为3位"

                },
                password: {

                    required: "请输入新密码",

                    minlength: "密码至少3位"

                },
                password1: {
                    required: "请确认密码",
                    minlength: "密码的长度至少为3位",
                    equalTo: "两次密码输入不一致"
                }
            }
        });
    });

</script>
</body>
</html>
