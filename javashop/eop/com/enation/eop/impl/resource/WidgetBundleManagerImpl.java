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
package com.enation.eop.impl.resource;

import java.util.List;

import com.enation.eop.core.resource.IWidgetBundleManager;
import com.enation.eop.core.resource.model.WidgetBundle;
import com.enation.eop.impl.support.BaseSupport;

public class WidgetBundleManagerImpl extends BaseSupport<WidgetBundle> implements
		 IWidgetBundleManager {

	
	public WidgetBundle getWidgetBundle(String widgetType) {
		String sql ="select * from widgetbundle where widgettype=?";
		return this.baseDaoSupport.queryForObject(sql, WidgetBundle.class, widgetType);
	}

	
	public List<WidgetBundle> getWidgetbundleList() {
		String sql ="select * from widgetbundle";
		return baseDaoSupport.queryForList(sql, WidgetBundle.class);
	}

	
	public void add(WidgetBundle widgetBundle) {
		this.baseDaoSupport.insert("widgetbundle", widgetBundle);
	}

 

}
