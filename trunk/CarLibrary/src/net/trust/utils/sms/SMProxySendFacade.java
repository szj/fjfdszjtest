/**
 * ˵�������ض��Ŵ������ࡣ
 * 		 ���� 
 * 			ProcessRecvDeliverMsg��CMPPMessage msg�����ն���
 * 		 ���� 
 * 			SendMessage��SmsBean sms��		��������ŵķ���
 * 			CarLibrarySendSms��SmsBean sms����������ר��
 * ʱ�䣺2008-12-16
 * 
 */
package net.trust.utils.sms;

//������ķ�������

public interface SMProxySendFacade {

	/**
	 * ��Ϊ���ŷ����ദ�������ࣩ
	 * 
	 * @param �����࣬�����ֻ��ţ����ݣ����
	 */
	public int SendMessage(SmsBean sms);

	
}
