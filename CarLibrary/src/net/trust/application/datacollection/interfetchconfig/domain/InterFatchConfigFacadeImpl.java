package net.trust.application.datacollection.interfetchconfig.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.utils.PubFunction;
/**
 * GPS�ӿ����ݲɼ��������� 
 *
 */
public class InterFatchConfigFacadeImpl implements InterFatchConfigFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	
	

	/**
	 * �ӿ����ݲɼ������¼�� 
	 * @param map
	 * @return
	 */
	public int findInterFatchConfigCount(HashMap map){
		return ((Integer)baseSqlMapDAO.queryForObject("InterFatchConfig.findInterFatchConfigCount", map)).intValue();
	}
	/**
	 * �ӿ����ݲɼ������¼
	 * @param map
	 * @return
	 */
	public List findInterFatchConfig(HashMap map){
		return baseSqlMapDAO.queryForList("InterFatchConfig.findInterFatchConfig", map);
	}
	/**
	 * �����ӿ����ݲɼ�����
	 * @param map
	 * @return
	 */
	public int insertInterFatchConfig(HashMap map){
		return baseSqlMapDAO.update("InterFatchConfig.insertInterFatchConfig", map);
	}
	/**
	 * �޸Ľӿ����ݲɼ�����
	 * @param map
	 * @return
	 */
	public int updateInterFatchConfig(HashMap map){
		return baseSqlMapDAO.update("InterFatchConfig.updateInterFatchConfig", map);
	}
	/**
	 * ɾ���ӿ����ݲɼ�����
	 * @param map
	 * @return
	 */
	public int deleteInterFatchConfig(HashMap map){
		return baseSqlMapDAO.update("InterFatchConfig.deleteInterFatchConfig", map);
	}
}
