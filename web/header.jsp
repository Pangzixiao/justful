<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="head_top">
	<div class="head_top_box">
		<div class="head_top_box_left link_lan">
			<span id="top_loginform"> 欢迎来到人才系统!&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="/common/a_prelogin">[管理员登录]</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="/common/c_prelogin">[企业登录]</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="/common/u_prelogin">[用户登录]</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="/common/preregister">[免费注册]</a>
			</span>

		</div>
		<div class="head_top_box_right link_bk">
			<div class="lia t_so" id="t_so">
				搜索
				<div class="op_search" id="op_search">
					<div class="stit">
						<div>搜索</div>
					</div>
					<div class="sform">
						<form action="" method="get" name="topsearch">
							<input name="key" type="text" id="top-search-key" class="key" />
							<div class="sutleft">
								<input type="button" value="搜职位" class="but70 top-search-button"
									id="QS_jobslist" />
							</div>
							<div class="sutright">
								<input type="button" value="搜简历" class="but70 top-search-button"
									id="QS_resumelist" />
							</div>
							<div class="clear"></div>
						</form>
					</div>
				</div>
			</div>
			<a href="javascript:void(0)" class="lia t_m">手机频道</a> <a
				href="javascript:void(0)" class="lia">帮助</a> <a href="" class="lia">网站首页</a>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="head">
	<div class="head_logo">
		<a href=""><img src="${pageContext.request.contextPath}/images/logo.jpg" alt="人才系统" border="0"
			align="absmiddle" /> </a>
	</div>
	<div class="head_logo_right">
		<div class="city"></div>
	</div>
	<div class="clear"></div>
</div>
