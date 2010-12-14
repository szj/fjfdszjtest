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
package com.enation.framework.plugin;

import java.util.ArrayList;
import java.util.List;

public class PluginContext {
	
	 private static List<IPlugin> pluginContext;
	static{
		pluginContext =  new ArrayList<IPlugin>();
	}
	 public static void registerPlugin(IPlugin plugin){
		 pluginContext.add( plugin);
	 }
	 
	 public static List<IPlugin> getPlugins(){
		 return pluginContext;
	 }
	 
}
