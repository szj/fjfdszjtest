package net.trust.application.carManage.putonsteam.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * ���͹���
 *
 */
public class PutonsteamFacadeImpl implements PutonsteamFacade{
	BaseSqlMapDAO baseSqlMapDAO;
	/**
	 * ��ѯ�����ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findPutonsteamCount(HashMap map){
    	return ((Integer)baseSqlMapDAO.queryForObject("PutonsteamManage.findPutonsteamCount",map)).intValue();
    }
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findPutonsteam(HashMap map){
    	return baseSqlMapDAO.queryForList("PutonsteamManage.findPutonsteam",map);
    }
    /**
	 * ��Ӽ�����Ϣ
	 * @param map
	 * @return
	 */
    public int insertPutonsteam(HashMap map) throws Exception{
    	//�������͵���
    	String pb_seq = baseSqlMapDAO.sequences("expedite_car_id");
    	map.put("putOnSteamId",pb_seq);
    	int st = baseSqlMapDAO.update("PutonsteamManage.insertPutonsteam",map);
    	
    	if (st == 0){
    		throw new Exception("�������͵���ʱ����");
    	}
    	//�������񵥾�
    	map.put("sourceOrderType", "1");    	
		map.put("sourceOrderCode",pb_seq);
		st=baseSqlMapDAO.update("FinanceManage.insertFinance", map);
		if (st == 0){
    		throw new Exception("�������񵥾�ʱ����");
    	}
    	return st;
    }
    /**
	 * �޸ļ�����Ϣ
	 * @param map
	 * @return
	 */
	public int updatePutonsteam(HashMap map) throws Exception{
		//�޸ļ��͵���
		int st = baseSqlMapDAO.update("PutonsteamManage.updatePutonsteam",map);
		if (st == 0){
    		throw new Exception("�޸ļ��͵���ʱ����");
    	}
		
		//�޸Ĳ��񵥾�
		map.put("sourceOrderCode", map.get("putonsteamId"));
		map.put("sourceOrderType", "1");
		st = baseSqlMapDAO.update("FinanceManage.updateFinance", map);
		if (st == 0){
    		throw new Exception("�޸Ĳ��񵥾�ʱ����");
    	}
		return st;
	}
	
	/**
	 * ɾ��������Ϣ
	 * @param map
	 * @return
	 */
	public int deletePutonsteam(HashMap map) throws Exception{
		//ɾ��������Ϣ����
		int st = baseSqlMapDAO.update("PutonsteamManage.deletePutonsteam",map);
		if (st == 0){
    		throw new Exception("ɾ�����͵���ʱ����");
    	}
		
		//ɾ�����񵥾�
		map.put("sourceOrderCode", map.get("putonsteamId"));
		map.put("sourceOrderType", "1");
		st = baseSqlMapDAO.update("FinanceManage.deleteFinance",map);
		if (st == 0){
    		throw new Exception("ɾ�����񵥾�ʱ����");
    	}
		
		return st;
	
	}
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
