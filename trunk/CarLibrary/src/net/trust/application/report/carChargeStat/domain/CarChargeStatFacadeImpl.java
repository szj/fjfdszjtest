package net.trust.application.report.carChargeStat.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * �ۺϱ��� -�� ��������ͳ��
 *
 */
public class CarChargeStatFacadeImpl implements CarChargeStatFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	
	public List findCarChargeStat(HashMap map) {
		return baseSqlMapDAO.queryForList("CarChargeStat.findCarChargeStat", map);
	}

}
