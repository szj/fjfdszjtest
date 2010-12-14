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

import com.enation.eop.core.resource.IThemeUriManager;
import com.enation.eop.core.resource.model.ThemeUri;
import com.enation.eop.impl.support.BaseSupport;

public class ThemeUriManagerImpl extends BaseSupport<ThemeUri> implements
		IThemeUriManager {

	 
	public List<ThemeUri> list( ) {
		String sql ="select * from themeuri";
		return this.baseDaoSupport.queryForList(sql, ThemeUri.class);
	}

	
	public ThemeUri getPath( String uri) {
		List<ThemeUri> list = list();
		 
		for(ThemeUri themeUri:list){
			if(themeUri.getUri().equals(uri)){
				return themeUri;
			}
		}
		return null;
	}

	
	public void add(ThemeUri uri) {
		this.baseDaoSupport.insert("themeuri", uri);
	}

}
