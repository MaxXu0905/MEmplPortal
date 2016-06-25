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
	var home = "${sessionScope.lastHomePath}";
	var employer_name = "${sessionScope.employer_name}";
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
	position: absolute;
	bottom: 0;
	width: 100%;

}

#list-menu{
	background-color: rgb(0, 168, 255) !important;
	width:106px;
	text-align: center;
	position: absolute;
	bottom:50px;
	right:0;
	display:none;
}
.show{
	display: block !important
}

.gone{
	display:none
}
#list-menu >div{
	height:50px;
	border-bottom: 1px solid #fff;
	color:#fff;
	cursor: pointer;
	line-height: 50px
}

button {
	text-align: center;
	border:0px;
	border-radius:8px;
}

.test_area {
	height: 150px;
	width: 75%;
	margin:8% auto;
	font-size: 16pt;
	font-weight:400;
}

.school {
	background-color: #428bca !important;
	color: #fff;
}

.society {
	background-color: #5cb85c !important;
	color: #fff;
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
	vertical-align: middle
}

.report {
	font-size: 12pt !important;
	font-weight:300 !important;
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
	<!-- 内容区域 -->
	<center>
	<button class="test_area school" id="schoolList">
		校招微信测评专区<br>
		<span class="report" id="schoolReport"></span>
	</button>
	<br>
	<button class="test_area society" id="societyList">
		在线测评<br>
		<span class="report" id="societyReport"></span>
	</button>
	</center>
</body>
</html>

<script type="text/javascript">
	(function() {
		var pageInit = {
			init : function() {
			var _that = this;
				this.check(_that);
			},
			check : function(_that) {
				$
						.ajax({
							url : root
									+ "sets/wx/schoolPosition/getPositionTestTypeInfo",
							type : "post",
							contentType : "application/json",
							dataType : "json",
							success : function(result) {
								var datas = result.data;
								var pending;
								if (result.code == 0) {
									if (datas[0].reportStatusCountInfo.length > 0) {
										for(var a=0;a<datas[0].reportStatusCountInfo.length;a++){
											if(datas[0].reportStatusCountInfo[a].testResult==0){
											soc_pending = "（有"
													+ datas[0].reportStatusCountInfo[a].count
													+ "份待处理报告）";
													break;
											}else{
											soc_pending = "（无待处理报告）";
											}
										}
										
									} else {
										/* $('#societyList').attr("disabled",true); */
										soc_pending = "（无待处理报告）";
									}
									if(datas[1].reportStatusCountInfo.length >0){
									for(var b=0;b<datas[1].reportStatusCountInfo.length;b++){
										if(datas[1].reportStatusCountInfo[b].testResult==0){
										school_pending = "(有"
												+ datas[1].reportStatusCountInfo[b].count
												+ "份待处理报告)";
												break;
										}else{
										school_pending = "（无待处理报告）";
										}
										}
									}else {
										/* $('#schoolList').attr("disabled",true); */
										school_pending = "（无待处理报告）";
									}
									if (datas.length > 1) {
										if (datas[0].testType == 1) {
											$('#societyReport').text(
													soc_pending);
											$('#schoolReport').text(
													school_pending);
										}
									} 
									_that.bindEvent(result);
								}
							}
						})
			},
			bindEvent : function(result){
				$('#menu').click(function(){
					$('#list-menu').toggleClass("show");
				});
				$('#schoolList').click(function(){
					if(result.data[1].positionNum>1){
						location.replace(root+"sets/wx/schoolTest?type=2");
					}else{
						var posId =result.data[1].positionId;
						location.replace(root+"sets/wx/actitylist?positionId="+posId+"&list=0");
					}
				});
				$('#societyList').click(function(){
					if(result.data[0].positionNum>1){
						location.replace(root+"sets/wx/societyTest?type=1");
					}else{
						var posId =result.data[0].positionId;
						location.replace(root+"sets/wx/examReport?positionId="+posId+"&list=0");
					}
				});
			}
		}
		pageInit.init();
	})()
</script>
