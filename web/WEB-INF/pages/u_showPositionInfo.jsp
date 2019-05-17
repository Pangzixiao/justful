<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<title>职位详细</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
<link href="${pageContext.request.contextPath}/styles/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/comp.css" rel="stylesheet" type="text/css" />
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

<div class="company-show-topnav">
  <div class="topcomname">
  <h1>${info.company_name}</h1>
	  <div class="clear"></div>
  </div>
	<div class="snav">

		<div class="clear"></div>
	</div>
</div>
<div class="jobs-show">
  <div class="left">
    <div class="show link_lan">
  	  <div class="jobsshow">
	   <h1>${info.p_name}
			</h1>
<div class="imgtipbox">
<div class="liimg li1">${info.p_date}<br />更新时间</div>
<div class="liimg li3">${info.apply_count}<br />简历投递量</div>
<div class="liimg li4">0<br />职位评价</div>
<div class="liimg li5">${info.check_type}<br />公司审核状态</div>
<div class="clear"></div>	
</div>
			<div class="tip">
						职位状态：${info.p_state},发布时间为:${info.p_date}
						</div>	  
		  <ul class="floatli link_bku">
		  <li>招聘职位：${info.p_name}</li>
		  <li>招聘公司：${info.company_name}</li>
		  <li>职位类型：${info.p_type1}-${info.p_type2}-${info.p_type3}</li>
		  <li>薪金待遇：${info.salary}</li>
		  <li>招聘人数：${info.need_count}</li>
		  <li>性别要求：${info.need_sex}</li>
		  <li>学历要求：${info.need_degree}</li>
		  <li>工作地区：${info.p_address}</li>
		  <li>工作经验：${info.required_work}</li>
		  <li>发布日期：${info.p_date}</li>
		  <li  style="width:90%">标签： 无</li>
		  </ul>	
		  <div class="clear"></div>	  
	      <div class="title"><strong>职位描述</strong></div>
		  <div>
			  <textarea  class="input_text_200_textarea" style="width:450px; height:150px;">${info.p_descript}</textarea>
		  </div>
		  <div class="title"><strong>岗位要求</strong></div>
		  <div>
			  <textarea  class="input_text_200_textarea" style="width:450px; height:150px;">${info.p_request}</textarea>
		  </div>
		  <div class="title"><strong>福利待遇</strong></div>
		  <div>
			  <textarea  class="input_text_200_textarea" style="width:450px; height:150px;">${info.treatment}</textarea>
		  </div>
		  <!--AJAX 联系方式 --><div id="jobs_contact"></div>
		  <div align="center" class="link_lan"><br />
			  <br />

		  </div>
		  <div class="share">

<div class="clear"></div>	
<!-- Baidu Button END -->
			</div>
			<div class="remind">防骗提醒： 招聘单位无权向求职者收取任何费用，如有单位在面试过程中向您收取押金、保证金、体检费、材料费、成本费等违规费用，指定医院体检等均为诈骗行为，欢迎举报。</div>
	  </div>
	</div>
	<!--评论 -->
	<div id="pl"></div>
</div>
	<div class="right">
		<jsp:include page="${pageContext.request.contextPath}/uu_right.jsp"></jsp:include>
	</div>
  <div class="clear"></div>
</div>
</body>
</html>

