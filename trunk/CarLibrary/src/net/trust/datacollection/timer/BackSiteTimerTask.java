package net.trust.datacollection.timer;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.utils.sms.SMProxySendFacade;
import net.trust.utils.sms.SmsBean;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class BackSiteTimerTask extends TimerTask {
	private Log log = LogFactory.getLog(BackSiteTimerTask.class);

	private BaseSqlMapDAO baseSqlMapDAO, sqlServerBaseSqlMapDAO; //sqlserver�������ӳ�����
	
	private SMProxySendFacade proxysend;
	
	//����������Ϣ
	private boolean backswitch=true;//��վ������ʶ
	private int expforehours=7;      //�ɳ�Ԥ����ʱʱ��

	//��ȡ������Ϣ
	private void Read_Conf()
	{
		//����������Ϣ
		HashMap param = null;
		List systemconfigList = baseSqlMapDAO.queryForList("SmsManage.systemConfig", param);
		Iterator<HashMap> systemconfig = systemconfigList.iterator();
		if (systemconfig.hasNext()) {
			HashMap systemconfig_element = systemconfig.next();
			backswitch=((Boolean)systemconfig_element.get("backswitch")).booleanValue();
			expforehours=((Integer)systemconfig_element.get("expforehours"));
		}	
	}
	
	//������
	public BackSiteTimerTask(ServletContext servletContext) {
		
		ApplicationContext context = WebApplicationContextUtils
				.getWebApplicationContext(servletContext);
		
		sqlServerBaseSqlMapDAO = (BaseSqlMapDAO) context.getBean("sqlServerBaseSqlMapDAO");
		
		baseSqlMapDAO = (BaseSqlMapDAO) context.getBean("baseSqlMapDAO");
		//���Ŵ�����
		proxysend=(SMProxySendFacade) context.getBean("smproxySendFacade");

		if (log.isDebugEnabled())
			log.debug("���Ųɼ���������");
	}

	//�����쳣��Ϣ����ÿ��10���ӱ���һ�Ρ�
	@Override
	public void run() {
		//��ȡ���������Ϣ
		Read_Conf();
		if(backswitch)
		{
			//IC���쳣����
			log.debug("��ʼ�����վ����!");
			BackSitePro();
		}
	}
	
	//��վ��������
	public void BackSitePro()
	{
		try {
			//��ѯ�쳣���ݻ�վ����
			HashMap param = null;
			List back_Site_Exception = sqlServerBaseSqlMapDAO.queryForList(
					"SmsManage.findBackSiteException", param);

			//2.ȷ����Ҫ���͵Ĺ���Ա
			HashMap map = new HashMap();
			Iterator<HashMap> car_ex = back_Site_Exception.iterator();
			//���ŷ�����
			while (car_ex.hasNext()) {
				HashMap car_ex_element = car_ex.next();
				map.clear();
				map.put("carMark", car_ex_element.get("CAR_MARK").toString());
				List ic_Admin_List = baseSqlMapDAO.queryForList(
						"SmsManage.findAdminUser", map);
				String sendSmsId = "";//��ˮ��
				String contentMsg = car_ex_element.get("content").toString();//��������
				String smsType = car_ex_element.get("type").toString();//����
				Iterator<HashMap> adminList = ic_Admin_List.iterator();
				
				HashMap admin_element = null;
				//1.���ӷ��Ͷ��ŵ����ݿ�
				param = new HashMap();
				//��ͨ����Ա
				if (adminList.hasNext()) {
					sendSmsId = baseSqlMapDAO.sequences("send_sms_id");
					admin_element = adminList.next();
					param.clear();
					param.put("sendSmsId", sendSmsId); //��ˮ��
					param.put("callStaffId", admin_element.get("astaff_info_id").toString()); //�����߶�ӦԱ����ID
					param.put("callManName", admin_element.get("astaff_name").toString()); 	//����������
					param.put("callPhone", admin_element.get("asms_phone").toString()); 	//�������ֻ�����
					param.put("sendContent", contentMsg);//��������
					param.put("staffId", admin_element.get("staff_info_id").toString()); //д�������ŵ��û�
					param.put("sourceOrderType", smsType); //ԭ������:IC���쳣 4����IC���쳣
					param.put("sourceOrderCode", ""); //Դ�����:��Ϊ��
					param.put("cityId", admin_element.get("city_id").toString()); //������
					
					baseSqlMapDAO.insert("SmsManage.insertSendSmsRecord", param);
					//2.���Ͷ���
					ArrayList mobileList = new ArrayList();
					mobileList.add(admin_element.get("asms_phone"));
					SmsBean smsBean = new SmsBean();
					smsBean.setMobileNoList(mobileList);
					smsBean.setSmsContent(contentMsg);
					smsBean.setSn("");
					int res=0;
					try{
						res = proxysend.SendMessage(smsBean);
					}catch(Exception e){
						System.out.println(e.toString());
					}
					//3.�޸����ݿ⣬˵���Ƿ��ͳɹ�
					if (res == 1) {
						param.clear();
						param.put("sendSmsId", sendSmsId); //��ˮ��
						baseSqlMapDAO.update("SmsManage.updateSendSmsState", param);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
