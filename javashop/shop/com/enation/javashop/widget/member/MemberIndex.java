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

import java.util.Map;

import com.enation.eop.model.Member;
import com.enation.eop.sdk.user.IUserService;
import com.enation.eop.sdk.user.UserServiceFactory;
import com.enation.eop.sdk.widget.AbstractWidget;
import com.enation.javashop.core.service.IWelcomeInfoManager;

public class MemberIndex extends AbstractMemberWidget {
	
	private IWelcomeInfoManager welcomeInfoManager;

	
	protected void execute(Map<String, String> params) {
		 this.setPageName("index");
		 IUserService userService = UserServiceFactory.getUserService();
		 Member member = userService.getCurrentMember();
		 Map wel = welcomeInfoManager.mapWelcomInfo();
		 
		 this.putData("member", member);
		 this.putData("wel", wel);
	}

	
	protected void config(Map<String, String> params) {
		
	}

	public IWelcomeInfoManager getWelcomeInfoManager() {
		return welcomeInfoManager;
	}

	public void setWelcomeInfoManager(IWelcomeInfoManager welcomeInfoManager) {
		this.welcomeInfoManager = welcomeInfoManager;
	}
	

}
