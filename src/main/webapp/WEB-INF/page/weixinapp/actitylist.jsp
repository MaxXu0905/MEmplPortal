<%@ page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    
    <title>返回微信窗口</title>
    
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    
    <script type="text/javascript"
	src="<%=request.getContextPath()%>/ch/js/appframework.min.js"></script>
	<script src="<%=request.getContextPath()%>/core/js/accountUnbind.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ch/css/style.css" />
	<style type="text/css">
	.topheader{border-bottom:1px solid #00a8ff;background:#00a8ff;color:#fff;height:54px;font-size: 15pt;text-align: center;position: fixed;bottom:0;width:100%;z-index: 9999}
    body{
    background:#f8f8f8 !important;       
    padding:0px;
    margin:0px; 
    }
    	    body,div,button,ul,li,a,header,p,input{
  	font-family:"Open Sans",Arial,"Hiragino Sans GB","Microsoft YaHei","微软雅黑","STHeiti","WenQuanYi Micro Hei",SimSun,sans-serif;
	color: #666666; 

    } 
	    .con{text-align: center;} 
	    
	   .flip1{border-bottom: 1px solid #999;background: url("images/down.png") no-repeat  right;} 

	    li{list-style-type:none} 
	    
	     .answer_are{padding:0px;margin:0px; border-top:1px solid #d5d5d5;}   
	.answer_are >li{border-bottom:1px solid #d5d5d5;
	     font-family: normal 100% "Open Sans",Arial,"Hiragino Sans GB","Microsoft YaHei","微软雅黑","STHeiti","WenQuanYi Micro Hei",SimSun,sans-serif;
	padding:16px 12px 16px 16px;
	margin:0px;
	font-size:small;
	color:#ff8a00;line-height:1.8em;
	} 
    .cort{
    background: url("<%=request.getContextPath()%>/ch/images/closer.png") right no-repeat;
    }
    .cort2{background: url("<%=request.getContextPath()%>/ch/images/open.png") right no-repeat;}
	.total_num{font-size: x-small;float:right;color:blue;}
	.header{font-size: 9pt;color:#00A8FF}
	.over{margin-right: 15px;float:right;color:blue;font-size: small} 
	.begin{margin-right: 15px;float:right;color:blue;font-size: small}
	.message{color:#ff8a00}
	.total{font-size: 10pt;color:green}
	.cont{color:blue}
	.top{
	height:108px;
	color:#fff;
	padding:8px 20px;
	font-weight:600;
	font-size:16px;
	line-height:24px;
	}
	.panel{
		display:block
	}
	/* background:rgba(0, 146, 221, 0.6); */
	.title_a{font-size:22px;font-weight:600;color:#fff;}
	.headertop{
	background: url("ch/images/topheader2.png")no-repeat top left;
	
	height:128px;
	border-bottom:1px solid #eeeeee;
	}
    /*rgba(0, 170, 242, 0.6)*/
	img{height:40px}
	.top1{
	height:100%;
	color:#fff;
	padding:2px;
	font-size:16px;
	line-height:24px;
	}
	.to_con{color:#ff8a00;font-size: 10pt}
	.con{color:blue;font-size: 10pt;width:100%}
	 	 .btn-info{background:#00a8ff;border:1px solid #0091dc;font-size:12pt;width:100%;}
	    .btn-info:hover{background:#0092dd;border:1px solid #0080c3;font-size:12pt;}  
	.event > label:after{background-color: #00a8ff !important}
#today{background:#ff0000;border:1px solid #ff0000;}	
.btn-now{margin-top:15px;background:#cf3222;border:1px solid #cf3222;font-size:12pt;width:100%;color:#fff;}
.btn-end{margin-top:15px;background:#dae0e4;border:1px solid #dae0e4;font-size:12pt;width:100%;color:#a7b7c3;}
.btn{height:40px}
.reportlist{text-decoration: underline;color:#ff8a00;}
.btn_all{margin-top:15px}
#all{
	background-color: rgb(253,234,218);
	height:50px;
	line-height: 50px;
	text-align: center;
	font-size: 12pt
}
#backto{
	float:left;height:54px;margin-top:8px
}
#menu {
	height: 50px;
	width: 50px;
	position: absolute;
	right: 0;
	cursor: pointer;
}#select {
	margin-right: 10px;
	vertical-align: middle;
	margin-top: 10px;
	height:35px
}
#list-menu>div {
	height: 50px;
	border-bottom: 1px solid #fff;
	color: #fff;
	cursor: pointer;
	line-height: 50px
}
#list-menu {
	background-color: rgb(0, 168, 255) !important;
	width: 106px;
	text-align: center;
	position: fixed;
	bottom: 50px;
	right: 0;
	display: none;
	z-index: 9999
}
.show {
	display: block !important
}#emergency{
	width:50px;height:50px;position:fixed;bottom:60px;left:0;border:1px solid #bcbcbc;text-align: center;background-color: #00a8ff;color:#fff !important;z-index:9999
}
    </style>
     <script type="text/javascript">
  		var root ="<%=basePath%>";
  		document.addEventListener('WeixinJSBridgeReady',function onBridgeReady(){
					WeixinJSBridge.call('hideOptionMenu');
		});
		var home = "${sessionScope.lastHomePath}";
		var employer_name = "${sessionScope.employer_name}";
    </script>  
   
  </head>
 <body>
  <div id="list-menu">
		<!-- <div id="speed">查看测速口令</div> -->
		<div id="logout">账号解绑</div>
	</div>
	<div id="emergency">在线<br>申测</div>
<div id="all"><span>查看所有报告>></span></div>
<div class="topheader">
<div id="backto"><img src="<%=request.getContextPath()%>/core/images/icon_white_nav_left_96.png"><div style="color:#fff;float:right;height:40px;line-height: 40px">上一步</div></div>
<div  id="menu">
			<img src="<%=request.getContextPath()%>/ch/images/select.png" id="select">
		</div>
<div style="clear: both;"></div>
</div> 
 <a href="#today_now" style="display:none"><span id="clickNow">click</span></a> 
    <div id="content">
        	<section class="main top1" style="margin-top: 40px;">
				<ul class="timeline" id="add">
				</ul>  
			</section>
	</div>
	
  </body>
</html>

<script type="text/javascript">
        var root = "<%=basePath%>";
        var list = "{param.list}";
        var openId = "${openId}";
        var userOpenId = "${sessionScope.userOpenId}";
        var type = "${param.type}";
        if(!openId){
        	openId="${param.openId}";
        }
        var posId = "${requestScope.positionId}";
        if("${param.posId}"){
        	posId = "${param.posId}";
        }
        var positionId = "${param.positionId}";
        var companyName = "${sessionScope.company_name}";
        $('.company').text(companyName);
		var errorBtn_text = '';											
		var relResult;
		var mydate = new Date();
		var ss = mydate.getTime();  //时间戳
		var activity2Interval = new Object();   
		
   	 	function choose(event,activityId){
   		var Button_text = $(event.target).text();
   		var testState = -1;
   		if(Button_text=="启动考试"){
   		  // 点击启动考试弹出提示框
   		    if(!window.confirm("确定要启动考试?"))
		         {
		           return false;
		         }
		     else{
		         testState = 1;
   		   		 examStase(activityId,testState,event);
		     }; 
   		  //启动考试时   点击提示框中的‘是’的时候才改变testState
   		  }
   		if(Button_text=="停止考试"){
   			//点击停止考试弹出提示框
   			if(!window.confirm("确定要停止考试?"))
		         {
		           return false;
		         }
		     else{
		         testState = 2;
   			 	 examStase(activityId,testState,event);
		     }; 
   			// 停止考试时  点击提示框中的‘是’的时候才改变testState
   		
   			
   		}
  		if(testState==-1){
   			return;
   		}
   			//获取按钮上的text 来判断用户的操作
	}
	
	function examStase(activityId,testState,event){
	        var Button_text = $(event.target).text();
	        $.ajax({
    		url:root+"sets/wx/schoolPosition/updateActivityStatus/"+activityId+"/"+testState,
    		type:"post",
    		contentType :"application/json",
    		dataType:"json",
    		success:function(result){
    			if(result.code!=0){
    			}
    			else{
	    			if(testState==1){  //开始考试的时候
	    			    //点击启动考试改变按钮样式
	    			    	$(event.target).addClass('btn-now');
				    		$(event.target).removeClass('btn-info');
						    $(event.target).text("停止考试");
							startCalJoinNum(activityId,testState);
	    			}
	    			if(testState==2){//停止考试的时候
	    				//点击停止按钮改变按钮样式
		    				$(event.target).addClass('btn-end');
					  		$(event.target).removeClass('btn-now');
						    $(event.target).text("已结束");
						    if(activity2Interval[activityId])
						    clearInterval(activity2Interval[activityId]);   //停止获取
	    			 }
    			}
    		}
    	});
	}
		function startCalJoinNum(activityId,testState){
			$.ajax({
					url:root+"sets/wx/schoolPosition/getActivityCount/"+activityId,
					type:"post",
					contentType:"application/json",
					dataType:"json",
					success:function(result){
						if(result.code!=0){
							return;
						}
						else{
							var totalJoinNum = result.data.totalJoinNum;
							var totalAnsweringNum = result.data.totalAnsweringNum;
							if(testState==1||testState==2){
							    
								//请求 AJAX 如果成功
								//返回  返回参加考试的人数和多少人未交试卷
								$("#oLi"+activityId).html('共有<a class="reportlist">'+totalJoinNum+'人</a>参加考试，其中'+totalAnsweringNum+'人未交卷');
								$("#oLo"+activityId).html('共有<a class="reportlist">'+totalJoinNum+'人</a>参加考试');
							  	
								//清除interval的时候调用
							}
						}
					}
				});
			}
			
		function message(){
			if(posId){
				var urlId = posId;
			}else if(positionId){
				var urlId = positionId;
			}
		   		$.ajax({
				url:root+"sets/wx/schoolPosition/getActivities/"+urlId,
				type:"post",
				contentType :"application/json",
				dataType:"json",
			    success:function(result){
		    	relResult = result.data;
		    	console.log(relResult);
		    	if(relResult=="")
		    	{
			    	$('#content').empty().append('<div style="text-align:center;height:100px;line-height:30px;color:#00A8FF;font-size:12pt;padding-top:100px">已绑定成功<br>测评报告将实时送到您手中。</div>');
			    	$('.timeTitle').empty();
			    	return;
		    	}
		      	if(result.code!=0){
					alert("getInfo error");
					return ;
				}		
					    var temp = [];
						var arr = result.data;
						var activityId = '';
					for(var i=0;i<arr.length;i++){
						
						activityId = arr[i].activityId;
						var testState =arr[i].testState;
				  	//已经结束
					if(testState==2){
						var activityDate =arr[i].activityDate
						activityDate = activityDate.split("-");
						var month = activityDate[1];//获得月份
						var day = activityDate[2];//获得日期
						//做比对
						temp.push('<li class="event_b">');
						temp.push('<label id="tod_con"></label>');
	  					temp.push('<div class="thumb_b user-4">'+month+'/'+day+'<br><span>'+arr[i].city+'</span></div>');
	  					temp.push('<div class="content-perspective">');
	  					temp.push('<div class="content">');
	  					temp.push('<p  class="flip_b flip_hide" id = "today_'+arr[i].isCurrent+'">'+arr[i].college+'<a class="cort2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><span style="display:none">'+i+'</span></p>');
	  					temp.push('<div class="panel mypanel" id='+i+'>');
	  					temp.push('<ul class="all_report">');
	  					temp.push('<li class="icon_a">'+arr[i].address+'</li>');
	  					temp.push('<li class="icon_b">'+arr[i].activityDate+'<br>'+arr[i].beginTime+'-'+arr[i].endTime+'</li>');
	  					temp.push('<li class="icon_c">共有');
	  					if(arr[i].seatNumber||arr[i].seatNumber)
	  					{
	  					temp.push('共有'+arr[i].seatNumber+'个座位');
	  					}else{
	  					temp.push('未知');
	  					}
	  					temp.push('</li>'); 
	  					if(arr[i].passport){
	  						if(arr[i].passport!=""){
		  					temp.push('<li>口令为<span style=color:red> '+arr[i].passport+'</span></li>'); 
	  						}
	  					}
	  					temp.push('<li class="act" style="display:none"><span style=color:red> '+activityId+'</span></li>');
	  					startCalJoinNum(activityId,testState);
	  					var joinNumId = "oLo"+arr[i].activityId;
				  		temp.push('<li id='+joinNumId+' class="icon_d"></li>');
				  		temp.push('<li class="details"><a class="reportlist">点击查看详情</a></li>');  
	  					temp.push('<lable class="btn btn_state btn-end" id="btnn" style="display:block;text-align:center;height:35px;line-height:35px;margin-top:15px">已结束</lable>');
	  					temp.push('</ul>');
	  					temp.push('</div>');
	  					temp.push('</div>');
	  					temp.push('</div>');
	  					temp.push('</li>');
	  					$('#add').html(temp.join(''));
	  					$('#clickNow').click();
					}
					else
					{
						    var activityDate =arr[i].activityDate;
							activityDate = activityDate.split("-");
							var month = activityDate[1];//获得月份
							var day = activityDate[2];//获得日期
							var dd = new Date();
							var today = dd.getDate();
							var tomonth = dd.getMonth()+1;
							
							var exmDay = day.toString()+month.toString();
							var to_day = today.toString()+tomonth.toString();
							//做比对
				            
							
							    temp.push('<li class="event">');
								temp.push('<label id="today_'+arr[i].isCurrent+'" class="now"></label>');
			  					temp.push('<div class="thumb user-4">'+month+'/'+day+'<br><span>'+arr[i].city+'</span></div>');
			  					temp.push('<div class="content-perspective">');
			  					temp.push('<div class="content this">');
			  					temp.push('<p class="flip flip_hide" id="today_now">'+arr[i].college+'<a class="cort">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><span style="display:none">'+i+'</span></p>');
			  					temp.push('<div class="panel mypanel today_con" id='+i+'>');
			  					temp.push('<ul class="pane all_report">');
			  					temp.push('<li class="icon_a">'+arr[i].address+'</li>');
			  					temp.push('<li class="icon_b">'+arr[i].activityDate+'<br>'+arr[i].beginTime+'-'+arr[i].endTime+'</li>');
			  					temp.push('<li class="icon_c">');
				  					if(arr[i].seatNumber||arr[i].seatNumber)
				  					{
				  					temp.push('共有'+arr[i].seatNumber+'个座位');
				  					}else{
				  					temp.push('未知');
				  					}
				  					temp.push('</li>');
			  					if(arr[i].passport){
				  					temp.push('<li class="passcode">口令为<span style=color:red> '+arr[i].passport+'</span></li>');
			  					}
			  					temp.push('<li class="act" style="display:none"><span style=color:red>'+activityId+'</span></li>');
			  					var joinNumId = "oLi"+arr[i].activityId;
						  		temp.push('<li id='+joinNumId+' class="icon_d"></li>');
						  		temp.push('<li class="details"><a class="reportlist">点击查看详情</a></li>');  
			  				    $('#clickNow').click(); 
			  					
			  					temp.push('</ul>');
			  					temp.push('<div class="btn_all">');
			  					
			  					
			  					
			  					if(testState==0){
			  						//可以开始考试
			  							//今天可以开始考试
			  						temp.push('<button type="button" class="btn btn-info btn_state state0" id="btnn" onClick="choose(event,'+activityId+')">启动考试</button>');
			  					
			  					}
			  					if(testState==1){
			  					    
				  					startCalJoinNum(activityId,testState);
				  					var intervalId = setInterval(function(){
				                           startCalJoinNum(activityId,testState);
				                     },5000);
				                     activity2Interval[activityId] = intervalId;
				                           
				  						temp.push('<button type="button" class="btn btn_state btn-now state1" id="btnn" onClick="choose(event,'+activityId+')">停止考试</button>');
			  					}
			  					
			  					temp.push('</div>');
			  					temp.push('</div>');
			  					temp.push('</div>');
			  					temp.push('</div>');
			  					temp.push('</li>');
			  					$('#add').html(temp.join(''));
			  					
			  			}
			  			
					}
					//未结束
						$('.today_con').show();  	
				},
				error:function(data){
				},
				complete : function(){
					window.location.href="#today_1";
				}
		});	
    	}
    	$(document).ready(function(){
   		 message();
   		$('#add').on('click','.all_report',function(){
   		    var act = parseInt($(this).find('.act').text());
   		    if(posId){
	   		    location.replace(root+"sets/wx/examReport?act="+act+"&&openId="+posId);
   		    }else if(positionId){
	   		    location.replace(root+"sets/wx/examReport?act="+act+"&&openId="+positionId+"&&list=0");
   		    }
   		 });
   		 $('#menu').click(function(){
					$('#list-menu').toggleClass("show");
				});
          $('#content').on('click','p',function(){
            var id = $(this).find('span').text();
            if($(this).hasClass('flip_hide'))
            {
            $(this).removeClass('flip_hide');
            $(this).find('a').removeClass('cort').addClass('cort2');
            $('#'+id+'').hide();
            }
            else{
            $(this).addClass('flip_hide');
            $(this).find('a').removeClass('cort2').addClass('cort');
            $('#'+id+'').show();
            }
         }); 
         
         $('#backto').click(function(){
         		if(type==2)
         		{
         			location.replace(root+"sets/wx/schoolTest?type=2");
         		}else if(list){
         			location.replace(root+"sets/wx/testList");
         		}
         });
         $('#all').click(function(){
         if(posId){
         	location.replace(root+"sets/wx/examReport?all=-1&&type=1&&openId="+userOpenId+"&userId="+posId);
         }else{
         	location.replace(root+"sets/wx/examReport?all=-1&&type="+type+"&&openId="+userOpenId+"&userId="+positionId);
         }
         });
         $('#emergency').click(function(){
			         if(posId){
	         			var relId = posId;
         			}else{
	         			var relId = positionId;
         			}
         			window.open(root+"sets/wx/getCode?posId="+relId,'_blank');
         });
	    
	    });
</script>