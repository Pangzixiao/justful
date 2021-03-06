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
    <script src="${pageContext.request.contextPath}/js/jquery.json-2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.qrcode.min.js"></script>
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
                    <h1>修改职位信息</h1>
                </div>
                <form method="post" action="/company/updatePosition" id="updPositonForm">
                    <table width="100%" border="0" cellpadding="4" cellspacing="0" style="margin-top:8px;">
                        <tr>
                            <td><input type="hidden" class="input_text_200" name="position_id" value="${info.position_id}"/><td>
                        </tr>
                        <tr>
                            <td><input type="hidden" class="input_text_200" name="company_id" value="${info.company_id}"/><td>
                        </tr>
                        <tr>
                            <td><input type="hidden" class="input_text_200" name="p_cname" value="${info.company_name}"/><td>
                        </tr>
                        <tr>
                            <td width="100" height="30" align="right"><span style="color:#FF3300; font-weight:bold">*</span> 职位名称：</td>
                            <td><input name="p_name" type="text" class="input_text_200" maxlength="30" value="${info.p_name}" style=" width:350px;"/></td>
                        </tr>
                        <tr>
                            <td height="30" align="right"><span style="...">*</span>职位类型1:</td>
                            <td><select style="width: 300px" name="p_type1" id="p_type1">
                                <option value="">--请选择--</option>
                                <option value="">所有</option>
                                <c:forEach items="${types}" var="v">
                                    <option value="${v.p1 }">${v.pname }</option>
                                </c:forEach>
                            </select></td>
                        </tr>
                        <tr>
                            <td height="30" align="right"><span style="...">*</span>职位类型2:</td>
                            <td><select style="width: 300px" name="p_type2" id="p_type2">
                                <option value="">--请选择--</option>
                                <option value="">所有</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td height="30" align="right"><span style="...">*</span>职位类型3:</td>
                            <td><select style="width: 300px" name="p_type3" id="p_type3">
                                <option value="">--请选择--</option>
                                <option value="">所有</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td height="30" align="right"><span
                                    style="color:#FF3300; font-weight:bold">*</span> 工作地区：
                            </td>
                            <td><select style="width: 300px" name="p_address">
                                <option value="">--请选择--</option>
                                <option value="北京">北京</option>
                                <option value="上海">上海</option>
                                <option value="郑州">郑州</option>
                                <option value="">其他</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td height="30" align="right">工作经验：</td>
                            <td><select style="width: 300px" name="required_work">
                                <option value="">--请选择--</option>
                                <option value="不限">不限</option>
                                <option value="有经验">有经验</option>
                            </select></td>
                        </tr>

                        <tr>
                            <td height="30" align="right">学历要求：</td>
                            <td><select style="width: 300px" name="need_degree">
                                <option value="">--请选择--</option>
                                <option value="不限">不限</option>
                                <option value="初中">初中</option>
                                <option value="高中">高中</option>
                                <option value="中技">中技</option>
                                <option value="中专">中专</option>
                                <option value="大专">大专</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                                <option value="博后">博后</option>
                            </select></td>
                        </tr>

                        <tr>
                            <td height="30" align="right">性别要求：</td>
                            <td><select style="width: 300px" name="need_sex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                                <option value="不限">不限</option>
                            </select></td>
                        </tr>

                        <tr>
                            <td height="30" align="right"><span
                                    style="color:#FF3300; font-weight:bold">*</span> 工资：
                            </td>
                            <td><input name="salary" type="text" class="input_text_200" maxlength="30"
                                       value="${info.salary}" style=" width:350px;"/></td>
                        </tr>

                        <tr>
                            <td height="30" align="right"><span
                                    style="color:#FF3300; font-weight:bold">*</span> 招聘人数：
                            </td>
                            <td><input name="need_count" type="text" class="input_text_200" value="${info.need_count}"
                                       maxlength="30" style=" width:350px;"/></td>
                        </tr>

                        <tr>
                            <td align="right" valign="top"><span
                                    style="color:#FF3300; font-weight:bold">*</span> 职位描述：
                            </td>
                            <td>
                                <div>
										<textarea name="p_descript" class="input_text_200_textarea"
                                                  style="width:450px; height:150px;">${info.p_descript}</textarea>
                                    <br/>
                                </div>

                            </td>
                        </tr>

                        <tr>
                            <td align="right" valign="top"><span
                                    style="color:#FF3300; font-weight:bold">*</span> 工作要求：
                            </td>
                            <td>
                                <div>
										<textarea name="p_request" class="input_text_200_textarea"
                                                  style="width:450px; height:150px;">${info.p_request}</textarea>
                                    <br/>
                                </div>

                            </td>
                        </tr>

                        <tr>
                            <td align="right" valign="top"><span
                                    style="color:#FF3300; font-weight:bold">*</span> 福利待遇：
                            </td>
                            <td>
                                <div>
										<textarea name="treatment" class="input_text_200_textarea" style="width:450px; height:150px;">${info.treatment}</textarea>
                                    <br/>
                                </div>

                            </td>
                        </tr>
                        <tr id="cp" style="display: table-row;">
                            <td align="right" valign="top"
                                style=" border-bottom:1px #CCCCCC dashed; color:#FF0000"><strong>范例：</strong></td>
                            <td style=" border-bottom:1px #CCCCCC dashed;"><strong>职位描述：</strong>
                                <br> 1、负责公司系统经营结构调整、新增投资与合作项目策划、现有投资项目调整以及投资管理等工作； <br>
                                2、主持制定公司投资项目总体发展规划，系统分析投资项目内外部经营风险，指导风险防范体系的建立。 <br>
                                <strong>任职要求：</strong><br> 1、经济管理、投资管理、工商管理及技术经济等专业硕士及以上学历； <br>
                                2、熟悉相关法律法规及投资项目实施、资产重组和处置过程的评估方法； <br>
                                3、具有较强的沟通及组织协调能力、学习能力及较强的团队合作精神； <br> 4、5
                                年及以上大型企业投资管理经验，熟悉资本运作； <br> 5、英语听说读写熟练。<br>
                                <strong>任职要求：</strong><br>1 五险一金
                            </td>
                        </tr>

                    </table>
                    <div style="position:relative;">
                        <table width="100%" border="0" cellpadding="20" cellspacing="0"
                               class="link_lan" bgcolor="F9F9F9">
                            <tr>
                                <td align="center">
                                    <table width="100%" border="0" cellpadding="10"
                                           cellspacing="0" class="link_lan" style="line-height:200%;">
                                        <tr>

                                            <td>
                                                <table width="100%" border="0" cellspacing="6"
                                                       cellpadding="5">
                                                    <tr>
                                                        <td width="30%" align="left">
                                                            <input name="" type="submit" value="确定修改" class="but100"/></td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">


    $().ready(function () {

        $("#p_type1").change(function () {
            var id1 = $("[name=p_type1]").val()

            /* ajax请求 */
            $.ajax({
                url: "/company/type2",
                type: "post",
                data: {
                    "id1": id1
                },
                dataType: "json",
                success: function (data) {
                    var str = "<option>请选择</option>"
                    $("#p_type2").html("");
                    for (var i = 0; i < data.length; i++) {
                        str += "<option value='" + data[i].pid
                            + "'>" + data[i].pname
                            + "</option>";
                    }
                    $("#p_type2").append(str);
                }
            });

        });

        $("#p_type2").change(function () {
            var id2 = $("[name=p_type2]").val()


            /* ajax请求 */
            $.ajax({
                url: "/company/type3",
                type: "post",
                data: {
                    "id2": id2
                },
                dataType: "json",
                success: function (data) {
                    var str = "<option>请选择</option>"
                    $("#p_type3").html("");
                    for (var i = 0; i < data.length; i++) {
                        str += "<option value='" + data[i].pid
                            + "'>" + data[i].pname
                            + "</option>";
                    }
                    $("#p_type3").append(str);
                }
            });

        });
        $("#updPositonForm").validate({

            rules: {

                p_name: {
                    required: true
                },
                p_address: {
                    required: true
                },
                salary: {
                    required: true
                },
                need_count: {
                    required: true,
                    digits:true
                },
                treatment: {
                    required: true
                },
                p_descript: {
                    required: true
                },
                p_request: {
                    required: true
                }
            },

            messages: {

                p_name: {
                    required: "请填写职位名"
                },
                p_address: {
                    required: "请填写地址"
                },
                salary: {
                    required: "请填写薪水"
                },
                need_count: {
                    required: "招聘人数不能为空",
                    digits: "必须输入整数"
                },
                treatment: {
                    required: "请按照范例填写"
                },
                p_descript: {
                    required: "请按照范例填写"
                },
                p_request: {
                    required: "请按照范例填写"
                }

            }

        });

    });



</script>
</body>
</html>