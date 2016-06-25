package com.ailk.sets.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ailk.sets.common.Constant;
import com.ailk.sets.common.EPResponse;
import com.ailk.sets.common.SysBaseResponse;
import com.ailk.sets.platform.intf.cand.domain.Employer;
import com.ailk.sets.platform.intf.common.PFResponse;
import com.ailk.sets.platform.intf.domain.CompanyRecruitActivity;
import com.ailk.sets.platform.intf.domain.CompanyRecruitActivityCount;
import com.ailk.sets.platform.intf.empl.domain.ConfigCodeNameWithCount;
import com.ailk.sets.platform.intf.empl.domain.Position;
import com.ailk.sets.platform.intf.empl.domain.PositionTestTypeInfo;
import com.ailk.sets.platform.intf.empl.service.ILogin;
import com.ailk.sets.platform.intf.empl.service.IPosition;
import com.ailk.sets.platform.intf.empl.service.ISchoolPositionService;
import com.ailk.sets.platform.intf.model.Page;
import com.ailk.sets.platform.intf.model.campus.SignUpOnlineSetsRsp;

@RestController
@RequestMapping("/wx/schoolPosition")
public class SchoolPositionController {
	private Logger logger = LoggerFactory.getLogger(SchoolPositionController.class);

	@Autowired
	private ISchoolPositionService schoolPositionService;
	@Autowired
	private IPosition positionImpl;
	@Autowired
	private ILogin loginServ;
	@RequestMapping(value = "/getPosIntention/{posOrActId}/{type}")
	public @ResponseBody
	EPResponse<List<ConfigCodeNameWithCount>> getPosIntention(HttpSession session,@PathVariable int posOrActId, @PathVariable int type) {
		EPResponse<List<ConfigCodeNameWithCount>> epResponse = new EPResponse<List<ConfigCodeNameWithCount>>();
		try {
			int emloyerId = (Integer) session.getAttribute(Constant.EMPLOYERID);
			epResponse.setData(schoolPositionService.getPosIntention(emloyerId,posOrActId,type));
			epResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			epResponse.setCode(SysBaseResponse.ESYSTEM);
			logger.error("error call getPosIntention", e);
		}
		return epResponse;
	}

