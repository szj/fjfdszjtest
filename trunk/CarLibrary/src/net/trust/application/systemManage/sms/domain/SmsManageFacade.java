package net.trust.application.systemManage.sms.domain;

import java.util.HashMap;
import java.util.List;

/**
 * ���Ź���
 *
 */
public interface SmsManageFacade {
	/**
	 * ��ȡ���յ��ļ�¼�� 
	 * @param map
	 * @return
	 */
	public int findInceptSmsCount(HashMap map);
	/**
	 * ��ȡ���յ��ļ�¼
	 * @param map
	 * @return
	 */
	public List findInceptSms(HashMap map);
	/**
	 * �޸Ľ��յ��Ķ��� ����״̬
	 * @param map
	 * @return
	 */
	public int updateInceptSms(HashMap map);
	
	
	/**
	 * ��ѯ���͵Ķ��ż�¼����
	 * @param map
	 * @return
	 */
	public int findSendSmsRecordCount(HashMap map);
	/**
	 * ��ѯ���͵Ķ��ż�¼
	 * @param map
	 * @return
	 */
	public List findSendSmsRecord(HashMap map);
	/**
	 * ��¼Ҫ���͵Ķ�������
	 * @param map
	 * @return
	 */
	public int insertSendSmsRecord(HashMap map);
	/**
	 * 2008-12-22
	 * Ⱥ����������
	 * @param map
	 * @return
	 */	
	public int smporxySend(HashMap map);
	/**
	 * ���·���
	 * @param map
	 * @return
	 */
	public int updateResendSms(HashMap map);
	
	/**
	 * ȡ�����ŷ���
	 * @param map
	 * @return
	 */
	public int updateSendSmsCancel(HashMap map);
	
	/**
	 * 2009-01-17
	 * ��ѯϵͳ����������Ϣ
	 * @param map
	 * @return
	 */
	public List findSystemConfig(HashMap map);
	/**
	 * 2009-01-17
	 * �޸�ϵͳ����������Ϣ
	 * @param map
	 * @return
	 */
	public int updateSystemConfig(HashMap map);
}
