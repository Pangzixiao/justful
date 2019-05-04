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
												value="${info.birthday}" /> <span style="color:#666666">(如：2003年8月)</span></td>
										</tr>
										
										<tr>
											<td height="23" align="right"><strong
												style="color:#FF0000">*</strong>毕业年份：</td>
											<td><input name="graduate_date" type="date"
												class="input_text_200 date_input"  maxlength="18"
												value="${info.graduate_date}" /> </td>
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
	<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
