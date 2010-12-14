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
package com.enation.javashop.core.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.enation.eop.core.resource.model.EopSite;
import com.enation.framework.context.spring.SpringContextHolder;
import com.enation.framework.context.webcontext.ThreadContextHolder;
import com.enation.javashop.core.service.ICartManager;

public class ShopSessionListener implements HttpSessionListener {

	
	public void sessionCreated(HttpSessionEvent se) {
		
	}

	
	public void sessionDestroyed(HttpSessionEvent se) {
		String sessionid = se.getSession().getId();
		EopSite site  =(EopSite)ThreadContextHolder.getSessionContext().getAttribute("site_key");

		if(site!=null){
		ICartManager cartManager = SpringContextHolder.getBean("cartManager");
		cartManager.clean(sessionid,site.getUserid(),site.getId());
		//System.out.println("cart clean...");
		}
	}

}
