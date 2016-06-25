<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta name="viewport"
	content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ch/js/appframework.min.js"></script>

<style type="text/css">
body,div,button,ul,li,a,header,h4 {
	font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei",
		"微软雅黑", "STHeiti", "WenQuanYi Micro Hei", SimSun, sans-serif;
	color: #666666;
	background: #f8f8f8 !important;
}

body {
	padding: 0px;
	margin: 0px;
}

.header {
	height: 50px;
	background-color:rgb(0,168,255) !important;
	color:#fff;
	font-weight: 800;
	text-align: center;
	line-height: 50px;
	position: absolute;
	bottom:0;
	width:100%
}
button{
	text-align: center;
	margin-left:20%
}
.test_area{
	margin-top:20%;
	height:100px;
	width:200px
}
.school{
	background-color:#428bca !important;
	color:#fff;
	font-size: 15pt
}
.society{
	background-color:#5cb85c !important;
	color:#fff;
	font-size: 15pt
}
</style>
</head>

<body>
	<div class="header">
	<button></button>
	</div>
	<button class="test_area school">校招微测试专区</button><br>
	<button class="test_area society">测评</button>
</body>
</html>
