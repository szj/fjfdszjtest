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
package com.enation.javashop.core.plugin;

import com.enation.framework.plugin.AutoRegisterPlugin;

public abstract class AbstractGoodsPlugin extends AutoRegisterPlugin implements  IGoodsFillAddInputDataEvent, IGoodsBeforeAddEvent ,IGoodsFillEditInputDataEvent, IGoodsAfterAddEvent,IGoodsAfterEditEvent,IGoodsBeforeEditEvent {


	
	public void register(){
		addTabs();
 
 
	}
 
	
	
	public abstract void addTabs();	
	
	
	
	protected void addTags(Integer id,String name){
		JspPageTabs.addTab("goods",id, name);	
	}
	
	
	protected void registerPage(String type,String path){
		//PluginPageContext.addPage(type,path);
	}
	
	
}
