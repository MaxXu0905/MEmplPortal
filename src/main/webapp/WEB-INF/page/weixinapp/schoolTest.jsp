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

<title>返回微信窗口</title>
<meta name="viewport"
	content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ch/js/appframework.min.js"></script>
<script src="<%=request.getContextPath()%>/core/js/accountUnbind.js"></script>
<script type="text/javascript">
	var root = "<%=basePath%>";
	var type = "${param.type}";
	var employer_name = "${sessionScope.employer_name}";
	var home = "${sessionScope.lastHomePath}";
	var userOpenId = "${sessionScope.userOpenId}";
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>

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

.header {
	height: 50px;
	background-color: rgb(0, 168, 255) !important;
	color: #fff;
	font-weight: 800;
	line-height: 50px;
	position: fixed;
	bottom: 0;
	width: 100%;
	text-align: right
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

.show {
	display: block !important
}

.gone {
	display: none
}

#list-menu>div {
	height: 50px;
	border-bottom: 1px solid #fff;
	color: #fff;
	cursor: pointer;
	line-height: 50px
}

#menu {
	height: 50px;
	width: 50px;
	position: absolute;
	right: 0;
	cursor: pointer;
}

#select {
	margin-right: 10px;
	vertical-align: middle;
	margin-top: 10px
}

.back {
	height: 50px
}

#back {
	position: absolute;
	left: 0;
	cursor: pointer;
}
.list-content{
	border-bottom:1px solid rgb(190,190,190);
	text-align: left;
	line-height: 21px;
	padding: 15px 15px 15px 20px ;
	background: url("core/images/icon_blue_nav_right_48.png") no-repeat right 15px center;
	background-size:20px 20px;
}
.list-content span{font-size:13px;}
.noReport{
	height:150px;
	line-height: 150px;
	text-align: center;
}
#report_list{
	margin-bottom:50px
}
.backStep{
	position: absolute;
	left:50px;
	color:#fff;
	font-weight:normal
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
		<div id="back">
			<img
				src="${pageContext.request.contextPath}/core/images/icon_white_nav_left_96.png"
				class="back">
		</div>
		<div class="backStep">上一步</div>
	</div>
	<div id="list-menu">
		<!-- <div id="speed">查看测速口令</div> -->
		<div id="logout">账号解绑</div>
	</div>
	<!-- 列表部分 -->
	<div id = "report_list">
	</div>
	
</body>
</html>

<script type="text/javascript">
	(function() {
		var _that;
		var List = {
			init : function() {
				_that = this;
				var dataList = {
					"pageSize" : 1000,
					"requestPage" : 1
				};
				$.ajax({
					url : root
							+ "sets/wx/schoolPosition/getPositionByTestType/2",
					type : "post",
					data : JSON.stringify(dataList),
					dataType : "json",
					contentType : "application/json",
					success : function(result) {
						_that.view(result);
					}
				})
				_that.bindEvent();
			},
			view : function(result) {
				var $div = $('#report_list');
				if (result.code == 0) {
				 if(result.data){
					var datas = result.data;
					var listContent = [];
					for(var i=0;i<datas.length;i++){
						listContent.push('<div class="list-content" data-posId = "'+datas[i].positionId+'">'+datas[i].positionName+'<br><span>');
						if(datas[i].reportStatusCountInfo.length>0){
							for(var a =0;a<datas[i].reportStatusCountInfo.length;a++){
								if(datas[i].reportStatusCountInfo[a].testResult==0){
									listContent.push('（'+datas[i].reportStatusCountInfo[a].count+'个待处理报告）');
									break;
								}else{
									listContent.push('（无待处理报告）');
									break;
								}
							}
						}else{
									listContent.push('（无待处理报告）');
						}
									listContent.push('</span></div>');
					}
						$div.html(listContent.join(''));
				 }else{
				 	$div.text("暂无任何测评").addClass("noReport");
				 }
				}
			},
			bindEvent : function(){
				$('#report_list').on('click','.list-content',function(){
					var postionId = $(this).data("posid");
					location.replace(root+"sets/wx/actitylist?positionId="+postionId+"&type=2");
				});
				$('#back').click(function(){
					location.replace(root+"sets/wx/testList");
				});
				$('.backStep').click(function(){
					location.replace(root+"sets/wx/testList");
				});
				$('#menu').click(function(){
					$('#list-menu').toggleClass("show");
				});
			}
		}
		List.init();
	})()
</script>