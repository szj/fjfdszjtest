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
package com.enation.shop.goods;

import org.junit.Before;

import com.enation.eop.context.EopContext;
import com.enation.eop.core.resource.model.EopSite;
import com.enation.framework.test.SpringTestSupport;
import com.enation.javashop.core.service.IGoodsCatManager;

public class GoodsCatTest extends SpringTestSupport {
	
	private IGoodsCatManager goodsCatManager;
	
	@Before
	public void mock(){
		
		goodsCatManager = this.getBean("goodsCatManager");
		
        EopSite site = new EopSite();
        site.setUserid(2);
        site.setId(2);
		EopContext context  = new EopContext();
		context.setCurrentSite(site);
		EopContext.setContext(context);		
		
	}

}
