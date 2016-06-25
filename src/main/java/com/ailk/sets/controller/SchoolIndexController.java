package com.ailk.sets.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ailk.sets.common.Constant;
import com.ailk.sets.common.EPResponse;
import com.ailk.sets.common.SysBaseResponse;
import com.ailk.sets.platform.intf.cand.domain.Employer;
import com.ailk.sets.platform.intf.cand.service.ISchoolInfoService;
import com.ailk.sets.platform.intf.common.Constants;
import com.ailk.sets.platform.intf.domain.Company;
import com.ailk.sets.platform.intf.empl.domain.PositionTestTypeInfo;
import com.ailk.sets.platform.intf.empl.service.ILogin;
import com.ailk.sets.platform.intf.empl.service.IPosition;
import com.ailk.sets.platform.intf.model.wx.model.WXAuthInfo;
import com.ailk.sets.platform.intf.wx.service.IWeixinService;

/**
 * 测试用
 */
@Controller
@RequestMapping("/wx")
public class SchoolIndexController {
	private static Logger logger = LoggerFactory.getLogger(SchoolIndexController.class);
	@Autowired
	private ILogin loginServ;
	
	@Autowired
	private ISchoolInfoService schoolInfoService;

	@Autowired
	private IPosition positionImpl;
	
	@Autowired
	@Qualifier("iWeixinService")
	private IWeixinService iWeixinService;
	
	@RequestMapping("/actitylist")
	public String home() {//活动列表
		return "weixinapp/actitylist";
	}

	/**
     * url带openid登陆
     * @param request
     * @param code
     * @return
     */
    @RequestMapping("/wxLogin/{openId}")
    public String login(HttpServletRequest request ,@PathVariable String openId) {
        Employer employer = loginServ.getEmployerByOpenId(openId);
        if(employer != null){
            logger.debug("the empoyer not be null ,so login for employerId {} ", employer.getEmployerId());
            request.getSession().setAttribute(Constant.EMPLOYERID, employer.getEmployerId());
            request.getSession().setAttribute(Constant.EMPLOYERNAME, employer.getEmployerAcct());
            Integer companyId = employer.getCompanyId();
            if(companyId != null){
                Company company =  schoolInfoService.getCompanyById(companyId);
                if(company != null){
                    request.getSession().setAttribute(Constant.COMPANYNAME, company.getCompanyName());
                }
            }
            logger.debug("the openID is {} for employer {} ", openId,employer.getEmployerId());
            request.setAttribute("openId", openId);
            request.getSession().setAttribute("userOpenId", openId);//前台要求 加入session中 userOpenId
            int employerId = employer.getEmployerId();
            List<PositionTestTypeInfo> positionTestTypeInfos = positionImpl.getPositionTestTypeInfo(employerId);
            return goPageForFirst(positionTestTypeInfos,employerId,request);
        }
        return "weixinapp/login";
    }
	
	/**
	 * 点击微信菜单登陆
	 * @param request
	 * @param code
	 * @return
	 */
	@RequestMapping("/wxLoginByMenu")
	public String loginWithWXMenu(HttpServletRequest request ,@RequestParam(required=false) String code) {
	    
		logger.info(" weixin auth paramString:{"+ request.getQueryString()+"}");
        logger.info(" weixin auth param {code:"+code+"} ");
        
        String openId = "none"; // openId
        // 通过微信授权之后得到换取access_token的票据code
        if(!StringUtils.isBlank(code))
        {
            // 使用OAuth2.0授权后的得到的code获得授权信息(用户openId token等...)
            try
            {
                WXAuthInfo info = iWeixinService.getAuthInfoByCodeER(code);
                if(StringUtils.isBlank(info.getErrcode())) // 非异常情况
                {
                    openId = StringUtils.stripToEmpty(info.getOpenid());
                    request.setAttribute("openId", openId);
                    request.getSession().setAttribute("userOpenId", openId); // 将openid放入Session中
                    logger.info(" weixin openId : {"+openId+"} ");
                }
            } catch (Exception e)
            {
                logger.error(" get weixin OAuth info error ", e);
            }
        }
		Employer employer = loginServ.getEmployerByOpenId(openId);
		if(employer != null){
			logger.debug("the employer not be null ,so login for employerId {} ", employer.getEmployerId());
			request.getSession().setAttribute(Constant.EMPLOYERID, employer.getEmployerId());
			request.getSession().setAttribute(Constant.EMPLOYERNAME, employer.getEmployerAcct());
			Integer companyId = employer.getCompanyId();
			if(companyId != null){
				Company company =  schoolInfoService.getCompanyById(companyId);
				if(company != null){
					request.getSession().setAttribute(Constant.COMPANYNAME, company.getCompanyName());
				}
			}
			logger.debug("the openID is {} for employer {} ", openId,employer.getEmployerId());
//			request.setAttribute("openId", openId);
//			request.getSession().setAttribute("userOpenId", openId);//前台要求 加入session中 userOpenId
			int employerId = employer.getEmployerId();
			List<PositionTestTypeInfo> positionTestTypeInfos = positionImpl.getPositionTestTypeInfo(employerId);
			return goPageForFirst(positionTestTypeInfos,employerId,request);
		}
		return "weixinapp/login";
	}
	
	@RequestMapping("/examReport")
	public String examReport() {//报告页面
		return "weixinapp/examReport";
	}
	@RequestMapping("/testList")
	public String testList() {//首页 社招校招都有
		return "weixinapp/testList";
	}
	@RequestMapping("/schoolTest")
	public String schoolTest() {//校招测评列表
		return "weixinapp/schoolTest";
	}
	@RequestMapping("/societyTest")
	public String societyTest() {//社招测评列表
		return "weixinapp/societyTest";
	}
	@RequestMapping("/getCode")
	public String getCode() {//紧急预案
		return "weixinapp/getCode";
	}
	
