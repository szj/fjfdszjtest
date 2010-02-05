package com.qzgf.application.gpsdata.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.qzgf.IbatisDaoTools.BaseSqlMapDAO;
/**
 * �ۺϱ��� -�� �г���¼
 * @author chenqf
 *
 */
public class GpsDataFacadeImpl implements GpsDataFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	
	/**
	 * ��ѯ������¼
	 * @param map
	 * @return
	 */
	public List findGpsRecord(HashMap map){
		List ls=new ArrayList();
		try{
		ls=baseSqlMapDAO.queryForList("GpsRecord.findGpsRecord", map);
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
		return ls;
	}
	/**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
	public List findGpsCarMsg(HashMap map)
	{
		List ls=new ArrayList();
		try{
		ls=baseSqlMapDAO.queryForList("GpsRecord.findGpsCarMsg", map);
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
		return ls;
	}
	/**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
	public List findGpsWarnMsg(HashMap map)
	{
		List ls=new ArrayList();
		try{
		ls=baseSqlMapDAO.queryForList("GpsRecord.findGpsWarnMsg", map);
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
		return ls;
	}
	/**
	 * ��ʱ����ѯ��������AreaId(103)�����г���������Ϣ
	 * @param map
	 * @return
	 */
	public List findTimeGpsRecord(HashMap map)
	{
		List ls=new ArrayList();
		try{
		ls=baseSqlMapDAO.queryForList("GpsRecord.findTimeGpsRecord", map);
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
		return ls;
	}
	
	/**
	 * ��̬sql��ѯ
	 * @param map
	 * @return
	 */
	public List DynamicSql(HashMap map)
	{
		List ls=new ArrayList();
		try{
		ls=baseSqlMapDAO.queryForList("GpsRecord.genSelectsql", map);
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
		return ls;
	}
}
