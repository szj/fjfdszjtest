/*
============================================================================
��Ȩ���� (C) 2008-2010 �����ǻ㣨�������Ƽ����޹�˾������������Ȩ����
��վ��ַ��http://www.javamall.com.cn

����������ȫ���ء������û���ȨЭ�顷�Ļ����ϣ��������Ӧ�����κ���;��������
ҵ��;����������֧�������Ȩ��Ȩ���á��������û���ȨЭ�顷���Դ����ǵ���վ���أ�
������ķ��ɷ��գ���Ҳ������ϵ���ǻ������汾����ȨЭ�顣��δ����Ȩ����²�
����Գ���������κ���ʽ�κ�Ŀ�ĵ��޸Ļ��ٷ�����
============================================================================
*/
package com.enation.eop.sdk.webapp;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enation.eop.sdk.EopServlet;
import com.enation.eop.utils.JspUtil;

public class AdminServlet implements EopServlet {

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		
		
		String servletPath  = request.getServletPath();
		request.setAttribute("content",  JspUtil.getJspOutput(servletPath, request, response) );
		String content  = JspUtil.getJspOutput("/eop/main_frame.jsp", request, response) ;
		//response.setHeader("P3P","CP=\"CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR\"");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(content);
		
		
		
	}

}
