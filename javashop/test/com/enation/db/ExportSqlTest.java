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
package com.enation.db;

import org.junit.Before;
import org.junit.Test;

import com.enation.app.saler.service.IProductService;
import com.enation.app.saler.service.impl.ProfileCreator;
import com.enation.app.saler.service.impl.SqlExportService;
import com.enation.eop.context.EopContext;
import com.enation.eop.core.resource.model.EopSite;
import com.enation.framework.test.SpringTestSupport;


public class ExportSqlTest extends SpringTestSupport {
	@Before
	public void mock() {
		EopSite site = new EopSite();
		site.setUserid(1);
		site.setId(1);
		site.setThemeid(1);
		EopContext context = new EopContext();
		context.setCurrentSite(site);
		EopContext.setContext(context);
	}
	
	@Test
	public void testImport(){
		IProductService productService = this.getBean("productService");	
		productService.imported( "aaa","d:/test123.zip");
	}
	
	@Test
	public void testExport(){
		IProductService productService = this.getBean("productService");	
		productService.export("test123", true, true, true,true);
	}
	
	
	@Test
	public void testExportSql(){
		SqlExportService sqlExportService = this.getBean("sqlExportService");
		String sql  =sqlExportService.dumpSql();
		System.out.println(sql);
		
	}
	
	//@Test
	public void tesetCreateProfile(){
		ProfileCreator profileCreator = this.getBean("profileCreator");
		profileCreator.createProfile("d:/a.xml");
	}
}
