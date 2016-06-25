package com.ailk.sets.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.PropertyUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ailk.sets.common.Constant;
import com.ailk.sets.common.EPResponse;
import com.ailk.sets.common.SetsUtils;
import com.ailk.sets.common.SysBaseResponse;
import com.ailk.sets.model.LoginInfoNeedCode;
import com.ailk.sets.model.LoginParam;
import com.ailk.sets.model.NeedValidateCode;
import com.ailk.sets.platform.intf.cand.domain.Employer;
import com.ailk.sets.platform.intf.cand.service.ISchoolInfoService;
import com.ailk.sets.platform.intf.common.FuncBaseResponse;
import com.ailk.sets.platform.intf.domain.Company;
import com.ailk.sets.platform.intf.empl.domain.PositionTestTypeInfo;
import com.ailk.sets.platform.intf.empl.service.ILogin;
import com.ailk.sets.platform.intf.empl.service.IPosition;
import com.ailk.sets.platform.intf.exception.PFServiceException;
import com.ailk.sets.platform.intf.model.employer.LoginInfo;
import com.ailk.sets.platform.intf.model.employer.RegisterInfo;
import com.ailk.sets.utils.RandomValidateCode;
import com.alibaba.dubbo.common.utils.StringUtils;

/**
 * 招聘人登录控制器
 * 
 * @author 毕希研
 * 
 */
@Controller
@RequestMapping("wx/login")
public class SchoolLoginController {
	private static Logger logger = LoggerFactory.getLogger(SchoolLoginController.class);
	@Autowired
	@Qualifier("loginServ")
	private ILogin loginServ;
	
	
	@Autowired
	private ISchoolInfoService schoolInfoService;
	@Autowired
	private IPosition positionImpl;

	/**
	 * 登录验证
	 * 
	 * @param param
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/certify", method = RequestMethod.POST)
	public @ResponseBody
	EPResponse<LoginInfoNeedCode> login(@RequestBody LoginParam param, HttpSession session,HttpServletRequest request) throws IOException {
		EPResponse<LoginInfoNeedCode> epResponse = new EPResponse<LoginInfoNeedCode>();
		Integer errorNum = (Integer)session.getAttribute(Constant.SESSION_LOGIN_ERROR_NUM);
		if(errorNum == null){
			errorNum = 0;
		}
		try {
			LoginInfoNeedCode li = new LoginInfoNeedCode();
			li.setNeedCode(0);//是否需要验证码
			if(errorNum >= Constant.MAX_NUM_FOR_CODE){
				li.setNeedCode(1);
				if(StringUtils.isEmpty(param.getCertifycode())){
					logger.error("need certifycode but not found, the errorNum is {}", errorNum);
					epResponse.setCode(SysBaseResponse.SUCCESS);
					epResponse.setData(li);
					return epResponse;
				}
			}
			
			if(!StringUtils.isEmpty(param.getCertifycode())){//只要有验证码就要验证
				String certifycode = param.getCertifycode();
				String certigycodeR = (String) session.getAttribute(RandomValidateCode.RANDOMCODEKEY);
				if (!certigycodeR.equalsIgnoreCase(certifycode)) {
					li.setCode(FuncBaseResponse.CERTIFYCODEERR);
					epResponse.setCode(SysBaseResponse.SUCCESS);
					epResponse.setData(li);
					return epResponse;
				}
			}
			
			LoginInfo result = loginServ.certify(param.getUsername(), param.getPassword());
			if (FuncBaseResponse.SUCCESS.equals(result.getCode())) {
				if(StringUtils.isNotEmpty(param.getOpenId()) && !param.getOpenId().equals(result.getEmployer().getOpenId())){
					logger.debug("update openId for {} to {} ",result.getEmployer().getEmployerId(),param.getOpenId());
					loginServ.updateOpenId(result.getEmployer().getEmployerId(), param.getOpenId());
				}
				logger.debug("logger watcher3,{},{},"+System.currentTimeMillis()+"," + SetsUtils.getIpAddr(request),result.getEmployer().getEmployerId(),session.getId());
				session.setAttribute(Constant.EMPLOYERID, result.getEmployer().getEmployerId());
				session.setAttribute(Constant.EMPLOYERNAME, result.getEmployer().getEmployerAcct());
				Integer companyId = result.getEmployer().getCompanyId();
				if(companyId != null){
					Company company =  schoolInfoService.getCompanyById(companyId);
					if(company != null){
						session.setAttribute(Constant.COMPANYNAME, company.getCompanyName());
					}
				}
				session.removeAttribute(Constant.SESSION_LOGIN_ERROR_NUM);//成功后删除错误次数
				Employer em = new Employer();
				em.setTicket(result.getEmployer().getTicket());
				result.setEmployer(em);
			}else{
				errorNum++;
				session.setAttribute(Constant.SESSION_LOGIN_ERROR_NUM, errorNum);
				if(errorNum >= Constant.MAX_NUM_FOR_CODE)
					li.setNeedCode(1);
			}
			epResponse.setCode(SysBaseResponse.SUCCESS);
			PropertyUtils.copyProperties(li, result);
			epResponse.setData(li);
		} catch (Exception e) {
			epResponse.setCode(SysBaseResponse.ESYSTEM);
			logger.error("call login error ", e);
		}
		return epResponse;
	}

	/**
	 * 是否需要验证码
	 * 
	 * @param param
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/needValidateCode")
	public @ResponseBody
	EPResponse<NeedValidateCode> needValidateCode(HttpSession session) throws IOException {
		EPResponse<NeedValidateCode> epResponse = new EPResponse<NeedValidateCode>();
		try {
			Integer errorNum = (Integer)session.getAttribute(Constant.SESSION_LOGIN_ERROR_NUM);
			NeedValidateCode needCode = new NeedValidateCode();
			needCode.setNeedCode(0);
			if(errorNum != null && errorNum >= Constant.MAX_NUM_FOR_CODE){
				logger.debug("the errorNum is {}, so need validateCode .",errorNum);
				needCode.setNeedCode(1);
			}
			epResponse.setCode(SysBaseResponse.SUCCESS);
			epResponse.setData(needCode);
		} catch (Exception e) {
			epResponse.setCode(SysBaseResponse.ESYSTEM);
			logger.error("call login error ", e);
		}
		return epResponse;
	}
	
	/**
	 * 招聘人申请账号
	 * 
	 * @param param
	 * @param session
	 * @return
	 */
	@RequestMapping("/register")
	public @ResponseBody
	EPResponse<RegisterInfo> register(@ModelAttribute("employer") Employer employer, BindingResult result, HttpSession session) {
		EPResponse<RegisterInfo> epResponse = new EPResponse<RegisterInfo>();
		try {
			RegisterInfo ri = loginServ.register(employer);
			if (FuncBaseResponse.SUCCESS.equals(ri.getCode())) {
				session.setAttribute(Constant.EMPLOYERID, ri.getEmployer().getEmployerId());
				session.setAttribute(Constant.EMPLOYERNAME, ri.getEmployer().getEmployerAcct());
			}
			epResponse.setCode(SysBaseResponse.SUCCESS);
			epResponse.setData(ri);
		} catch (PFServiceException e) {
			epResponse.setCode(SysBaseResponse.ESYSTEM);
			epResponse.setMessage(e.getMessage());
			if (logger.isDebugEnabled())
				e.printStackTrace();
		}
		return epResponse;
	}

