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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/ch/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/ch/css/jquery.mobile-1.3.2.min.css" />
    
	<script type="text/javascript" src="<%=request.getContextPath() %>/ch/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/ch/js/jquery.mobile-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/ch/js/bootstrap.min.js"></script>
    

<style type="text/css">
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

html {
	-ms-touch-action: none;
}

body,ul,li {
	padding: 0;
	margin: 0;
	border: 0;
}

body {
	font-size: 12px;
	font-family: ubuntu, helvetica, arial;
	overflow: hidden; /* this is important to prevent the whole page to bounce */
}

#header {
	position: absolute;
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

	    h1{display:none}
	   
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

    .tel{height:19px;width:20px}
   
    #defaultHeader{background-color: #0da5f1 !important;}
    .sel{padding-top:5px;}
    #search{height:30px;width:100%;padding-left:23px; 
    border:1px solid #ff0000;  border-radius:6 !important;
            background: url("<%=request.getContextPath() %>/ch/images/search.png") no-repeat  7px !important;
            background-color: white !important;font-size: 10pt}
    .search >li{float:left;background-color: #0da5f1 !important}
    .return{width:20%}
    .se{width:55%}
    .re{width:25%}
    #refesh{margin-top: 12px;}
    #select{margin-left: 10px}
    .hide_cont{height:20px !important}
    
    #header{background-color: #0da5f1 !important}
    .panel{height:100px;display:none;padding:20px 10px;border-top:0px;text-align:center;
     background:#e7e9ea url("<%=request.getContextPath() %>/ch/images/topbg.gif") repeat-x  top !important;
     margin-bottom:-4px;
     }
    .panel_ul >li{float:left;font-size: 14px;padding:0px 8%;border-bottom:none;
    width:33.3%;
    text-align: center;
    line-height:25px;
    background:#e7e9ea !important;
    border-right:1px solid #d5d5d5;}
    .panel_ul >li >span{font-size:16px;}
    .head >li{float:left;background-color: #0da5f1 !important}
    .ui-body-inherit{background-color: #0da5f1 !important}
    .btn,.btn-group{background-color: #0da5f1 !important}
    .title{background-color: #f1f1f1 !important;color:#7f7f7f;font-weight: 400;border-bottom:1px solid #c9c9c9;}
    .title span{float:left;font-size:16px;text-align:left;border-bottom:1px solid #c9c9c9;background-color: #f1f1f1 !important;}
     .num{width:24%;padding-left:14px;}
    .name{width:40%;}
    .score{width:26%;}
    .row_title{width:10%;}

.list:hover{background:#fff !important;}
.list{ border-bottom:1px solid #c9c9c9;height:55px;background:#f8f8f8;}
 .list span{float:left;height:55px;line-height:55px;

font-size:16px;text-align:left;}
 .rel_num{width:24%;padding-left:14px;}
    .rel_name{width:40%;}
    .rel_score{width:26%;}
    .rel_row_title{width:10%} 
    
    
    .ui-shadow {
    box-shadow: 0 0px 0px rgba(0, 0, 0, 0);
    }
    .ui-input-search, div.ui-input-text {
    background-image: none;
    margin: 0 0;
    position: relative;
}
    .ui-shadow-inset {
    box-shadow: 0 0px 0px rgba(0, 0, 0, 0) inset;
}
.bak{text-align:center;}
.bak div{background-color: #00a8ff !important;width:50px;text-align:center;}
.bak div:hover{background-color: #0092dd !important;width:50px;text-align:center;}
</style>

</head>  
<body>
<div id="header">
<ul class="head">
   <li class="bak"><div>o<image src="<%=request.getContextPath() %>/ch/images/back.png"></div></li>
   <li style="width:85%" class="sel"><input type="text" id="search" placeholder="电话/姓名/邮箱"></li>
   <li  class="bak"><div><image src="<%=request.getContextPath() %>/ch/images/search_r.png"></div></li>
   <li  class="bak"><div><image src="<%=request.getContextPath() %>/ch/images/refesh.png"></div><!-- <span><image src="../ch/images/select.png"></span> -->
 <!-- 
   <div class="btn-group">
    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" style="width:20px;border:none;margin-top: -10px">
      <image src="<%=request.getContextPath() %>/ch/images/select.png">
    </button>
    <ul class="dropdown-menu" style="margin-left:-100px;width:50px !important">
      <li style="width:100px;border-bottom: 1px solid #cbcbcb">进入复试</li>
      <li style="width:100px">已提交报告</li>
    </ul>
  </div>
  -->   
  </li>
</ul>
<div style="clear:both;"></div>
   <p class="title">
        <span class="num" >序号</span>
        <span class="name">姓名</span>
        <span class="score">分数</span>
        <span class="row_title">&nbsp;</span>
    </p>
  </div>
<div id="wrapper">
	<div id="scroller">
		<div id="pullDown">
			<span></span><span class="pullDownLabel"></span>
		</div>
		
<!-- list -->
<div id="thelist">

     <div  class="list">
        <span class="rel_num">004</span>
        <span class="rel_name">张经国<image src="<%=request.getContextPath() %>/ch/images/phone.png"></span>
        <span class="rel_score">90&nbsp;分</span>
        <span class="row_title"><image src="<%=request.getContextPath() %>/ch/images/row.png"></span> 
     </div>
     <div class="panel">
        <ul class="panel_ul">
          <li>数据库基础<br><br>60分</li>
          <li>Java<br><br>90分</li>
          <li>SQL<br><br>90分</li>
        </ul>
     </div>
     
     <div  class="list">
        <span class="rel_num">004</span>
        <span class="rel_name">张经国<image src="<%=request.getContextPath() %>/ch/images/phone.png"></span>
        <span class="rel_score">90&nbsp;分</span>
        <span class="row_title"><image src="<%=request.getContextPath() %>/ch/images/row.png"></span> 
     </div>
     <div class="panel">
        <ul class="panel_ul">
          <li>数据库基础<br><br>60分</li>
          <li>Java<br><br>90分</li>
          <li>SQL<br><br>90分</li>
        </ul>
     </div>
     <div  class="list">
        <span class="rel_num">004</span>
        <span class="rel_name">张经国<image src="<%=request.getContextPath() %>/ch/images/phone.png"></span>
        <span class="rel_score">90&nbsp;分</span>
        <span class="row_title"><image src="<%=request.getContextPath() %>/ch/images/row.png"></span> 
     </div>
     <div class="panel">
        <ul class="panel_ul">
          <li>数据库基础<br><br>60分</li>
          <li>Java<br><br>90分</li>
          <li>SQL<br><br>90分</li>
        </ul>
     </div>
     <div  class="list">
        <span class="rel_num">005</span>
        <span class="rel_name">张经国<image src="<%=request.getContextPath() %>/ch/images/phone.png"></span>
        <span class="rel_score">90&nbsp;分</span>
        <span class="row_title"><image src="<%=request.getContextPath() %>/ch/images/row.png"></span> 
     </div>
     <div class="panel" id="panel">
        <ul class="panel_ul">
          <li>数据库基础<br><span>60分</span></li>
          <li>Java<br><span>90分</span></li>
          <li>SQL<br><span>90分</span></li>
        </ul>
     </div>
     <div  class="list">
        <span class="rel_num">006</span>
        <span class="rel_name">张经国<image src="<%=request.getContextPath() %>/ch/images/phone.png"></span>
        <span class="rel_score">90&nbsp;分</span>
        <span class="row_title"><image src="<%=request.getContextPath() %>/ch/images/row.png"></span> 
     </div>
     <div class="panel">
        <ul class="panel_ul">
          <li>数据库基础<br><br>60分</li>
          <li>Java<br><br>90分</li>
          <li>SQL<br><br>90分</li>
        
     </div>
</div>		
		
		<div id="pullUp">
			<span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
		</div>
		
	</div>
</div>

<div id="footer"></div>

</body>
</html>  

<script type="text/javascript">

  $('#thelist').on('swiperight','.cont',function(){
     
      $(this).next().slideDown();
  })
  $('#thelist').on('swipeleft','.cont',function(){
     
      $(this).next().slideUp();
  })
var root = "<%=basePath%>";
var index = 0;
var page = 0;
var myScroll,
	pullDownEl, pullDownOffset,
	pullUpEl, pullUpOffset,
	generatedCount = 0;
 
/**
 * 下拉刷新 （自定义实现此方法）
 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
 */
/* function pullDownAction () {
	setTimeout(function () {	
		var el, li, i;
		el = document.getElementById('thelist');

		for (i=0; i<3; i++) {
			li = document.createElement('li');
			li.innerText = 'Generated row ' + (++generatedCount);
			el.insertBefore(li, el.childNodes[0]);
		}
		
		myScroll.refresh();		
	}, 1000);	
} */
//获取报告

  
   //生成试卷报告
   
   function generatePaper(result,search){
       console.log(result);
       var length = result.data.length;
       for(var i=0;i<length;i++)
       {
        $('#thelist').append('<span class="rel_num">'+[++index]+'</span><span class="rel_name">'+result.data[i].candidateName+'</span>'+
                            '<span><image src="<%=request.getContextPath() %>/ch/images/phone.png" class="tel"></span><span class="rel_score">'+result.data[i].getScore+'&nbsp;分</span><span>>></span>'+
                            '<div class="panel"><ul class="panel_ul"><li>数据库基础<br><br>60分</li><li>Java<br><br>90分</li><li>SQL<br><br>90分</li></ul></div>');
       }
   }
   //回车监听事件
      document.onkeydown=function(event){
        e = event ? event :(window.event ? window.event : null);
        if(e.keyCode==13){
            var search = $('#search').val();
            $('#thelist').empty();
            index = 0;
            page = 0;
            getReport(search);
        }
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
			if (this.y > 20 && !pullDownEl.className.match('flip')) {
				/* pullDownEl.className = 'flip';
				/* pullDownEl.querySelector('.pullDownLabel').innerHTML = '松手开始更新...'; 
				this.minScrollY = 0; */
			} else if (this.y < 20 && pullDownEl.className.match('flip')) {
				pullDownEl.className = '';
				/* pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...'; */
				this.minScrollY = -pullDownOffset;
			} else if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {
				console.log('松手开始更新...' + this.y + ', ' + this.maxScrollY);
				pullUpEl.className = 'flip';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '松手开始更新...';
				this.maxScrollY = this.maxScrollY;
			} else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
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
     (function($){
     $(document).ready(function(){
         $('#panel').show();
         /* $('.rel_score').click(function(){
            $(this).parent().next().slideToggle();
         
         }); */
         $('#header').find('#search').parent().removeClass("ui-input-text ui-shadow-inset");
         $('.dropdown-toggle').removeClass("ui-btn ui-shadow ui-corner-all");
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
     
     $('.content').click(function(){
         var name = $(this).find('.username').text();
         location.href="page8.jsp";
     });
     })(jQuery);
</script>
