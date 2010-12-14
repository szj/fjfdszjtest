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
package com.enation.javashop.core.service.impl.cache;

import java.util.List;

import com.enation.eop.context.EopContext;
import com.enation.eop.core.resource.model.EopSite;
import com.enation.framework.cache.AbstractCacheProxy;
import com.enation.javashop.core.model.SiteMenu;
import com.enation.javashop.core.service.ISiteMenuManager;

public class SiteMenuCacheProxy extends AbstractCacheProxy<List<SiteMenu>> implements ISiteMenuManager {
	private static final String MENU_LIST_CACHE_KEY = "siteMenuList";
	private ISiteMenuManager siteMenuManager;
	public SiteMenuCacheProxy(ISiteMenuManager siteMenuManager) {
		super(MENU_LIST_CACHE_KEY);
		this.siteMenuManager = siteMenuManager;
		 
	}

	private void cleanCache(){
		EopSite site  = EopContext.getContext().getCurrentSite();
		this.cache.remove( MENU_LIST_CACHE_KEY+"_"+site.getUserid() +"_"+site.getId());
	}
	
	
	public void add(SiteMenu siteMenu) {
		this.siteMenuManager.add(siteMenu);
		this.cleanCache();
	}

	
	public void delete(Integer id) {
		this.siteMenuManager.delete(id);
		this.cleanCache();
	 
	}

	
	public void edit(SiteMenu siteMenu) {
		this.siteMenuManager.edit(siteMenu);
		this.cleanCache();
	}

	
	public SiteMenu get(Integer menuid) {
		return this.siteMenuManager.get(menuid);
	}

	
	public List<SiteMenu> list(Integer parentid) {
		EopSite site  = EopContext.getContext().getCurrentSite();
		List<SiteMenu> menuList  =  this.cache.get( MENU_LIST_CACHE_KEY+"_"+site.getUserid() +"_"+site.getId());
		
		
		if(menuList== null ){
			menuList = this.siteMenuManager.list(parentid);
			this.cache.put( MENU_LIST_CACHE_KEY+"_"+site.getUserid() +"_"+site.getId(),menuList);
			if(this.logger.isDebugEnabled()){
				this.logger.debug("load sitemenu from database");
			}
		}else{
			if(this.logger.isDebugEnabled()){
				this.logger.debug("load sitemenu from cache");
			}
		}
		
		return menuList;
	}

	
	public void updateSort(Integer[] menuid, Integer[] sort) {
		this.siteMenuManager.updateSort(menuid, sort);
		this.cleanCache();
	}

}
