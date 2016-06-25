package com.ailk.sets.weixin.message.resp;

public class ProcessResult {
	public static final String MSG_TYPE = "msg";
	public static final String CLICK_TYPE= "click";
	private String type;
	private String url;
	private String context;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
}
