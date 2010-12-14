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
package com.enation.javashop.core.service.impl;

import java.util.List;

import com.enation.eop.impl.support.BaseSupport;
import com.enation.framework.database.Page;
import com.enation.javashop.core.model.Logi;
import com.enation.javashop.core.service.ILogiManager;
 

public class LogiManager extends BaseSupport<Logi> implements ILogiManager{
	
	public void delete(String id) {
		if (id == null || id.equals(""))
			return;
		String sql = "delete from logi_company where id in (" + id + ")";
		this.baseDaoSupport.execute(sql);
	}

	
	public Logi getLogiById(Integer id) {
		String sql  = "select * from logi_company where id=?";
		Logi a =  this.baseDaoSupport.queryForObject(sql, Logi.class, id);
		return a;
	}

	
	public Page pageLogi(String order, Integer page, Integer pageSize) {
		order = order == null ? " id desc" : order;
		String sql = "select * from logi_company";
		sql += " order by  " + order;
		Page webpage = this.baseDaoSupport.queryForPage(sql, page, pageSize);
		return webpage;
	}

	
	public void saveAdd(String name) {
		Logi logi = new Logi();
		logi.setName(name);
		this.baseDaoSupport.insert("logi_company", logi);
		
	}

	
	public void saveEdit(Integer id, String name) {
		Logi logi = new Logi();
		logi.setName(name);
		logi.setId(id);
		this.baseDaoSupport.update("logi_company", logi, "id="+id);
	}

	
	public List list() {
		String sql = "select * from logi_company";
		return this.baseDaoSupport.queryForList(sql);
	}

	
}
