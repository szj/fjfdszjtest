package net.trust.datacollection.timer;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.datacollection.thread.DataCollectionThread;
import net.trust.utils.PubFunction;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * ���ݲɼ���ʱ����ͨ��������������
 *
 */
public class DataCollectionTimerTask extends TimerTask {
	private Log log = LogFactory.getLog(DataCollectionTimerTask.class);
	private ServletContext servletContext;
	private BaseSqlMapDAO baseSqlMapDAO;
	private Properties properties;
	private DataCollectionThread dataCollectionThread;
	
	public DataCollectionTimerTask(ServletContext servletContext){
		this.servletContext = servletContext;
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		baseSqlMapDAO = (BaseSqlMapDAO)context.getBean("baseSqlMapDAO");
		
		try {
			properties = new Properties();
			properties.load(getClass().getResourceAsStream("/net/trust/datacollection/timer/DataCollectionTimerTask.properties"));//����Properties�ļ���
		} catch (IOException e) {
			e.printStackTrace();
		}	
		
		if (log.isDebugEnabled())
			log.debug("���ݲɼ���������");
	}
	
	/**
	 * ȡֵ��ʽ 1��ʵʱ 2������ 3������ 4������ 5������ 
	 * 		Select * from td_system_para where para_type = 'INTER_FETCH_CONFIG' and para_name = 'FETCH_MODE'
	 */
	@Override
	public void run() {
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		int currentlyHour = cal.get(Calendar.HOUR_OF_DAY);
		List dataCollectionConfigList = null;
		
		if (log.isDebugEnabled())
			log.debug("���ղɼ�����");
		//���췽ʽȡ�����ݲɼ�����
		dataCollectionConfigList = findDataCollectionConfig(2, currentlyHour);
		getDataCollConfigDetail(dataCollectionConfigList);
		
		
		//���ܷ�ʽȡ�����ݲɼ�����
		String weekDay = (new SimpleDateFormat("E")).format(date);	//ȡ�õ�ǰʱ��Ϊ���ڼ�
		if (properties.get("Timer.weekDay").equals(weekDay)){	//�������е�ʱ��Ա��Ƿ���Կ�ʼִ��
			if (log.isDebugEnabled())
				log.debug("���ܲɼ�����");
			
			dataCollectionConfigList = findDataCollectionConfig(3, currentlyHour);
			getDataCollConfigDetail(dataCollectionConfigList);
		}//if
		
		
		//���·�ʽȡ�����ݲɼ�����
		if (Integer.valueOf(properties.get("Timer.monthDay").toString()) == date.getDay()){	//�������е�ʱ��Ա��Ƿ���Կ�ʼִ��
			if (log.isDebugEnabled())
				log.debug("���²ɼ�����");
			
			dataCollectionConfigList = findDataCollectionConfig(4, currentlyHour);
			getDataCollConfigDetail(dataCollectionConfigList);
		}//if
		
		
		//���귽ʽȡ�����ݲɼ�����
		if (Integer.valueOf(properties.get("Timer.yearMonth").toString()) == date.getYear()){	//�������е�ʱ��Ա��Ƿ���Կ�ʼִ��
			if (Integer.valueOf(properties.get("Timer.yearDay").toString()) == date.getDay()) {
				if (log.isDebugEnabled())
					log.debug("����ɼ�����");
				
				dataCollectionConfigList = findDataCollectionConfig(5, currentlyHour);
				getDataCollConfigDetail(dataCollectionConfigList);
			}
		}//if
	}
	
	
	/**
	 * ��ѯ���ݲɼ�����
	 * @param fetchMode	�ɼ���ʽ
	 * @param collTime	�ɼ�ʱ�䣨��λ Сʱ��
	 * @return
	 */
	private List findDataCollectionConfig(int fetchMode, int collTime){
		HashMap param = new HashMap();
		param.put("fetchMode", ""+fetchMode);
		param.put("collTime", ""+collTime);
		return baseSqlMapDAO.queryForList("InterFatchConfig.findDataCollectionConifg", param);
	}
	
	/**
	 * ȡ�����ݲɼ�������ϸ
	 * @param dataCollectionConfigList
	 */
	private void getDataCollConfigDetail(List dataCollectionConfigList){
		Iterator dataCollectionConfigIt = dataCollectionConfigList.iterator();
		HashMap dataCollectionConfigMap = null;
		HashMap param = null;
		String interFetchConfigId = null;
		String interSelectSql = null;
		String localSelectSql = null;
		String localInsertSql = null;
		String localUpdateSql = null;
		
		while (dataCollectionConfigIt.hasNext()){
			interFetchConfigId = (String)dataCollectionConfigIt.next();
			param = new HashMap();
			param.put("interFetchConfigId", interFetchConfigId);
			dataCollectionConfigMap = (HashMap)baseSqlMapDAO.queryForObject("InterFatchConfig.findInterFatchConfig", param);
			
			interSelectSql = PubFunction.getNulltoStr(dataCollectionConfigMap.get("inter_select_sql")).replaceAll("''", "'");
			localSelectSql = PubFunction.getNulltoStr(dataCollectionConfigMap.get("local_select_sql")).replaceAll("''", "'");
			localInsertSql = PubFunction.getNulltoStr(dataCollectionConfigMap.get("local_insert_sql")).replaceAll("''", "'");
			localUpdateSql = PubFunction.getNulltoStr(dataCollectionConfigMap.get("local_update_sql")).replaceAll("''", "'");
			
			if (log.isDebugEnabled())
				log.debug("������"+dataCollectionConfigMap.get("inter_fetch_config_name")+"���ɼ��߳�");
			//�����̣߳����߳���ִ�����ݲɼ�
			dataCollectionThread = new DataCollectionThread(dataCollectionConfigMap.get("inter_fetch_config_name").toString(), interSelectSql, localSelectSql, localInsertSql, localUpdateSql, servletContext);
			dataCollectionThread.start();
		}
	}
}
