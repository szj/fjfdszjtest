package net.trust.application.carManage.staffcheckin.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * ��Ա���ڹ���
 *
 */
public class StaffCheckinManageFacadeImpl implements StaffCheckinManageFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	/**
	 * ��Ա���ڼ�¼
	 * @param map
	 * @return
	 */
	public List findStaffCheckin(HashMap map) {
		
		return baseSqlMapDAO.queryForList("StaffCheckinManage.findStaffCheckin", map);
	}
	/**
	 * ��Ա���ڼ�¼����
	 * @param map
	 * @return
	 */
	public int findStaffCheckinCount(HashMap map) {
		return ((Integer)baseSqlMapDAO.queryForObject("StaffCheckinManage.findStaffCheckinCount", map)).intValue();
	}
}
