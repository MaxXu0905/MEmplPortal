<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>返回微信窗口</title>
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

input[type="range"] {
    -webkit-appearance: none;  
	/*	
	   -webkit-box-shadow: 0 1px 0 0px #424242,
        0 1px 0 #060607 inset,
	   0px 2px 10px 0px black inset,
        1px 0px 2px rgba(255, 255, 0, 0.4) inset,
        0 0px 1px rgba(255, 255, 0, 0.6) inset;
	*/		
    margin-top: 10px;
    margin-bottom: 20px;
    background-color: #fff;
    border-radius: 15px;
    width: 100%;
	height:14px;
}

input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none;
    cursor: default;
    top: 0px;
    margin-top:-5px;
    height: 30px;
    width: 30px;
    background: none repeat scroll 0 0 #3385ff !important;
    border-radius: 20px;
    -webkit-box-shadow: 1 1px 1px 1px #fff inset;
    outline:none;    
}

input[type="range"]::-webkit-slider-runnable-track {
  background-color: #bcbcbc !important;
  height:20px;
  border-radius: 15px;
  border:0px solid #d4d4d4 !important;
}

input[type="range"]::-moz-range-track{
    background-color: #bcbcbc !important;
	border:0px solid #d4d4d4 !important;
    border-radius: 15px;
	height:20px
}

input[type="range"]::-moz-range-thumb {
    -webkit-appearance: none;
    cursor: default;
    top: 1px;
    height: 30px;
    width: 30px;
    border: 0px;
    background: none repeat scroll 0 0 #3385ff !important;
    border-radius: 20px;
    -webkit-box-shadow: 1 1px 1px 1px #fff inset;
}


input[type="range"]::-ms-thumb{
	width:15px;
	height:15px;
	border-radius:50%;
	background:none repeat scroll 0 0 #3385ff !important;
	margin-top:-17px
}
input[type="range"]::-ms-track{
	height:30px;
}
input[type="range"]::ms-tooltip{
	display:none
}
/**滑块滑过部分样式*/
input[type="range"]::-ms-fill-lower{
}
input[type="range"]::-ms-ticks-before{
	background-color: blue;
}


/*

input[type="range"]::-webkit-slider-runnable-track {
  border: 2px solid red;
  background: green;
  padding: 2em 0;
}
input[type="range"]::-webkit-slider-thumb {
  outline: 2px solid blue;
} 

input[type="range"]::-moz-range-track {
  border: 2px solid red;
  height: 20px;
  background: orange;
}
input[type="range"]::-moz-range-thumb {
  background: blue;
  height: 30px;
}

*/
/*

input[type="range"] {
    -webkit-appearance: none;  
	
	   -webkit-box-shadow: 0 1px 0 0px #424242,
        0 1px 0 #060607 inset,
	   0px 2px 10px 0px black inset,
        1px 0px 2px rgba(255, 255, 0, 0.4) inset,
        0 0px 1px rgba(255, 255, 0, 0.6) inset;
			
    margin-top: 20px;
    background-color: #e7e9ea;
	border:1px solid #d4d4d4;
    width: 100%;
	height:14px;
}




input[type="range"] {		
    margin-top: 20px;
   margin-bottom: 10px;
    width: 100%;
}
input[type="range"]::-webkit-slider-runnable-track {

    -webkit-appearance: none;  
	
	   -webkit-box-shadow: 0 1px 0 0px #424242,
        0 1px 0 #060607 inset,
	   0px 2px 10px 0px black inset,
        1px 0px 2px rgba(255, 255, 0, 0.4) inset,
        0 0px 1px rgba(255, 255, 0, 0.6) inset;
			
    background-color: #e7e9ea;
	border:1px solid #d4d4d4;
  
}
input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none;
    cursor: default;
    top: 1px;
    height: 30px;
    width: 30px;
    background: none repeat scroll 0 0 #0092dd;
    border-radius: 20px;
    -webkit-box-shadow: 0 0px 0px 0px inset;
}

*/


body,div,button,ul,li,a,header,h4 {
	font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei",
		"微软雅黑", "STHeiti", "WenQuanYi Micro Hei", SimSun, sans-serif;
	color: #666666;
	background: #f8f8f8 !important;
}
textarea,input{
font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei",
		"微软雅黑", "STHeiti", "WenQuanYi Micro Hei", SimSun, sans-serif;
	color: #666666;
}

body {
	padding: 0px;
	margin: 0px;
}

