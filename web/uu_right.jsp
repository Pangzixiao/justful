<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <div class="txtbox">
  <div class="qrcode"><img src="${pageContext.request.contextPath}/images/user/url_qrcode.png" alt="guoxinan - 二维码" /></div>
  <div class="tit">企业档案</div>	  
  <div class="txt">
	  <ul class="link_bku">
		<li>企业性质：${com.c_type}</li>
		<li>公司规模：${com.c_scale}</li>
		<li>所在地区：${com.c_address}</li>
	  </ul>
  </div>
</div>
