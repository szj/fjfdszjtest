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

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.enation.eop.impl.support.BaseSupport;
import com.enation.framework.cache.CacheFactory;
import com.enation.framework.cache.ICache;
import com.enation.javashop.core.model.Regions;
import com.enation.javashop.core.service.IRegionsManager;

public class RegionsCacheProxy extends BaseSupport<Regions> implements IRegionsManager {
	protected final Logger logger = Logger.getLogger(getClass());
	protected ICache<List<Regions>> cache;
	
	private IRegionsManager regionsManager;
	private static final String REGION_LIST_CACHE_KEY = "regionCache";
	public  RegionsCacheProxy(IRegionsManager regionsManager){
		cache = CacheFactory.getCache(REGION_LIST_CACHE_KEY);
		this.regionsManager =regionsManager;
	}
	
	
	public List listCity(int province_id) {
		 
		return regionsManager.listCity(province_id);
	}

	
	public List listProvince() {
 
		return regionsManager.listProvince();
	}

	
	public List listRegion(int city_id) {
		 
		return this.regionsManager.listRegion(city_id);
	}

	
	public List listChildren(Integer regionid) {
	 
		return this.regionsManager.listChildren(regionid);
	}

	private List<Regions> listAll(){
		String sql ="select * from regions order by region_id";
		return this.baseDaoSupport.queryForList(sql, Regions.class);
	 
	}
	
	
	public List listChildren(String regionid) {
		if(logger.isDebugEnabled()){
			logger.info("find parents is " + regionid);
		}
		if(regionid==null || "".equals(regionid))return new ArrayList();
		
		List<Regions> regionsList = cache.get(REGION_LIST_CACHE_KEY);
		if(regionsList==null){
			if(logger.isDebugEnabled()){
				logger.info("load regions list from db");
			}
			regionsList = listAll() ;
			cache.put(REGION_LIST_CACHE_KEY,regionsList );
		}else{
			if(logger.isDebugEnabled()){
				logger.info("load regions list from cache");
			}
		}
		List<Integer> list = new ArrayList<Integer>();
		String[] regionsArray =regionid.split(",");
		for(String id:regionsArray){

			for(Regions  region:regionsList){
				if(region.getRegion_path().indexOf(","+id+",")>=0){
					list.add(region.getRegion_id());
				}
			}
		}
		
		return list;
	}
	

	
	public String getChildrenJson(Integer regionid) {
		 
		return this.regionsManager.getChildrenJson(regionid);
	}

	
	public void add(Regions regions) {
		this.regionsManager.add(regions);
		
	}

	
	public void delete(int regionId) {
		this.regionsManager.delete(regionId);
		
	}

	
	public Regions get(int regionId) {
		return this.regionsManager.get(regionId);
	}

	
	public void update(Regions regions) {
		this.regionsManager.update(regions);
		
	}


	public void reset() {
		this.regionsManager.reset();
	}

}
