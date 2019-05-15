<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>职位检索</title>
<base href="${base}" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
<link href="${pageContext.request.contextPath}/styles/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/default.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.json-2.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.qrcode.min.js"></script>
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
	<form method="post" action="/user/findPosition">
	<div class="d1">
		<div class="left">
			<div class="box">

				<div class="tit">
					<h3>搜索职位</h3>
					<div class="clear"></div>
				</div>

					<div class="search">
					<div class="left">
						<div class="keybox">
							<div class="keyinputbox">
								<input name="key" type="text" id="index-search-key"
									maxlength="25" value="" style="color: #CCCCCC" />
							</div>
							<div class="subinputbox">
								<input type="submit" id="index-search-button" value="搜职位" />
							</div>

						</div>
							<div class="clear"></div>
						</div>
					</div>

			</div>
		</div>

		<div class="clear"></div>
	</div>
	<div class="d2">
		<div class="left">
			<div class="box">
				<div class="tit">
					<h3>附加条件</h3>
					<div class="clear"></div>
				</div>
				<div class="list link_lan">
					类型1<select weitht="200" name="p_type1" id="p_type1">
					<option value="">请选择</option>
					<option value="">所有</option>
					<c:forEach items="${types}" var="v">
						<option  value="${v.p1 }">${v.pname }</option>
					</c:forEach>
				</select>
				</div>
				<div class="list link_lan">
					类型2<select weitht="200" name="p_type2" id="p_type2">
					<option value="">请选择</option>
					<option value="">所有</option>
				</select>
				</div>
				<div class="list link_lan">
					类型3<select weitht="200" name="p_type3" id="p_type3">
					<option value="">请选择</option>
					<option value="">所有</option>
				</select>
				</div>
				<div class="list link_lan">
					工作地点<select name="p_address" >
					<option value="">不限</option>
					<option value="北京">北京</option>
					<option value="上海">上海</option>
					<option value="郑州">郑州</option>
					<option value="其他">其他</option>
				</select>
				</div>
				<div class="list link_lan">
					工作经验<select name="required_work" >
					<option value="">不限</option>
					<option value="无要求">无要求</option>
					<option value="有经验">有经验</option>
				</select>
				</div>
			</div>
		</div>
	</div>
	</form>
	<div class="d3">
		<div class="left">
			<div class="box">
				<div class="tit">
					<div class="tbox">
						<strong>推荐职位</strong>
					</div>

					<div class="clear"></div>
					<c:forEach begin="1" end="24">
						<div class="list link_lan">
							<a href="company/comp_view.jsp" target="_blank">中软国际</a><span
								style="color: #666666">(08-12)</span> <br /> <span
								style="color:#009900">聘:</span><span class="link_bk"> <a
								href="jobs/jobs_view.jsp" target="_blank">Java程序员</a>
							</span>
						</div>
					</c:forEach>

				</div>

				<div class="clear"></div>
			</div>
		</div>

		<div class="clear"></div>


	</div>
	<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
	<script type="text/javascript">


        $("#p_type1").change(function (){
            var id1 = $("[name=p_type1]").val()

            /* ajax请求 */
            $.ajax({
                url : "/company/type2",
                type : "post",
                data : {
                    "id1" : id1
                },
                dataType : "json",
                success : function(data) {
                    var str="<option>请选择</option>"
                    $("#p_type2").html("");
                    for ( var i = 0; i < data.length; i++) {
                        str += "<option value='" + data[i].pid
                            + "'>" + data[i].pname
                            + "</option>";
                    }
                    $("#p_type2").append(str);
                }
            });

        });

        $("#p_type2").change(function (){
            var id2 = $("[name=p_type2]").val()


            /* ajax请求 */
            $.ajax({
                url : "/company/type3",
                type : "post",
                data : {
                    "id2" : id2
                },
                dataType : "json",
                success : function(data) {
                    var str="<option>请选择</option>"
                    $("#p_type3").html("");
                    for ( var i = 0; i < data.length; i++) {
                        str += "<option value='" + data[i].pid
                            + "'>" + data[i].pname
                            + "</option>";
                    }
                    $("#p_type3").append(str);
                }
            });

        });


	</script>
</body>
</html>