	/**
	 * 获取验证码图片
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/validateCode")
	public void getValidateCode(HttpServletRequest request, HttpServletResponse response) {
		// System.out.println("calling..............");
		response.setContentType("image/jpeg");// 设置相应类型,告诉浏览器输出的内容为图片
		response.setHeader("Pragma", "No-cache");// 设置响应头信息，告诉浏览器不要缓存此内容
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);
		RandomValidateCode randomValidateCode = new RandomValidateCode();
		try {
			randomValidateCode.getRandcode(request, response);// 输出图片方法
		} catch (Exception e) {
			if (logger.isDebugEnabled())
				e.printStackTrace();
		}
	}
	
	/**
	 * 登录验证
	 * 
	 * @param param
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/certifyWithDemo/{ticket}")
	public String certifyWithDemo(HttpSession session,HttpServletRequest request, @PathVariable String ticket) throws IOException {
		try {
			LoginInfo result = loginServ.certifyDemo(ticket);
			if (FuncBaseResponse.SUCCESS.equals(result.getCode())) {
				session.setAttribute(Constant.EMPLOYERID, result.getEmployer().getEmployerId());
				session.setAttribute(Constant.EMPLOYERNAME, result.getEmployer().getEmployerAcct());
				Integer companyId = result.getEmployer().getCompanyId();
				if(companyId != null){
					Company company =  schoolInfoService.getCompanyById(companyId);
					if(company != null){
						session.setAttribute(Constant.COMPANYNAME, company.getCompanyName());
					}
				}
				int employerId = result.getEmployer().getEmployerId();
			   List<PositionTestTypeInfo> positionTestTypeInfos = 	positionImpl.getPositionTestTypeInfo(employerId);
			   return SchoolIndexController.goPageForFirst(positionTestTypeInfos, employerId,request);
			}else{
				logger.warn("not right ticket {} or not have employer demo@101test.com ", ticket);
				return "weixinapp/error"; 
			}
		} catch (Exception e) {
			logger.error("call certifyWithDemo error ", e);
			return "weixinapp/error"; 
		}
	}

}
