package com.ailk.sets.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ailk.sets.common.Constant;
import com.ailk.sets.common.SysBaseResponse;
import com.ailk.sets.platform.intf.cand.domain.Employer;
import com.ailk.sets.platform.intf.empl.service.ILogin;
import com.ailk.sets.platform.intf.wx.service.IWeixinService;

public class SchoolSessionInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(SchoolSessionInterceptor.class);
	
	@Autowired
	private ILogin login;
    
    @Autowired
    @Qualifier("iWeixinService")
    private IWeixinService iWeixinService;
    
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String type = request.getHeader(Constant.X_REQUEST_TYPE);

		Object employerId = session.getAttribute(Constant.EMPLOYERID);
		String openId = request.getParameter("openId");
        String emplId = request.getParameter("employerId");
        
		if (employerId == null) {
			
			if(StringUtils.isNotEmpty(openId) && StringUtils.isNotEmpty(emplId)){
				logger.debug("the openId is {} , emplId {} ", openId,emplId);
				Employer employer = login.getEmployerByOpenId(openId,Integer.valueOf(emplId));
				if(employer != null){
					logger.debug("the empoyer not be null ,so login for employerId {} ", employer.getEmployerId());
					request.getSession().setAttribute(Constant.EMPLOYERID, employer.getEmployerId());
					request.getSession().setAttribute(Constant.EMPLOYERNAME, employer.getEmployerAcct());
					return super.preHandle(request, response, handler);
				}
			}
			if (StringUtils.isNotEmpty(type) && type.equals(Constant.X_REQUEST_VALUE)) {
				logger.debug("this is a school ajax session ");
				// 这是一个 ajax 请求
				JSONObject jo = new JSONObject();
				jo.put("code", SysBaseResponse.ETIME);
				response.getWriter().write(jo.toString());
				return false;
			} else {
				logger.debug("this is a school request session ");
				// 这是其他请求
				StringBuffer url = request.getRequestURL();
				session.setAttribute(Constant.REQUEST_URL, url);
				response.sendRedirect(request.getContextPath() + "/sets/wx/wxLogin/" + openId);
				return false;
			}
		}

		return super.preHandle(request, response, handler);
	}
}
