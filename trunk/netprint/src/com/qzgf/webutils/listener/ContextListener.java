package com.qzgf.webutils.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.qzgf.IbatisDaoTools.BaseSqlMapDAO;

/**
 * �����ļ������� ˵��������������ʱ���س����ʱ���Զ���ʼ��һЩ���� ��Ӧ�ĵ������ر�֮ǰ��ִ��һЩ����
 * 
 * @author lsr
 * @datge 20081102
 * 
 */
public class ContextListener implements ServletContextListener {
	private Log log = LogFactory.getLog(ContextListener.class);
	private BaseSqlMapDAO baseSqlMapDAO = null;

	public void contextInitialized(ServletContextEvent arg0) {
		if (log.isDebugEnabled()) {
			log.debug("++++++++++++contextInitialized++++++++++++++");
		}
	}

	/**
	 * ���������ر�ǰ����������������״̬��Ϊ������
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		if (log.isDebugEnabled()) {
			log.debug("++++++++++++contextDestroyed++++++++++++++");
		}

		ServletContext servletContext = arg0.getServletContext();// ��ȡspring����������
		ApplicationContext context = WebApplicationContextUtils
				.getWebApplicationContext(servletContext);

		baseSqlMapDAO = (BaseSqlMapDAO) context.getBean("baseSqlMapDAO");
		int i = baseSqlMapDAO.update("ManagerInfo.updateManagerIsOnline", null);
		if (i > 0) {
			if (log.isDebugEnabled())
				log.debug("����������������������ɹ�");
		}
	}

}
