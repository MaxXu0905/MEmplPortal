<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>  
<html>  
<head>  
<base href="<%=basePath%>">
  <meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ch/css/scrollbar.css">
    <script type="application/javascript" src="<%=request.getContextPath() %>/ch/js/iscroll.js"></script>
    
	<script type="text/javascript" src="<%=request.getContextPath()%>/ch/js/appframework.min.js"></script>
    

<style type="text/css">
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}



body,ul,li {
	padding: 0;
	margin: 0;
	border: 0;
}

body {
	font-size: 12px;
	font-family: ubuntu, helvetica, arial;
	 /* overflow: hidden; this is important to prevent the whole page to bounce */
}
img {
    vertical-align: middle;
}
#header {
	z-index: 2;
	top: 0;
	left: 0;
	width: 100%;
	height: 45px;
	line-height: 45px;
	background: #CD235C;
	padding: 0;
	color: #eee;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
}

/* #footer {
	position: absolute;
	z-index: 2;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 48px;
	background: #444;
	padding: 0;
	border-top: 1px solid #444;
} */

#wrapper {
	position: absolute;
	/* z-index: 9999; */
	top: 95px;
	bottom: 0px;
	left: 0;
	width: 100%;
	background: #ccc;
	overflow: hidden;
}

#scroller {
	position: absolute;
	z-index: 1;
	-webkit-tap-highlight-color: rgba(0,0,0,0);
	width: 100%;
	-webkit-transform: translateZ(0);
	-moz-transform: translateZ(0);
	-ms-transform: translateZ(0);
	-o-transform: translateZ(0);
	transform: translateZ(0);
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-text-size-adjust: none;
	-moz-text-size-adjust: none;
	-ms-text-size-adjust: none;
	-o-text-size-adjust: none;
	text-size-adjust: none;
	background-color: #f1f1f1 !important;
	
}

#scroller ul {
	list-style: none;
	padding: 0;
	margin: 0;
	width: 100%;
	text-align: left;
}

