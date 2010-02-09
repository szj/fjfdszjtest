package net.trust.datacollection.thread;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
/**
 * ���ݲɼ���ʱ����DataCollectionTimerTask���ǵ��ø÷���
 * �߳�DataCollectionTimerListener
 *
 */
public class DataCollectionThread extends Thread {
	private Log log = LogFactory.getLog(DataCollectionThread.class);
	
	private String interFetchConfigName;//�ɼ����������
	
	private String interSelectSql;	//�ɼ��ӿ�����Select SQL���
	private String localSelectSql;	//���ز�ѯSQL�������ж������Ƿ��Ѵ���
	private String localInsertSql;	//�������ݱ�Insert SQL���
	private String localUpdateSql;	//�������ݱ�Update SQL���
	private ServletContext servletContext;
	private BaseSqlMapDAO baseSqlMapDAO;
	
	boolean runflag = true;

	public DataCollectionThread(){}
	/**
	 * @param interSelectSql	�ɼ��ӿ�����Select SQL���
	 * @param localSelectSql	���ز�ѯSQL�������ж������Ƿ��Ѵ���
	 * @param localInsertSql	�������ݱ�Insert SQL���
	 * @param localUpdateSql	�������ݱ�Update SQL���
	 * @param servletContext
	 */
	public DataCollectionThread(String interFetchConfigName, String interSelectSql, String localSelectSql, String localInsertSql, String localUpdateSql, ServletContext servletContext){
		this.interFetchConfigName = interFetchConfigName;
		
		this.interSelectSql = interSelectSql;
		this.localSelectSql = localSelectSql;
		this.localInsertSql = localInsertSql;
		this.localUpdateSql = localUpdateSql;
		this.servletContext = servletContext;
	}
	
