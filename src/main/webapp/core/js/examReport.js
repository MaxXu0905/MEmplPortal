$(function() {
	"use strict";

	/** 事件绑定:分成两个方法是为了方便查找 */
	function bindReportEvent() {
		var backUrl = "";
		if(positionId){
			if(list){
				backUrl = 'testList';
			}else{
				backUrl = 'societyTest?type=1';
			}
		}else if(ACT){
			if(list){
				backUrl = 'actitylist?positionId=' +  openId+"&type=2&list=0";
			}else{
				backUrl = 'actitylist?positionId=' +  openId+"&type=2";
			}
		}else if(all){
			backUrl = 'actitylist?positionId=' +  userId+"&type=2";
		}/*if(hideType==2){
			backUrl = 'societyTest?hideType=1';
		}else if(hideType==3){
			backUrl = 'actitylist?positionId=' +  userId+"&type=2&hideType=3";
		}*/
		$actionBar.on('click', '.img-btn', function() {
			switch ($(this).data('action')) {
			case 'back':
				location.replace(backUrl);
				break;
			case 'search':
				showSearch();
				break;
			case 'refresh':
				$newReportTag.hide().text(0);
				refreshSearchReq(true);
				getReport(true, $(this));
				getNewReportCount(true, true);
				break;
			}
		});
		$actionBar.on('click','.backStep',function(){
			location.replace(backUrl);
		})

		$reportList.on('click', '.load-more-btn', function() { // 加载更多
			getReport();
		}).on(
				'click',
				'.report-item>.clicker',
				function() { // 查看详情
					var data = $(this).parent('.report-item').data('report');
					var testId = data.testId;
					var score = data.getScore;
					if(ACT){
						location.href = 'personReport?testId=' + testId + '&act=' + ACT + '&job='
						+ ($filterPosition.children('.btn-info').val() || '') + '&score=' + score+'&&openId='+openId;
					}else if(positionId){
						location.href = 'personReport?testId=' + testId + '&postionId=' +positionId + '&job='
						+ ($filterPosition.children('.btn-info').val() || '') + '&score=' + score+'&&openId='+openId;
					}else if(all){
						location.href = 'personReport?testId=' + testId + '&userId='+userId+'&job='
						+ ($filterPosition.children('.btn-info').val() || '') + '&score=' + score+'&&openId='+openId+"&all=-1";
					}
				});

		$(window).on('resize', function() {
			var refWidth = $(this).width();
			var refHeight = $(this).height();
			$reportList.height(refHeight - meta.actionBarHeight - 35);
			if (_searchWrapperVisible) {
				$searchWrapper.height(refHeight);
				$searchFilter.height(refHeight - 106);
				$searchInput.width(refWidth - 60);
				$filterStatus.children('.status-item').width((refWidth - 44) / 2);
				$filterPosition.children('.position-item').width(refWidth - 34);
			}
		});
		$('#menu').click(function(){
			$('#list-menu').toggleClass("show");
		});
	}
	/** 事件绑定 */
	function bindSearchEvent() {
		$sActionBar.on('click', '.btn', function() {
			switch ($(this).data('action')) {
			case 'back':
				hideSearch();
				break;
			case 'confirm':
				commitSearch();
				break;
			}
		})

		$filterStatus.on('click', '.status-item', function() {
			$filterStatus.children('.status-item').removeClass('btn-info').addClass('btn-default');
			$(this).addClass('btn-info');
		});
		$filterPosition.on('click', '.position-item', function() {
			$filterPosition.children('.position-item').removeClass('btn-info').addClass('btn-default');
			$(this).addClass('btn-info');
		});
		if(type){
			$('#menu').hide();
		}
	}
	function enterClick(){
		$(document).keydown(function(event){
			if(event.keyCode==13){
				commitSearch();
			}
		})
		
	}

	/** 确定搜索 */
	function commitSearch() {
		// 获取搜索内容
		refreshSearchReq();
		getReport(true, null, '按条件查询');
		hideSearch();
		// clear search input
		$searchInput.val('');
		getNewReportCount(true);
	}

	/** 获取搜索条件 */
	function refreshSearchReq(noFilter) {
		if (noFilter) {
			if(ACT){
				 reportReqData = { // 请求报告
						activityId : ACT,
						intentPos : '',
						searchTxt : '',
						testResult : 0,
						page : {
							requestPage : 1,
							pageSize : 30
						}
				};
			}else if(positionId){
				 reportReqData = { // 请求报告
						positionId : positionId,
						intentPos : '',
						searchTxt : '',
						testResult : 0,
						page : {
							requestPage : 1,
							pageSize : 30
						}
				};
			}else if(all){
				 reportReqData = { // 请求报告
						positionId :userId,
						intentPos : '',
						searchTxt : '',
						testResult : 0,
						page : {
							requestPage : 1,
							pageSize : 30
						}
				};
			}else if(posId){
				reportReqData = { // 请求报告
						positionId :posId,
						intentPos : '',
						searchTxt : '',
						testResult : 0,
						page : {
							requestPage : 1,
							pageSize : 30
						}
				};
			}
			return;
		}
		var searchTxt = $searchInput.val();
		var testResult = $filterStatus.children('.btn-info').val() || 0;
		var intentPos = $filterPosition.children('.btn-info').val() || '';
		if(ACT){
			 reportReqData = { // 请求报告
					activityId : ACT,
					intentPos : intentPos,
					searchTxt : searchTxt,
					testResult : testResult,
					page : {
						requestPage : 1,
						pageSize : 30
					}
			};
		}else if(positionId){
			 reportReqData = { // 请求报告
					positionId : positionId,
					intentPos : intentPos,
					searchTxt : searchTxt,
					testResult : testResult,
					page : {
						requestPage : 1,
						pageSize : 30
					}
			};
		}else if(all){
			 reportReqData = { // 请求报告
					positionId :userId,
					intentPos : intentPos,
					searchTxt : searchTxt,
					testResult : testResult,
					page : {
						requestPage : 1,
						pageSize : 30
					}
			};
		}else if(posId){
			reportReqData = { // 请求报告
					positionId :posId,
					intentPos : intentPos,
					searchTxt : searchTxt,
					testResult : testResult,
					page : {
						requestPage : 1,
						pageSize : 30
					}
			};
		}
	};

	/** 显示搜索区域 */
	function showSearch() {
		if (_searchWrapperVisible) {
			return;
		}
		_searchWrapperVisible = true;
		getPositionList();

		$(window).trigger('resize');
		var refHeight = $(window).height();
		$searchWrapper.css({
			height : refHeight
		});
		$searchWrapper.find('input').show();
		$searchWrapper.show().addClass('pt-page-moveFromBottom').on(_animEndEventName, function() {
			$searchWrapper.off(_animEndEventName);
			$searchWrapper.removeClass('pt-page-moveFromBottom');
		});

	}
	/** 隐藏搜索区域 */
	function hideSearch() {
		if (!_searchWrapperVisible) {
			return;
		}
		_searchWrapperVisible = false;
		$searchWrapper.addClass('pt-page-moveToBottom').on(_animEndEventName, function() {
			$searchWrapper.off(_animEndEventName);
			$searchWrapper.removeClass('pt-page-moveToBottom');
			$searchWrapper.find('input').hide();
			$searchWrapper.hide();
		});
	}

	/** 显示消息 */
	function showInfo(info) {
		clearTimeout(_alertTimeoutId);
		_alertTimeoutId = setTimeout(function() {
			var top = $alert.css('top');
			top = top.substring(0, top.length - 2) * 1;
			if (top < 0) {
				top = top + 3;
				$alert.css('top', top);
				showInfo(info);
			} else {
				$alert.text(info);
			}
		}, 10);
	}

	/** hide消息 */
	function hideInfo(stopVal) {
		clearTimeout(_alertTimeoutId);
		_alertTimeoutId = setTimeout(function() {
			var top = $alert.css('top');
			top = top.substring(0, top.length - 2) * 1;
			if (top > stopVal) {
				top = top - 3;
				$alert.css('top', top);
				hideInfo(stopVal);
			} else {
				$alert.css('top', stopVal);
			}
		}, 10);
	}

	/** 固定布局 */
	function initLayout() {
		$filterStatus.children('.status-item').each(function(index) {
			if (index > 1) {
				$(this).css({
					marginTop : '0'
				})
			}
			if (index == 1 || index == 3) {
				$(this).css({
					marginLeft : '8px'
				})
			}
		});
		$(window).trigger('resize');
	}

	/** 加载页面 */
	function init() {
		bindReportEvent();
		enterClick();
		bindSearchEvent();
		initLayout();
		getReport(true);
		getTestStatus();

		/** 启动新消息提醒定时器 */
		setInterval(function() {
			getNewReportCount();
		}, 30000);
	}

	/** 获取报告数量 */
	function getNewReportCount(beTriggered, fresh) {
		var reqData = {
			activityId : ACT,
			intentPos : fresh ? '' : ($filterPosition.children('.btn-info').val() || '')
		}
		if (beTriggered) {
			// 如果是由于用户点击刷新或者搜索触发,那么先判断职位是否发生了变化,只有发生变化的情况才会去获取消息数
			if (reqData.intentPos == msgCount.preIntentPos) {
				return;
			}
		}
		$.ajax({
			url : 'schoolReport/getReportCount',
			type : 'post',
			contentType : 'application/json',
			data : JSON.stringify(reqData),
			dataType : 'json',
			success : function(result) {
				if (result.code == 0) {
					if (reqData.intentPos != msgCount.preIntentPos) {
						// 职位切换，需要重置
						msgCount.preIntentPos = reqData.intentPos;
						msgCount.init = true;
						msgCount.preCount = result.data;
					}
					msgCount.nowCount = result.data;

					if (!msgCount.init) {
						msgCount.newCount = msgCount.nowCount - msgCount.preCount;
						if (msgCount.newCount > 0) {
							var num = ($newReportTag.text() || 0) * 1
							num += msgCount.newCount
							$newReportTag.show().text(num);
						}
					} else {
						msgCount.init = false;
					}

					// last:
					msgCount.newCount = 0;
					msgCount.preCount = msgCount.nowCount;
				}
			}
		});
	}

	/** 获取报告列表项 */
	function getReportItem(data, rank) {
		var items = [];
		items.push('<li class="list-view-item report-item">');
		items.push('<span class="rank">')
		items.push(rank);
		items.push('</span><div class="name"><a style="display:inline-block;width:50%;text-decoration:none" href="tel:');
		items.push(data.candidatePhone);
		items.push('">');
		items.push(data.candidateName);
		items.push(' <img src="' + ROOT
				+ '/core/images/icon_green_nav_phone_48.png" style="width:14px;height:14px;"></a></div>');
		items.push('<span class="score clicker">');
		items.push(data.getScore);
		items.push('</span><span class="detail clicker">');
		items.push('<a><img src="' + ROOT
				+ '/core/images/icon_blue_nav_right_48.png" style="width:16px;height:16px;"></a>');
		items.push('</span>');
		items.push('</li>');
		var $ele = $(items.join(''));
		$ele.data('report', data);
		return $ele;
	}

	/** 展现报告列表 */
	function renderListReports(datas, refresh) {
		if (refresh) {
			$reportList.empty();
			maxRank = 1;
		} else {
			$reportList.children('.load-more').remove();
		}
		var items = [];
		for ( var i = 0; i < datas.length; i++) {
			var $item = getReportItem(datas[i], maxRank++);
			$reportList.append($item);
		}
		var morebtn = [];
		morebtn.push('<li class="list-view-item load-more">');
		morebtn.push('<div class="btn btn-info load-more-btn">点击加载更多</div>');
		morebtn.push('</li>');
		$reportList.append(morebtn.join(''));
	}

	/** 获取职位列表项 */
	function getPositionItem(data) {
		var items = [];
		items.push('<li class="btn btn-default position-item" value="');
		items.push(data.id.codeId);
		items.push('">');
		items.push(data.codeName);
		items.push('（共');
		items.push(data.count);
		items.push('人）</li>');
		var $ele = $(items.join(''));
		$ele.data('position', data);
		return $ele;
	}

	/** 展现职位列表 */
	function renderListPosition(datas) {
		if (datas.length < 1) {
			return;
		}
		$filterPosition.empty();
		var items = [];
		for ( var i = 0; i < datas.length; i++) {
			var $item = getPositionItem(datas[i]);
			$filterPosition.append($item);
		}
		$(window).trigger('resize');
	}

	/** 获取职位列表 */
	function getPositionList() {
		var success = false;
		var posActId = "";
		var selType = "";
		if(ACT){
			posActId = ACT;
			selType = 2;
		}else if(positionId){
			posActId = positionId;
			selType = 1;
		}else if(posId){
			posActId = posId;
			selType = 1;
		}else if(all){
			posActId = userId;
			selType = 1;
		}
		$.ajax({
			url : ROOT+'/sets/wx/schoolPosition/getPosIntention/' + posActId+'/'+selType,
			type : 'post',
			dataType : 'json',
			contentType : 'application/json',
			success : function(result) {
				if (result.code == 0) {
					if(result.data){
						$('.title').show();
						$('.filter-position').show();
						success = true;
						renderListPosition(result.data || []);
					}
				}
			},
			complete : function() {
			}
		});
	}
     
	/**更新状态*/
	
	function getTestStatus (){
		var reportUrl = "";
		if(ACT){
			reportUrl = ROOT+"/sets/wx/schoolReport/getSchoolReportStatusCount/"+ACT+"/2"
		}else if(positionId){
			reportUrl = ROOT+"/sets/wx/schoolReport/getSchoolReportStatusCount/"+positionId+"/1"
		}else if(all){
			reportUrl = ROOT+"/sets/wx/schoolReport/getSchoolReportStatusCount/"+userId+"/1"
		}else if(posId){
			reportUrl = ROOT+"/sets/wx/schoolReport/getSchoolReportStatusCount/"+posId+"/1"
		}
		$.ajax({
			url:reportUrl,
			type:'post',
			dataType :　'json',
			contentType : 'application/json',
			success : function(result){
				var length = result.data.length;
				for(var i=0;i<length;i++)
					{
						var datas = result.data[i];
						var testResult = result.data[i].testResult;
						switch(testResult){
							case 0 :
									   $('#wait').text("待处理（"+datas.count+"人）")
									break;
							case 1 :
										$('#willhired').text("拟录用（"+datas.count+"人）");
									break;
							case 2 :
									 	$('#nohired').text("拟不录用（"+datas.count+"人）");
								 	break;
							case 3 : 
									 	$('#retest').text("进入复试（"+datas.count+"人）")
								 	break;
						}
					}
				
			}
		})
	}
	
	/** 获取最新的报告 */
	function getReport(refresh, $triggerBtn, info) {
		if (refresh) {
			reportReqData.page.requestPage = 1;
		}
		var success = false;
		var hasMore = true
		$.ajax({
			url : ROOT+'/sets/wx/schoolReport/getReport',
			type : 'post',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(reportReqData),
			beforeSend : function() {
				if (refresh) {
					showInfo((info ? info : '报告列表刷新') + '中...');
					if ($triggerBtn) {
						$triggerBtn.attr('disabled', 'disabled');
					}
				} else {
					getLoadMoreBtn().attr('disabled', 'disabled').text('正在加载中...');
				}
			},
			success : function(result) {
				if (result.code == 0) {
					success = true;
					var datas = result.data || [];
					if (datas.length < reportReqData.page.pageSize) {
						hasMore = false;
					}
					renderListReports(result.data || [], refresh);
				}
			},
			complete : function() {
				if (refresh) {
					showInfo((info ? info : '报告列表刷新') + '完成');
					setTimeout(function() {
						hideInfo(-meta.alertHeight);
						if ($triggerBtn) {
							$triggerBtn.removeAttr('disabled');
						}
					}, 1000);
				}
				if (success) {
					reportReqData.page.requestPage++;
				}
				var $loadMoreBtn = getLoadMoreBtn();
				if ($loadMoreBtn) {
					if (hasMore) {
						$loadMoreBtn.text('点击加载更多');
					} else {
						$loadMoreBtn.attr('disabled', 'disabled').text('已加载全部数据');
					}
				}
			}
		});
	}

	/** 加载更多按钮 */ 
	function getLoadMoreBtn() {
		return $reportList.children('.load-more').children('.load-more-btn');
	}

	/** 获取动画停止事件名称 */
	function getAnimateEndEventName() {
		var el = document.createElement('wx')
		var transEndEventNames = {
			'WebkitAnimation' : 'webkitAnimationEnd',
			'OAnimation' : 'oAnimationEnd',
			'msAnimation' : 'MSAnimationEnd',
			'animation' : 'animationend'
		};
		for ( var name in transEndEventNames) {
			if (el.style[name] !== undefined) {
				return transEndEventNames[name];
			}
		}
	}

	var $actionBar = $('.report-action-bar'); // 导航栏
	var $navBack = $actionBar.find('.nav-back'); // 返回按钮
	var $navSearch = $actionBar.find('.nav-search'); // 搜索按钮
	var $navRefresh = $actionBar.find('.nav-refresh'); // 刷新按钮
	var $newReportTag = $actionBar.find('.new-report-tag'); // 新消息提醒
	var $reportListWrapper = $('.report-list'); // 
	var $reportList = $reportListWrapper.find('.list-body'); // 报告列表
	var $alert = $reportListWrapper.find('.list-header>.list-alert');

	var $searchWrapper = $('.search-wrapper');
	var $sActionBar = $searchWrapper.children('.search-action-bar');
	var $searchInput = $searchWrapper.find('.search-input'); // 输入搜索
	var $searchFilter = $searchWrapper.find('.search-filter'); // 筛选
	var $filterStatus = $searchWrapper.find('.filter-status'); // 状态筛选
	var $filterPosition = $searchWrapper.find('.filter-position'); // 职位筛选

	var _alertTimeoutId;
	var _searchWrapperVisible = false;
	var _animEndEventName = getAnimateEndEventName() || 'webkitAnimationEnd';

	var job = '';
	var maxRank = 1;
	var meta = { // 元数据
		actionBarHeight : 48,
		alertHeight : 36
	};
	var reportReqData;
	if(ACT){
		 reportReqData = { // 请求报告
				activityId : ACT,
				intentPos : '',
				searchTxt : '',
				testResult : 0,
				page : {
					requestPage : 1,
					pageSize : 30
				}
		};
	}else if(positionId){
		 reportReqData = { // 请求报告
				positionId : positionId,
				intentPos : '',
				searchTxt : '',
				testResult : 0,
				page : {
					requestPage : 1,
					pageSize : 30
				}
		};
	}else if(all){
		 reportReqData = { // 请求报告
				positionId :userId,
				intentPos : '',
				searchTxt : '',
				testResult : 0,
				page : {
					requestPage : 1,
					pageSize : 30
				}
		};
	}else if(posId){
		reportReqData = { // 请求报告
				positionId :posId,
				intentPos : '',
				searchTxt : '',
				testResult : 0,
				page : {
					requestPage : 1,
					pageSize : 30
				}
		};
	}

	var msgCount = { // 报告数
		init : true,
		preIntentPos : '',
		preCount : 0,
		newCount : 0,
		nowCount : 0
	}

	init();
    
    
    
});
