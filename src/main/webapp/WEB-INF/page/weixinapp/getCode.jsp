<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>
<meta name="viewport"
	content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ch/js/appframework.min.js"></script>
<style type="text/css">
body,div,button,ul,li,a,header,h4 {
	font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei",
		"微软雅黑", "STHeiti", "WenQuanYi Micro Hei", SimSun, sans-serif;
	color: #666666;
}

body {
	padding: 0px;
	margin: 0px;
}

.title {
	margin:15px 0px;
	text-align: center;
	font-size: 17pt;
	color:#0da5f1;
	line-height:32px;
}
.title span, .time span{
	font-size: 10pt;
	color:#7e7e7e;
	letter-spacing:-0.5pt;
	}
.topheader {
	background-color:#0da5f1;
	width: 100%;
	height: 50px;
}
.top-title{
	text-align:center;
	margin:0 10px;
	line-height:50px;
	color:#FFF;
	font-size:14pt;
	margin-right:50px;
	}
a.prev{
	width:50px;
	float:left;
	display: none
	}
.child-title {
	width: 100%;
	background-color:#e7ebee;
	height: 30px;
	line-height: 30px;
	border-top:1px solid #dae0e4;
	border-bottom:1px solid #dae0e4;
}
.title1{
	color:#5e5e5e;
	padding-left:15px;}
.code-message {
	padding: 15px 15px;
	color:#353535;
	margin:0px 20px;
	line-height: 25px;
}

.setTime {
	text-align: center;
	padding:10px 35px 30px 35px;
}

.btn-info {
	background: #0da5f1 !important;
	border: 1px solid #dedede;
	font-size: 13pt;
	color: #fff !important;
	height: 50px !important;
	width: 100%;
	border-radius:5px;
	
}

.time {
	text-align: center;
	padding:30px 0px;
	color:#353535;
	line-height:25px;
}

.time-select {
	height: 35px;
	text-align: center;
	width: 278px;
	margin-top:10px;
}


</style>

</head>

<body>
	<!--页面头部分  -->
	<div class="topheader">
    	<div class="top-title">
        	<a class="prev"><img src="<%=request.getContextPath()%>/core/images/icon_white_nav_left_96.png" height="50"></a>
           <span class="title-text"> 申请在线考试设置</span>
        </div>
    </div>
	<!-- 第一个页面部分  -->
	<div class="step1" >
		<div class="title">
			没有网、页面太卡？<br>状况紧急查看此锦囊<br> <span>（申请成功后，考生将会收到考试通行证。）</span>
		</div>
		<div class="child-title">
			<div class="title1">第一计</div>
		</div>
		<div class="code-message">
			请考生关注微信服务号"百一微测试",编辑发送"<span style="color:#e21a15;"><span class="passport">TEST</span>#姓名#邮箱</span>"
		</div>
		<div class="setTime">
			<button class="btn-info">设置时间</button>
		</div>
	</div>
	<!--第二个页面部分  -->
	<div class="step2" style="display:none">
		<div class="time">
			申请截止时间<br><span class="title1">在线申请将在这个时间之后自动关闭</span><br>
			<select class="time-select end-date" id="re-date">
			</select><br> 
			<select class="time-select end-time" id="re-time">
			</select><br>

		</div>
		
		<div class="time">
			考试截止时间<br><span class="title1">在线考试邀请邮件中告知考生的最后交卷时间</span><br>
			<select class="time-select end-date" id="exam-date">
			</select><br> 
			<select class="time-select end-time" id="exam-time">
			</select><br>

		</div>
		<div class="setTime btn-area">
			<button class="btn-info" id="save">保存</button>
		</div>
