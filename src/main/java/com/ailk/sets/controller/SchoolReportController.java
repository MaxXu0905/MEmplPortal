package com.ailk.sets.controller;

import java.util.List;

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
import com.ailk.sets.grade.intf.BaseResponse;
import com.ailk.sets.grade.intf.IGradeService;
import com.ailk.sets.grade.intf.report.Interview.InterviewItem;
import com.ailk.sets.platform.intf.cand.domain.Employer;
import com.ailk.sets.platform.intf.cand.domain.InfoNeeded;
import com.ailk.sets.platform.intf.cand.service.ICandidateInfoService;
import com.ailk.sets.platform.intf.common.PFResponse;
import com.ailk.sets.platform.intf.domain.ReportStatusCountInfo;
import com.ailk.sets.platform.intf.empl.service.ILogin;
import com.ailk.sets.platform.intf.empl.service.ISchoolReportService;
import com.ailk.sets.platform.intf.school.domain.ReportSkillsScoreInfo;
import com.ailk.sets.platform.intf.school.domain.SchoolCandidateReport;
import com.ailk.sets.platform.intf.school.domain.SchoolReportCondition;
import com.ailk.sets.platform.intf.school.domain.SchoolReportInfo;

@RestController
@RequestMapping("/wx/schoolReport")
public class SchoolReportController {

	private final Logger logger = LoggerFactory
			.getLogger(SchoolReportController.class);

	@Autowired
	private ISchoolReportService schoolReportService;

	@Autowired
	private IGradeService gradeService;

	@Autowired
	private ICandidateInfoService candidateInfoService;
	@Autowired
	private ILogin loginImpl;

	/**
	 * 调用gradeService，保存视频
	 * 
	 * @param testId
	 * @param items
	 * @return
	 */
	@RequestMapping(value = "/saveInterview/{testId}", method = { RequestMethod.POST })
	public @ResponseBody
	EPResponse<BaseResponse> saveInterview(@PathVariable long testId,
			@RequestBody List<InterviewItem> items) {
		EPResponse<BaseResponse> epResponse = new EPResponse<BaseResponse>();
		try {
			epResponse.setData(gradeService.saveInterview(testId, items));
			epResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			epResponse.setCode(SysBaseResponse.ESYSTEM);
			logger.error("error call saveInterview ", e);
		}
		return epResponse;
	}

	/**
	 * 调用gradeService，获取视频
	 * 
	 * @param testId
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getInterview/{testId}")
	public @ResponseBody
	EPResponse<BaseResponse> getInterview(@PathVariable long testId,
			HttpSession session) {
		final int TEST_TYPE = 2; // 校招

		EPResponse<BaseResponse> epResponse = new EPResponse<BaseResponse>();
		try {
			int emloyerId = (Integer) session.getAttribute(Constant.EMPLOYERID);
			epResponse.setData(gradeService.getInterview(emloyerId, TEST_TYPE,
					testId));
			epResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			epResponse.setCode(SysBaseResponse.ESYSTEM);
			logger.error("error call getInterview ", e);
		}
		return epResponse;
	}

	/**
	 * 获取输入控件信息
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getReport", method = RequestMethod.POST)
	public @ResponseBody
	EPResponse<List<SchoolCandidateReport>> getReport(HttpSession session,
			@RequestBody SchoolReportCondition condition) {
		Integer employerId = (Integer) session.getAttribute(Constant.EMPLOYERID);
		EPResponse<List<SchoolCandidateReport>> cpResponse = new EPResponse<List<SchoolCandidateReport>>();
		try {
			condition.setEmployerId(employerId);
			List<SchoolCandidateReport> list = schoolReportService
					.getSchoolReportList(condition);
			logger.debug("list SchoolCandidateReport size is {}", list.size());
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
	 * 获取报告各个技能分数
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getSkillScore/{testId}", method = RequestMethod.POST)
	public @ResponseBody
	EPResponse<List<ReportSkillsScoreInfo>> getSkillScore(
			@PathVariable long testId) {
		EPResponse<List<ReportSkillsScoreInfo>> cpResponse = new EPResponse<List<ReportSkillsScoreInfo>>();
		try {
			List<ReportSkillsScoreInfo> list = schoolReportService
					.getReportSkillsScoreInfo(testId);
			logger.debug("list SchoolCandidateReport size is {}", list.size());
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
	 * 获取报告各个技能分数
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getCandidateInfo/{testId}", method = RequestMethod.POST)
	public @ResponseBody
	EPResponse<List<InfoNeeded>> getCandidateInfo(@PathVariable long testId) {
		EPResponse<List<InfoNeeded>> cpResponse = new EPResponse<List<InfoNeeded>>();
		try {
			logger.debug("get input info testId is {}", testId);
			List<InfoNeeded> list = candidateInfoService
					.getCandConfigInfoExts(testId);
			logger.debug("InfoNeed size is {}", list.size());
			cpResponse.setData(list);
			cpResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			logger.error("get input info error ", e);
			cpResponse.setMessage(e.getMessage());
			cpResponse.setCode(SysBaseResponse.ESYSTEM);
		}
		return cpResponse;
	}

	/**
	 * 获取报告总数
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getReportCount", method = RequestMethod.POST)
	public @ResponseBody
	EPResponse<Long> getReportCount(HttpSession session, @RequestBody SchoolReportCondition condition) {
		EPResponse<Long> cpResponse = new EPResponse<Long>();
		Integer employerId = (Integer) session.getAttribute(Constant.EMPLOYERID);
		try {
			condition.setEmployerId(employerId);
			Long size = schoolReportService.getCountReportList(condition);
			logger.debug("list getReportCount size is {} for condition {} ",
					size, condition);
			cpResponse.setData(size);
			cpResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			logger.error("get getReportCount info error ", e);
			cpResponse.setMessage(e.getMessage());
			cpResponse.setCode(SysBaseResponse.ESYSTEM);
		}
		return cpResponse;
	}

	/**
	 * 更新报告状态
	 * 
	 * @param positionId
	 * @param invitationId
	 * @param testResult
	 * @return
	 */
	@RequestMapping("/updateTestResult/{testId}/{testResult}")
	public @ResponseBody
	EPResponse<PFResponse> updateTestResult(HttpSession session,
			@PathVariable long testId, @PathVariable int testResult) {
		logger.debug("updateTestResult for testId {}, testResult {} ", testId,
				testResult);
		EPResponse<PFResponse> epResponse = new EPResponse<PFResponse>();
		try {
			PFResponse ps = schoolReportService.updateTestResult(testId,
					testResult);
			epResponse.setData(ps);
			epResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			epResponse.setCode(SysBaseResponse.ESYSTEM);
			epResponse.setMessage(e.getMessage());
		}
		return epResponse;
	}

