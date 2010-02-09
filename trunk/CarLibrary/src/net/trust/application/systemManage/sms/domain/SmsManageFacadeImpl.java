package net.trust.application.systemManage.sms.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.utils.sms.SMProxySendFacade;
import net.trust.utils.sms.SmsBean;

/**
 * ���Ź���
 * 
 */
public class SmsManageFacadeImpl implements SmsManageFacade {
	private BaseSqlMapDAO baseSqlMapDAO;

	private SMProxySendFacade smproxySendFacade;

	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}

	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}

	/**
	 * ��ȡ���յ��ļ�¼��
	 * 
	 * @param map
	 * @return
	 */
	public int findInceptSmsCount(HashMap map) {
		return ((Integer) baseSqlMapDAO.queryForObject(
				"SmsManage.findInceptSmsCount", map));
	}

	/**
	 * ��ȡ���յ��ļ�¼
	 * 
	 * @param map
	 * @return
	 */
	public List findInceptSms(HashMap map) {
		return baseSqlMapDAO.queryForList("SmsManage.findInceptSms", map);
	}

	/**
	 * �޸Ľ��յ��Ķ��� ����״̬
	 * 
	 * @param map
	 * @return
	 */
	public int updateInceptSms(HashMap map) {
		return baseSqlMapDAO.update("SmsManage.updateInceptSms", map);
	}

	/**
	 * ��ѯ���͵Ķ��ż�¼����
	 * 
	 * @param map
	 * @return
	 */
	public int findSendSmsRecordCount(HashMap map) {
		return ((Integer) baseSqlMapDAO.queryForObject(
				"SmsManage.findSendSmsRecordCount", map));
	}

	/**
	 * ��ѯ���͵Ķ��ż�¼
	 * 
	 * @param map
	 * @return
	 */
	public List findSendSmsRecord(HashMap map) {
		return baseSqlMapDAO.queryForList("SmsManage.findSendSmsRecord", map);
	}

	/**
	 * ��¼Ҫ���͵Ķ�������
	 * 
	 * @param map
	 * @return 1:�ɹ� -100���ǼǷ��Ͷ��ż�¼ʧ�� -200:Ҫ���͵Ķ����ѱ���¼��������ʧ����ͨ���б��ѯ����¼������·���
	 */
	public int insertSendSmsRecord(HashMap map) {
		String sendSmsId = baseSqlMapDAO.sequences("send_sms_id");
		map.put("sendSmsId", sendSmsId);
		int st = baseSqlMapDAO.update("SmsManage.insertSendSmsRecord", map);
		if (st == 0) {
			return -100; // �ǼǷ��Ͷ��ż�¼ʧ��
		}

		SmsBean smsBean = new SmsBean();
		ArrayList mobileList = new ArrayList();
		mobileList.add(map.get("mobileNo").toString());
		smsBean.setMobileNoList(mobileList);
		smsBean.setSmsContent(map.get("smsContent").toString());
		smsBean.setSn("");
		try{
		st = smproxySendFacade.SendMessage(smsBean);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		if (st == 1) {
			map.clear();
			map.put("sendSmsId", sendSmsId); // ��ˮ��
			baseSqlMapDAO.update("SmsManage.updateSendSmsState", map);
			return 1;
		} else {
			return -200; // Ҫ���͵Ķ����ѱ���¼��������ʧ����ͨ���б��ѯ����¼������·���
		}
	}

	/**
	 * ���·���
	 * 
	 * @param map
	 * @return 1:�ɹ� -200��Ҫ���͵Ķ����ѱ���¼��������ʧ����ͨ���б��ѯ����¼������·���
	 */
	public int updateResendSms(HashMap map) {
		map = (HashMap) baseSqlMapDAO.queryForObject(
				"SmsManage.findSendSmsRecord", map);
		String sn = map.get("send_sms_id").toString();
		SmsBean smsBean = new SmsBean();
		ArrayList mobileList = new ArrayList();
		mobileList.add(map.get("call_phone").toString());
		smsBean.setMobileNoList(mobileList);
		smsBean.setSmsContent(map.get("send_content").toString());
		smsBean.setSn("");
		int st=0;
		try{
		 st = smproxySendFacade.SendMessage(smsBean);
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}
		try {
			Thread.sleep(1500);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		if (st == 1) {
			map.clear();
			map.put("sendSmsId", sn); // ��ˮ��
			baseSqlMapDAO.update("SmsManage.updateSendSmsState", map);
			return 1;
		} else {
			return -200; // Ҫ���͵Ķ����ѱ���¼��������ʧ����ͨ���б��ѯ����¼������·���
		}
	}

	/**
	 * Ⱥ���������� 2008-12-22
	 * 
	 * @param map
	 * @return 1:�ɹ� -100���ǼǷ��Ͷ��ż�¼ʧ�� -200:Ҫ���͵Ķ����ѱ���¼��������ʧ����ͨ���б��ѯ����¼������·���
	 */
	public int smporxySend(HashMap map) {
		// ���ط�ʽ���Ͷ���
		SmsBean smsBean = new SmsBean();
		// �����ֻ���
		ArrayList mobileList = new ArrayList();
		String mobilesStr = map.get("mobiles").toString();
		String[] mobileArray = mobilesStr.split(";");
		for (int i = 0; i < mobileArray.length; i++) {
			mobileList.add(mobileArray[i]);
		}
		smsBean.setMobileNoList(mobileList);
		String staffIdStr=map.get("staffId").toString();
		String cityIdStr=map.get("cityId").toString();
		String contentStr=map.get("smsContext").toString();
		smsBean.setSmsContent(contentStr);// ��������
		smsBean.setSn("");
		int st=0;
		try{
			st = smproxySendFacade.SendMessage(smsBean);
		}catch(Exception e)
		{
			System.out.println(e.toString());
		}

		if (st == 1) {
			// ���ͳɹ����ݿ⣬���Ӽ�¼
			for (int i = 0; i < mobileArray.length; i++) {
				//��������
				String sendSmsId = baseSqlMapDAO.sequences("send_sms_id");
				map.clear();
				map.put("staffId", staffIdStr);
				map.put("cityId", cityIdStr);
				map.put("sendSmsId", sendSmsId);
				map.put("callPhone", mobileArray[i]);
				map.put("sendContent", contentStr);
				map.put("sourceOrderType", "5");
				st = baseSqlMapDAO.update("SmsManage.insertSendSmsRecord", map);
				if (st == 0) {
					return -100; // �ǼǷ��Ͷ��ż�¼ʧ��
				} else {
					//��������
					map.clear();
					map.put("sendSmsId", sendSmsId); // ��ˮ��
					baseSqlMapDAO.update("SmsManage.updateSendSmsState", map);
				}
			}
			return 1;
		} else {
			return -200; // Ҫ���͵Ķ����ѱ���¼��������ʧ����ͨ���б��ѯ����¼������·���
		}
	}
	
	/**
	 * 2009-01-17
	 * ��ѯϵͳ����������Ϣ
	 * @param map
	 * @return
	 */
	public List findSystemConfig(HashMap map){
		return baseSqlMapDAO.queryForList("SmsManage.systemConfig", map);
	}
	/**
	 * 2009-01-17
	 * �޸�ϵͳ����������Ϣ
	 * @param map
	 * @return
	 */
	public int updateSystemConfig(HashMap map){
		return baseSqlMapDAO.update("SmsManage.updatesystemConfig", map);
	}

	/**
	 * ȡ�����ŷ���
	 * 
	 * @param map
	 * @return
	 */
	public int updateSendSmsCancel(HashMap map) {
		return baseSqlMapDAO.update("SmsManage.updateSendSmsCancel", map);
	}

	/**
	 * @return the smproxySendFacade
	 */
	public SMProxySendFacade getSmproxySendFacade() {
		return smproxySendFacade;
	}

	/**
	 * @param smproxySendFacade
	 *            the smproxySendFacade to set
	 */
	public void setSmproxySendFacade(SMProxySendFacade smproxySendFacade) {
		this.smproxySendFacade = smproxySendFacade;
	}
}
