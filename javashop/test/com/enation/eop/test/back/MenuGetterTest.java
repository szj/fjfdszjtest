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
package com.enation.eop.test.back;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.enation.eop.impl.backend.MenuJsonGetter;

public class MenuGetterTest {
	
	@Before
	public void setup() {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "spring/*.xml" });
	 
	}
	
	
	
	@Test
	public void testGetJson(){
//		String json = MenuJsonGetter.getMenuJson(1, 1);
//		System.out.println(json);
	}
	
}
