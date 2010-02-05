package com.qzgf.webutils.listener;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.qzgf.IbatisDaoTools.BaseSqlMapDAO;
import com.qzgf.application.systemManage.manager.dto.UserInfo;

/**
 * Session������
 * @author lsr
 * @date 20081102
 * @˵��: �����û��Ự��������û���¼ʱ���û���״̬������⣬
 *		  ���û��˳���ҳ��Ƿ��رա���ʱʱ���û�״̬�������
 *	
 *		����Session�¼������壺
 *			1����¼��վ�Ŀͻ���¼��־����¼���˳���Ϣ�ȣ�   
 *			2��ͳ����������
 *			3���ȵȻ��кܶ�
 *
 */
public class SessionListener implements HttpSessionAttributeListener  {
	Log log = LogFactory.getLog(SessionListener.class);
	private BaseSqlMapDAO baseSqlMapDAO = null;
	
	public SessionListener(){
//		if (log.isDebugEnabled())
//			log.debug("Start Up Session Listener");
	}
	//�����Ựʱ
	public void attributeAdded(HttpSessionBindingEvent arg0) {
//		if (log.isDebugEnabled())
//			log.debug("Creating Session Listener");
	}
	//ɾ���Ự��ʱ
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
//		if (log.isDebugEnabled())
//			log.debug("Clean Out Session Listener");
		//�ж�������Ƿ���Ϊcom.qzgf.application.systemManage.manager.dto.UserInfo����
		if (arg0.getValue() != null){
			if (arg0.getValue().getClass().getName().equals("com.qzgf.application.systemManage.manager.dto.UserInfo")){
				UserInfo userInfo = (UserInfo)arg0.getValue();//���Session�е�UserInfo����
				
				ServletContext servletContext = arg0.getSession().getServletContext();//��ȡspring����������
				ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext); 
				
				baseSqlMapDAO = (BaseSqlMapDAO)context.getBean("baseSqlMapDAO");
				if (baseSqlMapDAO != null){
					UserInfo temp = new UserInfo();
					temp.setIsOnline("0");
					temp.setStaffId(userInfo.getStaffId());
					
					baseSqlMapDAO.update("ManagerInfo.updateManagerInfo", temp);//�����û�����״̬
					
				}
			}
		}
	}
	//����Ựֵ
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
//		if (log.isDebugEnabled())
//			log.debug("Reseting Session Listener");
	}

}
