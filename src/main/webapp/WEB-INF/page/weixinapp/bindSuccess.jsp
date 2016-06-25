<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>返回微信页面</title>
<meta name="viewport"
	content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ch/js/appframework.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/core/js/accountUnbind.js"></script>
<style type="text/css">
	body,div,button,ul,li,a,header,h4 {
	font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei",
		"微软雅黑", "STHeiti", "WenQuanYi Micro Hei", SimSun, sans-serif;
	color: #666666;
}

body {
	padding: 0px;
	margin: 0px;
}
	
	#menu { 
	height: 50px;
	width: 50px;
	position: absolute;
	right: 0;
	cursor: pointer;
}

.show{
	display: block !important
}

.gone{
	display:none
}

#select {
	margin-right: 10px;
	vertical-align: middle;
	margin-top: 10px
}
.header {
	height: 50px;
	background-color: rgb(0, 168, 255) !important;
	color: #fff;
	font-weight: 800;
	line-height: 50px;
	position: absolute;
	bottom: 0;
	width: 100%;
	text-align: right
}
#list-menu >div{
	height:50px;
	border-bottom: 1px solid #fff;
	color:#fff;
	cursor: pointer;
	line-height: 50px
}
#list-menu {
	background-color: rgb(0, 168, 255) !important;
	width: 106px;
	text-align: center;
	position: fixed;
	bottom: 50px;
	right: 0;
	display: none;
}

	
</style>
</head>

<body>
	<!-- 导航栏部分 -->
	<div class="header">
		<div id="menu">
			<img src="<%=request.getContextPath()%>/ch/images/select.png"
				id="select">
		</div>
	</div>
	<!-- 菜单列表部分 -->
	<div id="list-menu">
		<!-- <div id="speed">查看测速口令</div> -->
		<div id="logout">账号解绑</div>
	</div>
	<div id="text-content">
		<div style="text-align:center;height:100px;line-height:30px;color:#00A8FF;font-size:12pt;padding-top:100px">已绑定成功<br>测评报告将实时送到您手中。</div>
	</div>
</body>
</html>
<script type="text/javascript">
var employer_name = "${sessionScope.employer_name}";
var home = "${sessionScope.lastHomePath}";
var userOpenId = "${sessionScope.userOpenId}";
var root = "<%=basePath%>";
	$(document).ready(function(){
		$('#menu').click(function(){
					$('#list-menu').toggleClass("show");
				});
	});
</script>