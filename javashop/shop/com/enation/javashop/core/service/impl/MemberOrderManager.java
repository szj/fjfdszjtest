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
package com.enation.javashop.core.service.impl;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.enation.eop.impl.support.BaseSupport;
import com.enation.eop.model.Member;
import com.enation.eop.sdk.user.IUserService;
import com.enation.eop.sdk.user.UserServiceFactory;
import com.enation.framework.database.Page;
import com.enation.javashop.core.model.Delivery;
import com.enation.javashop.core.model.Order;
import com.enation.javashop.core.service.IMemberOrderManager;


public class MemberOrderManager extends BaseSupport implements
		IMemberOrderManager {

	
	public Page pageOrders(int pageNo, int pageSize) {
		IUserService userService = UserServiceFactory.getUserService();
		Member member = userService.getCurrentMember();
		
		String sql = "select * from order where member_id = ? order by create_time desc";
		Page rpage = this.baseDaoSupport.queryForPage(sql, pageNo, pageSize, member.getMember_id());
		List<Map> list = (List<Map>) (rpage.getResult());
		return rpage;
	}
	
	
	public Order getOrder(int order_id) {
		Order order = (Order)this.baseDaoSupport.queryForObject("select * from order where order_id = ?", Order.class, order_id);
		return order;
	}

	
	public Delivery getOrderDelivery(int order_id) {
		Delivery delivery = (Delivery)this.baseDaoSupport.queryForObject("select * from delivery where order_id = ?", Delivery.class, order_id);
		return delivery;
	}
	
	
	public List listOrderLog(int order_id) {
		String sql = "select * from order_log where order_id = ?";
		List list = this.baseDaoSupport.queryForList(sql, order_id);
		list = list == null ? new ArrayList() : list;
		return list;
	}

	
	public List listGoodsItems(int order_id) {
		String sql = "select * from order_items where order_id = ?";
		List list = this.baseDaoSupport.queryForList(sql, order_id);
		list = list == null ? new ArrayList() : list;
		return list;
	}

	
	public List listGiftItems(int orderid) {
		String sql  ="select * from order_gift where order_id=?";
		return this.baseDaoSupport.queryForList(sql, orderid);
	}

}
