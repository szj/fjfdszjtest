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

import com.enation.eop.model.Member;
import com.enation.eop.sdk.user.IUserService;
import com.enation.eop.sdk.user.UserServiceFactory;
import com.enation.eop.sdk.widget.AbstractWidget;
import com.enation.framework.context.webcontext.ThreadContextHolder;
import com.enation.framework.database.Page;
import com.enation.javashop.core.service.IPointHistoryManager;

public class MemberPointHistoryWidget extends AbstractMemberWidget {

	private IPointHistoryManager pointHistoryManager;

	
	protected void config(Map<String, String> params) {
		// TODO Auto-generated method stub

	}

	
	protected void execute(Map<String, String> params) {
		this.setPageName("member_pointhistory");
		IUserService userService = UserServiceFactory.getUserService();
		Member member = userService.getCurrentMember();
		HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		String page = request.getParameter("page");
		page = (page == null || page.equals("")) ? "1" : page;
		int pageSize = 20;
		Page pointHistoryPage = pointHistoryManager.pagePointHistory(Integer
				.valueOf(page), pageSize);
		Long pageCount = pointHistoryPage.getTotalPageCount();
		List pointHistoryList = (List) pointHistoryPage.getResult();
		pointHistoryList = pointHistoryList == null ? new ArrayList()
				: pointHistoryList;
		
		Long consumePoint = pointHistoryManager.getConsumePoint();
		Long gainedPoint = pointHistoryManager.getGainedPoint();

		this.putData("pageCount", pageCount);
		this.putData("pageSize", pageSize);
		this.putData("page", page);
		this.putData("pointHistoryList", pointHistoryList);
		this.putData("point", member.getPoint());
		this.putData("consumePoint", consumePoint);
		this.putData("gainedPoint", gainedPoint);
	}

	public IPointHistoryManager getPointHistoryManager() {
		return pointHistoryManager;
	}

	public void setPointHistoryManager(IPointHistoryManager pointHistoryManager) {
		this.pointHistoryManager = pointHistoryManager;
	}

}
