package net.trust.datacollection.timer;

import java.util.HashMap;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.utils.sms.SMProxySendFacadeImplTimeTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SmsCollectionTimerTask extends TimerTask {
	private Log log = LogFactory.getLog(SmsCollectionTimerTask.class);
	private ServletContext servletContext;
	
	private BaseSqlMapDAO baseSqlMapDAO;
	
	private DataSource dataSource;
	
	
	private SMProxySendFacadeImplTimeTask smpsend=new SMProxySendFacadeImplTimeTask();
	
	
	public SmsCollectionTimerTask(ServletContext servletContext){
		this.servletContext = servletContext;
		
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		dataSource = (DataSource)context.getBean("sqlServerDataSource");	// ��ȡSqlServer�������ӳ�
		baseSqlMapDAO = (BaseSqlMapDAO)context.getBean("baseSqlMapDAO");// ��ȡmysqlserver����������
		if (log.isDebugEnabled())
			log.debug("���Ųɼ���������");
	}
	
	//����
	public SmsCollectionTimerTask(){
	}
	/**
	 * 1�����Ž��գ�mysql���ݿ��������ݡ� 2:
	 * ����ת����sqlserver��ѯ������ݹ�����Ա��Ȼ���Ͷ��Ÿ�������Ա��mysql�����Ӷ�����Ϣ��
	 */
	@Override
	public void run() {

		String connState = ""; 
		try { 
		do { 
			connState = smpsend.myProxy.getConnState();
		} while (true); 
		} catch (Exception e) { 
		e.printStackTrace(); 
			return; 
		}
		// baseSqlMapDAO.update("SmsManage.insertInceptSms", param);
	}
	
	//���Խ��ն���
	public static void main(String[] args)
	{
		SmsCollectionTimerTask sm=new SmsCollectionTimerTask() ;
		sm.run();
	}
}
