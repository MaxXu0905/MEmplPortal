$(document).ready(function(){
	var loc = window.location.href.split("wx/")[1];
	if(loc.indexOf(home)!=-1||loc.indexOf("wxLogin")!=-1){
		$('#back').hide();
		$('#backto').hide();
		$('.backStep').hide();
	}else{$('#menu').hide();}
	if(loc.indexOf("Demo")!=-1){
		$('#back').hide();
		$('#backto').hide();
		$('.backStep').hide();
		$('#menu').hide();
	}
	if(employer_name=="demo@101test.com"){
		$('#menu').hide();
	}
	if(loc.indexOf("ByMenu")!=-1){
		$('#back').hide();
		$('#backto').hide();
		$('.backStep').hide();
		$('#menu').show();
	}
	$('#list-menu').on('click','#logout',function(){
		$('#list-menu').removeClass("show");
		if(!window.confirm("帐号解绑后，微信将会收不到百一推送的报告消息，确定解绑吗？"))
		{
			return false;
		}
		else{
			$.ajax({ 
				url:root+"sets/wx/clearSession",
				type:"post",
				dataType:"json",
				contentType:"application/json",
				success:function(result){
					location.replace(root + "sets/wx/wxLogin/"+userOpenId);
				}
			
			})
		}; 
	});
	
});	
