package net.trust.application.baseArchives.recunitInfo.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * ������λ��Ϣ����
 * @author zhengmh
 *
 */
public class RecUnitFacadeImpl implements RecUnitFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ������λ�ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findRecUnitInfoCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("RecUnitInfoManage.findRecUnitInfoCount",map)).intValue();
    }
    /**
	 * ��ѯ������λ��Ϣ
	 * @param map
	 * @return
	 */
    public List findRecUnitInfo(HashMap map){
    	return baseSqlMapDAO.queryForList("RecUnitInfoManage.findRecUnitInfo",map);
    }
    /**
	 * ���������λ��Ϣ
	 * @param map
	 * @return
	 */
    public int insertRecUnitInfo(HashMap map){
    	return baseSqlMapDAO.update("RecUnitInfoManage.insertRecUnitInfo",map);
    }
    /**
	 * �޸�������λ��Ϣ
	 * @param map
	 * @return
	 */
	public int updateRecUnitInfo(HashMap map){
		return baseSqlMapDAO.update("RecUnitInfoManage.updateRecUnitInfo",map);
	}
	
	/**
	 * ɾ��������λ��Ϣ
	 * @param map
	 * @return
	 */
	public int deleteRecUnitInfo(HashMap map){
		return baseSqlMapDAO.update("RecUnitInfoManage.deleteRecUnitInfo",map);
	
	}
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
