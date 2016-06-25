package com.ailk.sets.weixin.message.service;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ailk.sets.platform.intf.cand.service.ISchoolInfoService;
import com.ailk.sets.weixin.message.resp.ProcessResult;
import com.ailk.sets.weixin.message.resp.TextMessage;
import com.ailk.sets.weixin.util.MessageUtil;

public class CoreService {
	private static Logger logger = LoggerFactory.getLogger(CoreService.class);
	/**
	 * 核心服务类
	 * 
	 * 处理微信发来的请求
	 * **/
	public static ProcessResult processRequest(HttpServletRequest request, ISchoolInfoService schoolInfoService) {
		ProcessResult result = new ProcessResult();
		result.setType(ProcessResult.MSG_TYPE);
		// XML格式的消息数据
		String respMessage = null;
		try {
			// 默认回复文本消息
			String respContent = "请求处理异常，请稍候尝试！";
			// 调用parseXml方法来解析请求信息
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			// 发送方帐号（open_id）
			String fromUserName = requestMap.get("FromUserName");
			// 公众帐号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);
  
			logger.debug("the msgType is {} ", msgType);
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				respContent = "感谢您关注百一测评系统。我们致力于为您减轻招聘压力，简化招聘流程，精准寻找人才，为您百里挑一！";
			}
			// 事件类型 订阅事件
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				String eventType = requestMap.get("Event");
				logger.debug("the eventType is {} ", eventType);
				// 已经订阅返回提示语
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					respContent = "感谢您关注百一测评系统。我们致力于为您减轻招聘压力，简化招聘流程，精准寻找人才，为您百里挑一！";
				}else if(eventType.equalsIgnoreCase(MessageUtil.EVENT_TYPE_CLICK)){
					result.setType(ProcessResult.CLICK_TYPE);
					String eventKey = requestMap.get("EventKey");
					logger.debug("the eventKey is {} ", eventKey);
                    if(eventKey.equals("goLogin")){					
//                    	String url = "wx/wxLogin/" + fromUserName;
                    	String baseUrl = schoolInfoService.getServiceBaseUrl();
    		        	String url = baseUrl + request.getContextPath() + "/sets/" + "wx/wxLogin/" + fromUserName;
    		        	result.setUrl(url);
    	           	    respContent = " <a href=\"" +url+"#wechat_webview_type=1"+"\">点击进入百一测评</a>";
                    }
				}
			}
			textMessage.setContent(respContent);
			respMessage = MessageUtil.MessageToXml(textMessage);
			result.setContext(respMessage);
		} catch (Exception e) {
            logger.error("error process weixin ",e);
		}
		return result;
	}
}
