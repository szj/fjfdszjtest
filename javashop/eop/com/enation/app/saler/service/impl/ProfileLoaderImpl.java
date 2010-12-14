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
package com.enation.app.saler.service.impl;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;

import com.enation.app.saler.service.IProfileLoader;
import com.enation.eop.EopSetting;

public class ProfileLoaderImpl implements IProfileLoader {

	//D:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/ROOT/products/base/profile.xml
	public Document load(String productId) {
		String xmlFile = EopSetting.PRODUCTS_STORAGE_PATH+"/"+productId +"/profile.xml"; 
		xmlFile="file:///"+xmlFile;
		try {
		    DocumentBuilderFactory factory = 
		    DocumentBuilderFactory.newInstance();
		    DocumentBuilder builder = factory.newDocumentBuilder();
		    Document document = builder.parse(xmlFile);
		    return document;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("load ["+productId +"] profile error" );
		} 	 
		 
	}

}
