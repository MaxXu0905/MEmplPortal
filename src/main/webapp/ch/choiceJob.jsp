<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'choiceJob.jsp' starting page</title>
    <meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="<%=request.getContextPath()%>/ch/js/appframework.min.js"></script>
    
    <style type="text/css">
      .topheader{border-bottom:1px solid #00a8ff;padding:4% 5%;color:#fff;font-size: 15pt;background-color: #00a8ff}
      .content{background-color:#fff;border:1px solid #bcbcbc;width:100%;margin-top: 10px;font-size: 15pt;color:#00a8ff;text-align: center;height:50px;line-height: 50px;border-radius:10px;margin-top:20px}
      .btn-info{background:#00a8ff!important;border:1px solid #0091dc;font-size:15pt;color:#fff!important;border-radius:10px;width:100%;height:50px;}
      .btn-info:hover{background:#0092dd!important;border:1px solid #0080c3;font-size:15pt;color:#fff;border-radius:10px;width:100%;height:50px;}
      #con{width:100%}
      .bak_btn{border:none;background-color: #00a8ff}
      .bak_btn:hover{border:none;background-color: #0092dd}
    </style>
  </head>
  
  <body>
   <div class="topheader">
   <button type="button" class="bak_btn"><image src="<%=request.getContextPath() %>/ch/images/back.png"></button>
       请选择职位意向
   </div>
   <div id="con">
       	 <button class="content">JAVA方向</button>
       	 <button class="content">C++方向</button>
   </div>
  </body>
</html>
<script type="text/javascript">
     $('#con').on('click','.content',function(){
	     $('.content').removeClass("btn-info");
	     $(this).addClass("btn-info");
	     alert($(this).text());
     });
</script>
