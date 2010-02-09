package net.trust.application.report.runrecord.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * �ۺϱ��� -�� �г���¼
 * @author chenqf
 *
 */
public class RunRecordFacadeImpl implements RunRecordFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}

	/**
	 * ��ѯ�г���¼����
	 * @param map
	 * @return
	 */
	public int findRunRecordCount(HashMap map){
		return ((Integer)baseSqlMapDAO.queryForObject("RunRecord.findRunRecordCount", map));
	}
	/**
	 * ��ѯ�г���¼
	 * @param map
	 * @return
	 */
	public List findRunRecord(HashMap map){
		return baseSqlMapDAO.queryForList("RunRecord.findRunRecord", map);
	}
}
