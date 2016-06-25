package com.ailk.sets.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ailk.sets.common.Constant;
import com.ailk.sets.controller.SchoolIndexController;
import com.ailk.sets.platform.intf.cand.domain.Employer;
import com.ailk.sets.platform.intf.cand.service.ISchoolInfoService;
import com.ailk.sets.platform.intf.empl.domain.PositionTestTypeInfo;
import com.ailk.sets.platform.intf.empl.service.ILogin;
import com.ailk.sets.platform.intf.empl.service.IPosition;

public class SchoolLoginInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(SchoolLoginInterceptor.class);
	@Autowired
	private ILogin loginImpl;
	
	@Autowired
	private IPosition positionImpl;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		Integer employerId = (Integer)session.getAttribute(Constant.EMPLOYERID);
		if(employerId != null)
		{
			Employer employer = loginImpl.getEmployerByEmployerId(employerId);
			if(employer.getEmployerAcct().equals("demo@101test.com")){//按demo登陆后如果点击正式登陆,需要让进入到首页
				return super.preHandle(request, response, handler);
			}
			String url = request.getRequestURL().toString();
			String openId = url.substring(url.lastIndexOf("/") + 1, url.length());
			request.setAttribute("openId", openId);
			request.getSession().setAttribute("userOpenId", openId);//前台要求 加入session中 userOpenId
			logger.debug("direct login for index of employerId {}, openId {} " , employerId, openId);

			List<PositionTestTypeInfo> positionTestTypeInfos = positionImpl.getPositionTestTypeInfo(employerId);
			String to = SchoolIndexController.goPageForFirst(positionTestTypeInfos,employerId,request);
			to = to.replace("weixinapp/", "");
			request.getRequestDispatcher("/sets/wx/" + to).forward(request, response);
//			response.sendRedirect(request.getContextPath() + "/sets/wx/actitylist?openId=" + openId);//带上openId,否则刷新登陆页面再解绑后404
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}
