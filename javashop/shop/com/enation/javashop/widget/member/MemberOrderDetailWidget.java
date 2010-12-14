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
package com.enation.javashop.widget.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.enation.eop.sdk.widget.AbstractWidget;
import com.enation.framework.context.webcontext.ThreadContextHolder;
import com.enation.javashop.core.model.Delivery;
import com.enation.javashop.core.model.Order;
import com.enation.javashop.core.service.IMemberOrderManager;
import com.enation.javashop.core.service.IOrderManager;

public class MemberOrderDetailWidget extends AbstractMemberWidget {
	
	private IMemberOrderManager memberOrderManager;
	private IOrderManager orderManager;
	
	
	protected void config(Map<String, String> params) {
		// TODO Auto-generated method stub

	}

	
	protected void execute(Map<String, String> params) {
		this.setPageName("orderdetail");
		HttpServletRequest request =  ThreadContextHolder.getHttpRequest();
		String order_id = request.getParameter("order_id");
		int orderid = Integer.valueOf(order_id);
		Order order = memberOrderManager.getOrder(orderid);
		List orderLogList = memberOrderManager.listOrderLog(orderid);
		List orderItemsList = memberOrderManager.listGoodsItems(orderid);
		List pgk = orderManager.listGiftItems(0);
		List giftList  = memberOrderManager.listGiftItems(orderid);
		this.putData("order", order);
		this.putData("orderLogList", orderLogList);
		this.putData("orderItemsList", orderItemsList);
		this.putData("giftList", giftList);
	}

	public IMemberOrderManager getMemberOrderManager() {
		return memberOrderManager;
	}

	public void setMemberOrderManager(IMemberOrderManager memberOrderManager) {
		this.memberOrderManager = memberOrderManager;
	}

	public IOrderManager getOrderManager() {
		return orderManager;
	}

	public void setOrderManager(IOrderManager orderManager) {
		this.orderManager = orderManager;
	}

}
