<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<base href="${base}" />
<meta charset="UTF-8" />
<link rel="shortcut icon" href="favicon.ico" />
<title>中软国际</title>
<link href="admin/styles/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin_top_bg">
    <table width="980" height="70" border="0" cellpadding="0" cellspacing="0">
        <tr><td width="200" rowspan="2" align="right" valign="middle" >
		</td>
          <td height="39" align="right" valign="middle" class="link_w">
		  欢迎超级管理员：<strong style="color: #99FF00">admin</strong>&nbsp; 登录&nbsp;&nbsp;&nbsp;&nbsp;  
		  <a href="/adm/layout" target="_top">[退出]</a>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;

		  </td>
        </tr>
        <tr>
          <td height="31" valign="bottom" class="admin_top_nav">
		  <a href="adm/getIndex"  target="mainFrame">首页</a>
		  <a href="adm/type1" target="mainFrame" id="company">职位</a>
		  <a href="adm/queryCompanys" target="mainFrame" id="personal">企业</a>
		  <a href="adm/queryUsers" target="mainFrame" id="feedback">用户</a>
		  <a href="common/preChangeUser" target="mainFrame" id="users">修改用户密码</a>
		  <a href="common/preChangeCom" target="mainFrame" id="set">修改企业密码</a>
		  <div class="clear"></div>
		   </td>
        </tr>
      </table>
	  </div>
</body>
</html>
