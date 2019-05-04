<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<link rel="shortcut icon" href="favicon.ico" />
<title>Powered by gxaedu</title>
<link href="admin/styles/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		$("li").first().addClass("hover");
		$("li>a").click(function() {
			$("li").removeClass("hover");
			$(this).parent().addClass("hover");
			$(this).blur();
		})
	})
</script>
</head>
<body>
	<div class="admin_left_box">
		<ul>
			<li><a href="adm/getIndex"  target="mainFrame">管理中心首页</a></li>
			<li><a href="" target="mainFrame">职位列表</a></li>
			<li><a href="adm/queryCompanys" target="mainFrame">企业列表 </a>
			<li><a href="adm/queryUsers" target="mainFrame">用户列表 </a></li>
			<li><a href="common/preChangeUser"  target="mainFrame">修改用户密码 </a></li>
			<li><a href="common/preChangeCom"  target="mainFrame">修改企业密码 </a></li>
		</ul>
	</div>
</body>
</html>