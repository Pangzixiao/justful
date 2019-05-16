<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<base href="${base}" />
	<meta charset="UTF-8" />
	<title>我的简历 - 个人会员中心 - 人才系统</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
	<link href="${pageContext.request.contextPath}/styles/user.css" rel="stylesheet" type="text/css" />
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
	<table width="985" border="0" align="center" cellpadding="0"
		cellspacing="0" style="margin-top:8px;">
		<tr>
			<td width="173" valign="top" class="link_bk"><jsp:include
					page="${pageContext.request.contextPath}/u_left.jsp" /></td>
			<td valign="top">
				<div class="user_right_box">
					<div class="user_right_top_tit_bg">
						<h1>我的简历</h1>
					</div>
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						bgcolor="#FFFFFF">
						<tr>
							<td height="22">
								<form id="Form1" name="Form1" method="post"
									action="/user/updateIntroduceById">
									<table width="100%" border="0" cellspacing="0" cellpadding="4">
										<tr>
											<td height="50" colspan="2" bgcolor="#F5FAFC"
												style=" border-bottom:1px #CCCCCC dashed; color:#003399">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
												style="font-size:14px;">创建简历</span> <span
												style="color:#999999">(带<strong style="color:#FF0000">*</strong>的为必填)
											</span></td>
										</tr>
										<tr>
											<td width="100" height="10"></td>
											<td></td>
										</tr>
										<tr>
											<td width="100" height="23" align="right" valign="top"
												style="padding-top:10px;"><strong style="color:#FF0000">*</strong>用户id：</td>
											<td><input name="user_id" type="text"
												class="input_text_200"  maxlength="80" value="${info.user_id}" /><br />
											</td>
										</tr>
										<tr>
											<td width="100" height="23" align="right"><strong
												style="color:#FF0000">*</strong>真实姓名：</td>
											<td><input name="fullname" type="text"
												class="input_text_200" id="fullname" maxlength="6" value="${info.fullname}" />
											</td>
										</tr>
										<tr>
											<td height="23" align="right">性别：</td>
											<td><label> <input name="sex" type="radio"
													 checked="checked" value="男" /> 男
											</label>&nbsp;&nbsp;&nbsp;&nbsp; <label> <input type="radio"
													name="sex"  value="女" /> 女
											</label> </td>
										</tr>
										
										<tr>
											<td height="23" align="right">民族：</td>
											<td><input name="nation" type="text"
												class="input_text_200"  maxlength="80" value="${info.sex}" /></td>
										</tr>
										
										<tr>
											<td height="23" align="right"><strong
												style="color:#FF0000">*</strong>出生年份：</td>
											<td><input name="birthday" type="date"
												class="input_text_200 date_input"  maxlength="18"
												value="${info.birthday}" />
										</tr>
										

										
										
										<tr>
											<td height="23" align="right">身高：</td>
											<td><input name="height" type="text"
												class="input_text_200" id="height" maxlength="3"
												style="width:60px;" value="${info.height}" /> CM</td>
										</tr>
										<tr>
											<td height="23" align="right">婚姻状况：</td>
											<td><label><input name="marriage" type="radio"
													 checked="checked" value="未婚" /> 未婚</label>&nbsp;&nbsp;&nbsp;&nbsp;
												<label><input type="radio" name="marriage" 
													value="已婚" /> 已婚</label>&nbsp;&nbsp;&nbsp;&nbsp; <label><input
													type="radio" name="marriage" value="保密" /> 保密</label> 
											</td>
										</tr>
										<tr>
											<td height="23" align="right"><strong
												style="color:#FF0000">*</strong>工作经验：</td>
											<td>
												<select name="work_age" style="width: 170px">
													<option value="">--请选择--</option>
													<option value="无经验">无经验</option>
													<option value="1年以下">1年以下</option>
													<option value="1-3年">1-3年</option>
													<option value="3-5年">3-5年</option>
													<option value="5-10年">5-10年</option>
													<option value="10年以上">10年以上</option>
												</select>
											</td>
										</tr>
										<tr>
											<td height="23" align="right"><strong
												style="color:#FF0000">*</strong>户口所在地：</td>
											<td><input name="u_address" type="text"
												class="input_text_200"  maxlength="60"
												value="${info.u_address}" /></td>
										</tr>
										
										<tr>
											<td height="23" align="right"><strong
												style="color:#FF0000">*</strong>联系地址：</td>
											<td><input name="now_address" type="text"
												class="input_text_200"  maxlength="60"
												value="${info.now_address}" /></td>
										</tr>
										
										<tr>
											<td height="23" align="right"><strong
												style="color:#FF0000">*</strong>学历：</td>
											<td>
												<select name="degree" style="width: 170px">
													<option value="">--请选择--</option>
													<option value="初中">初中</option>
													<option value="高中">高中</option>
													<option value="中技">中技</option>
													<option value="中专">中专</option>
													<option value="大专">大专</option>
													<option value="本科">本科</option>
													<option value="硕士">硕士</option>
													<option value="博士">博士</option>
													<option value="博后">博后</option>
												</select>
											</td>
										</tr>

										<tr>
											<td width="100" height="23" align="right"><strong
												style="color:#FF0000">*</strong>毕业学校：</td>
											<td><input name="school" type="text"
												class="input_text_200"  maxlength="30" value="${info.school}" />
											</td>
										</tr>
										

										<tr>
											<td width="100" height="23" align="right"><strong
												style="color:#FF0000">*</strong>专业：</td>
											<td><input name="major" type="text"
												class="input_text_200"  maxlength="30" value="${info.major}" />
											</td>
										</tr>

										<tr>
											<td height="23" align="right"><strong
													style="color:#FF0000">*</strong>开学日期：</td>
											<td><input name="study_start" type="date"
													   class="input_text_200 date_input"  maxlength="18"
													   value="${info.study_start}" /> </td>
										</tr>

										<tr>
											<td height="23" align="right"><strong
													style="color:#FF0000">*</strong>毕业年份：</td>
											<td><input name="graduate_date" type="date"
													   class="input_text_200 date_input"  maxlength="18"
													   value="${info.graduate_date}" /> </td>
										</tr>

										<tr>
											<td height="23" align="right"><strong
												style="color:#FF0000">*</strong>联系电话：</td>
											<td><input name="phone" type="text"
												class="input_text_200"  maxlength="60"
												value="${info.phone}" /> <span style="color:#0066FF">非常重要，招聘方会通过此电话与您联系！</span><br />
											</td>
										</tr>
										
										
										<tr>
											<td height="23" align="right">个人主页/博客：</td>
											<td><input name="website" type="text"
												class="input_text_200" id="website" maxlength="80" value="${info.website}" /></td>
										</tr>
										
										<tr>
											<td width="100" height="23" align="right"><strong
												style="color:#FF0000">*</strong>最近工作的企业：</td>
											<td><input name="old_cname" type="text"
												class="input_text_200"  maxlength="30" value="${info.old_cname}" />
											</td>
										</tr>
										
										<tr>
											<td width="100" height="23" align="right"><strong
												style="color:#FF0000">*</strong>最近任职的职位：</td>
											<td><input name="oldjob" type="text"
												class="input_text_200"  maxlength="30" value="${info.oldjob}" />
											</td>
										</tr>

										<tr>
											<td height="23" align="right"><strong
													style="color:#FF0000">*</strong>工作起始日期：</td>
											<td><input name="work_start" type="date"
													   class="input_text_200 date_input"  maxlength="18"
													   value="${info.work_start}" /> </td>
										</tr>

										<tr>
											<td height="23" align="right"><strong
													style="color:#FF0000">*</strong>工作结束日期：</td>
											<td><input name="work_end" type="date"
													   class="input_text_200 date_input"  maxlength="18"
													   value="${info.work_end}" /> </td>
										</tr>

										<tr>
											<td width="100" height="23" align="right"><strong
												style="color:#FF0000">*</strong>期望职位：</td>
											<td><input name="job_want" type="text"
												class="input_text_200"  maxlength="30" value="${info.job_want}" />
											</td>
										</tr>
										
										<tr>
											<td width="100" height="23" align="right"><strong
												style="color:#FF0000">*</strong>期望就职地点：</td>
											<td><input name="city_want" type="text"
												class="input_text_200"  maxlength="30" value="${info.city_want}" />
											</td>
										</tr>
										
										<tr>
											<td width="100" height="23" align="right"><strong
												style="color:#FF0000">*</strong>期望最低薪资：</td>
											<td><input name="min_wage" type="text"
												class="input_text_200"  maxlength="30" value="${info.min_wage}" />
											</td>
										</tr>
										
										<tr>
											<td width="100" height="23" align="right"><strong
												style="color:#FF0000">*</strong>期望最高薪资：</td>
											<td><input name="max_wage" type="text"
												class="input_text_200"  maxlength="30" value="${info.max_wage}" />
											</td>
										</tr>
										
										<tr>
											<td width="100" height="23" align="right"><strong
												style="color:#FF0000">*</strong>现在的状态：</td>
											<td><select name = "now_state" style="width: 170px">
												<option value="">--请选择--</option>
											    <option value="积极找工作">积极找工作</option>
												<option value="其他">其他</option>
											</select>
											</td>
										</tr>
										
										<tr>
											<td align="right" valign="top"  >
												<span style="color:#FF3300; font-weight:bold">*</span> 自我描述：</td>
											<td  >
												<textarea name="u_describe" class="input_text_200_textarea" style="width:450px; height:150px; margin-bottom:6px;" >${info.u_describe}</textarea>
												<br />

											</tr>
										
									</table>
									
									<div style="position:relative;">
										<table width="100%" border="0" cellspacing="0" cellpadding="4"
											style="margin-bottom:150px;">
											<tr>
												<td width="100" height="23" align="right"></td>
												<td height="60"><input type="submit" 
													 value="保存"  />

												</td>
											</tr>
										</table>
								</form>
								</div>
							</td>
							<td width="150" valign="top" class="resume_right_box"><jsp:include
									page="${pageContext.request.contextPath}/u_right.jsp"></jsp:include></td>
						</tr>
					</table>

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
            $("#Form1").validate({

                rules: {
                    fullname:{
                        required:true
					},
                    nation:{
                        required:true
					},
                    birthday:{
                        required:true
					},
                    height:{
                        required:true,
                        digits:true
					},
                    work_age:{
                        required:true
                    },
                    u_address:{
                        required:true
					},
                    now_address:{
                        required:true
					},
                    degree:{
                        required:true
					},
                    school:{
                        required:true
					},
                    major:{
                        required:true
					},
                    study_start:{
                        required:true
					},
                    graduate_date:{
                        required:true
					},
                    phone:{
                        isPhone:true
					},
                    website:{
                        required:true,
						url:true
					},
                    old_cname:{
                        required:true
					},
                    oldjob:{
                        required:true
					},
                    work_start:{
                        required:true
					},
                    work_end:{
                        required:true
					},
                    job_want:{
                        required:true
					},
                    city_want:{
                        required:true
					},
                    min_wage:{
                        required:true
					},
                    max_wage:{
                        required:true
					},
                    now_state:{
                        required:true
					}
                },

                messages: {
                    fullname:{
                        required:"请输入真实姓名"
                    },
                    nation:{
                        required:"请输入民族"
                    },
                    birthday:{
                        required:"日期不能为空"
                    },
                    height:{
                        required:"身高不能为空",
                        digits:"请输入整数"
                    },
                    work_age:{
                        required:"该选项不能为空"
                    },
                    u_address:{
                        required:"该选项不能为空"
                    },
                    now_address:{
                        required:"该选项不能为空"
                    },
                    degree:{
                        required:"该选项不能为空"
                    },
                    school:{
                        required:"该选项不能为空"
                    },
                    major:{
                        required:"该选项不能为空"
                    },
                    study_start:{
                        required:"该选项不能为空"
                    },
                    graduate_date:{
                        required:"该选项不能为空"
                    },
                    phone:{
                        isPhone:"请输入正确的手机号"
                    },
                    website:{
                        url:"请输入正确的网站格式"
                    },
                    old_cname:{
                        required:"没有请填无"
                    },
                    oldjob:{
                        required:"没有请填无"
                    },
                    work_start:{
                        required:"该选项不能为空"
                    },
                    work_end:{
                        required:"该选项不能为空"
                    },
                    job_want:{
                        required:"请输入期望的职位"
                    },
                    city_want:{
                        required:"请输入理想城市"
                    },
                    min_wage:{
                        required:"该选项不能为空"
                    },
                    max_wage:{
                        required:"该选项不能为空"
                    },
                    now_state:{
                        required:"该选项不能为空"
                    }

                }

            });

        });
	</script>
</body>
</html>
