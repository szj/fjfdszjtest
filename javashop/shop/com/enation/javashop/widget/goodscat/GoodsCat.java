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
package com.enation.javashop.widget.goodscat;

import java.util.List;
import java.util.Map;

import com.enation.eop.sdk.widget.AbstractWidget;
import com.enation.javashop.core.model.Cat;
import com.enation.javashop.core.service.IGoodsCatManager;

public class GoodsCat extends AbstractWidget {
	 
	private IGoodsCatManager goodsCatManager;
	
	protected void execute(Map<String, String> params) {
		List<Cat> cat_tree =  goodsCatManager.listAllChildren(0);
		String catimage = params.get("catimage");
		boolean showimage  = catimage!= null &&catimage.equals("on") ?true:false;
		//System.out.println(catimage);
		this.putData("showimg", showimage);
		this.putData("cat_tree", cat_tree);
	 
	}
	
	
	protected void config(Map<String, String> params) {
		
	}

	public IGoodsCatManager getGoodsCatManager() {
		return goodsCatManager;
	}

	public void setGoodsCatManager(IGoodsCatManager goodsCatManager) {
		this.goodsCatManager = goodsCatManager;
	}
	
}
