package com.ailk.sets.weixin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ailk.sets.platform.intf.cand.service.ISchoolInfoService;
import com.ailk.sets.weixin.message.resp.ProcessResult;
import com.ailk.sets.weixin.message.service.CoreService;
import com.ailk.sets.weixin.util.SignUtil;
  

  

  
/** 
 * 核心请求处理类 
 *  
 * @author liufeng 
 * @date 2013-05-18 
 */  
public class CoreServlet extends HttpServlet {  
    private static final long serialVersionUID = 4440739483644821986L;  
  

	@Autowired
	@Qualifier("schoolInfoService")
	private static ISchoolInfoService schoolInfoService;
	
	private Logger logger = LoggerFactory.getLogger(CoreServlet.class);

    @Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		ServletContext servletContext = this.getServletContext();  
	    WebApplicationContext wac = null;   
	    wac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
	    schoolInfoService = wac.getBean(ISchoolInfoService.class);
	}

	/** 
     * 确认请求来自微信服务器 
     */  
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        // 微信加密签名  
        String signature = request.getParameter("signature");  
        // 时间戳  
        String timestamp = request.getParameter("timestamp");  
        // 随机数  
        String nonce = request.getParameter("nonce");  
        // 随机字符串  
        String echostr = request.getParameter("echostr");  
  
        PrintWriter out = response.getWriter();  
        // 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败  
        if (SignUtil.checkSignature(signature, timestamp, nonce)) {  
            out.print(echostr);  
        }  
        out.close();  
        out = null;  
    }  
  
    /** 
     * 处理微信服务器发来的消息 
     */  
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	        // 将请求、响应的编码均设置为UTF-8（防止中文乱码）  
	        request.setCharacterEncoding("UTF-8");  
	        response.setCharacterEncoding("UTF-8");  
	        ProcessResult result = CoreService.processRequest(request,schoolInfoService); 
	        if(result.getType().equals(ProcessResult.MSG_TYPE)){
	        	  PrintWriter out = response.getWriter();  
	        	 out.print(result.getContext()); 
	 	        // 响应消息  
	 	        out.close(); 
	        }else if(result.getType().equals(ProcessResult.CLICK_TYPE)){
	        	 PrintWriter out = response.getWriter(); 
	        	/*String baseUrl = schoolInfoService.getServiceBaseUrl();
	        	String url = baseUrl + request.getContextPath() + "/sets/" + result.getUrl();
           	    String respContent = "百一测评 <a href=\"" +url+"#wechat_webview_type=1"+"\">点击进入</a>";*/
	        	logger.debug("by click enter the respContent url is {} ", result.getContext());
		         out.print(result.getContext()); 
		 	     out.close(); 
		 	     logger.debug("write end .... ");
//				response.sendRedirect(url);
	        }else{
	        	logger.error("unknown request, please check .. ");
	        }
	        
    }  
}