/* #scroller li {
	padding: 0 10px;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	background-color: #fafafa;
	font-size: 14px;
} */
body,div,button,ul,li,a,header,h4,input{
    	font-family:"Open Sans",Arial,"Hiragino Sans GB","Microsoft YaHei","微软雅黑","STHeiti","WenQuanYi Micro Hei",SimSun,sans-serif;
	color: #666666;
	  background:#f8f8f8 !important;
    } 

	   h1{color:black;
	   text-shadow: 0 0px 0 #111111 !important;}
	    font{font-size: small;color:blue}
	    li{list-style-type:none} 
	    
	    .answer_are{padding:0px;margin:0px;}   
	.answer_are >li{
	 padding:4px 0px;   
	margin:16px;
	border:1px solid #dae0e4;
	background:#fff !important;	
border-radius: 6px; 
	}
	
    .total{font-size: 8pt;color:green;float:right;border:thin solid #00A8FF;height:22px;background-color: #D4D4D4;}
	.result{font-size: small;color:blue;}
	.message{border-top:1px dashed #dae0e4;padding:8px 20px;background:#fff !important;} 
	.message font{float:right;color:#00a8ff;}
    .user_mes{background:#fff !important;}
    .user_mes .username{font-size:18px;color:#00a8ff;font-weight: 600; background:#fff !important;padding:5px 14px;}  
    .user_mes .tel{font-size:16px;background:#fff !important;margin-bottom:10x;
background:url("images/tel1.png") no-repeat 1em center !important;font-weight: 300;padding-left:2.3em;color:#2cca00;text-decoration: none} 
	
    
    
    .clear{clear:both;}
   
	/* img{float:right;} */
    /* .cont{text-align: center} */
   
    /*.name{margin-left: 20%}*/ 
    .other{margin-left: 20%}
    .sql{margin-left: 20%}
    .form-control{background:url("css/images/icons-png/search-black.png") no-repeat 1em center !important ;padding-left: 2.6em !important;}
    .delete{position:absolute; z-index: 999; right:1px;top:5px;border-radius:20px;border:none; display:none}
    .btn-info{background:#00a8ff !important;border:1px solid #0091dc;font-size:10pt;color:#fff !important;}
   .btn-info:hover{background: #0092dd !important;border:1px solid #0080c3;font-size:10pt;color:#fff;}
   .btnradius{border-radius:6 !important;}
    .btn-lg {
     border-radius: 6px;
    font-size: 10pt;
     line-height: 1.33;
    padding: 10px 16px;
     }
    .btn-group{margin-top:12px}
    .ui-focus{box-shadow:none !important}
    .se_all{z-index: 999;position: fixed;width:98%;}
    .rel_tel{background-color: #FFFFFF !important}
    
.head{
height:45px;
background-color: #00A8FF !important;
}

    .tel{height:19px;width:20px}
   
    #defaultHeader{background-color: #0da5f1 !important;}
    .sel{padding-top:5px;}
    #search{height:40px;width:100%;padding-left:23px; 
            border-radius:6 !important;
            background: url("<%=request.getContextPath() %>/ch/images/search.png") no-repeat  7px !important;
            background-color: white !important;font-size: 10pt;margin-top:-3px}
    .search >li{float:left;background-color: #0da5f1 !important}
    .return{width:20%}
    .se{width:55%}
    .re{width:25%}
    #refesh{margin-top: 12px;}
    #select{margin-left: 10px}
    .hide_cont{height:20px !important}
    
    #header{background-color: #00A8FF !important}
    .panel{height:100px;display:none;padding:20px 10px;border-top:0px;text-align:center;
     background:#e7e9ea url("<%=request.getContextPath() %>/ch/images/topbg.gif") repeat-x  top !important;
     margin-bottom:-4px;
     }
    .panel_ul >li{float:left;font-size: 14px;padding:0px 5px;border-bottom:none;
    width:33.3%;
    text-align: center;
    line-height:25px;
    background:#e7e9ea !important;
    border-right:1px solid #d5d5d5;}
    .panel_ul >li >span{font-size:16px;}
    .head >li{float:left;background-color: #00a8ff !important}
    .title{background-color: #f1f1f1 !important;color:#7f7f7f;font-weight: 400;border-bottom:1px solid #c9c9c9;}
    .title span{float:left;font-size:16px;text-align:left;border-bottom:1px solid #c9c9c9;background-color: #f1f1f1 !important;margin-top:-20px;height:53px}
     .num{width:24%;padding-left:14px;}
    .name{width:40%;}
    .score{width:26%;}
    .row_title{width:10%;}

.list:hover{background:#fff !important;}
.call:hover{background:#fff !important;}
.list{ border-bottom:1px solid #c9c9c9;height:55px;background:#f8f8f8;}
 .list span{float:left;height:55px;line-height:55px;

font-size:16px;text-align:left;}
 .rel_num{width:24%;padding-left:14px;}
    .rel_name{width:40%;}
    .rel_score{width:26%;}
    .rel_row_title{width:10%} 
    
    
.bak{text-align:center;}
.bak div{background-color: #00a8ff !important;width:50px;text-align:center;}
.bak div:hover{background-color: #0092dd !important;width:50px;text-align:center;}
.sel{text-align:center;}
.sel div{background-color: #00a8ff !important;width:50px;text-align:center;}
.sel div:hover{background-color: #0092dd !important;width:50px;text-align:center;}
.cancel{margin-top:-10px;height:35px;border-radius:6px;line-height: 30px;font-size: 10pt;border:none;background-color: #ccc !important;width:80px;margin-left:5px;display:none}
/* #header{height:53px !important} */
.del{float:right;z-index: 9999;position: absolute;top:7px;right:200px}
.dele{border:none;height:30px;border-radius:6px;background-color: white;position: absolute;top:12px;right:12px;display: none}
.de_pic{margin-top: -10px}
.hide_area{display: none}
#choose{color:#fff}
.name_r{display: none}

.badge_1 {
    background-color: #999999;
    border-radius: 10px;
    color: #FFFFFF;
    display: inline-block;
    font-size: 12px;
    font-weight: bold;
    line-height: 1;
    min-width: 10px;
    padding: 3px 7px;
    text-align: center;
    vertical-align: baseline;
    white-space: nowrap;
}
.pull-right_1 {
    float: right !important;
}
.caret{color:#fff}
.re_cont{border-bottom: 1px solid #D5D5D5;height:40px}
.answer2 {
	border-bottom: 1px solid #d5d5d5;
	border-top: 1px solid #fff;
	border-left:4px solid #00a8ff;
	color: #0092dd !important;
	font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei",
		"微软雅黑", "STHeiti", "WenQuanYi Micro Hei", SimSun, sans-serif;
	background: #fff;
	position: relative;
}
.re_cont{line-height: 40px}
.re_a{margin-top: 5px;list-style: none;}
/*.model{background-color: #fff !important;z-index: 99999;position: absolute;top:45px;height:100%;width:100%;display:none;margin-top:20px}*/
.model{background-color: #fff !important;z-index: 9999;width:100%;display:none;margin-top:140px;}
.back_to{text-align:center;display: none;width:20%}
.back_to div{background-color: #00a8ff !important;width:50px;text-align:center;}
.back_to div:hover{background-color: #0092dd !important;width:50px;text-align:center;}
.dropdown-menu {
    background-clip: padding-box;
    background-color: #FFFFFF;
    border: 1px solid rgba(0, 0, 0, 0.15);
    border-radius: 4px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.176);
    display: none;
    float: left;
    font-size: 14px;
    left: 0;
    list-style: none outside none;
    margin: 0 0 0 !important;
    min-width: 160px;
    padding: 0 0 !important;
    position: absolute;
    top: 100%;
    z-index: 1000;
    margin-left:-50px ! important
}
.sel >div{position: absolute;right:20px}
#model_search{height:80px;line-height:80px;text-align: center;border-bottom: 1px solid #bcbcbc}
#model_search > input{width:90%;height:40px;border-radius:10px;padding-left: 20px;}
.model_title{background:#bcbcbc;width:100%;height:30px;display: block;font-size: 13pt;line-height: 30px}
.model_title >span{margin-left:20px;font-size: 8pt}
.model_status_cont{margin-top:10px;border-bottom: 1px solid #bcbcbc;height:140px;background-color: #fff !important}
.model_status_cont >li{float:left;width:30%;margin-left:40px;height:50px;background-color: #fff;text-align: center;line-height: 50px;border:1px solid #bcbcbc;margin-top:10px;border-radius:10px}
.btn-info{background:#00a8ff!important;border:1px solid #0091dc;font-size:8pt;color:#fff!important;}
.btn-info:hover{background:#0092dd!important;border:1px solid #0080c3;font-size:8pt;color:#fff}
/*.model_job{height:150%;}*/
.model_job >li{float:left;width:90%;margin-left:16px;height:50px;line-height:50px;text-align: center;background-color: #fff;border:1px solid #bcbcbc;margin-top:10px;border-radius:10px}
</style>

</head>  
<body>

<div id="header">
<ul class="head">
   <li class="bak" id="back"><div><img src="<%=request.getContextPath() %>/ch/images/back.png"></div></li>
   <li  class="back_to"><div><img src="<%=request.getContextPath() %>/ch/images/back.png"></div></li>
    <%-- <li style="width:80%; margin-left:-10px;margin-top:-7px !important" class="sel"><input type="text" id="search" placeholder="电话/姓名/邮箱"><button type="button" class="dele"><img src="<%=request.getContextPath() %>/ch/images/delete.png" class="de_pic"></button></li> --%>
    <!-- <li style="width:20%;height:30px"><button type="button" class="cancel" >取消</button></li> -->
    <li class="sel" style="width:80%; margin-left:-10px;margin-top:-7px !important"><div id="sure" style="color:#fff;font-weight: 400;width:70px;font-size:8pt">确定</div></li>
    <li  class="bak" style="position: absolute;right:50px" id="search_con"><div><img src="<%=request.getContextPath() %>/ch/images/search_r.png"></div></li>
    <li  class="bak"style="position: absolute;right:0px" id="ref"><span class="badge_1 pull-right_1" style="z-index: 99999;position: absolute;top:4px;right:5px">0</span><div><img src="<%=request.getContextPath() %>/ch/images/refesh.png" ></div></li>
</ul>
<div style="clear:both;"></div>
   <p class="title" id="head_title">
        <span class="num" >排名</span>
        <span class="name">姓名</span>
        <span class="score">分数</span>
        <span class="row_title">&nbsp;</span>
    </p>
   
        <div id="model_search" style="display:none"><input id="search" type="text" placeholder="输入电话/姓名/邮箱模糊搜索"/></div>
    
  </div>
<div id="wrapper">
	<div id="scroller">
		<div id="pullDown">
			<span></span><span class="pullDownLabel"></span>
		</div>
		

<div id="thelist"></div>
		
		<div id="pullUp">
			<span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
		</div>
		
	</div>
</div>
<div id="thelist2">
<div class="model">
    <label class="model_title"><span>请选择状态</span></label>
    <div class="model_status">
         <ul class="model_status_cont">
           <li class="btn-info status" value="0">待处理</li>
           <li class="status" value="3">进入复试</li>
           <li class="status" value="1">拟录用</li>
           <li class="status" value="2">拟不录用</li>
         </ul>
    </div>
    <label class="model_title"><span>请选择职位</span></label>
    <div class="model_status">
         <ul class="model_job">
         </ul>
    </div>
</div>	
</div>		

<div id="footer"></div>

</body>
</html>  

<script type="text/javascript">
var root = "<%=basePath%>";

  var sHeight = document.body.clientHeight - 93;
  $('#thelist').css({minHeight:sHeight});
   //拨号事件
   $('#thelist').on('click','.call',function(){
         var name = $(this).text();
          if(!window.confirm("确定要拨打"+name+"的电话?"))
         {
           return false;
         }; 
     });
   
var root = "<%=basePath%>";
var index = 0;
var page = 0;
var myScroll,
	pullDownEl, pullDownOffset,
	pullUpEl, pullUpOffset,
	generatedCount = 0;
var text = 0;

   //滑动获取详细报告
   function detail(testId,$this){
   console.log($this);
          $.ajax({
             url:root+"sets/wx/schoolReport/getSkillScore/"+testId,
              type:'post',
		      contentType: 'application/json',
			  dataType:'json',
			  success:function(result){
			     console.log(result.code);
			     var datas = result.data
			        for(var i=0;i<datas.length;i++)
			        {
			            var wid = 100/datas.length;
     			        $this.next().find('.panel_ul').append('<li style="width:'+wid+'%">'+datas[i].skillName+'<br>'+datas[i].score+'分</li>');  
			        }
			       
			  },
			  complete:function(){
			     $this.next().slideDown();
			  
			  }
			  
          });
   }

   
//获取报告
   var result_length = '';
   var act = "${param.act}";
   var job ="";
   var search = "";
   function getReport(){
      
         var dataResult = {
				"activityId" : act,
				"intentPos":job,
				"searchTxt" : search,
				"testResult" : text,
				"page" : {
				  "requestPage" : ++page,
				   "pageSize" : 10
				  }
				};
		$.ajax({
		   url:root+"sets/wx/schoolReport/getReport",
		   type:'post',
		   contentType: 'application/json',
		   dataType:'json',
		   data:JSON.stringify(dataResult),
           beforeSend:function(){
              /* showLoader(); */
           },
		   success:function(result){
		          console.log(result.code);
		          if(result.code==0)
		          {
		             result_length = result.data.length;
		             generatePaper(result,search);
		          }
		   },
		   complete:function(){
		      myScroll.refresh();
		      /* hideLoader(); */
		      if(result_length<10)
		      {
		      $('.pullUpLabel').text("全部加载完成");
		      $('.pullUpIcon').hide();
		      }
		      else{
		       $('.pullUpLabel').text("上拉加载更多...");
		       $('.pullUpIcon').show();
		      }
		   }
		});
   }
   var length = 0;

   
   //生成试卷报告
   
   function generatePaper(result,search){
       console.log(result);
       var length = result.data.length;
       for(var i=0;i<length;i++)
       {
        $('#thelist').append('<span class="hide_area">'+result.data[i].testId+'</span><div  class="list"><span class="rel_num">'+[++index]+
                            '</span><span class="rel_name">'+result.data[i].candidateName+'<a href="tel:'+result.data[i].candidatePhone+'" class="call"><image src="<%=request.getContextPath() %>/ch/images/phone.png" class="phone"><span class="name_r">'+result.data[i].candidateName+'</span></a></span>'+
        '<span class="rel_score">'+result.data[i].getScore+'&nbsp;分</span><span class="row_title"><image src="<%=request.getContextPath() %>/ch/images/row.png"><span style="display:none">'+result.data[i].testId+'</span><p style="display:none">'+result.data[i].getScore+'</p></span>'+ 
        '</div><div class="panel"><ul class="panel_ul"></ul></div>');
       }
   }
   
  
   
   //回车监听事件
   var lock = true;
      document.onkeydown=function(event){
        e = event ? event :(window.event ? window.event : null);
        if(e.keyCode==13){
            search = $('#search').val();
            $('#thelist').empty();
            $('#head_title').show();
            index = 0;
            page = 0;
            getReport();
            $('.model').hide();
            if(myScroll){
            	myScroll.enable();
            }
            $('#head_title2').hide();
            $('#model_search').hide();
            $('#thelist').css('height','0px');
            $('#wrapper').show();
            lock = false;
        }
    }   
    
    //新纪录统计
    var new_report = 0;
    var now_report = 0;
    var old_report = 0;
    var init = true;
    
    function newReport(){
        var reqData = {"activityId":act,"intentPos":job};
        $.ajax({
           url:root+"sets/wx/schoolReport/getReportCount",
           type:"post",
           contentType: 'application/json',
           data:JSON.stringify(reqData),
		   dataType:'json',
		   success:function(result){
		    
			       if(now_report=="0")
			       {
			       now_report = result.data;
			       old_report = now_report;
			       }
			       now_report = result.data;
			       new_report = now_report-old_report;
                   $('#ref').click(function(){
                   now_report = result.data;
			       new_report = now_report-old_report;
			       old_report = now_report;
                   });
		       
		       if(init)
		       {
		         init=false;
		       }
		       else{
		           if(new_report!="0")
		           {
		           
			       $('.pull-right_1').text(new_report).show();
		           }
		       }
		   }
           
           
        });
    }
    function controlReport(){
        setInterval(function(){
           newReport();
        
        },60000);
    }
 
 /**
 * 下拉刷新 （自定义实现此方法）
 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
 */
 function pullDownAction () {
	setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
      search = $('#search').val();
	  getReport();
			
		console.log(myScroll);	// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
	}, 1000);
} 
    
/**
 * 滚动翻页 （自定义实现此方法）
 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
 */
function pullUpAction () {
	setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
	  getReport();
			
		console.log(myScroll);	// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
	}, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
}

/**
 * 初始化iScroll控件
 */
function loaded() {
	pullDownEl = document.getElementById('pullDown');
	pullDownOffset = pullDownEl.offsetHeight;
	pullUpEl = document.getElementById('pullUp');	
	pullUpOffset = pullUpEl.offsetHeight;
	
	myScroll = new iScroll('wrapper', {
		scrollbarClass: 'myScrollbar', /* 重要样式 */
		useTransition: false, /* 此属性不知用意，本人从true改为false */
		topOffset: pullDownOffset,
		onRefresh: function () {
			if (pullDownEl.className.match('loading')) {
				pullDownEl.className = '';
				/* pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...'; */
			} else if (pullUpEl.className.match('loading')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
			}
		},
		onScrollMove: function () {
			if (this.y > 5 && !pullDownEl.className.match('flip')) {
				 pullDownEl.className = 'flip';
				 pullDownEl.querySelector('.pullDownLabel').innerHTML = '松手开始更新...'; 
				this.minScrollY = 0; 
			} else if (this.y < 5 && pullDownEl.className.match('flip')) {
				pullDownEl.className = '';
				/* pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...'; */
				this.minScrollY = -pullDownOffset;
			} else if (this.y < (this.maxScrollY - 20) && !pullUpEl.className.match('flip')) {
				console.log('松手开始更新...' + this.y + ', ' + this.maxScrollY);
				pullUpEl.className = 'flip';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '松手开始更新...';
				this.maxScrollY = this.maxScrollY;
			} else if (this.y > (this.maxScrollY + 20) && pullUpEl.className.match('flip')) {
				console.log('上拉加载更多...'  + this.y + ', ' + this.maxScrollY);
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
				this.maxScrollY = pullUpOffset;
			}
		},
		onScrollEnd: function () {
			if (pullDownEl.className.match('flip')) {
				pullDownEl.className = 'loading';
				/* pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';	 */			
				pullDownAction();	// Execute custom function (ajax call?)
			} else if (pullUpEl.className.match('flip')) {
				pullUpEl.className = 'loading';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载中...';				
				pullUpAction();	// Execute custom function (ajax call?)
			}
		}
	});
	
	setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
}

//初始化绑定iScroll控件 
document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
document.addEventListener('DOMContentLoaded', loaded, false); 
     
     $(document).ready(function(){
         
         $('.pull-right_1').hide(); 
         newReport();
         controlReport();
         $('#search').parent().css({'margin-top':"-3px"});
         $('#search_con').click(function(){
         $.ajax({
            url:root+"sets/wx/schoolPosition/getPosIntention/"+act,
            type:"post",
            dataType:"json",
            contentType:"application/json",
            success:function(result){
                 console.log(result);
                 length = result.data.length;
                 var datas = result.data;
                 for(var i=0;i<length;i++)
                 {
                 $('.model_job').append('<li value='+result.data[i].id.codeId+' class="jobs">'+result.data[i].codeName+'(共'+result.data[i].count+'人)</li>');
                 }
         var relLength = length*51+393;
         $('#wrapper').hide();
//	         $('.model').css('height', $(window).height() - 140);
       
//         $('#thelist').css('height',''+relLength+'px');
            },
            complete:function(){
            $('.model').show();
            if(myScroll){
            	myScroll.disable();
            }
            $('.sel').show();
            $('.back_to').show(3000);
            }
        });
         	
                $('#model_search').show();
                $('#head_title').hide();
                $('#head_title2').show();
            	pullUpAction(); 
            
         });
         /* $('.model').click(function(){
              $('#search').val("");
             $('.bak').show(1000);
             $('.btn_gro').show(1000);
             $('.sel').hide();
             $('.cancel').hide();
             $(this).hide(1000);
             $('.back_to').hide();
         }); */
         $('.sel').hide();
         $('#search').focus(function(){
             $('.dele').show();
         });
         $('.dele').click(function(){
             $('#search').val("");
             $('.dele').hide();
         });
         $('#search').blur(function(){
         
             if($('#search').val()=="")
             {
               $('.dele').hide();
             }
         });
         //搜索返回
         $('.back_to').click(function(){
         $('#model_search').hide();
         $('#thelist').css('height','0px');
         $('#wrapper').show();
             if(lock==false)
             {
             $('#ref').click();
             }
             lock = true;
             page=0;
             index=0;
             $('#search').val("");
             $('.bak').show(1000);
             $('.btn_gro').show(1000);
             $('.sel').hide();
             $('.cancel').hide();
             $('.back_to').hide();
             $('.model').hide();
             if(myScroll){
             	myScroll.enable();
             }
             $('#head_title').show();
             $('#thelist').empty();
             pullUpAction();
         });
         //筛选功能
         $('.sel').click(function(){
             lock = true;
             page=0;
             index=0;
             $('#wrapper').show();
             $('#thelist').css('height','0px');
             $('#head_title2').hide();
             $('#model_search').hide();
             search = $('#search').val();
             $('.model_job').empty();
             $('#head_title').show();
             $('.bak').show(1000);
             $('.btn_gro').show(1000);
             $('.sel').hide();
             $('.cancel').hide();
             $('.back_to').hide();
             $('.model').hide();
             if(myScroll){
             	myScroll.enable();
             }
             $('#thelist').empty();
             getReport();
             new_report = 0;
             old_report = 0;
             now_report = 0;
             init = true;
             newReport();
             $('#search').val("");
         });
                  
      
         pullUpAction();
         //刷新
         $('#ref').click(function(){
         
             $('#thelist').empty();
             index = 0;
             page = 0;
             $('.pull-right_1').hide();
             pullUpAction();
             /* showLoader(); */
         });
         //返回
         
         $('#back').click(function(){
             location.replace(root+"sets/wx/actitylist?act="+act);
         });
         

         
         $('#search_con').click(function(){
             $('.bak').hide();
             $('.btn_gro').hide();
             $('.sel').show(1000);
             $('.cancel').show(1000);
             
         });
         
         $('.cancel').click(function(){
             $('#search').val("");
             $('.bak').show(1000);
             $('.btn_gro').show(1000);
             $('.sel').hide();
             $('.cancel').hide();
         });
         
         $('.search_con').click(function(){
             var con = $(this).text();
             $('#search').text(con);
         });
         $('.delete').click(function(){
            $('.form-control').val("");
            $(this).hide();
         });
         $('.form-control').focus(function(){
              $('.delete').show();
         });
         /* $('.form-control').blur(function(){
              if($(this).val()=="")
              {
              $('.delete').hide();
              }
         }); */
         
     });
     
     $('.btn-lg').click(function(){
         $('.btn-lg').removeClass('btn-info');
         $(this).addClass('btn-info');
     
     });
     
     $('.status').click(function(){
        $('.status').removeClass('btn-info');
        $(this).addClass('btn-info');
        text = $(this).val();
     });
     
     $('.model_job').on('click','.jobs',function(){
        if($(this).hasClass('btn-info'))
        {
        $('.jobs').removeClass('btn-info');
        job = "";
        }
        else{
        $('.jobs').removeClass('btn-info');
        $(this).toggleClass('btn-info');
        job = $(this).val();
        }
     });
     
     $('#thelist').on('click','.row_title',function(){
             var testId = $(this).find("span").text();
             var score = $(this).find("p").text();
             location.replace(root
								+ "sets/wx/personReport?testId="+testId+"&act="+act+"&job="+job+"&score="+score);
     });
     
</script>
