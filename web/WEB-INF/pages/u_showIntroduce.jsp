<%@ page language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <base href="${base}"/>
    <meta charset="UTF-8"/>
    <title>${info.fullname}的个人简历 - 人才系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/styles/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/styles/css.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="resume_show">
    <tr>
        <td class="link_lan">&nbsp;&nbsp;<a href="">人才系统</a><span
                style="color:#999999">&nbsp;&nbsp;(http://localhost)</span></td>
        <td class="link_bku top_a">

        </td>
    </tr>
</table>
<table border="0" align="center" cellpadding="7" cellspacing="1" bgcolor="#CCCCCC" class="resume_show">
    <tr>
        <td colspan="5" bgcolor="#FFFFFF" class="btit">
            <div class="qrcode"><img src="${pageContext.request.contextPath}/images/user/url_qrcode.png" alt="二维码"/>
            </div>

            <h1>${info.fullname}的个人简历</h1>
            <div class="tip">
                <span style="color: #009900">毕业日期：${info.graduate_date}</span>
                <br/>
                学历：${info.degree} &nbsp;&nbsp;工作经验：${info.work_age}&nbsp;&nbsp;
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="5" bgcolor="#FAFAFA" class="title"><strong>基本信息</strong></td>
    </tr>
    <tr>
        <td width="80" align="right" bgcolor="#FAFAFA">
            真实姓名：
        </td>
        <td bgcolor="#FFFFFF">${info.fullname}</td>
        <td width="80" align="right" bgcolor="#FAFAFA">
            性别：
        </td>
        <td bgcolor="#FFFFFF">${info.sex}</td>
        <td width="140" rowspan="6" align="center" bgcolor="#FFFFFF"><img
                src="${pageContext.request.contextPath}/images/user/1376273539872.jpg" width="120" height="150"/></td>
    </tr>
    <tr>
        <td align="right" bgcolor="#FAFAFA">出生日期：</td>
        <td bgcolor="#FFFFFF">${info.birthday}</td>
        <td align="right" bgcolor="#FAFAFA">身高：</td>
        <td bgcolor="#FFFFFF">${info.height}</td>
    </tr>
    <tr>
        <td align="right" bgcolor="#FAFAFA">婚姻状况：</td>
        <td bgcolor="#FFFFFF">${info.marriage}</td>
        <td align="right" bgcolor="#FAFAFA">户籍所在：</td>
        <td bgcolor="#FFFFFF">${info.u_address}</td>
    </tr>
    <tr>
        <td align="right" bgcolor="#FAFAFA">最高学历：</td>
        <td bgcolor="#FFFFFF">${info.degree}</td>
        <td align="right" bgcolor="#FAFAFA">工作经验：</td>
        <td bgcolor="#FFFFFF">${info.work_age}</td>
    </tr>
    <tr>
        <td align="right" bgcolor="#FAFAFA">联系地址：</td>
        <td bgcolor="#FFFFFF">${info.now_address}</td>
        <td align="right" bgcolor="#FAFAFA">毕业时间：</td>
        <td bgcolor="#FFFFFF">${info.graduate_date}</td>
    </tr>
</table>
<table border="0" align="center" cellpadding="7" cellspacing="1" bgcolor="#CCCCCC" class="resume_show">
    <tr>
        <td colspan="2" bgcolor="#FAFAFA" class="title"><strong>求职意向</strong></td>
    </tr>
    <tr>
        <td width="120" align="right" bgcolor="#FAFAFA">最近工作过的职位：</td>
        <td bgcolor="#FFFFFF">${info.oldjob}</td>
    </tr>
    <tr>
        <td align="right" bgcolor="#FAFAFA">期望工作地：</td>
        <td bgcolor="#FFFFFF">${info.city_want}</td>
    </tr>
    <tr>
        <td align="right" bgcolor="#FAFAFA">期望月薪：</td>
        <td bgcolor="#FFFFFF">${info.min_wage}~${info.max_wage}</td>
    </tr>
    <tr>
        <td align="right" bgcolor="#FAFAFA">期望从事的岗位：</td>
        <td bgcolor="#FFFFFF">${info.job_want}</td>
    </tr>
</table>
<table border="0" align="center" cellpadding="7" cellspacing="1" bgcolor="#CCCCCC" class="resume_show">
    <tr>
        <td colspan="2" bgcolor="#FAFAFA" class="title"><strong>自我描述</strong></td>
    </tr>
    <tr>
        <td width="80" align="right" bgcolor="#FAFAFA">自我描述：</td>
        <td bgcolor="#FFFFFF">${info.u_describe}</td>
    </tr>
</table>
<table border="0" align="center" cellpadding="7" cellspacing="1" bgcolor="#CCCCCC" class="resume_show">
    <tr>
        <td colspan="2" bgcolor="#FAFAFA" class="title"><strong>教育经历</strong></td>
    </tr>
    <tr>
        <td colspan="2" bgcolor="#FAFAFA"><strong>${info.degree} </strong></td>
    </tr>
    <tr>
        <td width="80" align="right" bgcolor="#FAFAFA">起止年月：</td>
        <td bgcolor="#FFFFFF">${info.study_start}-${info.graduate_date}&nbsp;</td>
    </tr>
    <tr>
        <td width="120" align="right" bgcolor="#FAFAFA">学校名称：</td>
        <td bgcolor="#FFFFFF">${info.school}</td>
    </tr>
    <tr>
        <td align="right" bgcolor="#FAFAFA">专业名称：</td>
        <td bgcolor="#FFFFFF">${info.major}</td>
    </tr>
    <tr>
        <td align="right" bgcolor="#FAFAFA">获得学历：</td>
        <td bgcolor="#FFFFFF">${info.degree}</td>
    </tr>
</table>
<table border="0" align="center" cellpadding="7" cellspacing="1" bgcolor="#CCCCCC" class="resume_show">
    <tr>
        <td colspan="2" bgcolor="#FAFAFA" class="title"><strong>工作经历</strong></td>
    </tr>
    <tr>
        <td colspan="2" bgcolor="#FAFAFA"><strong>${info.oldjob}</strong></td>
    </tr>

    <tr>
        <td width="80" align="right" bgcolor="#FAFAFA">起止日期：</td>
        <td bgcolor="#FFFFFF">${info.work_start}-${info.work_end}&nbsp;</td>
    </tr>
    <tr>
        <td width="120" align="right" bgcolor="#FAFAFA">企业名称：</td>
        <td bgcolor="#FFFFFF">${info.old_cname}</td>
    </tr>
    <tr>
        <td width="120" align="right" bgcolor="#FAFAFA">从事职位：</td>
        <td bgcolor="#FFFFFF">${info.oldjob}</td>
    </tr>

</table>

<table border="0" align="center" cellpadding="7" cellspacing="1" bgcolor="#CCCCCC" class="resume_show resume_contact">
    <tr>
        <td bgcolor="#FAFAFA" class="title"><strong>联系方式</strong></td>
    </tr>
    <tr>
        <td bgcolor="#FFFFFF">
            <div id="resume_contact">
                <ul>
                    <li>联 系 人：${info.fullname}</li>
                    <li>联系电话：${info.phone}</li>
                    <li>联系地址：${info.now_address}</li>
                    <li>个人主页/博客：${info.website}</li>
                </ul>
                <div align="center"><br>

                </div>
                <div align="center">
                    <br><br>
                </div>
            </div>
        </td>
    </tr>
</table>
<table height="100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</body>
</html>