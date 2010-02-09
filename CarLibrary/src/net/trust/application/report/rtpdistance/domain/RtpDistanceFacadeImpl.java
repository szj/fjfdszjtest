package net.trust.application.report.rtpdistance.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * �ۺϱ��� -�� �г���¼
 * @author chenqf
 *
 */
public class RtpDistanceFacadeImpl implements RtpDistanceFacade {
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
	public int findRtpDistanceCount(HashMap map){
		return ((Integer)baseSqlMapDAO.queryForObject("RtpDistance.findRtpDistanceCount", map));
	}
	/**
	 * ��ѯ�г���¼
	 * @param map
	 * @return
	 */
	public List findRtpDistance(HashMap map){
		return baseSqlMapDAO.queryForList("RtpDistance.findRtpDistance", map);
	}
}
