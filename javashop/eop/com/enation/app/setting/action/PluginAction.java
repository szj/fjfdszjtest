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
package com.enation.app.setting.action;

import java.util.List;

import com.enation.framework.action.WWAction;
import com.enation.framework.plugin.PluginContext;

public class PluginAction extends WWAction {
	private List plugins;
	public String list() {
		plugins = PluginContext.getPlugins();
		return "list";
	}
	public List getPlugins() {
		return plugins;
	}
	public void setPlugins(List plugins) {
		this.plugins = plugins;
	}
	
	
}
