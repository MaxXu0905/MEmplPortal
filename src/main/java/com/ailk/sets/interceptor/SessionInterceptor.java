package com.ailk.sets.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ailk.sets.common.Constant;
import com.ailk.sets.common.SysBaseResponse;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String type = request.getHeader(Constant.X_REQUEST_TYPE);

		Object employerId = session.getAttribute(Constant.EMPLOYERID);
		if (employerId == null) {
			if (StringUtils.isNotEmpty(type) && type.equals(Constant.X_REQUEST_VALUE)) {
				logger.debug("this is a ajax session ");
				// 这是一个 ajax 请求
				JSONObject jo = new JSONObject();
				jo.put("code", SysBaseResponse.ETIME);
				response.getWriter().write(jo.toString());
				return false;
			} else {
				logger.debug("this is a request session ");
				// 这是其他请求
				StringBuffer url = request.getRequestURL();
				request.setAttribute(Constant.REQUEST_URL, url);
				RequestDispatcher rd = request.getRequestDispatcher("/sets/page/index.jsp");
				rd.forward(request, response);
				return false;
			}
		}

		return super.preHandle(request, response, handler);
	}
}
