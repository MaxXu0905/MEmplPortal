<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>返回微信窗口</title>
<meta name="viewport"
	content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/core/css/wx.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/core/css/examReport.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/ch/js/appframework.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/core/js/examReport.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/core/js/accountUnbind.js"></script>
<script type="text/javascript">
	var employer_name = "${sessionScope.employer_name}";
	var home = "${sessionScope.lastHomePath}";
	var root = "<%=basePath%>";
	var ACT = "${param.act}";
	var ROOT = "${pageContext.request.contextPath}";
	var openId = "${param.openId}";
	var positionId = "${param.positionId}";
	var type = "${param.type}";
	var all = "${param.type}";
	var posId = "${requestScope.positionId}";
	var list = "${param.list}";
	var userOpenId = "${sessionScope.userOpenId}";
	var userId = "${param.userId}";
</script>
</head>
<body>
	<div id="list-menu">
		<!-- <div id="speed">查看测速口令</div> -->
		<div id="logout">账号解绑</div>
	</div>
	<div class="action-bar report-action-bar">
		<div class="btn img-btn nav-back nav-l1" data-action="back" id="back">
			<img src="${pageContext.request.contextPath}/core/images/icon_white_nav_left_96.png">
		</div>
		<div class="backStep">上一步</div>
		<div class="btn img-btn nav-search nav-r3" id="menu">
			<img src="${pageContext.request.contextPath}/ch/images/select.png">
		</div>
		<div class="btn img-btn nav-search nav-r2" data-action="search">
			<img src="${pageContext.request.contextPath}/core/images/icon_white_nav_search_96.png">
		</div>
		<div class="btn img-btn nav-refresh nav-r1" data-action="refresh">
			<img src="${pageContext.request.contextPath}/core/images/icon_white_nav_refresh_96.png">
			<span class="new-report-tag"></span>
		</div>
	</div>
	<div class="list-view report-list">
		<div class="list-header">
			<span class="rank">排 名</span> <span class="name">姓 名</span> <span class="score">分 数（10）</span> <span class="detail">&nbsp;</span>
			<div class="list-alert"></div>
		</div>
		<div class="list-body"></div>
		<div class="list-footer"></div>
	</div>
	<div class="search-wrapper">
		<div class="action-bar search-action-bar">
			<div class="btn img-btn nav-back nav-l1" data-action="back">
				<img src="${pageContext.request.contextPath}/core/images/icon_white_nav_left_96.png">
			</div>
			<div class="btn nav-search nav-r1" data-action="confirm">确 定</div>
		</div>
		<div class="container filter-wrapper">
			<div class="search-input-wrapper">
				<img src="${pageContext.request.contextPath}/core/images/icon_white_nav_search_96.png">
				 <input class="pull-left search-input" type="text"
					placeholder="输入电话/姓名/邮箱模糊搜索" />
			</div>
			<div class="search-filter">
				<label class="title">按状态筛选：</label>
				<ul class="filter-status">
					<li class="btn btn-info status-item" value="0" id="wait">待处理（0人）</li>
					<li class="btn btn-default status-item" value="3" id="retest">进入复试（0人）</li>
					<li class="btn btn-default status-item" value="1" id="willhired">拟录用（0人）</li>
					<li class="btn btn-default status-item" value="2" id="nohired">拟不录用（0人）</li>
				</ul>
				<label class="title" style="display:none">按职位筛选：</label>
				<ul class="filter-position" style="display:none">
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
