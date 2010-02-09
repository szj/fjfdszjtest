package net.trust.application.systemManage.warninglog.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * Ԥ������
 * @author chenqf
 *
 */
public class WarningLogManageFacadeImpl implements WarningLogManageFacade {
	private BaseSqlMapDAO baseSqlMapDAO;

	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	/**
	 * Ԥ����¼������
	 * @param map
	 * @return
	 */
	public int findWarningLogCount(HashMap map){
		return ((Integer)baseSqlMapDAO.queryForObject("WarningLogManage.findWarningLogCount", map));
	}
	/**
	 * Ԥ����¼
	 * @param map
	 * @return
	 */
	public List findWarningLog(HashMap map){
		return baseSqlMapDAO.queryForList("WarningLogManage.findWarningLog", map);
	}
	/**
	 * �޸�Ԥ����Ϣ
	 * @param map
	 * @return
	 */
	public int updateWarningLog(HashMap map){
		return baseSqlMapDAO.update("WarningLogManage.updateWarningLog", map);
	}

}
