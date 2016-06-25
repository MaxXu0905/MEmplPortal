<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    <meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/ch/css/myBootstrap.css" />


	<script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-1.9.1.min.js"></script>

    <style type="text/css">
    	    body,div,button,ul,li,a,header,h4,input{
    	font-family:"Open Sans",Arial,"Hiragino Sans GB","Microsoft YaHei","微软雅黑","STHeiti","WenQuanYi Micro Hei",SimSun,sans-serif;
	color: #666666;
	  background:#f8f8f8 !important;
    } 
     body{padding:0px;margin:0px;}
     #content{margin-top:-20px;}
        header{color:#00A8FF;background:#fff !important;}
        ol{background:#fff !important;}
        ol li{background:#fff !important;}
	    h1{display:none}
	    .con{text-align: center;}
	    font{font-size: small;color:blue}
	    li{list-style-type:none} 
	   
	    .answer_are{padding:0px;margin:0px; }   
	.answer_are >li{
	margin:0px;
	font-size:small;
	color:#ff8a00;line-height:1.8em;
	}
	.username{font-size:20px;color:#00a8ff;font-weight: 700;padding:20px 20px;} 
	.username span{background:url("images/tel1.png") no-repeat 0.4em center !important;font-weight: 300;padding-left:25px;float:right;color:#2cca00;} 
	.result{font-size: small;color:blue;float:right}
	.message{border-bottom:1px solid #dae0e4;padding:8px 20px;} 
	.message font{float:right;color:#00a8ff;}
	.message span{float:right;color:#00a8ff;}
	img{float:right;} 
	hr{width:100%} 
	.flip1{border-top: none;background: url("images/down.png") no-repeat  right;}
	 .panel{display:none;background:#fff !important;padding:5px 20px;}
	.mypanel{margin-bottom:1px;background:#fff !important;}
	#slide{width:50px;height:30px;text-align: center;border:hidden;}
	#slide1{width:50px;height:30px;text-align: center;border:hidden;}
	#slide2{width:50px;height:30px;text-align: center;border:hidden;}
	#slide3{width:50px;height:30px;text-align: center;border:hidden;}
	#slide4{width:50px;height:30px;text-align: center;border:hidden;}
	#slide5{width:50px;height:30px;text-align: center;border:hidden;}
	.choose{float:right;}
    #money{width:150px;
background:url("images/money.gif") no-repeat 0.6em center !important;
 padding-left:2.4em  !important;
}
	.bf_bk{border-bottom: 1px solid #dae0e4;background: url("images/down.png") no-repeat  right;}
	.af_bk{border-bottom: 1px solid #dae0e4;background: url("images/up.png") no-repeat  right;}
.index_input{ font-size:12pt  !important;border:0px;}
.res{font-size: 15pt;color:green}
.r_title{color:#b7bdc1;padding:1px 20px;background:#e7ebee !important;border-top:1px solid #dae0e4;border-bottom:1px solid #dae0e4;}
	 .btn-info{background:#00a8ff !important;border:1px solid #0091dc !important;font-size:16pt;}
	    .btn-info:hover{background:#0092dd !important;border:1px solid #0080c3 !important;font-size:16pt;}     
    .ui-slider-bg{}
     .ui-btn-active{background:#00a8ff !important;}
     .bottom_res{padding:10px 20px;}
     
     .bottom_res select{margin-bottom:20px !important;}
     .direction{height:3em;line-height:2.6em;font-size:14px;text-align:left;}
     .lable{margin-top:-30px;}
     .btn-lg {
		    border-radius: 6px;
		    font-size: 8pt;
		    line-height: 1.33;
		    padding: 10px 16px;
              }
      input[type="range"] {
    -webkit-appearance: none;
    -webkit-box-shadow: 0 1px 0 0px #424242,
        0 1px 0 #060607 inset,
        0px 2px 10px 0px black inset,
        1px 0px 2px rgba(0, 0, 0, 0.4) inset,
        0 0px 1px rgba(0, 0, 0, 0.6) inset;
    margin-top: 2px;
    background-color: #272728;
    border-radius: 15px;
    width: 400px;
    height:400px;
}
     
    </style>    
  </head>
  
  <body onload="hidenShare()">&nbsp;<!-- Title -->
  <!-- 内容 --> 
  
    <div id="content">
        <!--过去  -->
		<ul class="answer_are">
		<li>
		    <div class="username">张经国<a href="tel:15568584988"><span>155-6858-4988</span></a></div>
		       <div class="r_title">基本信息</div>
            <div class="message">学校<font>长春理工</font></div>		   
		    <div class="message">学历<font>本科</font></div>
		    <div class="message">电话<font>15568584988</font></div>
		</li>       
		<li>
		    <div class="r_title">试卷信息</div>
		    <div class="message">JAVA <font>90分</font></div>           
		    <div class="message">数据库基础<font>60分</font></div>
		    <div class="message">SQL<font>90分</font></div>
		</li>
		</ul>
		<ul class="answer_are">
		<li>
		 <div class="r_title">面试报告</div>
		 <div class="message flip flip1">1、仪表举止气质<span id="score"></span></div> 
		
		<div class="panel mypanel">
		<header>观察内容</header>
		<ol>
		 <li>1、穿着打扮是否得体</li>
         <li>2、言行举止是否符合一般的礼节</li>
         <li>3、是否有多余的动作</li>
        </ol>
        <header>评价要点</header>
        <ol>
            <li>1、仪表端庄</li>
            <li>2、穿着整齐、得体,无明显失误</li>
			<li>3、走、坐、站、敲门等行为举止稳重大方</li>
       </ol>
          <div>
	          <div id="rel_score" style="text-align: center"></div>
	          <input id="slide" type="range" data-highlight="true" value="0" min="0" max="10">
	          <label style="width:30px;background-color: #bcbcbc;border-radius:50%;height:30px;z-index: 9999;position: absolute;">&nbsp;&nbsp;&nbsp;&nbsp;</label>
          </div>
		</div>
		</li>
		<li>
		 <div class="message flip flip1">2、沟通表达与自我认知<font id="score1">9</font>分</div> 
		 <div class="panel mypanel">
		   <header>观察内容</header>
		     <ol>
			    <li>1、表达内容是否准确、有条理</li>
				<li>2、引用实例、遣词准确性</li>
				<li>3、谈话时的姿态表情</li>
			 </ol>
           <header>评价要点</header>
           <ol>
             <li>1、语言简洁、逻辑清晰、说服力强</li>
			 <li>2、谈话的前后连续性</li>
			 <li>3、自我认知全面</li>
			</ol>
           <input id="slide1" type="range"  value="0" min="0" max="10">
		  </div>
		</li>
		
		<li>
		 <div class="message flip flip1">3、人际关系与社交能力<font id="score2"></font></div> 
		   
		<div class="panel mypanel">
		   <header>观察内容</header>
		   <ol>
		    <li>1、人际关系现状</li>
			<li>2、性格内、外向</li>
			<li>3、社会活动能力</li>
          </ol>
           <header>评价要点</header>
           <ol>
	            <li>1、人际关系好</li>
				<li>2、社交能力强</li>
				<li>3、有表现力和自信心</li>
		   </ol>
           <input id="slide2" type="range"  value="0" min="0" max="10">
		  </div>
		</li>
		
		<li>
		<div class="message flip flip1">4、个人品质<font id="score3">9</font></div> 

		<div class="panel mypanel">
		   <header>观察内容</header>
		   <ol>
		    <li>1、有无不良的性格(过分狂妄和过分自卑)或偏激的观点 </li>
            <li>2、背景条件是否太优越,不能吃苦</li>
			<li>3、回答问题是否认真、诚实</li>
			</ol>
           <header>评价要点</header>
           <ol>
            <li>1、为人诚实、待人真诚  </li>
			<li>2、抗压能力强 </li>
			<li>3、能吃苦耐劳 </li>                                   
		   </ol>
           <input id="slide3" type="range" data-highlight="true"  value="0" min="0" max="10">
		  </div>
		</li>
		
		<li>
		<div class="message flip flip1">5、学习态度、自学能力<font id="score4">9</font></div> 

		<div class="panel mypanel">
		   <header>观察内容</header>
		    <ol>
			    <li>1、专业成绩</li>
			    <li>2、对自身专业的关注程度</li>
			    <li>3、自我提高的主动性</li>
		    </ol>
           <header>评价要点</header>
            <ol>
            <li>1、成绩中上,无补考或重修</li>
            <li>2、关注专业的提高,拓宽知识面</li>
            <li>3、自我提高意识强</li>
            </ol>
           <input id="slide4" type="range"  value="0" min="0" max="10">
		  </div>
		</li>
		
		<li>
		<div class="message flip flip1">6、职业兴趣与适合度<font id="score5">9<span>分</span></font></div> 

		<div class="panel mypanel">
		   <header>观察内容</header>
		    <ol>
		      <li>1、兴趣与岗位情况匹配</li>
		      <li>2、对所要从事工作的认识</li>
		      <li>3、对长期出差工作模式的认可与接受程度</li>
		    </ol>
           <header>评价要点</header>
            <ol>
              <li>1、愿意投身软件行业</li>
              <li>2、与企业文化相吻合</li>
            </ol>
           <input id="slide5" type="range"  value="0" min="0" max="10">
		  </div>
		</li>
	   <li>
	   <div class="r_title">工作地及薪资</div>
	    <div class="message">工作地点<font><a class="choose">请选择></a></font></div>
	    <div class="message">期望薪资<span>
	    <label for="money" class="lable"><input type="text" id="money" class="index_input" placeholder="万元" name="money" ></label>
	    </span>
	    </div>
	    <div class="clear"></div>		
	  <!--  
	   <font class="total">工作地点：</font><span><a class="choose">请选择</a></span></li>--> 
	</ul>
	<!-- 
		<div>
		
	     <label for="money"></label>
	     <input type="text" id="money" class="index_input" placeholder="期望薪资（万元）" name="money" >
	     </div>
	 -->     
	   <ul class="answer_are">
	   <li>
	    <div class="r_title">结论</div>
	  <!--  <header class="res">结论：</header> -->
	  
<div class="bottom_res">
        <select class="direction">
         <option >请选择适合方向</option>
         <option >适合JAVA方向</option>
         <option >适合C++方向</option>
         <option >适合Android方向</option>
        </select>
      
      
        <select class="direction">
         <option >请选择适合岗位</option>
         <option >适合JAVA开发岗位</option>
         <option >适合C++开发岗位</option>
         <option >适合Android开发岗位</option>
        </select>
        

		<div class="btn-group btn-group-justified">
		  <a class="btn btn-default btn-lg">待处理</a>
		  <a type="button" class="btn btn-default btn-lg">不予考虑</a>
		  <a type="button" class="btn btn-default btn-lg">复试</a>
		  <a type="button" class="btn btn-default btn-lg">拟录用</a>
		</div>

        
        

 	  <br>
     <button type="button" id="save" class="btn btn-info btn-block">提交信息</button>
   
 
</div>
</li>
    </ul>         
        
</div>
  </body>
</html>

<script type="text/javascript">
     (function($){
     
      $(document).ready(function(){
      
      $('#save').removeClass('ui-btn ui-shadow ui-corner-all');
         $('.direction').parent().css('height','35px');
         $('.answer_are').on('click','.flip',function(){
         
    	  $(this).next().slideDown();
          $(this).removeClass('flip1');
          
          $(this).addClass('af_bk af_bk1');
    	  
         });
         $('.answer_are').on('click','.af_bk1',function(){
         
    	  $(this).next().slideUp();
          $(this).removeClass('af_bk af_bk1');
          $(this).addClass('flip1');
    	  
         });
  		$('#slide').next().css('margin-top','-30px');
  		$('#slide1').next().css('margin-top','-30px');
  		$('#slide2').next().css('margin-top','-30px');
  		$('#slide3').next().css('margin-top','-30px');
  		$('#slide4').next().css('margin-top','-30px');
  		$('#slide5').next().css('margin-top','-30px');
        
        setInterval(function(){
           var score = $('#slide').val();
           var score1 = $('#slide1').val();
           var score2 = $('#slide2').val();
           var score3 = $('#slide3').val();
           var score4 = $('#slide4').val();
           var score5 = $('#slide5').val();
           $('#score').text(score+"分");
           $('#rel_score').text(score);
           $('#score1').text(score1+"分");
           $('#score2').text(score2+"分");
           $('#score3').text(score3+"分");
           $('#score4').text(score4+"分");
           $('#score5').text(score5+"分");
        },0);        
        
      });
     })(jQuery)
</script>