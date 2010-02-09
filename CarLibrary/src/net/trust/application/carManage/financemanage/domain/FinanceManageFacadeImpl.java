package net.trust.application.carManage.financemanage.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;

public class FinanceManageFacadeImpl implements FinanceManageFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	/**
	 * ��ѯ���񵥾�����
	 * @param map
	 * @return
	 */
	public int findFinanceCount(HashMap map){
		return ((Integer)baseSqlMapDAO.queryForObject("FinanceManage.findFinanceCount", map)).intValue();
	}
	/**
	 * ��ѯ���񵥾�
	 * @param map
	 * @return
	 */
	public List findFinance(HashMap map){
		return baseSqlMapDAO.queryForList("FinanceManage.findFinance", map);
	}
	/**
	 * ��������������� 
	 * @param map
	 * @return
	 */
	public int insertFinance(HashMap map){
		return baseSqlMapDAO.update("FinanceManage.insertFinance", map);
	}
	/**
	 * �޸Ĳ��񵥾�
	 * @param map
	 * @return
	 */
	public int updateFinance(HashMap map){
		return baseSqlMapDAO.update("FinanceManage.updateFinance", map);
	}
	/**
	 * ɾ�����񵥾�
	 * @param map
	 * @return
	 */
	public int deleteFinance(HashMap map){
		return baseSqlMapDAO.update("FinanceManage.deleteFinance", map);
	}

}
