/*
============================================================================
��Ȩ���� (C) 2008-2010 �����ǻ㣨�������Ƽ����޹�˾������������Ȩ����
��վ��ַ��http://www.javamall.com.cn

����������ȫ���ء������û���ȨЭ�顷�Ļ����ϣ��������Ӧ�����κ���;��������
ҵ��;����������֧�������Ȩ��Ȩ���á��������û���ȨЭ�顷���Դ����ǵ���վ���أ�
������ķ��ɷ��գ���Ҳ������ϵ���ǻ������汾����ȨЭ�顣��δ����Ȩ����²�
����Գ���������κ���ʽ�κ�Ŀ�ĵ��޸Ļ��ٷ�����
============================================================================
*/
package com.enation.javashop.core.model.support;

import com.enation.javashop.core.model.Delivery;

public class DeliveryDTO  {
	
	private Delivery delivery;
	private String reason;
	private String[] sn;
	private String[] name;
	private String[] num;
	private Integer[] item_id;
	
	public String[] getName() {
		return name;
	}
	public void setName(String[] name) {
		this.name = name;
	}

	public String[] getNum() {
		return num;
	}
	public void setNum(String[] num) {
		this.num = num;
	}
	public String[] getSn() {
		return sn;
	}
	public void setSn(String[] sn) {
		this.sn = sn;
	}
	
	public Delivery getDelivery() {
		return delivery;
	}
	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}
	public Integer[] getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer[] item_id) {
		this.item_id = item_id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
