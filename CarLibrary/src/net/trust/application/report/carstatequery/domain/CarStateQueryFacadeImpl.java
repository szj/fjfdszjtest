package net.trust.application.report.carstatequery.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * �ۺϱ��� -�� ����״̬��ѯ
 * @author chenqf
 *
 */
public class CarStateQueryFacadeImpl implements CarStateQueryFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}

	/**
	 * ��ѯ����״̬��¼����
	 * @param map
	 * @return
	 */
	public int findCarStateQueryCount(HashMap map){
		return ((Integer)baseSqlMapDAO.queryForObject("CarStateQuery.findCarStateQueryCount", map));
	}
	/**
	 * ��ѯ����״̬��¼
	 * @param map
	 * @return
	 */
	public List findCarStateQuery(HashMap map){
		return baseSqlMapDAO.queryForList("CarStateQuery.findCarStateQuery", map);
	}

}
