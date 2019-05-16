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
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/messages_zh.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/additional-methods.js"></script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<!--导航 -->
<div class="floatnav">
    <jsp:include page="${pageContext.request.contextPath}/c_nav.jsp"></jsp:include>
</div>
<!--导航end -->
<div class="page_location link_bk">

    当前位置：<a href="//">首页</a>&nbsp;>>&nbsp;<a href="">会员中心</a>&nbsp;>>&nbsp;公司信息&nbsp;>>基本信息
</div>
<table width="985" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:8px;">
    <tr>
        <td width="173" valign="top" class="link_bk">
            <jsp:include page="${pageContext.request.contextPath}/c_left.jsp"></jsp:include>
        </td>
        <td valign="top">
            <div class="user_right_box">
                <div class="user_right_top_tit_bg">
                    <h1>企业基本信息</h1>
                </div>
                <form method="post" action="/company/updateCompanyInfo" id="updateComForm">
                    <table width="100%" border="0" cellpadding="4" cellspacing="0" style="margin-top:10px;">
                        <tr>

                            <td><input name="company_id" type="hidden" class="input_text_200" maxlength="30" style="width:350px;" value="${info.company_id}"/></td>
                        </tr>
                        <tr>
                            <td width="90" height="30" align="right">
                                <span style="color:#FF3300; font-weight:bold">*</span>公司名称：
                            </td>
                            <td><input name="company_name" type="text" class="input_text_200" maxlength="30" style="width:350px;" value="${info.company_name}"/></td>
                        </tr>
                        <tr>
                            <td height="30" align="right"><span style="color:#FF3300; font-weight:bold">*</span>企业性质：
                            </td>
                            <td><select name="c_type" style="width: 300px">
                                <option value="">--请选择--</option>
                                <option value="外资">外资</option>
                                <option value="合资">合资</option>
                                <option value="国企">国企</option>
                                <option value="民营">民营</option>
                                <option value="政府机关">政府机关</option>
                                <option value="事业单位">事业单位</option>
                                <option value="非盈利组织">非盈利组织</option>
                                <option value="上市公司">上市公司</option>
                                <option value="创业公司">创业公司</option>
                                <option value="其他">其他</option>
                            </select></td>

                        </tr>

                        <tr>
                            <td height="30" align="right"><span style="color:#FF3300; font-weight:bold">*</span>公司规模：
                            </td>
                            <td><select name="c_scale" style="width: 300px">
                                <option value="">--请选择--</option>
                                <option value="少于50">少于50</option>
                                <option value="50-150">50-150</option>
                                <option value="150-1000">150-1000</option>
                                <option value="1000-5000">1000-5000</option>
                                <option value="5000-10000">5000-10000</option>
                                <option value="10000以上">10000以上</option>
                            </select>
                            </td>
                        </tr>

                        <tr>
                            <td height="30" align="right"><span style="color:#FF3300; font-weight:bold">*</span>联系电话：
                            </td>
                            <td><input name="c_phone" type="text" class="input_text_200" maxlength="40"
                                       value="${info.c_phone}"/></td>
                        </tr>

                        <tr>
                            <td height="30" align="right">公司网址：</td>
                            <td><input name="c_websize" type="text" class="input_text_200" maxlength="80"
                                       value="${info.c_websize}"/></td>
                        </tr>
                        <tr>
                            <td height="30" align="right"><span style="color:#FF3300; font-weight:bold">*</span>通讯地址：
                            </td>
                            <td><input name="c_address" type="text" class="input_text_200" maxlength="80"
                                       style="width:447px;" value="${info.c_address}"/></td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">
                                <span style="color:#FF3300; font-weight:bold">*</span> 公司介绍：
                            </td>
                            <td>
                                <textarea name="c_describe" class="input_text_200_textarea"
                                          style="width:450px; height:150px; margin-bottom:6px;">${info.c_describe}</textarea>
                                <br/>

                        </tr>

                        <tr>
                            <td align="right" valign="top">&nbsp;</td>
                            <td height="160" valign="top"><br/>
                                <input type="submit" name="Submit" value="保存" class="user_submit"/>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </td>
    </tr>
</table>
<script>
    jQuery.validator.addMethod("isPhone", function(value, element) {
        var length = value.length;
        var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "phone is error");

    $().ready(function() {
        $("#updateComForm").validate({

            rules: {
                company_name: {

                    required: true

                },

                c_phone:{
                    isPhone: true
                },
                c_address:{

                },
                c_websize:{
                    url: true
                },
                c_scale:{
                    required: true
                },
                c_type:{
                    required: true
                },
                c_describe:{
                    required:true
                }


            },

            messages: {
                company_name: {
                    required: "请填写用户名"
                },
                c_phone:{
                    isPhone: "请填写正确的手机号"
                },
                c_address:{

                },
                c_websize:{
                    url: "请填写正确的网址"
                },
                c_scale:{
                    required: "请选择公司规模"
                },
                c_type:{
                    required: "请选择公司类型"
                },
                c_describe:{
                    required:"请填写公司描述"
                }

            }

        });

    });
</script>
</body>
</html>
