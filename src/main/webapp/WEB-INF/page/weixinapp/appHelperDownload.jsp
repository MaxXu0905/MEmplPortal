<%@ page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>百一测速下载</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<style type="text/css">
.icon-type {
	width: 36px;
	vertical-align: middle;
}

.cm-code {
	color: #AE1A2B;
	font-weight: bold;
}

.icon-dot-h {
	margin: 0 2px;
	padding: 10px;
	width: 18px;
	vertical-align: middle;
	background-color: #22292C;
}

.icon-dot-v {
	margin: 0 2px;
	padding: 10px;
	width: 6px;
	vertical-align: middle;
	background-color: #22292C;
}

.btn {
	text-decoration: none;
	display: block;
	padding: 12px 24px;
	text-align: center;
	cursor: pointer;
	border-radius: 4px;
	width: 100%;
}

.btn-green {
	color: #fff;
	background-color: #A5C845;
}

.btn-red {
	color: #fff;
	background-color: #d9534f;
}

p {
	line-height: 1.5;
}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/ch/js/appframework.min.js"></script>
<script type="text/javascript">
  	var root ="<%=basePath%>";
  	var authCode = "${requestScope.authCode}";
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('showOptionMenu');
	});
	/* function onBridgeReady(){
		 WeixinJSBridge.call('showOptionMenu');
		}

		if (typeof WeixinJSBridge == "undefined"){
		    if( document.addEventListener ){
		        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
		    }else if (document.attachEvent){
		        document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
		        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
		    }
		}else{
		    onBridgeReady();
		} */
	
</script>
</head>
<body>
	<p>百一测速旨在测试考试地点的信号强度和带宽是否能够正常支持微信考试</p>
	<p>预计花费时间30分钟，预计消耗流量80兆（合20元）</p>
	<p>
		测速口令：<span class="cm-code"></span>
	</p>
	<table>
		<tr>
			<td width="15%"><img class="icon-type" src="<%=basePath%>ch/images/icon-apple-black.png" /></td>
			<td width="85%"><a target="_blank" href="http://fir.im/jvso" class="btn btn-red">苹果版本下载</a></td>
		</tr>
		<tr>
			<td width="15%"><img class="icon-type" src="<%=basePath%>ch/images/icon-android-green.png" /></td>
			<td width="85%"><a target="_blank" href="http://fir.im/qo3b" class="btn btn-green">android版本下载</a></td>
		</tr>
	</table>
	<p>下载步骤：</p>
	<p>
		1、点击页面右上角<img class="icon-dot-h" src="<%=basePath%>ch/images/icon-dot-h.png" />或者<img class="icon-dot-v"
			src="<%=basePath%>ch/images/icon-dot-v.png" />， 选择“用浏览器打开”（微信不支持下载）。
	</p>
	<p>2、根据手机操作系统型号选择相应的选项下载应用。</p>
	<p>测速步骤：</p>
	<p>1、根据手机号码和口令登录百一测速工具。</p>
	<p>2、填写考试地点，并按照提示依次测试。</p>

</body>
<script type="text/javascript">
$('.cm-code').text(authCode||'demo');
</script>
</html>
