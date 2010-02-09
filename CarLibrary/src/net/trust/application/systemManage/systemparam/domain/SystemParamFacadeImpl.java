package net.trust.application.systemManage.systemparam.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * ϵͳ����
 * 
 *
 */
public class SystemParamFacadeImpl implements SystemParamFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	
	/**
	 * ϵͳ���������¼��
	 * @param map
	 * @return
	 */
	public int findSystemParamTypeCount(HashMap map){
		
		return ((Integer)baseSqlMapDAO.queryForObject("SystemParam.findSystemParamTypeCount",map)).intValue();
	}
	/**
	 * ϵͳ��������
	 * @param map
	 * @return
	 */
	public List findSystemParamType(HashMap map){
		return baseSqlMapDAO.queryForList("SystemParam.findSystemParamType", map);
	}
	/**
	 * ϵͳ������ϸ��Ϣ 
	 * @param map
	 * @return
	 */
	public List findSystemParam(HashMap map){
		return baseSqlMapDAO.queryForList("SystemParam.findSystemParam", map);
	}
	/**
	 * ���ϵͳ����
	 * @param map
	 * @return
	 */
	public int insertSystemParam(HashMap map){
		return baseSqlMapDAO.update("SystemParam.insertSystemParam", map);
	}
	/**
	 * �޸�ϵͳ����
	 * @param map
	 * @return
	 */
	public int updateSystemParam(HashMap map){
		return baseSqlMapDAO.update("SystemParam.updateSystemParam", map);
	}
	
	/**
	 * ɾ��ϵͳ����
	 * @param map
	 * @return
	 */
	public int deleteSystemParam(HashMap map){
		return baseSqlMapDAO.update("SystemParam.updateSystemParam", map);
	}
}
