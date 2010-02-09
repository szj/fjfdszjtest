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
import com.huawei.insa2.comm.cmpp.message.CMPPMessage;

public interface SMProxySendFacadeback {

	/**
	 * ��Ϊ���ŷ����ദ�������ࣩ
	 * 
	 * @param �����࣬�����ֻ��ţ����ݣ����
	 */
	public int SendMessage(SmsBean sms);

	/**
	 * ��������ר�ã��ݻ���
	 * 
	 * @param sms
	 */
	public int CarLibrarySendSms(SmsBean sms);

	/**
	 * ����MyProxy�ַ����ŵĽ���
	 * ���ն��ź�Ĵ���,���ڵ������ͨ�����ط�ʽ����������utf-8
	 * @param msg
	 */
	public void ProcessRecvDeliverMsg(CMPPMessage msg);
}
