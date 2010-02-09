package net.trust.application.carManage.maintainRoad.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * ��·�ѹ���
 *
 */
public class MaintainRoadFacadeImpl implements MaintainRoadFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ��·���ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findMaintainRoadCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("MaintainRoadManage.findMaintainRoadCount",map)).intValue();
    }
    /**
	 * ��ѯ��·����Ϣ
	 * @param map
	 * @return
	 */
    public List findMaintainRoad(HashMap map){
    	return baseSqlMapDAO.queryForList("MaintainRoadManage.findMaintainRoad",map);
    }
    /**
	 * �����·����Ϣ
	 * @param map
	 * @return
	 */
    public int insertMaintainRoad(HashMap map){
    	return baseSqlMapDAO.update("MaintainRoadManage.insertMaintainRoad",map);
    }
    /**
	 * �޸���·����Ϣ
	 * @param map
	 * @return
	 */
	public int updateMaintainRoad(HashMap map){
		return baseSqlMapDAO.update("MaintainRoadManage.updateMaintainRoad",map);
	}
	
	/**
	 * ɾ����·����Ϣ
	 * @param map
	 * @return
	 */
	public int deleteMaintainRoad(HashMap map){
		return baseSqlMapDAO.update("MaintainRoadManage.deleteMaintainRoad",map);
	
	}
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
