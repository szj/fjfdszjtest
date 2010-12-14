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
package com.enation.eop.processor.backend;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enation.eop.core.Request;
import com.enation.eop.core.Response;
import com.enation.eop.core.impl.RemoteRequest;
import com.enation.eop.core.impl.StringResponse;
import com.enation.eop.processor.Processor;
import com.enation.eop.sdk.user.UserContext;
import com.enation.framework.context.webcontext.ThreadContextHolder;
import com.enation.framework.context.webcontext.WebSessionContext;

public class LogoutProcessor implements Processor {

	
	public Response process(int mode, HttpServletResponse httpResponse,
			HttpServletRequest httpRequest) {
		
		WebSessionContext<UserContext> sessonContext = ThreadContextHolder.getSessionContext();			
		Response response= new StringResponse();
		sessonContext.removeAttribute(UserContext.CONTEXT_KEY);
		response.setContent("<script>location.href='index.jsp'</script>");
		return response;
	}
 
}