</body>
</html>
<script type="text/javascript">
	var myDate = new Date();
	var root="<%=basePath%>";
	var date = [];
	var posId = "${param.posId}";
	var endTime = ["01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30","00:00","00:30"];
	var year = myDate.getFullYear();
	var month = myDate.getMonth()+1;
	var index = 1;
	for(var p=0;p<endTime.length;p++){
		$('.end-time').append('<option value="'+endTime[p]+'">'+endTime[p]+'</option>');
	}
	for(var i=0;i<30;i++){
		var day = myDate.getDate();
		if(month=="1"||month=="3"||month=="5"||month=="7"||month=="8"||month=="10"){
					if(day+i+1>32){
						var decMonth = month+1;
						day=index++;
						if(day<10){day="0"+day}
						date.push(year+"-"+decMonth+"-"+day);
					}else{
						day=day+i;
						if(day<10){day="0"+day}
						date.push(year+"-"+month+"-"+day);
					}
		}else if(month=="4"||month=="6"||month=="9"||month=="11"){
				if(day+i+1>31){
						var decMonth = month+1;
						day=index++;
						if(day<10){day="0"+day}
						date.push(year+"-"+decMonth+"-"+day);
					}else{
						day=day+i;
						if(day<10){day="0"+day}
						date.push(year+"-"+month+"-"+day);
					}
		}else if(month=="2"){
				if(year%4==0){
					if(day+i+1>30){
						var decMonth = month+1;
						day=index++;
						if(day<10){day="0"+day}
						date.push(year+"-"+decMonth+"-"+day);
					}else{
						day=day+i;
						if(day<10){day="0"+day}
						date.push(year+"-"+month+"-"+day);
					}
				}else{
					if(day+i+1>29){
						var decMonth = month+1;
						day=index++;
						if(day<10){day="0"+day}
						if(decMonth<10){decMonth="0"+decMonth}
						date.push(year+"-"+decMonth+"-"+day);
					}else{
						var decMonth = month;
						day=day+i;
						if(day<10){day="0"+day}
						if(decMonth<10){decMonth="0"+decMonth}
						date.push(year+"-"+decMonth+"-"+day);
					}
				}
		}else{
			if(day+i+1>32){
						var decMonth = "01";
						day=index++;
						if(day<10){day="0"+day}
						date.push(year+"-"+decMonth+"-"+day);
					}else{
						day=day+i;
						if(day<10){day="0"+day}
						date.push(year+"-"+month+"-"+day);
					}
		}
	}
	for(var o=0;o<date.length;o++){
		$('.end-date').append('<option value="'+date[o]+'">'+date[o]+'</option>');
	}
	
	function bindEvent(){
		$('.setTime').click(function(){
			$('.step1').hide();
			$('.step2').show();
			$('a').show();
			$('.title-text').text("");
		});
		$('a').click(function(){
			$('.step1').show();
			$('.step2').hide();
			$('a').hide();
			$('.title-text').text("申请在线考试设置");
		});
		$('#save').click(function(){
			var reDate =$('#re-date').val()+"|"+$('#re-time').val();
			var examDate = $('#exam-date').val()+"|"+$('#exam-time').val();
			setTime(reDate,examDate)
		});
	}
	function selectTime(){
		$.ajax({
			url:root+"sets/wx/schoolPosition/queryOnlineReqSets/"+posId,
			type:"post",
			contentType:"application/json",
			dataType:"json",
			success:function(result){
			console.log(result);
			var newDate = new Date();
			var month = newDate.getMonth()+1;
			var day = newDate.getDate();
			var year = newDate.getFullYear();
			console.log(year+"/"+month+"/"+day);
				$('.passport').text(result.data.passport);
				var onlineReqEndDate  = result.data.onlineReqEndDate;
				var examEndDate = result.data.examEndDate;
				var onlineEnddate = onlineReqEndDate.split("|")[0];
				var onlineEndtime = onlineReqEndDate.split("|")[1];
				var examdate = examEndDate.split("|")[0];
				var examtime = examEndDate.split("|")[1];
				var olyear = onlineEnddate.split("-")[0];
				var olmonth = onlineEnddate.split("-")[1];
				var olday = onlineEnddate.split("-")[2];
				var exyear = examdate.split("-")[0];
				var exmonth = examdate.split("-")[1];
				var exday = examdate.split("-")[2];
				if(olyear < year){
					$('#re-date').append('<option value="'+onlineEnddate+'" selected>'+onlineEnddate+'</option>');
				}else if(olyear==year&&olmonth<month){
					$('#re-date').append('<option value="'+onlineEnddate+'" selected>'+onlineEnddate+'</option>');
				}
				else if(olday<day&&olmonth==month&&olyear == year){
					$('#re-date').prepend('<option value="'+onlineEnddate+'" selected>'+onlineEnddate+'</option>');
				}else{
				$('#re-date').val(onlineEnddate);
				}
				if(exyear < year){
					$('#exam-date').append('<option value="'+examdate+'" selected>'+examdate+'</option>');
				}else if(exyear==year&&exmonth<month){
					$('#exam-date').append('<option value="'+examdate+'" selected>'+examdate+'</option>');
				}
				else if(exday<day&&exmonth==month&&exyear == year){
					$('#exam-date').prepend('<option value="'+examdate+'" selected>'+examdate+'</option>');
				}else{
					$('#exam-date').val(examdate);
				}
				$('#re-time').val(onlineEndtime);
				$('#exam-time').val(examtime);
			},error:function(){
				alert("您的网络出现问题了，请检查网络后重试");
			},
			complete:function(){
			}
			
		})
	}
	function setDate (reDate,examDate){
									$.ajax({
									url:root+"sets/wx/schoolPosition/updateOnlineReqSets/"+posId+"/"+reDate+"/"+examDate,
									type:"post",
									contentType:"application/json",
									beforeSend:function(){
										$('#save').attr("disabled","disabled").text("提交中，请稍后。。。");
									},
									dataType:"json",
									success:function(result){
										if(result.code==0){
											alert("保存成功！")
										}
									},error:function(){
											alert("您的网络出现问题了，请检查网络后重试");
									},complete:function(){
										$('#save').removeAttr("disabled").text("保存");
									}
									})
	}
	function setTime(reDate,examDate){
					var relDate = reDate.split("|");
					var examdate = examDate.split("|");
					var newReyear = relDate[0].split("-")[0]*1;
					var newRemonth = relDate[0].split("-")[1]*1;
					var newReday = relDate[0].split("-")[2]*1;
					var newRehour = relDate[1].split(":")[0]*1;
					var newReminute = relDate[1].split(":")[1]*1;
					var newExamyear = examdate[0].split("-")[0]*1;
					var newExammonth = examdate[0].split("-")[1]*1;
					var newExamday = examdate[0].split("-")[2]*1;
					var newExamhour =examdate[1].split(":")[0]*1; 
					var newExamminute =examdate[1].split(":")[1]*1;
					if(newExamyear>newReyear){
							setDate(reDate,examDate);
					}else if(newExamyear==newReyear&&newExammonth>newRemonth){
							setDate(reDate,examDate);
					}else if(newExamyear==newReyear&&newExammonth==newRemonth&&newExamday>newReday){
						setDate(reDate,examDate);
					}else if(newExamyear==newReyear&&newExammonth==newRemonth&&newExamday==newReday){
							if(newExamhour==newRehour&&newExamminute>newReminute){
								setDate(reDate,examDate);
							}else if(newExamhour>newRehour){
								setDate(reDate,examDate);
							}else if(newExamhour==newRehour&&newExamminute==newReminute){
								alert("设置失败，申请时间不能等于考试截止时间！");
							}else{
								alert("设置失败，申请时间不能大于考试截止时间！");
							}
					}else{
						alert("设置失败，申请时间不能大于考试截止时间！");
					}
			
	}
	$(document).ready(function(){
		bindEvent();
		selectTime();
	});
</script>