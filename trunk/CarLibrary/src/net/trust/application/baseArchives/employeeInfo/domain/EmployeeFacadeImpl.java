package net.trust.application.baseArchives.employeeInfo.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * Ա����Ϣ����
 * @author chenqf
 *
 */
public class EmployeeFacadeImpl implements EmployeeFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ�����ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findEmployeeInfoCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("EmployeeInfoManage.findEmployeeInfoCount",map)).intValue();
    }
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findEmployeeInfo(HashMap map){
    	return baseSqlMapDAO.queryForList("EmployeeInfoManage.findEmployeeInfo",map);
    }
    /**
	 * ��Ӳ�����Ϣ
	 * @param userInfo
	 * @return
	 */
    public int insertEmployeeInfo(HashMap map){
    	return baseSqlMapDAO.update("EmployeeInfoManage.insertEmployeeInfo",map);
    }
    /**
	 * �޸Ĳ�����Ϣ
	 * @param userInfo
	 * @return
	 */
	public int updateEmployeeInfo(HashMap map){
		return baseSqlMapDAO.update("EmployeeInfoManage.updateEmployeeInfo",map);
	}
	
	/**
	 * ɾ��������Ϣ
	 * @param userInfo
	 * @return
	 */
	public int deleteEmployeeInfo(HashMap map){
		return baseSqlMapDAO.update("EmployeeInfoManage.deleteEmployeeInfo",map);
	}
	/*
	 * Ա����Ϣ(��ʻԱ),ͨ�����Ź���
	 */
    public List ajaxJsonEmp(HashMap map){
    	return baseSqlMapDAO.queryForList("EmployeeInfoManage.ajaxJsonEmp",map);
    }
    
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
