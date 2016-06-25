package com.ailk.sets.weixin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class GetJsonServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.getJson(request,response);
	}
	public String getJson(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String result = request.getParameter("res");
			//得到一个json根据这个值做判断 然后还要传送给前台一个值
			System.out.println("getJson :"+result);
			if("2".equals(result)){
				//发送一条数据到前台做处理
				JSONObject sendobj = new JSONObject();
			   	sendobj.put("re", "DFS");
				sendobj.put("userName", "tracy");
				sendobj.put("email", "tracy@126.com");
				sendobj.put("tel", "10086");
				sendobj.put("school", "长春理工大学");
				response.getWriter().print(sendobj.toString());
			}
				return result;
		   }

}
