package net.trust.application.carManage.insurance.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * ���չ���
 *
 */
public class InsuranceFacadeImpl implements InsuranceFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ�����ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findInsuranceCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("InsuranceManage.findInsuranceCount",map)).intValue();
    }
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findInsurance(HashMap map){
    	return baseSqlMapDAO.queryForList("InsuranceManage.findInsurance",map);
    }
    /**
	 * ��ӱ�����Ϣ
	 * @param map
	 * @return
	 */
    public int insertInsurance(HashMap map){
    	return baseSqlMapDAO.update("InsuranceManage.insertInsurance",map);
    }
    /**
	 * �޸ı�����Ϣ
	 * @param map
	 * @return
	 */
	public int updateInsurance(HashMap map){
		return baseSqlMapDAO.update("InsuranceManage.updateInsurance",map);
	}
	
	/**
	 * ɾ��������Ϣ
	 * @param map
	 * @return
	 */
	public int deleteInsurance(HashMap map){
		return baseSqlMapDAO.update("InsuranceManage.deleteInsurance",map);
	
	}
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