#content {
	margin-top: -20px;
	margin-bottom:50px
}

#WORKPLACE {
	background-color: rgba(4,4,4,0.5)!important;
	z-index: 9999;
	position: absolute;
	width: 100%;
	height: 100%;
}
#workPlace {
	width: 100%;
	height: 100%;
}

#workPlaceAndNav {
	width: 100%;
	height: 100%;
}

header {
	color: #00A8FF;
	background: #fff !important;
}


h1 {
	display: none
}

.con {
	text-align: center;
}

font {
	font-size: 16px;
	color: blue
}

li {
	list-style-type: none
}

.answer_are {
	padding: 0px;
	margin: 0px;
}

.answer_are>li {
	margin: 0px;
	font-size: small;
	color: #ff8a00;
	line-height: 1.8em;
}

.username {
	font-size: 20px;
	color: #00a8ff;
	font-weight: 700;
	padding: 20px 20px;
	float: lift;
}

.username #phoneNum {
	font-weight: 300;
	float: right;
	color: #2cca00;
	text-decoration: none;
}

.result {
	font-size: small;
	color: blue;
	float: right
}

.message {
	border-bottom: 1px solid #dae0e4;
	padding: 8px 20px;
}

.message font {
	float: right;
	color: #00a8ff;
}

.message span {
	float: right;
	color: #00a8ff;
}


hr {
	width: 100%
}

.flip1 {
	border-top: none;
	background: url("images/down.png") no-repeat right;
}

.panel {
	display: none;
	background: #fff !important;
	padding: 5px 20px;
}

.mypanel {
	padding: 8px 20px;
	margin-bottom: 1px;
	background: #fff !important;
}

.slide {
	width: 50px;
	height: 30px;
	text-align: center;
	border: hidden;
}


.choose {
	float: right;
}

#money {
	width: 150px;
	background: url("images/money.gif") no-repeat 0.6em center !important;
	padding-left: 2.4em !important;
}

.res {
	font-size: 15pt;
	color: green
}

.r_title {
	color: #b7bdc1;
	padding: 1px 20px;
	background: #e7ebee !important;
	border-top: 1px solid #dae0e4;
	border-bottom: 1px solid #dae0e4;
}

.btn-info {
	background: #00a8ff !important;
	border: 1px solid #0091dc !important;
	font-size: 16pt;
	color:white;
}

.btn-info:hover {
	background: #0092dd !important;
	border: 1px solid #0080c3 !important;
	font-size: 16pt;
}

.ui-slider-bg {
	
}

.ui-btn-active {
	background: #00a8ff !important;
}

.bottom_res {
	padding: 10px 20px;
}

.bottom_res select {
	margin-bottom: 20px !important;
}

.direction {
	height: 3em;
	line-height: 2.6em;
	font-size: 14px;
	text-align: left;
}

.lable {
	margin-top: -30px;
}

.btn-lg {
	border-radius: 6px;
	font-size: 8pt;
	line-height: 1.33;
	padding: 10px 16px;
}
.answer2 {
	border-bottom: 1px solid #d5d5d5;
	border-top: 1px solid #fff;
	border-left: 4px solid #00a8ff;
	color: #0092dd !important;
	font-family: "微软雅黑";
	padding: 16px 100px 16px 16px !important;
	background: #fff;
	font-size: 13pt;

}
.checked {
	border:1px solid #fff;
	background:#0da5f1;
	color:#fff;
	border-radius:4px;
	padding:4px 10px;
	background-color: #00A8FF !important
}
.unchecked {
	border:1px solid #dedede;
	background:#ffffff;
	color:#7f7f7f;
	border-radius:4px;
	padding:4px 10px;
}
#workPlaceReady {
	border:1px solid #fff;
	background:#0da5f1;
	color:#fff;
	border-radius:4px;
	padding:4px 10px;
	background-color: #00A8FF !important
}

</style>
</head>

