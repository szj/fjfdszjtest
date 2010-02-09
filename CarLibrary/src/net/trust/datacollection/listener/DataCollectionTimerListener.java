package net.trust.datacollection.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.trust.datacollection.timer.BackSiteTimerTask;
import net.trust.datacollection.timer.CarICCollectionTimerTask;
import net.trust.datacollection.timer.DataCollectionTimerTask;
import net.trust.datacollection.timer.ExecCreateWarningLogProcTimerTask;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 * ���ݲɼ���ʱ������,ͨ��������������(web.xml)
 *
 */
public class DataCollectionTimerListener implements ServletContextListener {
	private Log log = LogFactory.getLog(DataCollectionTimerListener.class);
	private java.util.Timer timer = null;
	
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext servletContext = servletContextEvent.getServletContext();
		
		if (log.isDebugEnabled())
			log.debug("���ݲɼ���ʱ��������");
		
		//����GPS�ӿ����ݲɼ�����Ϊ1Сʱ
		timer = new java.util.Timer(true);
		DataCollectionTimerTask dataCollectionTimerTask = new DataCollectionTimerTask(servletContext);
		timer.schedule(dataCollectionTimerTask, 0, 60 * 60 * 1000);
		
		
				
		//Ԥ������������Ϊ1Сʱ
		ExecCreateWarningLogProcTimerTask execCreateWarningLogProcTimerTask = new ExecCreateWarningLogProcTimerTask(servletContext);
		timer.schedule(execCreateWarningLogProcTimerTask, 0, 60 * 60 * 1000);
		
		//IC���쳣����ÿ��30����  30 * 60 * 1000
		CarICCollectionTimerTask carICCollectionTimerTask = new CarICCollectionTimerTask(servletContext);
		timer.schedule(carICCollectionTimerTask, 0, 30 * 60 * 1000);

		//��վ����ÿ��10����  10 * 60 * 1000
		BackSiteTimerTask backSiteTimerTask = new BackSiteTimerTask(servletContext);
		timer.schedule(backSiteTimerTask, 0, 10 * 60 * 1000);
		
		if (log.isDebugEnabled())
			log.debug("���ݲɼ��Ѿ����������ȱ�");
	}
	
	public void contextDestroyed(ServletContextEvent arg0) {

	}
}
