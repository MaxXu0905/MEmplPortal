<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>百一测评系统</title>	
    <meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="ch/css/bootstrap.css"/>
	<link rel="stylesheet" href="ch/css/jquery.mobile-1.4.2.min.css" />
	<link rel="stylesheet" href="ch/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/json2.js"></script>
	<script type="text/javascript" src="ch/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="ch/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="ch/js/jquery.mobile-1.4.2.min.js"></script>  
	<script src="<%=request.getContextPath()%>/plugin/jquery.md5.js"></script>
	<script type="text/javascript">
		var root = "<%=basePath%>";
  		document.addEventListener('WeixinJSBridgeReady',function onBridgeReady(){
					WeixinJSBridge.call('hideOptionMenu');
		});
 	</script> 
    <style type="text/css">
    body{
    background:#f8f8f8 !important;
    padding:0px;
    margin:0px;
    }
    body,div,button,ul,li,a,header,h4,input{
    	font-family:"Open Sans",Arial,"Hiragino Sans GB","Microsoft YaHei","微软雅黑","STHeiti","WenQuanYi Micro Hei",SimSun,sans-serif;
	color: #666666;
    }
  	.headertop{
	background:url("ch/images/topheader2.png") no-repeat top left;
	height:128px;
	border-bottom:1px solid #eeeeee;
	}  

#username{
background:url("ch/images/mail.png") no-repeat 0.6em center !important;
 padding-left:2.4em  !important;
}	
#password{
background:url("ch/images/pwd.png") no-repeat 0.4em center !important;
 padding-left:2.4em  !important;
}
#certifycode{
background:url("ch/images/pwd.png") no-repeat 0.4em center !important;
 padding-left:2.4em  !important;
}  

	 .btn-info{background:#00a8ff;border:1px solid #0091dc;font-size:16pt;}
	    .btn-info:hover{background:#0092dd;border:1px solid #0080c3;font-size:16pt;}  
	 .right{ width:30px;height:30px;margin-left:305px;margin-top:-43px; display:none;}
	 .wrong{ width:30px;height:30px;margin-left:305px;margin-top:-43px;display:none;}
  	

label{margin:0px; !important; height:0.2em !important;}
.login{background:#f8f8f8;padding-top:16px;}	    
	img{height:40px}    
.checkMark{
	display: none;
}
 
	</style>
    
  </head>
  
  <body>
 <div class="headertop"></div>
<header id="banner" >
    <div data-role="content" class="login">
   <label for="username">&nbsp;</label>
    <input type="text" id="username" name="username" class="index_input"  placeholder="请填写邮箱">
    <label for="psd">&nbsp;</label>
    <input type="password" id="password" name="password" class="index_input" maxlength="16" placeholder="请填写密码">
    <label for="certifycode">&nbsp;</label>
     <div id='checkcertifycode'>
    <input type="text" id="certifycode" name="certifycode" class="index_input" placeholder="请填写验证码">
    	<img src="sets/wx/login/validateCode" style="border:1px solid #e8e8e8;">&nbsp;&nbsp;&nbsp;<span><a id="change">看不清楚，换一张</a></span>
    </div>
   <button type="button" id="save_messages" class="btn btn-info btn-block" style="margin-top:14px;">登录</button>
    </div>
   	 <div class="page_er" id="error">网络异常</div> 	
     <div class="page_er" id="ACCTNOTEXIST">账号已经存在</div> 
     <div class="page_er" id="PASSWORDERROR">密码错误</div> 
     <div class="page_er" id="CERTIFYCODEERR">验证码错误</div> 
</body>
</html>

<script type="text/javascript">
	   	  $(document).ready(function(){
		      $('#checkcertifycode').hide();
		      $('.page_er').hide();
		      needValidateCode();//调用函数判断是否显示验证码
		      $('#save_messages').removeClass('ui-btn ui-shadow ui-corner-all');
        });
        	      //点击 换图片
			 $('#change').click(function(){
			 	$("img").attr("src","sets/wx/login/validateCode?time=" + new Date().getTime());
			 	});
      
		       $('#save_messages').click(function jump(){
			     			certify();
		       });
       function needValidateCode(){
        $.ajax({
        		url:root+"sets/wx/login/needValidateCode",
        		type:"post",
        		contentType:"application/json",
        		dataType:"json",
        		success:function(result){
        			if(result.code!=0){
        				setTimeout(function(){
								$('#error').fadeIn();
								setTimeout(function(){
								$('#error').fadeOut();
								}, 5000);
								}, 0);
        				return;
        			}
        			else{
        				 if(result.data.needCode == 1){
        					//需要验证码
        					$('#checkcertifycode').show();
        				}
        			}
        		}
        	});
       	 }
       
		function certify(){//点击登录的时候调用该方法
			//封装成json格式
			var data = {};
			var certifycode = $('#certifycode').val();
			var username = $('#username').val();
			var password = $.md5($("#password").val());
			
			data.certifycode = certifycode;
			data.username = username;
			data.password = password; 
			    // 封装基本信息给后台
			$.ajax({
				url:root+"sets/wx/login/certify",
				type:"post",
				contentType:"application/json",
				dataType:"json",
				data : JSON.stringify(data),
				success:function(result){
					if(result.code!=0){
						setTimeout(function(){
						$('#error').fadeIn();
						setTimeout(function(){
						$('#error').fadeOut();
						}, 5000);
						}, 0);
						return;
					}
					else{
						if(result.data.needCode == 0){
							//不需要输入验证码
						}
					    if(result.data.needCode == 1){
							//需要输入验证码
							$('#checkcertifycode').show();
						}
						if(result.data.code=="SUCCESS"){
							location.href=root+"ch/page6.jsp#wechat_webview_type=1";
						}
							console.log(result.data.code)
						if(result.data.code=="ACCTNOTEXIST"){
							setTimeout(function(){
								$('#ACCTNOTEXIST').fadeIn();
								setTimeout(function(){
								$('#ACCTNOTEXIST').fadeOut();
								}, 5000);
								}, 0);
						}
						if(result.data.code=="PASSWORDERROR"){
							setTimeout(function(){
								$('#PASSWORDERROR').fadeIn();
								setTimeout(function(){
								$('#PASSWORDERROR').fadeOut();
								}, 5000);
								}, 0);
						}
						if(result.data.code=="CERTIFYCODEERR"){
							setTimeout(function(){
								$('#CERTIFYCODEERR').fadeIn();
								setTimeout(function(){
								$('#CERTIFYCODEERR').fadeOut();
								}, 5000);
								}, 0);
						}
					}
				
				}
			});
		}  
</script>