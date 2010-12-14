/*
============================================================================
版权所有 (C) 2008-2010 易族智汇（北京）科技有限公司，并保留所有权利。
网站地址：http://www.javamall.com.cn

您可以在完全遵守《最终用户授权协议》的基础上，将本软件应用于任何用途（包括商
业用途），而不必支付软件版权授权费用。《最终用户授权协议》可以从我们的网站下载；
如果担心法律风险，您也可以联系我们获得书面版本的授权协议。在未经授权情况下不
允许对程序代码以任何形式任何目的的修改或再发布。
============================================================================
*/
package com.enation.javashop.widget.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.enation.eop.sdk.widget.AbstractWidget;
import com.enation.framework.context.webcontext.ThreadContextHolder;
import com.enation.javashop.core.model.Order;
import com.enation.javashop.core.service.IOrderManager;
import com.enation.javashop.widget.cart.checkout.CheckOutWidget;

/**
 * 会员订单支付
 * @author kingapex
 *2010-4-12下午02:42:37
 */
public class MemberOrderPay extends AbstractMemberWidget {
	 
	private IOrderManager orderManager;
	private  HttpServletRequest  request;
	
	protected void config(Map<String, String> params) {

	}

	
	protected void execute(Map<String, String> params) {
		request  = ThreadContextHolder.getHttpRequest();
		Integer  orderId = this.getIntParam("orderId") ; 
		Order order  = orderManager.get(orderId);
		this.putData("order", order);
		this.freeMarkerPaser.setClz(CheckOutWidget.class);
//		this.setPageFolder("/widgets/cart");
		this.setPageName("orderPay");
	}

	
	private Integer getIntParam(String name){
		try{
		 return Integer.valueOf( request.getParameter(name) );
		}catch(RuntimeException e){
			e.printStackTrace();
			return null;
		}
	}

	
	public IOrderManager getOrderManager() {
		return orderManager;
	}

	public void setOrderManager(IOrderManager orderManager) {
		this.orderManager = orderManager;
	}

}