	/**
	 * 获取报告信息
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getReportInfo/{testId}")
	public @ResponseBody
	EPResponse<SchoolReportInfo> getReportInfo(@PathVariable long testId) {
		EPResponse<SchoolReportInfo> cpResponse = new EPResponse<SchoolReportInfo>();
		try {
			logger.debug("getReportInfo  testId is {}", testId);
			SchoolReportInfo result = schoolReportService
					.getSchoolReportInfo(testId);
			cpResponse.setData(result);
			cpResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			logger.error("getReportInfo  error ", e);
			cpResponse.setMessage(e.getMessage());
			cpResponse.setCode(SysBaseResponse.ESYSTEM);
		}
		return cpResponse;
	}

	/**
	 * 获取报告统计数量信息
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getSchoolReportStatusCount/{posOrActId}/{type}")
	public @ResponseBody
	EPResponse<List<ReportStatusCountInfo>> getSchoolReportStatusCount(HttpSession session,
			@PathVariable int posOrActId, @PathVariable int type) {
		EPResponse<List<ReportStatusCountInfo>> cpResponse = new EPResponse<List<ReportStatusCountInfo>>();
		try {
			int emloyerId = (Integer) session.getAttribute(Constant.EMPLOYERID);
			logger.debug("getSchoolReportStatusCount  posOrActId is {}, type is {} ",
					posOrActId, type);
			cpResponse.setData(schoolReportService
					.getSchoolReportStatusCount(emloyerId,posOrActId,type));
			cpResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			logger.error("getSchoolReportStatusCount  error ", e);
			cpResponse.setMessage(e.getMessage());
			cpResponse.setCode(SysBaseResponse.ESYSTEM);
		}
		return cpResponse;
	}
	
	/**
	 * 获取登陆账号姓名信息
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getEmployerInfo")
	public @ResponseBody
	EPResponse<Employer> getEmployerInfo(HttpSession session) {
		EPResponse<Employer> cpResponse = new EPResponse<Employer>();
		try {
			int emloyerId = (Integer) session.getAttribute(Constant.EMPLOYERID);
			Employer employer = loginImpl.getEmployerByEmployerId(emloyerId);
			logger.debug("getEmployerInfo  employerId {} , employer {} ",emloyerId, employer);
			employer.setEmployerPwd(null);
			employer.setEmployerId(null);
			employer.setTicket(null);
			employer.setCreateDate(null);
			employer.setInitFlag(null);
			employer.setAuthCode(null);
			cpResponse.setData(employer);
			cpResponse.setCode(SysBaseResponse.SUCCESS);
		} catch (Exception e) {
			logger.error("getEmployerInfo  error ", e);
			cpResponse.setMessage(e.getMessage());
			cpResponse.setCode(SysBaseResponse.ESYSTEM);
		}
		return cpResponse;
	}

}
