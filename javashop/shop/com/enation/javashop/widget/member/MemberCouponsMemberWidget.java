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

import com.enation.app.setting.service.ISettingService;
import com.enation.eop.sdk.widget.AbstractWidget;
import com.enation.framework.context.webcontext.ThreadContextHolder;
import com.enation.framework.database.Page;
import com.enation.javashop.core.service.IMemberCouponsManager;

public class MemberCouponsMemberWidget extends AbstractMemberWidget {
	
	private ISettingService settingService;
	private IMemberCouponsManager memberCouponsManager;

	
	protected void config(Map<String, String> params) {
		// TODO Auto-generated method stub

	}

	
	protected void execute(Map<String, String> params) {
		this.setPageName("member_coupons");
		String mc_use_times = settingService.getSetting("coupons", "coupon.mc.use_times");
		mc_use_times = mc_use_times == null ? "1" : mc_use_times;
		HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		String page = request.getParameter("page");
		page = (page == null || page.equals("")) ? "1" : page;
		int pageSize = 20;
		Page pageMemberCoupons = memberCouponsManager.pageMemberCoupons(Integer.valueOf(page), pageSize);
		Long pageCount = pageMemberCoupons.getTotalPageCount();
		List listMemberCoupons = (List)pageMemberCoupons.getResult();
		listMemberCoupons = listMemberCoupons == null ? new ArrayList() : listMemberCoupons;
		this.putData("listMemberCoupons", listMemberCoupons);
		this.putData("mc_use_times", mc_use_times);
		this.putData("pageSize", pageSize);
		this.putData("pageCount", pageCount);
		this.putData("page", page);
	}

	public ISettingService getSettingService() {
		return settingService;
	}

	public void setSettingService(ISettingService settingService) {
		this.settingService = settingService;
	}

	public IMemberCouponsManager getMemberCouponsManager() {
		return memberCouponsManager;
	}

	public void setMemberCouponsManager(IMemberCouponsManager memberCouponsManager) {
		this.memberCouponsManager = memberCouponsManager;
	}

}
