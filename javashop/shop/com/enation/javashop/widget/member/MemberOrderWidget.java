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

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.enation.eop.sdk.widget.AbstractWidget;
import com.enation.framework.context.webcontext.ThreadContextHolder;
import com.enation.framework.database.Page;
import com.enation.javashop.core.service.IMemberOrderManager;

public class MemberOrderWidget extends AbstractMemberWidget {
	
	private IMemberOrderManager memberOrderManager;

	
	protected void execute(Map<String, String> params) {
		 HttpServletRequest request =  ThreadContextHolder.getHttpRequest();
		 String page  = request.getParameter("page");
		 page = (page == null || page.equals("")) ? "1" : page;
		 this.setPageName("myorder");
		 int pageSize = 20;
		 
		 Page ordersPage = memberOrderManager.pageOrders(Integer.valueOf(page), pageSize);
		 Long totalCount = ordersPage.getTotalCount();
		 
		 List ordersList = (List)ordersPage.getResult();
		 ordersList = ordersList == null ? new ArrayList() : ordersList;
		 
		 this.putData("totalCount", totalCount);
		 this.putData("pageSize", pageSize);
		 this.putData("page", page);
		 this.putData("ordersList", ordersList);
	}

	
	protected void config(Map<String, String> params) {
		
	}

	public IMemberOrderManager getMemberOrderManager() {
		return memberOrderManager;
	}

	public void setMemberOrderManager(IMemberOrderManager memberOrderManager) {
		this.memberOrderManager = memberOrderManager;
	}

}
