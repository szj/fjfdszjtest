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
import com.enation.javashop.core.service.IAdvanceLogsManager;

public class MemberAdvanceLogsWidget extends AbstractMemberWidget {
	
	private IAdvanceLogsManager advanceLogsManager;

	
	protected void config(Map<String, String> params) {
		// TODO Auto-generated method stub

	}

	
	protected void execute(Map<String, String> params) {
		this.setPageName("member_advanceLogs");
		HttpServletRequest request =  ThreadContextHolder.getHttpRequest();
		 String page  = request.getParameter("page");
		 page = (page == null || page.equals("")) ? "1" : page;
		 int pageSize = 20;
		 Page advanceLogsPage = advanceLogsManager.pageAdvanceLogs(Integer.valueOf(page), pageSize);
		 Long pageCount = advanceLogsPage.getTotalPageCount();
		 List advanceLogsList = (List)advanceLogsPage.getResult();
			advanceLogsList = advanceLogsList == null ? new ArrayList() : advanceLogsList;
			IUserService userService = UserServiceFactory.getUserService();
			Member member = userService.getCurrentMember();
			this.putData("advanceLogsList", advanceLogsList);
			this.putData("member_advance", member.getAdvance());
			this.putData("pageSize", pageSize);
			this.putData("pageCount", pageCount);
			this.putData("page", page);
	}

	public IAdvanceLogsManager getAdvanceLogsManager() {
		return advanceLogsManager;
	}

	public void setAdvanceLogsManager(IAdvanceLogsManager advanceLogsManager) {
		this.advanceLogsManager = advanceLogsManager;
	}

}