	/**
	 * 获取活动列表
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getActivities/{positionId}")
	public @ResponseBody
	EPResponse<List<CompanyRecruitActivity>> getActivities(HttpSession session,@PathVariable Integer positionId) {
		Integer employerId = (Integer) session.getAttribute(Constant.EMPLOYERID);
		logger.debug("getInput the employerId is {}", employerId);
		EPResponse<List<CompanyRecruitActivity>> cpResponse = new EPResponse<List<CompanyRecruitActivity>>();
		try {
			List<CompanyRecruitActivity> list = schoolPositionService.getActivitiesByEmployerId(employerId,positionId);
			logger.debug("list CompanyRecruitActivity size is {}", list.size());
			cpResponse.setData(list);
			cpResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			logger.error("get CompanyRecruitActivity info error ", e);
			cpResponse.setMessage(e.getMessage());
			cpResponse.setCode(SysBaseResponse.ESYSTEM);
		}
		return cpResponse;
	}

	/**
	 * 更新活动状态
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/updateActivityStatus/{activityId}/{status}", method = RequestMethod.POST)
	public @ResponseBody
	EPResponse<PFResponse> updateActivityStatus(@PathVariable int activityId, @PathVariable int status) {
		logger.debug("updateActivityStatus the activityId is {}, status is {}", activityId, status);
		EPResponse<PFResponse> cpResponse = new EPResponse<PFResponse>();
		try {
			schoolPositionService.updateActivity(activityId, status);
			cpResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			logger.error("get CompanyRecruitActivity info error ", e);
			cpResponse.setMessage(e.getMessage());
			cpResponse.setCode(SysBaseResponse.ESYSTEM);
		}
		return cpResponse;
	}

	/**
	 * 获取汇总信息
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getActivityCount/{activityId}", method = RequestMethod.POST)
	public @ResponseBody
	EPResponse<CompanyRecruitActivityCount> getActivityCount(@PathVariable int activityId) {
//		logger.debug("getActivityCount the activityId is {}", activityId);
		EPResponse<CompanyRecruitActivityCount> cpResponse = new EPResponse<CompanyRecruitActivityCount>();
		try {
			CompanyRecruitActivityCount count = schoolPositionService.getCompanyRecruitActivityCount(activityId);
			cpResponse.setData(count);
			cpResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			logger.error("get getActivityCount info error ", e);
			cpResponse.setMessage(e.getMessage());
			cpResponse.setCode(SysBaseResponse.ESYSTEM);
		}
		return cpResponse;
	}
	
	@RequestMapping(value = "/getPositionTestTypeInfo")
	public @ResponseBody
	EPResponse<List<PositionTestTypeInfo>> getPositionTestTypeInfo(HttpSession session,HttpServletRequest request) {
		EPResponse<List<PositionTestTypeInfo>> epResponse = new EPResponse<List<PositionTestTypeInfo>>();
		try {
			Integer employerId = (Integer) session.getAttribute(Constant.EMPLOYERID);
			logger.debug("getPositionTestTypeInfo the employerId is {}", employerId);
			List<PositionTestTypeInfo> positionTestTypeInfos = positionImpl.getPositionTestTypeInfo(employerId);
			epResponse.setData(positionTestTypeInfos);
			SchoolIndexController.goPageForFirst(positionTestTypeInfos, employerId, request);//需要调用下此方法，往session中放入lastHomePath  前台需要知道哪个是首页，用于显示解绑按钮
			epResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			epResponse.setCode(SysBaseResponse.ESYSTEM);
			logger.error("error call getPositionTestTypeInfo", e);
		}
		return epResponse;
	}
	
	@RequestMapping(value = "/getPositionByTestType/{testType}")
	public @ResponseBody
	EPResponse<List<Position>> getPositionByTestType(HttpSession session, @PathVariable int testType, @RequestBody Page page) {
		EPResponse<List<Position>> epResponse = new EPResponse<List<Position>>();
		try {
			Integer employerId = (Integer) session.getAttribute(Constant.EMPLOYERID);
			logger.debug("getPositionByTestType the employerId is {}, testType {} , page is " + page , employerId, testType);
			epResponse.setData(positionImpl.getPositionByTestType(employerId, testType, page));
			epResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			epResponse.setCode(SysBaseResponse.ESYSTEM);
			logger.error("error call getPositionByTestType", e);
		}
		return epResponse;
	}

	@RequestMapping(value = "/getEmployerAuthCode")
	public @ResponseBody
	EPResponse<String> getEmployerAuthCode(HttpSession session) {
		Integer employerId = (Integer)session.getAttribute(Constant.EMPLOYERID);
		logger.debug("getEmployerAuthCode , employerId is {} ", employerId);
		EPResponse<String> epResponse = new EPResponse<String>();
		try {
			Employer employer = loginServ.getEmployerByEmployerId(employerId);
			epResponse.setData(employer.getAuthCode());
			epResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			epResponse.setCode(SysBaseResponse.ESYSTEM);
			logger.error("call getEmployerAuthCode error ", e);
		}
		return epResponse;
	}
	
	/**
	 * 查询校招转在线考试的设置信息（口令、转在线终止时间）
	 * @param session
	 * @return
	 */
    @RequestMapping(value = "/queryOnlineReqSets/{positionId}")
    public @ResponseBody
    EPResponse<SignUpOnlineSetsRsp> queryOnlineReqSets(HttpSession session,@PathVariable Integer positionId) {
        logger.debug(" 查询校招转在线考试的设置信息, positionId is {} ",positionId);
        EPResponse<SignUpOnlineSetsRsp> epResponse = new EPResponse<SignUpOnlineSetsRsp>();
        try {
            SignUpOnlineSetsRsp querySets = schoolPositionService.querySets(positionId);
            epResponse.setData(querySets);
            epResponse.setCode(SysBaseResponse.SUCCESS);
        } catch (Exception e) {
            epResponse.setCode(SysBaseResponse.ESYSTEM);
            logger.error("call getEmployerAuthCode error ", e);
        }
        return epResponse;
    }
    
    /**
     * 更改校招转在线考试的设置信息（口令、转在线终止时间）
     * @param session
     * @return
     */
    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/updateOnlineReqSets/{positionId}/{newReqEndDate}/{newExamEndDate}")
    public @ResponseBody
    EPResponse updateOnlineReqSets(HttpSession session,@PathVariable Integer positionId,@PathVariable String newReqEndDate,@PathVariable String newExamEndDate) {
        logger.debug(" 更新校招转在线考试的设置信息");
        EPResponse<SignUpOnlineSetsRsp> epResponse = new EPResponse<SignUpOnlineSetsRsp>();
        try {
            schoolPositionService.updateSets(positionId, newReqEndDate ,newExamEndDate);
            epResponse.setCode(SysBaseResponse.SUCCESS);
        } catch (Exception e) {
            epResponse.setCode(SysBaseResponse.ESYSTEM);
            logger.error("call getEmployerAuthCode error ", e);
        }
        return epResponse;
    }
}
