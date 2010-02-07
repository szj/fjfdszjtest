package com.qzgf.NetStore.pub;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.remoting.httpinvoker.HttpInvokerServiceExporter;

import com.cownew.ctk.common.StringUtils;
import com.qzgf.NetStore.pub.lifeMgr.ServiceLifeMonitor;
import com.qzgf.NetStore.pub.lifeMgr.SessionServiceLifeListener;
import com.qzgf.NetStore.pub.sessionMgr.SessionManager;

/**
 * Զ��ӳ��ӿڵ�ʵ����
 * @author lsr
 */
@SuppressWarnings("serial")
public class RemotingCallServlet extends HttpServlet {
	private static Logger logger = Logger.getLogger(RemotingCallServlet.class);

	protected void doPost(HttpServletRequest httpRequest,
			HttpServletResponse httpResponse) throws ServletException,
			IOException {
		try {
			invokeService(httpResponse, httpRequest);
		} catch (Exception rpcEx) {
			// ��session�Ƿ�֮����쳣������bean���й������׳���,��˿ͻ��˵ò����쳣,
			// �����쳣���ڴ˴��׳�,�������ͨ��http�������ķ�ʽ���͸��ͻ���
			// ����Ҳ��֤��SessionServiceLifeListener���ù����õ���ʲôremoting����
			// ֻҪ�׳��쳣�Ϳ�����
			//HttpServletResponse.SC_BAD_REQUEST:400����,�������﷨�����д�
			String msg = rpcEx.getMessage();
			httpResponse.sendError(HttpServletResponse.SC_BAD_REQUEST, msg);

			logger.error(msg, rpcEx);
		} catch (Throwable e) {
			// ע��,bean���й����е��쳣������ͨ���˴��׳���,����ͨ��remoting���ƴ��ݵ��ͻ������׳���
			// �˴��׳����Ƿ�bean���쳣
			logger.error(e.getMessage(), e);

			throw new ServletException(e);
		}
	}

	private void invokeService(HttpServletResponse response,
			HttpServletRequest request) throws ServletException {
		String reqPath = request.getPathInfo();
		String serviceId = getServiceId(reqPath);
		String sessionId = request.getParameter(SysConstants.SESSIONID);
		ServiceLifeMonitor lifeMonitor = new ServiceLifeMonitor(sessionId);
		lifeMonitor.addServiceLifeListener(new SessionServiceLifeListener());

		try {
			if(serviceId.equals("com.qzgf.NetStore.dao.ICommonDAO")){
				// ���ڵ�¼�����ϵͳ������˵���������Ҳ�޷��õ�sessionId��,��Ϊ��ʱ��û��һ��sessionId
				// ����Ҫ���зǿ��ж�
				if (!StringUtils.isEmpty(sessionId)) {
					SessionManager sessionMgr = SessionManager.getInstance();
					boolean valid = sessionMgr.isValid(sessionId);
					// �ж�sessionId�Ƿ�Ϸ� 
					if (!valid) {
						System.out.println("sessionId���Ϸ�");
						//
					}

					ThreadVariableManager.getInstance().setCurrentSessionId(sessionId);
				}
			}
			else{
			    lifeMonitor.beforeInvoke();
			}
			invokeBean(request, response, serviceId);
		} finally {
			lifeMonitor.afterInvoke();
		}
	}

	private static String getServiceId(String reqPath) {
		Pattern pattern = Pattern.compile("/(.+)");
		Matcher match = pattern.matcher(reqPath);
		match.matches();
		match.group();

		String serviceId = match.group(1);
		return serviceId;
	}
	
	@SuppressWarnings("unchecked")
	private void invokeBean(HttpServletRequest request,
			HttpServletResponse response, String serviceId)
			throws ServletException {
		// ��������״̬��,��������ͬ������
		try {
			Class serviceIntfClass = Class.forName(serviceId);
			Object _service = LocalServiceLocator.getInstance().getService(
					serviceIntfClass);
			HttpInvokerServiceExporter exporter = new HttpInvokerServiceExporter();
			exporter.setService(_service);
			exporter.setServiceInterface(serviceIntfClass);
			exporter.afterPropertiesSet();
			exporter.handleRequest(request, response);
		} catch (ClassNotFoundException e) {
			throw new ServletException(e);
		} catch (IOException e) {
			throw new ServletException(e);
		}
	}

	
}
