<%@ page language="java" import="java.util.*,com.ailk.sets.common.Constant" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	// 取出需要重定向的url，然后清空掉
	// String request_url = session.getAttribute(Constant.REQUEST_URL)==null?"":(String)session.getAttribute(Constant.REQUEST_URL);
	// session.removeAttribute(Constant.REQUEST_URL);
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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ch/js/appframework.min.js"></script>
<script src="<%=request.getContextPath()%>/ch/js/md5.js"></script>
<script type="text/javascript">
	var LOGIN_REQUEST_URL = "${requestScope.request_url}";
	var root = "<%=basePath%>";
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideOptionMenu');
	});
</script>
<style type="text/css">
body {
	background: #f8f8f8 !important;
	padding: 0;
	margin: 0
}

body,div,button,ul,li,a,header,h4,input {
	font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei",
		"微软雅黑", "STHeiti", "WenQuanYi Micro Hei", SimSun, sans-serif;
	color: #666
}

.headertop {
	background: url("ch/images/topheader2.png") no-repeat top left;
	height: 128px;
	border-bottom: 1px solid #eee
}

.btn-info {
	background: #00a8ff;
	font-size: 16pt;
	height: 50px;
	width: 100%;
	color: #fff
}

.btn-info:hover {
	background: #0092dd;
	font-size: 16pt;
	color: #fff
}

.right {
	width: 30px;
	height: 30px;
	margin-left: 305px;
	margin-top: -43px;
	display: none
}

.wrong {
	width: 30px;
	height: 30px;
	margin-left: 305px;
	margin-top: -43px;
	display: none
}

label {
	margin: 0; ! important;
	height: .2em !important
}

.login {
	background: #f8f8f8;
	padding-top: 16px
}

img {
	height: 40px
}

.checkMark {
	display: none
}

.index_input {
	font-size: 13pt;
	height: 40px;
	border: 1px solid #bcbcbc
}

.page_er {
	border: 1px solid #f5beaa;
	color: #e85757;
	padding: 16px 30px 16px 50px;
	z-index: 999;
	position: fixed;
	top: 0;
	width: 100%;
	text-align: left;
	background-color: #fdece3 !important;
	background: url(<%=request.getContextPath()%>/ch/images/war.png )
		no-repeat 15px center;
	display: none
}

.topheader {
	border-bottom: 1px solid #00a8ff;
	background: #fff;
	color: #00a8ff;
	padding: 2% 5% 4% 5%;
	font-weight: 700
}
</style>

</head>

<body>
	<div class="topheader" style="text-align: left">用户登录</div>
	<!-- <div data-role="content" class="login"> -->
	<div style="margin:0px auto;width:90%;">
		<form style="margin-bottom:20px;">

			<input type="text" id="username" name="username" class="index_input"
				style="margin-top:30px;padding-left:1%;width:99%;"
				placeholder="请填写邮箱"> <br> <label for="psd">&nbsp;</label><br>
			<input type="password" id="password" name="password"
				style="padding-left:1%;width:99%;margin-top:5px;"
				class="index_input" maxlength="16" placeholder="请填写密码"><br>
			<label for="certifycode"></label>
			<!-- <div id='checkcertifycode'> -->
			<input type="text" id="certifycode" name="certifycode"
				class="index_input"
				style="padding-left:1%;width:99%;margin-top:25px;"
				placeholder="请填写验证码"><br>
			<img id="chose_num"
				src="${pageContext.request.contextPath}/sets/wx/login/validateCode"
				style="border:1px solid #e8e8e8;margin-top:20px;cursor: pointer;">&nbsp;&nbsp;&nbsp;<span><a
				id="change">换一张</a> </span><br>
			<!-- </div> -->
			<button type="button" id="save_messages" class="btn-info"
				style="border:none;margin-top:10px;">登录</button>
		</form>
	</div>
	<!-- </div> -->
	<div class="page_er" id="error">网络异常</div>
	<div class="page_er" id="ACCTNOTEXIST">账号不存在</div>
	<div class="page_er" id="PASSWORDERROR">密码错误</div>
	<div class="page_er" id="CERTIFYCODEERR">验证码错误</div>
	<div class="page_er" id="isempty">请输入验证码</div>

</body>
</html>

