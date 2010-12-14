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
import com.enation.javashop.core.model.DlyArea;
import com.enation.javashop.core.service.IAreaManager;

 

public class AreaManager extends BaseSupport<DlyArea> implements IAreaManager{
	
	public void delete(String id) {
		if (id == null || id.equals(""))
			return;
		String sql = "delete from dly_area where area_id in (" + id + ")";
		this.baseDaoSupport.execute(sql);
	}

	
	public List getAll() {
		String sql = "select * from dly_area order by area_id desc";
		List list = this.baseDaoSupport.queryForList(sql);
		return list;
	}

	
	public Page pageArea(String order, int page, int pageSize) {
		order = order == null ? " area_id desc" : order;
		String sql = "select  * from  dly_area";
		sql += " order by  " + order;
		Page webpage = this.baseDaoSupport.queryForPage(sql, page, pageSize);
		return webpage;
	}

	
	public void saveAdd(String name) {
		DlyArea dlyArea = new DlyArea();
		dlyArea.setName(name);
		this.baseDaoSupport.insert("dly_area", dlyArea);
	}

	
	public void saveEdit(Integer areaId, String name) {
		String sql = "update dly_area set name = ? where area_id=?";
		this.baseDaoSupport.execute(sql,name,areaId);
	}

	
	public DlyArea getDlyAreaById(Integer areaId) {
		String sql  = "select * from dly_area where area_id=?";
		DlyArea a =  this.baseDaoSupport.queryForObject(sql, DlyArea.class, areaId);
		return a;
	}
    
}
