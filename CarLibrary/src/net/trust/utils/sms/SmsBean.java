package net.trust.utils.sms;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * ���Ŵ������
 * @author chenqf
 * 
 * �޸ģ�2008-12-13,fjfdszj
 * ԭ�򣺶��ŷ��ͷ�ʽ����Ϊ���ط�ʽ�����ֻ��Ų���Ҫ��86��ͬʱ��Ϊ֧��Ⱥ���ķ�ʽ
 */
public class SmsBean implements Serializable {
	private ArrayList mobileNoList;	//�ֻ�����,Ⱥ���ֻ�������
	private String smsContent;			//��������
	private String sn;					//���кţ����ݿ��д洢����
	/**
	 * ��ȡ���к�
	 * @return
	 */
	public String getSn() {
		return sn;
	}
	/**
	 * �������к�
	 * @param sn
	 */
	public void setSn(String sn) {
		this.sn = sn;
	}
	/**
	 * ��ȡ��������
	 * @return
	 */
	public String getSmsContent() {
		return smsContent;
	}
	/**
	 * ���÷�����Ϣ���� (Ӧ����70���ַ�����,����������,1��������1���ַ����������Ȳ��ֵ����ݽ��ᶪʧ)
	 * @param smsContent
	 */
	public void setSmsContent(String smsContent) {
		this.smsContent = smsContent;
	}
	/**
	 * @return the mobileNoList
	 */
	public ArrayList getMobileNoList() {
		return mobileNoList;
	}
	/**
	 * @param mobileNoList the mobileNoList to set
	 */
	public void setMobileNoList(ArrayList mobileNoList) {
		this.mobileNoList = mobileNoList;
	}
}
