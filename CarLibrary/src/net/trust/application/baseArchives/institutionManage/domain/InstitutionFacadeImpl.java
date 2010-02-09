package net.trust.application.baseArchives.institutionManage.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * �������
 * @author zhengmh
 *
 */
public class InstitutionFacadeImpl implements InstitutionFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ�����ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findInstitutionCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("InstitutionManage.findInstitutionCount",map)).intValue();
    }
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findInstitutionInfo(HashMap map){
    	return baseSqlMapDAO.queryForList("InstitutionManage.findManagerInfo",map);
    }
    /**
	 * �޸Ļ�����Ϣ
	 * @param userInfo
	 * @return
	 */
    public int insertInstitution(HashMap map){
    	return baseSqlMapDAO.update("InstitutionManage.insertInstitution",map);
    }
    /**
	 * �޸Ļ�����Ϣ
	 * @param userInfo
	 * @return
	 */
	public int updateInstitutionInfo(HashMap map){
		return baseSqlMapDAO.update("InstitutionManage.updateInstitution",map);
	}
	
	/**
	 * ɾ��������Ϣ
	 * @param userInfo
	 * @return
	 */
	public int deleteInstitutionInfo(HashMap map){
		return baseSqlMapDAO.update("InstitutionManage.deleteInstitution",map);
	}
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	
}
