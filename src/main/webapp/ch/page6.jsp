<%@ page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    

	<link rel="stylesheet" href="<%=request.getContextPath()%>/lib/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ch/css/style.css" />
	<style type="text/css">
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
	font-weight:600;
	font-size:16px;
	line-height:24px;
	}
	.to_con{color:#ff8a00;font-size: 10pt}
	.con{color:blue;font-size: 10pt;width:100%}
	 	 .btn-info{background:#00a8ff;border:1px solid #0091dc;font-size:12pt;width:100%;}
	    .btn-info:hover{background:#0092dd;border:1px solid #0080c3;font-size:12pt;}  
	.event > label:after{background-color: #00a8ff !important}
}
		
#today{background:#ff0000;border:1px solid #ff0000;}	
.btn-now{background:#cf3222;border:1px solid #cf3222;font-size:12pt;width:100%;color:#fff;}
.btn-end{background:#dae0e4;border:1px solid #dae0e4;font-size:12pt;width:100%;color:#a7b7c3;}
    </style>
     <script type="text/javascript">
  		var root ="<%=basePath%>";
  		document.addEventListener('WeixinJSBridgeReady',function onBridgeReady(){
					WeixinJSBridge.call('hideOptionMenu');
		});
    </script>  
    <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/core/js/core.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/store+json2.min.js"></script>
     
  </head>
  
 <body>
  

<div class="headertop">

</div> 
<a href="ch/page6.jsp#today_now" style="display:none"><span id="clickNow">click</span></a>
    <div id="content">
        	<section class="main top1" style="margin-top: 20px;margin-left: 10px">
				<ul class="timeline" id="add">
				</ul>  
			</section>
	</div>
	<!-- 是否确认启动考试提示框 -->
<div class="modal fade " id="successModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content success_area">
      <div class="modal-header">
      <h4 align="center">温馨提示</h4>
      </div>
      <div class="modal-body">
        <p align="center"><font color="#00CC00" size="+1">是否确认启动考试？</font></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default " data-dismiss="modal" id="ifYes" style="width: 50%;margin-left:-90px">是</button>
        <button type="button" class="btn btn-primary " data-dismiss="modal" id="ifNo" style="width: 50%">否</button>
      </div> 
    </div><!--/.modal-content-->
  </div><!--/.modal-dialog-->
</div><!--/.modal -->

                                             <!-- 是否确认停止考试弹出框 -->
<div class="modal fade " id="StopModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content success_area">
      <div class="modal-header">
      <h4 align="center">温馨提示</h4>
      </div>
      <div class="modal-body">
        <p align="center"><font color="#00CC00" size="+1">是否确认停止考试？</font></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default " data-dismiss="modal" id="stopYes" style="width: 50%;margin-left:-90px">是</button>
        <button type="button" class="btn btn-primary " data-dismiss="modal" id="stopNo" style="width: 50%">否</button>
      </div> 
    </div>
  </div>
</div>
	
	
  </body>
</html>

<script type="text/javascript">
	
		
		var errorBtn_text = '';											
		var employerId = "100000004";
		var relResult;
		var mydate = new Date();
		var ss = mydate.getTime();  //时间戳
		var activity2Interval = new Object();   
		
   	 	function choose(event,activityId){
   		var Button_text = $(event.target).text();
   		var testState = -1;
   		if(Button_text=="启动考试"){
   		  // 点击启动考试弹出提示框
   		   $('#successModal').modal('show'); 
   		  //启动考试时   点击提示框中的‘是’的时候才改变testState
   		   $('#ifYes').click(function(){
   		  	testState = 1;
   		   examStase(activityId,testState,event);
   		   });
   		  }
   		if(Button_text=="停止考试"){
   			//点击停止考试弹出提示框
   			$('#StopModal').modal('show');
   			// 停止考试时  点击提示框中的‘是’的时候才改变testState
   			$('#stopYes').click(function(){
   			 testState = 2;
   			 examStase(activityId,testState,event);
   			});
   		
   			
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
    		    console.log(result);
    			if(result.code!=0){
    			alert('error');
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
	
		// 判断提示框的按钮上的值的方法
		//1  判断启动考试时候提示框中的 是  否
		/*
		function checkButton2(){
			startNo = $('#startNo').text();
		}
		//2  判断停止考试时候提示框中的 是  否
		function checkButton3(){
			ifYes = $('#ifYes').text();
		}
		function checkButton4(){
			ifNo = $('#ifNo').text();
		} */
		
		
		function startCalJoinNum(activityId,testState){
			$.ajax({
					url:root+"sets/wx/schoolPosition/getActivityCount/"+activityId,
					type:"post",
					contentType:"application/json",
					datatype:"json",
					success:function(result){
						if(result.code!=0){
							alert("error");
							return;
						}
					
						else{
							var totalJoinNum = result.data.totalJoinNum;
							var totalAnsweringNum = result.data.totalAnsweringNum;
							if(testState==1||testState==2){
							    var intervalId = setInterval(function(){	
								//请求 AJAX 如果成功
								//返回  返回参加考试的人数和多少人未交试卷
								$("#oLi"+activityId).text("共有"+totalJoinNum+"人参加考试，其中"+totalAnsweringNum+"人未交卷");
								$("#oLo"+activityId).text("共有"+totalJoinNum+"人参加考试");
							  	},1000);
								activity2Interval[activityId] = intervalId;//清除interval的时候调用
							}
							
						}
					}
				});
			}
			
		function message(){
		   		$.ajax({
				url:root+"sets/wx/schoolPosition/getActivities/"+employerId,
				type:"post",
				contentType :"application/json",
				dataType:"json",
			    success:function(result){
		    	relResult = result.data;
		      	if(result.code!=0){
					alert("getInfo error");
					return ;
				}		
					    var temp = [];
						var arr = result.data;
						var activityId = '';
					for(var i=0;i<arr.length;i++){
						var exmDate = new Date();
						activityId = arr[i].activityId;
						var testState =arr[i].testState;
				  	//已经结束
					if(testState==2){
						var activityDate =arr[i].activityDate
						exmDate.setTime(activityDate);
						var month = exmDate.getMonth()+1;//获得月份
						var day = exmDate.getDate();//获得日期
						//做比对
						if(month<10){
							month = '0'+month;
						}
						if(day<10){
							day = '0'+day;
						}
						temp.push('<li class="event_b">');
						temp.push('<label id="tod_con"></label>');
	  					temp.push('<div class="thumb_b user-4">'+month+'/'+day+'<br><span>'+arr[i].city+'</span></div>');
	  					temp.push('<div class="content-perspective">');
	  					temp.push('<div class="content">');
	  					temp.push('<p  class="flip_b">'+arr[i].activityName+'</p>');
	  					temp.push('<div class="panel mypanel">');
	  					temp.push('<ul>');
	  					temp.push('<li>'+arr[i].addressDetail+'</li>');
	  					temp.push('<li>'+arr[i].beginTime+'-'+arr[i].endTime+'</li>');
	  					temp.push('<li>共有'+arr[i].seatNumber+'个座位</li>'); 
	  					temp.push('<li>口令为<span style=color:red> '+arr[i].passcode+'</span></li>');
	  					startCalJoinNum(activityId,testState);
	  					var joinNumId = "oLo"+arr[i].activityId;
				  		temp.push('<li id='+joinNumId+'></li>');  
	  					temp.push('<lable class="btn btn_state btn-end" id="btnn">已结束</lable>');
	  					temp.push('</ul>');
	  					temp.push('</div>');
	  					temp.push('</div>');
	  					temp.push('</div>');
	  					temp.push('</li>');
	  					$('#add').html(temp.join(''));
					}
					else
					{
						    var activityDate =arr[i].activityDate;
							mydate.setTime(activityDate);
							var day = mydate.getDate();
							var month = mydate.getMonth()+1;
							
							var dd = new Date();
							var today = dd.getDate();
							var tomonth = dd.getMonth()+1;
							
							var exmDay = day.toString()+month.toString();
							var to_day = today.toString()+tomonth.toString();
							//做比对
				            
							if(month<10){
								month = '0'+month;
							}
							if(day<10){
								day = '0'+day;
							}
							    temp.push('<li class="event">');
								temp.push('<label id="tod_con" class="now"></label>');
			  					temp.push('<div class="thumb user-4">'+month+'/'+day+'<br><span>'+arr[i].city+'</span></div>');
			  					temp.push('<div class="content-perspective">');
			  					temp.push('<div class="content this">');
			  					temp.push('<p class="flip" id="today_now">'+arr[i].activityName+'</p>');
			  					temp.push('<div class="panel mypanel today_con">');
			  					temp.push('<ul>');
			  					temp.push('<li >'+arr[i].addressDetail+'</li>');
			  					temp.push('<li >'+arr[i].beginTime+'-'+arr[i].endTime+'</li>');
			  					temp.push('<li>共有'+arr[i].seatNumber+'个座位</li>');
			  					temp.push('<li>口令为<span style=color:red> '+arr[i].passcode+'</span></li>');
			  					var joinNumId = "oLi"+arr[i].activityId;
						  		temp.push('<li id='+joinNumId+'></li>');  
			  					$('#clickNow').click();
			  					if(testState==0){
			  						//可以开始考试
			  						if(exmDay==to_day){
			  							//今天可以开始考试
			  						temp.push('<button type="button" class="btn btn-info btn_state state0" id="btnn" onClick="choose(event,'+activityId+')">启动考试</button>');
			  						}
			  					else 
			  						{
			  						temp.push('<lable class="btn btn_state btn-end" id="btnn state2">未开始</lable>');//未开始考试
			  						}
			  					}
			  					
			  				   if(testState==1){
			  					
			  					startCalJoinNum(activityId,testState);
			  						temp.push('<button type="button" class="btn btn_state btn-now state1" id="btnn" onClick="choose(event,'+activityId+')">停止考试</button>');
			  					}
			  					
			  					temp.push('</ul>');
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
				}
		});	
    	}
    	$(document).ready(function(){
    	
   		 message();
   		 
         document.title = "亚信联创校园招聘";
         //隐藏分享
		
	   
          $('#content').on('click','p',function(){
            $(this).next().slideToggle();
         });
	    
	    });
</script>