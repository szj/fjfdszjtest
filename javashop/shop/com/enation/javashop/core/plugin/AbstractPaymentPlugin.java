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
package com.enation.javashop.core.plugin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.enation.eop.model.Member;
import com.enation.eop.sdk.user.UserServiceFactory;
import com.enation.framework.context.webcontext.ThreadContextHolder;
import com.enation.framework.plugin.AutoRegisterPlugin;
import com.enation.javashop.core.model.Order;
import com.enation.javashop.core.model.PaymentLog;
import com.enation.javashop.core.service.IOrderFlowManager;
import com.enation.javashop.core.service.IOrderManager;
import com.enation.javashop.core.service.IPaymentManager;

public abstract class AbstractPaymentPlugin extends AutoRegisterPlugin {
	private IPaymentManager paymentManager;
	private IOrderFlowManager orderFlowManager;
	private IOrderManager orderManager; 
	protected final Logger logger = Logger.getLogger(getClass());
	protected String getCallBackUrl(){
		HttpServletRequest request  =  ThreadContextHolder.getHttpRequest();
		String serverName =request.getServerName();
		String paymentId = request.getParameter("paymentid");
		int port  = request.getLocalPort();
		String contextPath = request.getContextPath();
		String orderId = request.getParameter("orderid"); 
		return "http://"+serverName+":"+port+contextPath+"/widget?type=paywidget&action=callback&paymentid="+paymentId+"&orderid="+orderId;
	}
	
	protected String getShowUrl(){
		
		HttpServletRequest request  =  ThreadContextHolder.getHttpRequest();
		String paymentId = request.getParameter("paymentid");
		String serverName =request.getServerName();	
		int port  = request.getLocalPort();
		String contextPath = request.getContextPath();		
		return "http://"+serverName+":"+port+contextPath+"/widget?type=paywidget&action=show&paymentid="+paymentId;
	}
	
	protected Map<String,String> getConfigParams(){
		HttpServletRequest request  =  ThreadContextHolder.getHttpRequest();
		String paymentId = request.getParameter("paymentid");
		
		return this.paymentManager.getConfigParams(Integer.valueOf(paymentId));
	}
	
	protected void paySuccess(Integer orderId){
		Order order  = orderManager.get(orderId);
		PaymentLog paymentLog =  new PaymentLog();
		Member member  = UserServiceFactory.getUserService().getCurrentMember();
		if(member!=null){
			paymentLog.setMember_name(member.getUname());
			paymentLog.setMember_id(member.getMember_id());
		}
		
		paymentLog.setPay_type(order.getPayment_type());
		paymentLog.setMoney(order.getOrder_amount());		
		paymentLog.setOrder_id(orderId);
		paymentLog.setPay_method(order.getPayment_name());
		this.orderFlowManager.pay(paymentLog);
	}
	
	public IPaymentManager getPaymentManager() {
		return paymentManager;
	}
	public void setPaymentManager(IPaymentManager paymentManager) {
		this.paymentManager = paymentManager;
	}

	public IOrderFlowManager getOrderFlowManager() {
		return orderFlowManager;
	}

	public void setOrderFlowManager(IOrderFlowManager orderFlowManager) {
		this.orderFlowManager = orderFlowManager;
	}

	public IOrderManager getOrderManager() {
		return orderManager;
	}

	public void setOrderManager(IOrderManager orderManager) {
		this.orderManager = orderManager;
	}
	
	
}
