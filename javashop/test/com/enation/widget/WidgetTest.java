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
package com.enation.widget;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;

import org.junit.Before;
import org.junit.Test;

import com.enation.eop.context.EopContext;
import com.enation.eop.core.resource.model.EopSite;
import com.enation.eop.sdk.user.UserServiceFactory;
import com.enation.eop.sdk.widget.IWidget;
import com.enation.framework.test.SpringTestSupport;

public class WidgetTest extends SpringTestSupport {
	
	@Before
	public void mock(){
		 UserServiceFactory.isTest=1;
		 
        EopSite site = new EopSite();
        site.setUserid(2);
        site.setId(2);
		EopContext context  = new EopContext();
		context.setCurrentSite(site);
		EopContext.setContext(context);		
	}
	
	@Test
	public void goodsWidgetTest() throws ServletException, IOException{
 
	    
		Map<String,String>   params =new HashMap<String,String>();
		params.put("tag_id", "1");		
		
		IWidget widget= (IWidget)this.getBean("goods_list");
		String content = widget.process(params);
		System.out.println(content);
	  

	}
	
	
	
	@Test
	public void catWidgetTest() throws ServletException, IOException{
 
	    
		Map<String,String>   params =new HashMap<String,String>();
		params.put("tag_id", "1");		
		
		IWidget widget= (IWidget)this.getBean("goods_cat");
		String content = widget.process(params);
		System.out.println(content);
	  

	}
		
	
	
	
}