<body>
	&nbsp;
	<!-- Title -->
	<!-- 内容 -->
	<div id="content">
		<!--过去  -->
		<div class="answer_are" id="WORKPLACE" style="display: none;">
			<div class="answer_are" id="workPlaceAndNav">
				<div id="workplacehead"></div>
				<div class="answer_are" id="workPlace" style="width:100%;height:100%;float: left;"></div>
				<div class="answer_are" id="nav" style="width: 10%;height:100%;position: fixed;right: 0px;top: 45px;background-color: rgba(255,255,255,0)!important;"></div>
			</div>
			<div class="answer_are" id="workPlaceFoot" style="position: fixed;bottom: 0px;width: 100%;border-top: 3px solid #00A8FF">
			<div>
			<img id="breakList" style="margin:13px 0 0 13px;" src="<%=request.getContextPath() %>/ch/images/close.png"><button id="workPlaceReady" style="width: 20%;height:33px;float: right;margin: 5px 5px 0 0;font-size: 17px">完成</button>
			</div>
			<div>
			<div style="height:55px;line-height:55px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><span style="margin-left: 18px">已选城市：</span><label id="selectedLabel"></label></div>
			</div>
			</div>
		</div>
		<div class="answer_are" id="BREAK" style="position: fixed;height:54px;bottom: -1px;width: 100%;text-align:center;">
			<div style="background-color: #00A8FF !important;height:54px;line-height:45px;color:#fff;"><span style="display:inline-block;height:45px;float:left;"><img style="margin:8px 0 0 10px;" class="breakNav" src="<%=request.getContextPath() %>/ch/images/back.png"></span><span class="breakNav" style="display:inline-block;height:54px;line-heigt:45px;padding: 0 10px;float:left;color: white;">返回到报告列表</span></div>
		</div>
		<div class="answer_are" id="HEADER">
		</div>
		<div class="answer_are" id="BASIC_INFORMATION">
		</div>
		<div class="answer_are" id="TEST_INFORMATION">
		</div>
		<div class="answer_are" id="INTERVIEW_MAIN">
		</div>
		<input id="INTERVIEWNUM" style="display: none"></input>
		</br>
		
		<div class="testResult" style="text-align:center">
			<a type="button" id="test-result-0" class="unchecked">待处理</a> 
			<a type="button" id="test-result-2" class="unchecked">不予考虑</a>
			<a type="button" id="test-result-3" class="unchecked">复试</a>
			<a type="button" id="test-result-1" class="unchecked">拟录用</a>
		</div>
		</br>
		<div style="text-align:center;margin-top:20px;"><button type="button" id="save" class="btn-info">提交信息</button></div><br>
		<div style="margin-bottom:20px"><span></span></div>
	</div>
</body>
</html>