	public void run() {
		if (log.isDebugEnabled())
			log.debug("�̡߳�"+interFetchConfigName+"����ʼִ�вɼ�");
		
		//ȡ��Spring������
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		DataSource dataSource = (DataSource)context.getBean("sqlServerDataSource");	//��ȡSqlServer�������ӳ�
		baseSqlMapDAO = (BaseSqlMapDAO)context.getBean("baseSqlMapDAO");	//��ȡMySql��Ibatis���ݲ�������
		
		try {
			Connection conn = dataSource.getConnection();
			Statement stem = conn.createStatement();
			if (log.isDebugEnabled())
				log.debug(interSelectSql);
			ResultSet rs = stem.executeQuery(interSelectSql);
			
			boolean localSelectFlag = false, localInsertFlag = false, localUpdateFlag = false;
			
			//�жϡ���ѯMySql������Ƿ��Ѵ��ڸü�¼����SQL�Ƿ�Ϊ�� 
			if (null != localSelectSql && !"".equals(localSelectSql)){
				localSelectFlag = true;
			}//if
			//�жϡ�MySql��Insert����SQL�Ƿ�Ϊ��
			if (null != localInsertSql && !"".equals(localInsertSql)){
				localInsertFlag = true;
			}//if
			//�жϡ�MySql��Update����SQL�Ƿ�Ϊ��
			if (null != localUpdateSql && !"".equals(localUpdateSql)){
				localUpdateFlag = true;
			}//if
			
			if (localSelectFlag){	//��select��
				List selectField = createField(localSelectSql);
				
				if (localInsertFlag){	//��insert��
					List insertField = createField(localInsertSql);
					
					if (localUpdateFlag){	//��update��
						List updateField = createField(localUpdateSql);
						
						while (rs.next()){
							if (findIsExistIbatisSql(localSelectSql, selectField, rs) == 0){//�ж����ݿ��Ƿ��Ѵ��ڸ����ݣ�������insert������update
								executeIbatisSql(localInsertSql, insertField, rs);	//��������insert
							}else{
								executeIbatisSql(localUpdateSql, updateField, rs);	//������update
							}//if
						}
						
					}else{
						while (rs.next()){
							if (findIsExistIbatisSql(localSelectSql, selectField, rs) > 0){//�ж����ݿ��Ƿ��Ѵ��ڸ����ݣ��Ѵ���������
								executeIbatisSql(localInsertSql, insertField, rs);	//ִ��insert����
							}
						}
						
					}//if
					
				}else if (localUpdateFlag){
					List updateField = createField(localUpdateSql);
					while (rs.next()){
						executeIbatisSql(localUpdateSql, updateField, rs);	//������update
					}
				}//if
				
			}else{
				if (localInsertFlag){	//��insert��
					List insertField = createField(localInsertSql);
					while (rs.next()){
						executeIbatisSql(localInsertSql, insertField, rs);	//��������insert
					}
					
				}else if (localUpdateFlag){
					List updateField = createField(localUpdateSql);
					while (rs.next()){
						executeIbatisSql(localUpdateSql, updateField, rs);	//������update
					}
				}//if
			}//if
			
			if (log.isDebugEnabled())
				log.debug("�̡߳�"+interFetchConfigName+"�������ɼ�");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//try
	}
	
	/**
	 * ��ѯMySql������Ƿ��Ѵ��ڸü�¼ 
	 * @param sql	Ҫִ�е�SQL���辭������滻�����ϲ���������
	 * @param field	�ֶ��б���ԭSQL��ȡ������
	 * @param rs	SqlServerִ���������صĽ����
	 * @return
	 * @throws SQLException
	 */
	public int findIsExistIbatisSql(String sql, List field, ResultSet rs) throws SQLException{
		Iterator it = field.iterator();
		String oldChar = "";
		String newChar = "";
		String tmp1 = "";
		String tmp2 = "";
		while (it.hasNext()){
			tmp1 = (String)it.next();
			oldChar = "::" + tmp1 + "::";
			newChar = "NULL";
			if (null != rs.getString(tmp1) && !"".equals(rs.getString(tmp1)))
				newChar = rs.getString(tmp1);
			
			tmp1 = sql.substring(0, sql.indexOf(oldChar));
			tmp2 = sql.substring(sql.indexOf(oldChar)+oldChar.length(), sql.length());
			sql = tmp1 + newChar + tmp2;
		}
		return ((Integer)baseSqlMapDAO.queryForObject("dynamicSqlCount", sql));
	}
	
	/**
	 * ִ��MySql��䣬����ִ��Insert Update
	 * @param sql	Ҫִ�е�SQL���辭������滻�����ϲ���������
	 * @param field	�ֶ��б���ԭSQL��ȡ������
	 * @param rs	SqlServerִ���������صĽ����
	 * @return
	 * @throws SQLException
	 */
	public int executeIbatisSql(String sql, List field, ResultSet rs) throws SQLException{
		Iterator it = field.iterator();
		String oldChar = "";
		String newChar = "";
		String tmp1 = "";
		String tmp2 = "";
		while (it.hasNext()){
			tmp1 = (String)it.next();
			oldChar = "::" + tmp1 + "::";
			newChar = "NULL";
			if (null != rs.getString(tmp1) && !"".equals(rs.getString(tmp1)))
				newChar = rs.getString(tmp1);
			
			tmp1 = sql.substring(0, sql.indexOf(oldChar));
			tmp2 = sql.substring(sql.indexOf(oldChar)+oldChar.length(), sql.length());
			sql = tmp1 + newChar + tmp2;
		}
		
		return baseSqlMapDAO.update("dynamicInsertAndUpdateSql", sql);
	}
	
	/**
	 * ����Ҫת�����ֶ���
	 * @param sql
	 * @return
	 */
	public List createField(String sql){
		List list = new ArrayList();
		String field = "";
		while (sql.indexOf("::") > -1){
			sql = sql.substring(sql.indexOf("::") + 2, sql.length());
			field = sql;
			field = field.substring(0, sql.indexOf("::"));
			list.add(field);
			sql = sql.substring(sql.indexOf("::") + 2, sql.length());
		}
		return list;
	}
	
	/**
	 * ֹͣ�߳�
	 */
	public synchronized void stopThread() {
		runflag = false;
	}

	/**
	 * ��ȡ�߳�����״̬
	 * @return
	 */
	public synchronized boolean getRunFlag() {
		return runflag;
	}
	
	public static void main(String arg[]){
		String a = "111";
		System.out.println(a.getClass().getName());
		
		
//		DataCollectionThread dataCollectionThread = new DataCollectionThread();
//		String sql = "INSERT INTO INTER_CAR_INFO"+
//					"		  (INTER_CAR_INFO_ID,"+
//					"		   CAR_MARK,"+
//					"		   CARID,"+
//					"		   CAR_GROUP,"+
//					"		   CAR_CLASS,"+
//					"		   CAR_TYPE,"+
//					"		   MOTORID,"+
//					"		   GSM_NUMBER,"+
//					"		   CAR_COLOR,"+
//					"		   COMPANYID,"+
//					"		   INSTALL_TIME,"+
//					"		   CAR_STATUS,"+
//					"		   LICENSE,"+
//					"		   REGIST_AGENT,"+
//					"		   REGIST_TIME,"+
//					"		   ACCIDENT_DATE,"+
//					"		   CAR_MUSTERTIME,"+
//					"		   CAR_MUSTERFLAG,"+
//					"		   LAST_LON,"+
//					"		   LAST_LAT,"+
//					"		   LAST_SPEED,"+
//					"		   LAST_ANGLE,"+
//					"		   LAST_TIME,"+
//					"		   LAST_FLAG,"+
//					"		   TERMINAL_VER,"+
//					"		   TERMINAL_UPDATE_TIME,"+
//					"		   MAX_SPEED,"+
//					"		   INBOUND_LIMIT,"+
//					"		   OUTBOUND_LIMIT,"+
//					"		   TERMINAL_REPORT,"+
//					"		   TERMINAL_REPORT_TIME,"+
//					"		   LAST_LOCATION,"+
//					"		   UPDATE_RECORD_DATE)"+
//					"		VALUES"+
//					"		  (pb_get_sequences(@in_seq_name:='INTER_CAR_INFO_ID'),"+
//					"		   '::CAR_MARK::',"+
//					"		   ::CARID::,"+
//					"		   ::CAR_GROUP::,"+
//					"		   ::CAR_CLASS::,"+
//					"		   '::CAR_TYPE::',"+
//					"		   '::MOTORID::',"+
//					"		   '::GSM_NUMBER::',"+
//					"		   '::CAR_COLOR::',"+
//					"		   '::COMPANYID::',"+
//					"		   '::INSTALL_TIME::',"+
//					"		   '::CAR_STATUS::',"+
//					"		   '::LICENSE::',"+
//					"		   '::REGIST_AGENT::',"+
//					"		   '::REGIST_TIME::',"+
//					"		   '::ACCIDENT_DATE::',"+
//					"		   '::CAR_MUSTERTIME::',"+
//					"		   '::CAR_MUSTERFLAG::',"+
//					"		   ::LAST_LON::,"+
//					"		   ::LAST_LAT::,"+
//					"		   ::LAST_SPEED::,"+
//					"		   ::LAST_ANGLE::,"+
//					"		   '::LAST_TIME::',"+
//					"		   ::LAST_FLAG::,"+
//					"		   ::TERMINAL_VER::,"+
//					"		   '::TERMINAL_UPDATE_TIME::',"+
//					"		   ::MAX_SPEED::,"+
//					"		   ::INBOUND_LIMIT::,"+
//					"		   ::OUTBOUND_LIMIT::,"+
//					"		   ::TERMINAL_REPORT::,"+
//					"		   '::TERMINAL_REPORT_TIME::',"+
//					"		   '::LAST_LOCATION::',"+
//					"		   NOW())";
//		List list = dataCollectionThread.createField(sql);
//		System.out.println(list);
//		sql = "	UPDATE inter_car_info"+
//				"   SET CAR_GROUP = ::CAR_GROUP::,"+
//				"       CAR_CLASS = ::CAR_CLASS::,"+
//				"       CAR_TYPE = ''::CAR_TYPE::'',"+
//				"       MOTORID = ''::MOTORID::'',"+
//				"       GSM_NUMBER = ''::GSM_NUMBER::'',"+
//				"       CAR_COLOR = ''::CAR_COLOR::'',"+
//				"       COMPANYID = ''::COMPANYID::'',"+
//				"       INSTALL_TIME = ''::INSTALL_TIME::'',"+
//				"       CAR_STATUS = ''::CAR_STATUS::'',"+
//				"       LICENSE = ''::LICENSE::'',"+
//				"       REGIST_AGENT = ''::REGIST_AGENT::'',"+
//				"       REGIST_TIME = ''::REGIST_TIME::'',"+
//				"       ACCIDENT_DATE = ''::ACCIDENT_DATE::'',"+
//				"       CAR_MUSTERTIME = ''::CAR_MUSTERTIME::'',"+
//				"       CAR_MUSTERFLAG = ''::CAR_MUSTERFLAG::'',"+
//				"       LAST_LON = ::LAST_LON::,"+
//				"       LAST_LAT = ::LAST_LAT::,"+
//				"       LAST_SPEED = ::LAST_SPEED::,"+
//				"       LAST_ANGLE = ::LAST_ANGLE::,"+
//				"       LAST_TIME = ''::LAST_TIME::'',"+
//				"       LAST_FLAG = ::LAST_FLAG::,"+
//				"       TERMINAL_VER = ::TERMINAL_VER::,"+
//				"       TERMINAL_UPDATE_TIME = ''::TERMINAL_UPDATE_TIME::'',"+
//				"       MAX_SPEED = ::MAX_SPEED::,"+
//				"       INBOUND_LIMIT = ::INBOUND_LIMIT::,"+
//				"       OUTBOUND_LIMIT = ::OUTBOUND_LIMIT::,"+
//				"       TERMINAL_REPORT = ::TERMINAL_REPORT::,"+
//				"       TERMINAL_REPORT_TIME = ''::TERMINAL_REPORT_TIME::'',"+
//				"       LAST_LOCATION = ''::LAST_LOCATION::'',"+
//				"       UPDATE_RECORD_DATE = NOW()"+
//				" WHERE CAR_MARK = ''::CAR_MARK::''"+
//				"   AND CARID = ::CARID::";
//		list = dataCollectionThread.createField(sql);
//		System.out.println(list);
	}
}
