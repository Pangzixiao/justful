<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<title>企业会员中心 - 人才系统</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
<link href="${pageContext.request.contextPath}/styles/user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<!--导航 -->
<div class="floatnav">
 <jsp:include page="${pageContext.request.contextPath}/nav.jsp"></jsp:include>
</div>
<!--导航end --><div class="page_location link_bk">
</div>
<table width="985" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:8px;" >
  <tr>
    <td width="173" valign="top" class="link_bk">
	</td>
    <td valign="top">
	<div class="user_right_box">
		<div class="user_right_top_tit_bg">
		  <h1>企业基本信息</h1>
		</div>
		<form  method="post" action="/company/updateCompanyInfo"  >
      <table width="100%" border="0" cellpadding="4" cellspacing="0"  style="margin-top:10px;">
		  <tr>
			  <td width="90" height="30" align="right"   ><span style="color:#FF3300; font-weight:bold">*</span>公司id：</td>
			  <td><input type="text" value="${info.company_id}"  readonly="readonly" name="company_id"  class="input_text_200 input_text_200_selsect"/></td>
		  </tr>
		  <tr>
          <td width="90" height="30" align="right"   ><span style="color:#FF3300; font-weight:bold">*</span>公司名称：</td>
			  <td> <input type="text" value="${info.company_name}"  readonly="readonly"  class="input_text_200 input_text_200_selsect"/></td>
        </tr>
        <tr>
            <td height="30" align="right"  ><span style="color:#FF3300; font-weight:bold">*</span>企业性质：</td>
			<td><input type="text" value="${info.c_type}"  readonly="readonly"  class="input_text_200 input_text_200_selsect"/></td>
        </tr>

		<tr>
            <td height="30" align="right" ><span style="color:#FF3300; font-weight:bold">*</span>公司规模：</td>
			<td><input type="text" value="${info.c_scale}"  readonly="readonly"  class="input_text_200 input_text_200_selsect"/></td>
        </tr>

		  <tr>
              <td height="30" align="right"  ><span style="color:#FF3300; font-weight:bold">*</span>联系电话：</td>
			  <td><input type="text" value="${info.c_phone}"  readonly="readonly"  class="input_text_200 input_text_200_selsect"/></td>
        </tr>

        <tr>
             <td height="30" align="right" >公司网址：</td>
			 <td><input type="text" value="${info.c_websize}"  readonly="readonly"  class="input_text_200 input_text_200_selsect"/></td>
        </tr>
		<tr>
          <td height="30" align="right"  ><span style="color:#FF3300; font-weight:bold">*</span>通讯地址：</td>
			<td><input type="text" value="${info.c_address}"  readonly="readonly"  class="input_text_200 input_text_200_selsect"/></td>
        </tr>

		  <tr>
			  <td height="30" align="right"  ><span style="color:#FF3300; font-weight:bold">*</span>审核结果：</td>
			  <td><input type="text" value="${info.check_type}"  readonly="readonly"  class="input_text_200 input_text_200_selsect"/></td>
		  </tr>


		  <tr>
			  <td height="30" align="right"  ><span style="color:#FF3300; font-weight:bold">*</span>注册时间：</td>
			  <td><input type="text" value="${info.regist_date}"  readonly="readonly"  class="input_text_200 input_text_200_selsect"/></td>
		  </tr>
        <tr>
          <td align="right" valign="top"  >
		  <span style="color:#FF3300; font-weight:bold">*</span> 公司介绍：</td>
          <td  >
			<textarea name="c_describe" class="input_text_200_textarea" style="width:450px; height:150px; margin-bottom:6px;" >${info.c_describe}</textarea></td>
            <br />

        </tr>
      </table>
        </form>
		</div>
    </td>
  </tr>
</table>
<div class="footer">
<div class="link_bk"><a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://localhost');" href="javascript:">设为首页</a>&nbsp;|&nbsp;<a href="javascript:" onclick="window.external.addFavorite(parent.location.href,document.title);">加入收藏</a>
&nbsp;|&nbsp;<a href="//explain/explain-show.php?id=1" target="_blank">自定义栏目</a>&nbsp;|&nbsp;<a href="//explain/explain-show.php?id=2" target="_blank">自定义栏目</a></div>
<div class="link_bk">
联系地址：00省00市00路00号0大厦00楼 联系电话：000-00000000 网站备案：<a href="http://www.miibeian.gov.cn/" target="_blank">icp000000000</a>  </div>
<div class="link_bk">Copyright @ 2010 .com All Right Reserved </div>
<div class="link_bk" style="font-size:10px;"> Powered by <a href="http://www..com/" target="_blank" style="color:#009900"><em>  v3.3</em></a></div>
</div>
</body>
</html>
