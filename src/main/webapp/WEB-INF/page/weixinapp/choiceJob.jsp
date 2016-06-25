<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>亚信2014春季校招-北航</title>
    <meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="<%=request.getContextPath()%>/ch/js/appframework.min.js"></script>
    
    <style type="text/css">
    *{padding:0px;margin:0px;}
      .topheader{border-bottom:1px solid #00a8ff;padding:4% 5%;color:#fff;font-size: 15pt;background-color: #00a8ff}
      .content{background-color:#fff;border:1px solid #bcbcbc;width:100%;margin-top: 10px;font-size: 15pt;color:#00a8ff;text-align: center;height:50px;border-radius:10px;margin-top:20px}
      .btn-info{background:#00a8ff!important;border:1px solid #0091dc;font-size:15pt;color:#fff!important;border-radius:10px;width:100%;height:50px;}
      .btn-info:hover{background:#0092dd!important;border:1px solid #0080c3;font-size:15pt;color:#fff;border-radius:10px;width:100%;height:50px;}
      #con{width:100%}
      .bak_btn{border:none;background-color: #00a8ff;float:left}
      .bak_btn:hover{border:none;background-color: #0092dd}
      .content{background-color: #fff;line-height: 50px;height:50px;border:1px solid #bcbcbc}
    </style>
  </head>
  
  <body>
   <div class="topheader">
   <div>
      <button type="button" class="bak_btn"><image src="<%=request.getContextPath() %>/ch/images/back.png"></button>
      <span style="height:30px;line-height: 30px;">返回到活动列表</span> 
   </div>
   </div>
     <div id="con"></div>
  </body>
</html>
<script type="text/javascript">
     var act = "${param.act}";
     var root = "<%=basePath%>";
     $('#con').on('click','.content',function(){
	     $('.content').removeClass("btn-info");
	     $(this).addClass("btn-info");
	     var job = $(this).val();
	     location.replace(root+"sets/wx/examReport?act="+act+"&&job="+job);
     });
     $('.bak_btn').click(function(){
        location.replace(root+"sets/wx/actitylist#wechat_webview_type=1");
     });
     function jobList(){
         $.ajax({
            url:root+"sets/wx/schoolPosition/getPosIntention/"+act,
            type:"post",
            contentType: 'application/json',
            dataType:"json",
            success:function(result){
              console.log(result)
              var length = result.data.length;
              var datas = result.data;
              for(var i=0;i<length;i++)
              {
                 $('#con').append('<button value="'+datas[i].id.codeId+'" class="content">'+datas[i].codeName+'(共'+datas[i].count+'人)</button>');
              }
            }
            
         });
     }
     $(document).ready(function(){
          jobList();
     });
</script>