<script type="text/javascript">
	var openId = "${requestScope.openId}";

	var code = 0;
	var reqData;

	function needValidateCode() {
		$.ajax({
			url : root + "sets/wx/login/needValidateCode",
			type : "post",
			contentType : "application/json",
			dataType : "json",
			success : function(result) {
				if (result.code != 0) {
					setTimeout(function() {
						$("#error").show();
						setTimeout(function() {
							$("#error").hide();
						}, 5e3);
					}, 0);
					return;
				} else {
					if (result.data.needCode == 1) {

						code = result.data.needCode;
						$("#certifycode").show();
						$("#change").show();
						$("#chose_num").show();
					}
				}
			}
		});
	}


	function certify() {
		var data = {};
		var certifycode = $("#certifycode").val();
		var username = $("#username").val();
		var password = hex_md5($("#password").val());
		data.certifycode = certifycode;
		data.username = username;
		data.password = password;
		data.openId = openId;
		$
				.ajax({
					url : root + "sets/wx/login/certify",
					type : "post",
					contentType : "application/json",
					dataType : "json",
					data : JSON.stringify(data),
					success : function(result) {
						if (result.code != 0) {
							setTimeout(function() {
								$("#error").show();
								setTimeout(function() {
									$("#error").hide();
								}, 5e3);
							}, 0);
							return;
						} else {
							if (result.data.needCode == 0) {
								code = result.data.needCode;
							}
							if (result.data.needCode == 1) {
								code = result.data.needCode;
								$("#certifycode").show();
								$("#change").show();
								$("#chose_num").show();
							}
							if (result.data.code == "SUCCESS") {
								if (LOGIN_REQUEST_URL) {
									location.replace(LOGIN_REQUEST_URL);
									return;
								}
								
								$.ajax({
								url : root
										+ "sets/wx/schoolPosition/getPositionTestTypeInfo",
								type : "post",
								contentType : "application/json",
								dataType : "json",
								success : function(result) {
									var datas =result.data; 
									if(datas.length>1){
 										location.replace(root + "sets/wx/testList"); 
									}else if(datas.length==1){
										if(datas[0].testType==1){
											if(datas[0].positionNum>1){
 												location.replace(root + "sets/wx/societyTest?positionId="+datas[0].positionId); 
											}else{
 												location.replace(root + "sets/wx/examReport?positionId="+datas[0].positionId); 
											}
										}else{
											if(datas[0].positionNum>1){
 												location.replace(root + "sets/wx/schoolTest?positionId="+datas[0].positionId); 
											}else{
 												location.replace(root + "sets/wx/actitylist?posId="+datas[0].positionId); 
											}
										}
									}else if(datas.length==0){
										location.replace(root + "sets/wx/bindSuccess"); 
									}
								}
								})
							}
							if (result.data.code == "ACCTNOTEXIST") {
								setTimeout(function() {
									$("#ACCTNOTEXIST").show();
									setTimeout(function() {
										$("#ACCTNOTEXIST").hide();
									}, 5e3);
								}, 0);
							}
							if (result.data.code == "PASSWORDERROR") {
								setTimeout(function() {
									$("#PASSWORDERROR").show();
									setTimeout(function() {
										$("#PASSWORDERROR").hide();
									}, 5e3);
								}, 0);
							}
							if (result.data.code == "CERTIFYCODEERR") {
								setTimeout(function() {
									$("#CERTIFYCODEERR").show();
									setTimeout(function() {
										$("#CERTIFYCODEERR").hide();
									}, 5e3);
								}, 0);
							}
						}
					}
				});
	}

	$(document).ready(function() {
		$("#certifycode").hide();
		$("#change").hide();
		$("#chose_num").hide();
		$(".page_er").hide();
		needValidateCode();
		$("#save_messages").removeClass("ui-btn ui-shadow ui-corner-all");
	});

	$("#change").click(
			function() {
				$("img").attr(
						"src",
						"${pageContext.request.contextPath}/sets/wx/login/validateCode?time="
								+ new Date().getTime());
			});

	$("#save_messages").click(function jump() {
		if ($('#username').val() != "" && $('#password').val() != "") {
			if (code == 1) {
				var checkCode = $("#certifycode").val();
				if (checkCode == "") {
					setTimeout(function() {
						$("#isempty").show();
						setTimeout(function() {
							$("#isempty").hide();
						}, 5e3);
					}, 0);
				}
			}
			certify();
		}
	});
</script>