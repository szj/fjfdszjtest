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
package com.enation.app.saler.action;

import java.util.Map;

import com.enation.eop.impl.facade.ParsePageService;
import com.enation.framework.action.WWAction;

public class IndexAction extends WWAction {
	private ParsePageService parsePageService;
	public String execute(){
		this.parsePageService.parse();
		return "index";
	}
	public ParsePageService getParsePageService() {
		return parsePageService;
	}
	public void setParsePageService(ParsePageService parsePageService) {
		this.parsePageService = parsePageService;
	}
	

}
