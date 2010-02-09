package net.trust.application.carManage.peccancymanage.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * Υ�¹���
 *
 */
public class PeccancyManageFacadeImpl implements PeccancyManageFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯΥ���ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findPeccancyCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("PeccancyManage.findPeccancyCount",map)).intValue();
    }
    /**
	 * ��ѯΥ����Ϣ
	 * @param map
	 * @return
	 */
    public List findPeccancy(HashMap map){
    	return baseSqlMapDAO.queryForList("PeccancyManage.findPeccancy",map);
    }
    /**
	 * ���Υ����Ϣ
	 * @param map
	 * @return
	 */
    public int insertPeccancy(HashMap map){
    	return baseSqlMapDAO.update("PeccancyManage.insertPeccancy",map);
    }
    /**
	 * �޸�Υ����Ϣ
	 * @param map
	 * @return
	 */
	public int updatePeccancy(HashMap map){
		return baseSqlMapDAO.update("PeccancyManage.updatePeccancy",map);
	}
	
	/**
	 * ɾ��Υ����Ϣ
	 * @param map
	 * @return
	 */
	public int deletePeccancy(HashMap map){
		return baseSqlMapDAO.update("PeccancyManage.deletePeccancy",map);
	
	}
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
