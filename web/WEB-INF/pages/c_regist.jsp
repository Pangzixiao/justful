<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <base href="${base}" />
    <meta charset="UTF-8" />
    <title>快速注册 - 人才系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
    <link href="${pageContext.request.contextPath}/styles/user.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/messages_zh.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/additional-methods.js"></script>
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="reg_box">
        <div class="reg_box_tit link_lan">
        <strong>企业会员注册</strong><span>切换至 <a href="u_regist.jsp">个人会员</a> 注册</span>
        </div>
   <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:50px; margin-top:30px;">
       <tr>
        <td width="600" style=" border-right:1px #DDDDDD solid">
	        <form id="Form1" name="Form1" method="post" action="/company/c_regist">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
                    <tr>
                        <td width="130" height="40" align="right">用户名：</td>
                        <td><input name="company_name" type="text"  class="reg_input"  maxlength="25" /></td>
                    </tr>

                    <tr>
                        <td height="40" align="right">设置登录密码：</td>
                        <td><input name="c_password" type="password"  class="reg_input" id="c_password"  maxlength="18"/></td>
                    </tr>
                    <tr>
                        <td height="40" align="right">确认登录密码：</td>
                        <td><input name="password2" type="password"  class="reg_input" id="password2"  maxlength="18"  /></td>
                    </tr>

                    <tr>
                        <td width="130" height="40" align="right">联系方式：</td>
                        <td><input name="c_phone" type="text"  class="reg_input"  maxlength="25" /></td>
                    </tr>

                    <tr>
                        <td width="130" height="40" align="right">公司类型：</td>
                        <td><select name="c_type" style="width: 170px">
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
                        <td width="130" height="40" align="right">公司规模：</td>
                        <td><select name="c_scale" style="width: 170px">
                            <option value="">--请选择--</option>
                            <option value="少于50">少于50</option>
                            <option value="少于50">少于50</option>
                            <option value="50-150">50-150</option>
                            <option value="150-1000">150-1000</option>
                            <option value="1000-5000">1000-5000</option>
                            <option value="5000-10000">5000-10000</option>
                            <option value="10000以上">10000以上</option>
                        </select></td>
                     </tr>

                    <tr>
                        <td width="130" height="40" align="right">公司地址：</td>
                        <td><input name="c_address" type="text"  class="reg_input"  maxlength="25" /></td>
                    </tr>

                    <tr>
                        <td width="130" height="40" align="right">公司官网：</td>
                        <td><input name="c_websize" type="text"  class="reg_input"  maxlength="25" /></td></tr>
                    <tr>
                        <td>
                            <input name="member_type" type="hidden" id="member_type" value="1" /></td>
                        <td  class="link_lan"><input name="agreement" id="agreement" type="checkbox" value="1" checked="checked" />我已阅读并同意 <a href="" target="_blank">[注册协议]</a></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td height="50">
                            <div style="position:relative;">
                                <input name="reg" type="submit" id="reg" class="but100"  value="立即注册" />
                                <input id="waiting" type="button" value="正在注册" style="display:none;"   class="but100"  disabled="disabled"/></div>
                        </td>
                    </tr>
                </table>
            </form>
        </td>
           <td valign="top"><table width="220" border="0" align="center" cellpadding="0" cellspacing="10" style="line-height:180%">
               <tr>
                   <td   style="font-size:14px;"><strong>已经有帐号？</strong></td>
               </tr>
               <tr>
                   <td><input name="reg2" type="submit" class="but100" id="" value="立即登录"  onclick="window.location='common/c_prelogin'" /></td>
               </tr>
               <tr>
                   <td><strong style="color: #009900">企业会员</strong> <br />
                       发布招聘信息，查看人才简历，搜索简历，在线邀请面试...</td>
               </tr>
               <tr>
                   <td><strong style="color:#009900"> 个人会员 </strong> <br />填写个人简历，在线投递简历，在线申请职位，搜索职位... </td>
               </tr>
               <tr>
                   <td>&nbsp;</td>
               </tr>
           </table>
           </td>
       </tr>
   </table>
    </div>
    <script>
        jQuery.validator.addMethod("isPhone", function(value, element) {
            var length = value.length;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "phone is error");

        $().ready(function() {
            $("#Form1").validate({

                rules: {
                    company_name: {

                        required: true

                    },
                    c_password: {

                        required: true,
                        minlength: 3

                    },
                    password2:{
                        required: true,
                        minlength: 3,
                        equalTo: "#c_password"
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
                    }

                },

                messages: {
                    company_name: {
                        required: "请填写用户名"
                    },
                    c_password: {
                        required: "密码不能为空",
                        minlength: "密码长度不能小于3位"
                    },
                    password2:{
                        required: "请输入密码",
                        minlength: "密码长度不能小于3位",
                        equalTo: "两次密码输入不一致"
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
                    }

                }

            });

        });
    </script>

</body>
</html>
