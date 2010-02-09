package net.trust.application.baseArchives.deptInfo.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;

public class DeptInfoFacadeImpl implements DeptInfoFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ�����ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findDeptInfoCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("DeptInfoManage.findDeptInfoCount",map)).intValue();
    }
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findDeptInfo(HashMap map){
    	return baseSqlMapDAO.queryForList("DeptInfoManage.findDeptInfo",map);
    }
    /**
	 * ��Ӳ�����Ϣ
	 * @param userInfo
	 * @return
	 */
    public int insertDeptInfo(HashMap map){
    	return baseSqlMapDAO.update("DeptInfoManage.insertDeptInfo",map);
    }
    /**
	 * �޸Ĳ�����Ϣ
	 * @param userInfo
	 * @return
	 */
	public int updateDeptInfo(HashMap map){
		return baseSqlMapDAO.update("DeptInfoManage.updateDeptInfo",map);
	}
	
	/**
	 * ɾ��������Ϣ
	 * @param userInfo
	 * @return
	 */
	public int deleteDeptInfo(HashMap map){
		return baseSqlMapDAO.update("DeptInfoManage.deleteDeptInfo",map);
	
	}
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
