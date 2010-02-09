package com.qzgf.NetStore.pub;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.remoting.httpinvoker.CommonsHttpInvokerRequestExecutor;
import org.springframework.remoting.httpinvoker.HttpInvokerProxyFactoryBean;

import com.cownew.ctk.common.StringUtils;

public class WebEndServiceLocator {
	@SuppressWarnings("unchecked")
	public static Object getService(HttpServletRequest request,
			Class serviceIntfClass) {
		HttpSession webSession = request.getSession();
		String sessionId = (String) webSession
				.getAttribute(WebConstant.SESSIONID);
		return getService(sessionId, serviceIntfClass);
	}

	@SuppressWarnings("unchecked")
	public static Object getService(String sessionId, Class serviceIntfClass) {
		WebConfig webConfig = WebConfig.getInstance();
		HttpInvokerProxyFactoryBean proxyFactory = new HttpInvokerProxyFactoryBean();
		CommonsHttpInvokerRequestExecutor reqExecutor = new CommonsHttpInvokerRequestExecutor();
		//ִ��Զ�̵���
		proxyFactory.setHttpInvokerRequestExecutor(reqExecutor);
		String serviceIntfName = serviceIntfClass.getName();
		String serviceURL = webConfig.getServerURL().toString()
				+ serviceIntfName;
		if (!StringUtils.isEmpty(sessionId)) {
			StringBuffer sb = new StringBuffer();
			sb.append(serviceURL).append("?").append(SysConstants.SESSIONID)
					.append("=").append(sessionId);
			//����Զ��Ŀ������ַ,�õ�ַ������Զ���ṩ����Ĺ���һ��
			proxyFactory.setServiceUrl(sb.toString());
		} else {
			//����Զ��Ŀ������ַ,�õ�ַ������Զ���ṩ����Ĺ���һ��  
			proxyFactory.setServiceUrl(serviceURL);
		}
		proxyFactory.setServiceInterface(serviceIntfClass);
		proxyFactory.afterPropertiesSet();
		Object service = proxyFactory.getObject();
		return service;
	}
}