	/**
	 * 这是微信菜单“测速助手”请求处理
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/appHelperDownloadRedirect")
	public String appHelperDownloadRedirect(HttpSession session,HttpServletRequest request,@RequestParam(required=false) String code) {
	    
	    logger.debug(" weixin auth param {code:"+code+"} ");
	    String openId = "none"; // openId
        // 通过微信授权之后得到换取access_token的票据code
        if(!StringUtils.isBlank(code))
        {
            // 使用OAuth2.0授权后的得到的code获得授权信息(用户openId token等...)
            try
            {
                WXAuthInfo info = iWeixinService.getAuthInfoByCodeER(code);
                if(StringUtils.isBlank(info.getErrcode())) // 非异常情况
                {
                    openId = StringUtils.stripToEmpty(info.getOpenid());
                    session.setAttribute("userOpenId", openId); // 将openid放入Session中
                }
            } catch (Exception e)
            {
                logger.error(" get weixin OAuth info error ", e);
            }
        }else
        {
            // 从session中获取openId哟，因为微信菜单授权的code只能用一次
            openId = session.getAttribute("userOpenId")==null?"none":(String)session.getAttribute("userOpenId");
        }
        Employer employer = loginServ.getEmployerByOpenId(openId);
	    if (null == employer)
        {
	        StringBuffer url = request.getRequestURL();
	        logger.debug("用户["+openId+"]未绑定百一账号，点击百一测速菜单，跳转到登录页面，登录后将重定向到["+url+"]");
            request.setAttribute(Constant.REQUEST_URL, url.toString());
            request.setAttribute("openId", openId);
//            return "redirect:/sets/wx/wxLogin/"+openId;
            return "weixinapp/login";
        }else
        { 
            logger.debug("用户["+openId+"]已绑定百一账号，直接进入测速助手页面");
            // 如果已绑定
//            session.removeAttribute(Constant.REQUEST_URL);
            return "redirect:/sets/wx/appHelperDownload/"+employer.getAuthCode();
        }
	}
	
	@RequestMapping("/appHelperDownload/{authCode}")
	public String appHelperDownload(HttpServletRequest request , @PathVariable String authCode) {//测试网络app下载页面
	    request.setAttribute("authCode", authCode);
	    return "weixinapp/appHelperDownload";
	}

	@RequestMapping("/personReport")
	public String personReport() {
		return "weixinapp/personReport";
	}
	
	@RequestMapping("/choiceJob")
	public String choiceJob() {
		return "weixinapp/choiceJob";
	}
	@RequestMapping("/bindSuccess")
	public String bindSuccess() {
		return "weixinapp/bindSuccess";
	}
	
	@RequestMapping("/clearSession")
	public @ResponseBody
	EPResponse clearSession(HttpSession session) {
	
		EPResponse ep = new EPResponse();
		Integer employerId = (Integer) session.getAttribute(Constant.EMPLOYERID);
		logger.debug("clear session .... for employerId {} ", employerId);
		ep.setCode(SysBaseResponse.SUCCESS);
		try {
			loginServ.updateOpenId(employerId, "");//清除此empoyer的openId
		} catch (Exception e) {
			logger.error("clear openId error ", e);
			ep.setCode(SysBaseResponse.ESYSTEM);
		}
		session.removeAttribute(Constant.EMPLOYERID);
		session.removeAttribute(Constant.EMPLOYERNAME);
		session.removeAttribute(Constant.COMPANYNAME);
		session.removeAttribute("userOpenId");
		session.removeAttribute("lastHomePath");
		return ep;
	}
	
	public static String goPageForFirst(List<PositionTestTypeInfo> positionTestTypeInfos, int employerId,HttpServletRequest request){
		logger.debug("the positionTestTypeInfos is {} for employerId {} ",positionTestTypeInfos,employerId);
		int size = positionTestTypeInfos.size();
		String homePage = "";
		if(size == 0){//没有测评
			homePage = "weixinapp/bindSuccess";
		}else if(size == 2){//校招社招都有
			homePage = "weixinapp/testList";
		}else if(positionTestTypeInfos.size() == 1){//校招社招有其中一种
			PositionTestTypeInfo typeInfo = positionTestTypeInfos.get(0);
			int positionNum = typeInfo.getPositionNum();
			if(typeInfo.getTestType() == Constants.TEST_TYPE_CLUB){
				if(positionNum > 1){//有多余1个的社招测评
					homePage = "weixinapp/societyTest";
				}else{//只要一个社招测评，跳转到报告
					int positionId = typeInfo.getPositionId();
					request.setAttribute("positionId", positionId);
					homePage = "weixinapp/examReport";
				}
			}else if(typeInfo.getTestType() == Constants.TEST_TYPE_SCHOOL){
				if(positionNum > 1){//有多余1个的校招测评
					homePage = "weixinapp/schoolTest";
				}else{//只要一个校招测评，跳转到活动
					int positionId = typeInfo.getPositionId();
					request.setAttribute("positionId", positionId);
					homePage = "weixinapp/actitylist";
				}
			}else {
				throw new RuntimeException("not right test type " + typeInfo.getTestType());
			}
		}else{
			throw new RuntimeException("not right test Type length for employerId " + employerId + " , size is " + size);
		}
		request.getSession().setAttribute("lastHomePath", homePage.replace("weixinapp/", ""));//放入session  前台需要知道哪个是首页，用于显示解绑按钮
		return homePage;
	}
}