<script type="text/javascript">
    var root = "<%=basePath%>";
	var testId = "${param.testId}";
	var testPaperScore="${param.score}";
	var userId = "${param.userId}";
	var all  = "${param.all}";
	var employerName = "";
	var testName="a";
		//生成试卷模板
		function getCandidateInfo(){
			$.ajax({
             url:root+"sets/wx/schoolReport/getCandidateInfo/"+testId,
              type:'post',
		      contentType: 'application/json',
			  dataType:'json',
			  success:function(result){
			     var datas = result.data
			            var div1=$('<div class="r_title">基本信息</div><div class="basicList"></div>');
			            $('#BASIC_INFORMATION').append(div1);
			        for(var i=0;i<datas.length;i++){
			        	if((datas[i].infoId)=="FULL_NAME"){
			        		var div2=$('<div class="username">'+datas[i].value+'<a id="phoneNum"></a></div>');
			        		div2.appendTo("#HEADER")
			        	}else if((datas[i].infoId)=="PHONE"){
			        		//var phoneNUM=(datas[i].value).substring(0,3)+"-"+(datas[i].value).substring(3,7)+"-"+(datas[i].value).substring(7);
			        		var phoneNUM=(datas[i].value);
			        		$("#phoneNum").text(phoneNUM);
			        		$("#phoneNum").attr("href","tel:"+datas[i].value)
			        	}else if((datas[i].infoId)=="SEX"||(datas[i].infoId)=="EDUCATION"||(datas[i].infoId)=="POSTGRADUATE_APPLIED"||(datas[i].infoId)=="INTENTION_POSITION"){
			        		var div2=$('<div class="message">'+datas[i].infoName+'<font>'+(datas[i].realValue||'')+'</font>');
			        		div2.appendTo(".basicList");
			        	}else if((datas[i].infoId)=="EMAIL"){
			        	var div2=$('<div class="message">'+datas[i].infoName+'<font>'+(datas[i].value||'')+'</font>');
			        		div2.appendTo(".basicList");
			        	}else{
			        	var div2=$('<div class="message">'+datas[i].infoName+'<font>'+(datas[i].realValue||'')+'</font>');
			        	div2.appendTo(".basicList")
			        	};
			        }
			  },
          });
			
		};
		function getSkillScore(){
			$.ajax({
             url:root+"sets/wx/schoolReport/getSkillScore/"+testId,
              type:'post',
		      contentType: 'application/json',
			  dataType:'json',
			  success:function(result){
			     var datas = result.data;
			        for(var i=0;i<datas.length;i++){
			        	var div2=$('<div class="message">'+datas[i].skillName+'<font style="font-size:17px">'+datas[i].score+'分</font>');
			        	div2.appendTo(".skillList");
			        }
			  }
          });
		};
		
		function updateTestResult($btn){
			var testResultId = $('.testResult').children('a.checked').attr('id');
			if(testResultId){
				var testResult = testResultId.split('-')[2];
			}
			var success = false;
			$.ajax({
				url: root + "sets/wx/schoolReport/updateTestResult/" + testId + "/" + testResult,
              	type:'post',
			  	dataType:'json',
			  	success:function(data){
					if(data.code == 0 && data.data){
						if(data.data.code == 'SUCCESS'){
							success = true;
						}
					} 
				},
				complete: function(){
					if(!success){
					setTimeout(function(){
						$btn.text('提交失败');	
					},1000);
					}else{
					setTimeout(function(){
						$btn.text('提交成功');
					},1000);		
					}
					setTimeout(function(){
						if(success){
							$('.breakNav').trigger('click');
						}
						/* $btn.removeAttr('disabled').text('提交信息'); */
					}, 2000);
				}
			});
		}
		
		function getTestResult(){
			$.ajax({
             url:root+"sets/wx/schoolReport/getReportInfo/"+testId,
              type:'post',
			  dataType:'json',
			  success:function(data){
				  if(data.code == 0){
					  if(data.data && data.data.code == 'SUCCESS'){
						  var testResult = data.data.testResult;
						  $('.testResult > #test-result-' + testResult).trigger('click');
						  $('#paperSorce').html('总成绩:'+data.data.getScore+'分');
					  }
				  }
			  }
          });
		}
		
		
		var reviewDataManager = {
				reviewMap : {},
				getKey : function(gId, iId) {
					return 'G_' + gId + '_I_' + iId;
				},
				assembleReviewData : function(reviewArray) {
					for ( var i = 0; i < reviewArray.length; i++) {
						var reviewData = reviewArray[i];
						this.reviewMap[this.getKey(reviewData.groupId, reviewData.infoId)] = reviewData;
					}
				},
				getReviewData : function(key, key2) {
					if (arguments.length == 2) {
						return this.reviewMap[this.getKey(key, key2)]
					}
					return this.reviewMap[key];
				}
			};
		var listIndex = 0;
		function getInterview() {
            $.ajax({
                url:root+"sets/wx/schoolReport/getInterview/"+testId,
                type:"post",
                contentType: 'application/json',
			    dataType:'json',
			    success:function(result){
					reviewDataManager.assembleReviewData(result.data.interview.items || []);
					var groupDatas=result.data.interview.interviewInfo.groups;
			        for(var i=0;i<groupDatas.length;i++){
			        	var groupId = groupDatas[i].id;
			        	if(groupDatas[i].id == 'INTERVIEW_ITEM'){
			        	var div1=$('<div class="r_title ' + groupDatas[i].id + '">'+groupDatas[i].name+'<span style="float: right;color:#00a8ff">面试平均分 :<span id="average"></span></span></div><div class="list" id="' + groupDatas[i].id + '"></div>');
			        	}else{
			        	var div1=$('<div class="r_title ' + groupDatas[i].id + '">'+groupDatas[i].name+'</div><div class="list" id="' + groupDatas[i].id + '"></div>');
			        	}
			        	
			        	$('#INTERVIEW_MAIN').append(div1);
			        	var result2=groupDatas[i].items;
			        	var average=0;
			        	if(groupId=="SKILL_BASE"){
			        		    var indexid = "skillListcontent"+(++listIndex)
				        		for(var q=0;q<groupDatas[i].items.length;q++){
				        		var div2=$('<div class="message flip1">'+groupDatas[i].items[q].name+'</div><div class="list2 mypanel"><select id="'+groupDatas[i].items[q].id+'" data-name="'+groupDatas[i].items[q].id+'" class="saveHiden '+indexid+'" style="height:30px;width:88.5%;margin-left:5.9%;margin-bottom:3px"><option>请选择</option></select></div>');
				        		div2.appendTo($(".list"));
				        		 var viewMapping = groupDatas[i].items[q].mappings;
				        			for(var p=0;p<viewMapping.length;p++){
					        			var options =$('<option value="'+viewMapping[p].key+'">'+viewMapping[p].value+'</option>');
					        			options.appendTo('.'+indexid+'');
				        			}
				        		}
			        		}
			        	for(var j=0;j<result2.length;j++){
			        		var infoId = result2[j].id;
			        		var reviewData = reviewDataManager.getReviewData(groupId, infoId);// 回显数据
			        		if(reviewData){
			        				$('#INTERVIEW_MAIN').find('#'+infoId+'').val(reviewData.value);
			        			}
			        		if(groupId=="INTERVIEW_ITEM"){
			        		var div2=$('<div class="message flip flip1" id="'+result2[j].id+'">'+result2[j].name+'<span id="score'+result2[j].id+'" ></span></div><div class="list2"></div>');
			        		$("#INTERVIEWNUM").attr("value",j+2);
			        		}else if(infoId=="WORK_AREA"){
			        		var div2=$('<div class="message flip1" id="'+result2[j].id+'parentDiv"><a id="'+result2[j].id+'" href="'+window.location.href+'#workplacehead" style="height: 36px;width: 100%;text-decoration: none;">'+result2[j].name+'<span style="color:#666666">请选择</span></a></div><div class="mypanel" id="selectWorkPlace" style="display: none;"></div>');
			        			
			        		}else if(infoId=="COMMENTS"){
			        			var div2=$('<div class="message flip1" id="'+result2[j].id+'">'+result2[j].name+'</div><div class="list2 mypanel"><textarea id="examRemark" style="margin-top:8px;margin-left:6%;height:80px;color:#666666;font-size:11pt;width:87%" placeholder="请输入'+result2[j].name+'"></textarea></div>');
			        			if(reviewData){
			        				div2=$('<div class="message flip1" id="'+result2[j].id+'">'+result2[j].name+'</div><div class="list2 mypanel"><textarea id="examRemark" style="margin-top:8px;margin-left:6%;height:80px;color:#666666;font-size:11pt;width:87%" placeholder="请输入'+result2[j].name+'">'+reviewData.value+'</textarea></div>');
			        			}
			        		}else if(infoId=="INTERVIEWER"){
			        			if(reviewData){
			        				div2=$('<div class="message flip1" id="'+result2[j].id+'">'+result2[j].name+'</div><div class="list2 mypanel"><input id="interviewer" style="margin-left:6%;margin-top:8px" placeholder="请输入'+result2[j].name+'" value="'+reviewData.value+'"></div>');
			        			}else if(employerName!=""){
			        				var div2=$('<div class="message flip1" id="'+result2[j].id+'">'+result2[j].name+'</div><div class="list2 mypanel"><input id="interviewer" style="margin-left:6%;margin-top:8px" placeholder="请输入'+result2[j].name+'" value="'+employerName+'"></div>');
			        			}else{
			        				var div2=$('<div class="message flip1" id="'+result2[j].id+'">'+result2[j].name+'</div><div class="list2 mypanel"><input id="interviewer" style="margin-left:6%;margin-top:8px" placeholder="请输入'+result2[j].name+'" value="'+localStorage.employerName+'"></div>');
			        			}
			        		}
			        		else if(groupId=="INTERVIEW_DECISION"){
			        		var div2=$('<div class="message flip1" id="'+result2[j].id+'">'+result2[j].name+'</div><div class="list2"></div>');
			        		}
			        		else if(groupId=="ADDITIONAL_INFO"){
			        		var div2=$('<div class="message flip1" id="'+result2[j].id+'">'+result2[j].name+'</div><div class="list2"></div>');
			        		};
			        		div2.appendTo($(".list"));
			        		if(groupId=="INTERVIEW_ITEM"){
			        			var result3=result2[j].description.replace(/\n/g, "</br>");
			        			var div3=$('<div class="panel mypanel" id="'+result2[j].id+'div" style="padding-top: 10px">'+result3+'</br><input class="range1" id="slider'+result2[j].id+'" type="range" value="0" min="0" max="10"></input></div>');
			        			div3.appendTo($(".list2"));
			        			var scoreval="#score"+result2[j].id;
			        			var sliderval="#slider"+result2[j].id;
			        			if(reviewData){
			        				$(sliderval).val(reviewData.value);
			        			}
			        			var score= $(sliderval).val()+"分";
			        			$(scoreval).text(score);
			        		}else if(infoId=="EXPECTED_SALARY"){
			        			if(reviewData){
			        			var div3=$('<div class="mypanel" id="'+result2[j].id+'div"><input style="width:90%;margin-left:5%;height:30px" class="range1" id="salary'+result2[j].id+'"  value="'+reviewData.value+'" placeholder="请输入'+result2[j].name+'"></input></div>');
			        			}else{
			        			var div3=$('<div class="mypanel" id="'+result2[j].id+'div"><input style="width:90%;margin-left:5%;height:30px" class="range1" id="salary'+result2[j].id+'"  placeholder="请输入'+result2[j].name+'"></input></div>');
			        			};
			        			div3.appendTo($(".list2"));
			        		}else if(infoId=="WORK_DIRECTION"||infoId=="WORK_POSITION"){
			        			var div3=$('<div class="mypanel" id="'+result2[j].id+'div"><select id="select'+result2[j].id+'" class="list3" style="height:30px;width:90%;margin-left:5%;"><option>请选择</option></select></div>');
			        			div3.appendTo($(".list2"));
			        			var result5=result2[j].mappings;
			        			for(var n=0;n<result5.length;n++){
			        				var option=$('<option value="' + result5[n].key + '">'+result5[n].value+'</option>');
			        				option.appendTo(".list3");
			        			};
			        			if(reviewData){
			        				div3.find('select').val(reviewData.value);
			        			}
			        		};
			        		if(infoId=="WORK_AREA"){
			        			var cityMap = {};
			        			if(reviewData){
			        				var cities = reviewData.value.split('、');
			        				for(var cIndex = 0; cIndex < cities.length; cIndex ++){
			        					cityMap[cities[cIndex]] = 1;
			        				}
			        			}
			        			var result4=result2[j].values;
			        			var obj=new Object();
			        			for(var m=0;m<result4.length;m++){
				        			var key=result4[m].index;
				        			var name=result4[m].name;
				        			var hasReview = cityMap.hasOwnProperty(name);
				        			if(obj[key]){
				        				if(m==((result4.length)-1)){
				        				var workPlaceNavWord=$('<div class="message workPlace1 flip1" id="'+name+'">'+name+'</div><div style="height:89px"><div>');
				        				workPlaceNavWord.appendTo($(".workPlaceList"));
				        				}else{
				        				var workPlaceNavWord=$('<div class="message workPlace1 flip1" id="'+name+'">'+name+'</div>');
				        				workPlaceNavWord.appendTo($(".workPlaceList"));
				        				};
				        			}else{
				        				obj[key]=result4[m].index;
				        				var workPlaceNav=$('<div id="nav_'+key+'" style="text-align: center;background-color: rgba(255,255,255,0)!important;"><a href="'+window.location.href+'#workPlace_'+key+'" style="font-size:15px;text-decoration: none;background-color: rgba(255,255,255,0)!important;">'+key+'</a></div>');
				        				workPlaceNav.appendTo($("#nav"));
				        				if(m==((result4.length)-1)){
				        				var workPlaceNavWord=$('<div class="r_title" id="workPlace_'+key+'">'+key+'</div><div class="workPlaceList"><div class="message workPlace1 flip1" id="'+name+'">'+name+'</div><div style="height:89px"><div></div>');
				        				workPlaceNavWord.appendTo($("#workPlace"));
				        				}else{
				        				var workPlaceNavWord=$('<div class="r_title" id="workPlace_'+key+'">'+key+'</div><div class="workPlaceList"><div class="message workPlace1 flip1" id="'+name+'">'+name+'</div></div>');
				        				workPlaceNavWord.appendTo($("#workPlace"));
				        				};
				        			};
				        			if(hasReview){
				        				$("#workPlace").find('#' + name).trigger('click');
				        			}
			        			}
			        			$('#workPlaceReady').trigger('click');
			        		};
			        	};
			        };
			        calculateAverage();
			    },
			    complete : function(){
			    	$('#INTERVIEW_ITEM').children().eq(0).click();
			    }
            });
		};
		
		function calculateAverage(){
			var j1=$("#INTERVIEWNUM").attr("value");
			var average=0;
			for(var k=1;k<j1;k++){
			var scoreval="#score"+k;
		    var sliderval="#slider"+k;
		    var num= $(sliderval).val()+"分";
		    $(scoreval).text(num);
		    average=(average+($(sliderval).val()*1));
		    $("#average").text((average/(j1-1))+"分");
			}
		}
		
		function assembleINTERVIEW_ITEM($wrapper){
			var datas = [];
			$wrapper.children('.message').each(function(){
				var item = {};
				item.groupId = 'INTERVIEW_ITEM';
				item.infoId = $(this).attr('id');
				item.value = parseInt($(this).children('span').text());
				item.realValue = item.value;
				datas.push(item);
			});
			return datas;
		}
		function assembleADDITIONAL_INFO($wrapper){
			var datas = [];
			var areaValue = $wrapper.find('#selectWorkPlace').text();
			if(areaValue){
				areaValue = areaValue.substring(0, areaValue.length - 1);
				datas.push({
					groupId: 'ADDITIONAL_INFO',
					infoId: 'WORK_AREA',
					value: areaValue,
					realValue: areaValue
				});
			}
			var salaryValue = $wrapper.find('#salaryEXPECTED_SALARY').val();
				datas.push({
					groupId: 'ADDITIONAL_INFO',
					infoId: 'EXPECTED_SALARY',
					value: salaryValue,
					realValue: salaryValue
				});
			return datas;
		}
		function assembleINTERVIEW_DECISION($wrapper){
			var datas = [];
			var $dSelector = $wrapper.find('#selectWORK_DIRECTION');
			var dSelector = $dSelector.get(0);
			var dValue = $dSelector.val();
			var dRealValue = dSelector[dSelector.selectedIndex].text;
			if(dValue != '请选择'){
				datas.push({
					groupId: 'INTERVIEW_DECISION',
					infoId: 'WORK_DIRECTION',
					value: dValue,
					realValue: dRealValue
				});
			}
			var $pSelector = $wrapper.find('#selectWORK_POSITION');
			var pSelector = $pSelector.get(0);
			var pValue = $pSelector.val();
			var pRealValue = pSelector[pSelector.selectedIndex].text;
			if(pValue != '请选择'){
				datas.push({
					groupId: 'INTERVIEW_DECISION',
					infoId: 'WORK_POSITION',
					value: pValue,
					realValue: pRealValue
				});
			}
			
			var remark = $wrapper.find('#examRemark').val();
			datas.push({
					groupId: 'INTERVIEW_DECISION',
					infoId: 'COMMENTS',
					value: remark,
					realValue: remark
				});
			
			var interviewer = $wrapper.find('#interviewer').val();
			datas.push({
					groupId: 'INTERVIEW_DECISION',
					infoId: 'INTERVIEWER',
					value: interviewer,
					realValue: interviewer
				});
			return datas;
		}
		function assembleSKILL_BASE($wrapper){
			var datas = [];
			var $dSelector = $wrapper.find('.saveHiden');
			$dSelector.each(function(){
				var name = $(this).data('name');
				var dSelector = $(this).get(0);
				var dValue = $(this).val();
				var dRealValue = dSelector[dSelector.selectedIndex].text;
				if(dValue != '请选择'){
					datas.push({
						groupId: 'SKILL_BASE',
						infoId: name,
						value: dValue,
						realValue: dRealValue
					});
				}
			})
			
			return datas;
		}
		
		function employerInfo(){
			$.ajax({
				url:root+"/sets/wx/schoolReport/getEmployerInfo",
				type:"post",
				contentType:"application/json",
				dataType:"json",
				success:function(result){
					employerName = result.data.employerName;
					saveEmployer(employerName);
				}
			})
		}
		
		function saveEmployer(name){
			localStorage.employerName = name;
		}
			

		$(document).ready(function() {
				var localtion = window.location.href;
				if(!localStorage.employerName){
					employerInfo();
				}
		      var div1=$('<div class="r_title">试卷信息<span id="paperSorce" style="float: right;color:#00a8ff">总成绩:'+testPaperScore+'分</span></div><div class="skillList"></div>');
	            $('#TEST_INFORMATION').append(div1);
				var act = "${param.act}";
				var job = "${param.job}";
				var openId = "${param.openId}";
				var positionId = "${param.postionId}";
			if(act){
				$('.breakNav').click(function(){
	            	location.replace(root+"sets/wx/examReport?act="+act+"&&job="+job+"&&openId="+openId);
	         	});
			}else if(positionId){
				$('.breakNav').click(function(){
	            	location.replace(root+"sets/wx/examReport?positionId="+positionId+"&&job="+job+"&&openId="+openId);
	         	});
			}else if(all){
				$('.breakNav').click(function(){
	            	location.replace(root+"sets/wx/examReport?job="+job+"&&openId="+openId+"&type=2&userId="+userId+"&all=-1");
	         	});
			}
			else{
				$('#BREAK > div').text('测评报告');
			}	            
	            
			$('.answer_are').on('click', '.flip', function() {
			var a1=$(this).attr("id");
			if(testName==a1){
			var a2="#"+a1+"div";
			$(a2).toggle();
			}else{
			var a3="#"+testName+"div";
			$(a3).hide();
			var a2="#"+a1+"div";
			$(a2).toggle();
			};
			testName=a1;
			});
			var selectedState=[];
			$(document).on('click','#WORK_AREAparentDiv',function(e){
				window.location.href=localtion+"#top";
				$('.answer2').each(function(){
					//获取已选择城市
					selectedState.push($('.answer2').text());
				});
			});
			
			$(document).on('click', '#WORK_AREAparentDiv', function() {
				$("#WORKPLACE").show();
				$("#INTERVIEW_MAIN").hide();
			});
			$('.testResult').on('click', '.unchecked', function() {
				$(".checked").attr("class","unchecked");
				$(this).attr("class","checked");
			});
			
			$(document).on('click', '#workPlaceReady', function() {
				$("#WORKPLACE").hide();
				$("#INTERVIEW_MAIN").show();
				$("#selectWorkPlace").show();
				$("#selectWorkPlace").html('<span id="selectedPlace">'+$("#selectedLabel").text()+'</span>');
			});
			$(document).on('click', '#breakList', function() {
				$("#WORKPLACE").hide();
				$("#INTERVIEW_MAIN").show();
				//将已选城市恢复到操作之前的状态
				$('.answer2').attr("class","message workPlace1 flip1");
					$('#selectedLabel span').remove();
				for(var r=0;r<selectedState.length;r++){
					var selectedState1="#"+selectedState[r];
					$(selectedState1).attr("class","answer2 workPlace1");
					var selectedplace2=$('<span class="'+selectedState[r]+'">'+selectedState[r]+'、</span>');
					$('#selectedLabel').append(selectedplace2);
					
				};
			});
			
			$(document).on('click', '.workPlace1', function() {
				var $this = $(this);
				if($(this).attr("class")!="answer2 workPlace1"){
				$(this).attr("class","answer2 workPlace1");
				var selectedplace1=$('<span class="'+$this.text()+'">'+$this.text()+'、</span>');
				selectedplace1.appendTo($("#selectedLabel"));
				}else{
				$(this).attr("class","message workPlace1 flip1");
				var spanPlace="."+$this.text();
				$(spanPlace).remove();
				};
			});
				
			$('#INTERVIEW_MAIN').on('change', 'input[type="range"]', function(){
				calculateAverage();
			});
		   
			$(document).on('click', '#save', function(){
				var $btn = $(this);
				var reqData = [];
				$('#INTERVIEW_MAIN').children('.list').each(function(){
					var $this = $(this);
					switch($this.attr('id')){
					case 'INTERVIEW_ITEM':
						reqData = reqData.concat(assembleINTERVIEW_ITEM($this));
						break;
					case 'SKILL_BASE':
					    reqData = reqData.concat(assembleSKILL_BASE($this));
					    break;
					case 'ADDITIONAL_INFO':
						reqData = reqData.concat(assembleADDITIONAL_INFO($this));
						break;
					case 'INTERVIEW_DECISION':
						reqData = reqData.concat(assembleINTERVIEW_DECISION($this));
						break;
					}
				});
				var success = false;
				$.ajax({
					url : root + 'sets/wx/schoolReport/saveInterview/' + testId,
					type : 'post',
					data : JSON.stringify(reqData),
					contentType : 'application/json',
					dataType: 'json',
					beforeSend : function() {
						$btn.attr('disabled', 'disabled').text("信息提交中...");						
					},
					success : function(data) {
						if (data.code == 0) {
							var name = $('#interviewer').val();
							saveEmployer(name);
							if (data.data && data.data.errorCode == 0) {
								success = true;
							}
						}
					},
					error : function(e) {
					},
					complete : function() {
						if(!success){
							$btn.text('提交失败');	
							setTimeout(function(){
								$btn.removeAttr('disabled').text('提交信息');
							}, 2000);
						}else{
							updateTestResult($btn);
						}
					}
				
				});
			});
			
			getCandidateInfo();
			getSkillScore();            
            getInterview();
			getTestResult();
		});
	
</script>