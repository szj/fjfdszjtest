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
package com.enation.javashop.widget.setting;

import java.util.List;

import com.enation.javashop.core.model.Tag;
import com.enation.javashop.core.service.ITagManager;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsListSetting extends ActionSupport{
	private ITagManager tagManager ;
	private List<Tag> tagList;
	
	public String execute(){
	 
	 	
		tagList = tagManager.list();
		return this.SUCCESS;
	}
	public void setTagManager(ITagManager tagManager) {
		this.tagManager = tagManager;
	}
	public List<Tag> getTagList() {
		return tagList;
	}
	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}

	
}
