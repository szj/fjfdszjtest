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
import com.enation.javashop.core.service.ICommentsManager;
import com.enation.javashop.core.service.IMemberOrderManager;

public class MemberCommentsWidget extends AbstractMemberWidget {
	
	private ICommentsManager commentsManager;

	
	protected void execute(Map<String, String> params) {
		HttpServletRequest request =  ThreadContextHolder.getHttpRequest();
		String page  = request.getParameter("page");
		 page = (page == null || page.equals("")) ? "1" : page;
		 this.setPageName("mycomments");
		 int pageSize = 5;
		 
		 Page commentsPage = commentsManager.pageComments_Display(Integer.valueOf(page), pageSize);
		 Long totalCount = commentsPage.getTotalCount();
		 
		 List commentsList = (List)commentsPage.getResult();
		 commentsList = commentsList == null ? new ArrayList() : commentsList;
		 
		 this.putData("totalCount", totalCount);
		 this.putData("pageSize", pageSize);
		 this.putData("page", page);
		 this.putData("commentsList", commentsList);
	}

	
	protected void config(Map<String, String> params) {
		
	}

	public ICommentsManager getCommentsManager() {
		return commentsManager;
	}

	public void setCommentsManager(ICommentsManager commentsManager) {
		this.commentsManager = commentsManager;
	}

}
