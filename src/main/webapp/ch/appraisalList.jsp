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

<title>My JSP 'appraisalList.jsp' starting page</title>
<meta name="viewport"
	content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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

#header {
	height: 50px;
	background-color:black !important;
	color:#fff;
	font-weight: 800;
	text-align: left;
	line-height: 50px;
	padding-left:20px
}
.list{
	border-bottom:1px solid red;
	height:63px;
	line-height:63px;
}
</style>

</head>

<body>
	<div id="header">校招微信测评专区</div>
	<!-- 测评列表部分 -->
	<div id="content">
		<div class="list">2014年春季校园招聘测评-C++</div>
		<div class="list">2014年春季校园招聘测评-java</div>
	</div>
</body>
</html>
