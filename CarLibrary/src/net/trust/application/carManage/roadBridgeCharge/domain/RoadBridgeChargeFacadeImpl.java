package net.trust.application.carManage.roadBridgeCharge.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
/**
 * ��·���ŷ��ù���
 *
 */
public class RoadBridgeChargeFacadeImpl implements RoadBridgeChargeFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	
	/**
	 * ��ѯ��·���ŷ���
	 * @param map
	 * @return
	 */
	public List findRoadBridgeCharge(HashMap map) {
		return baseSqlMapDAO.queryForList("RoadBridgeCharge.findRoadBridgeCharge", map);
	}
	
	/**
	 * ��ѯ��·���ŷ����ܼ�¼��
	 * @param map
	 * @return
	 */
	public int findRoadBridgeChargeCount(HashMap map) {
		return (Integer)baseSqlMapDAO.queryForObject("RoadBridgeCharge.findRoadBridgeChargeCount", map);
	}
	
	/**
	 * ������·���ŷ���
	 * @param map
	 * @return
	 */
	public int insertRoadBridgeCharge(HashMap map) throws Exception{
		String roadBridgeChargeId = baseSqlMapDAO.sequences("road_bridge_charge_id");
		map.put("roadBridgeChargeId", roadBridgeChargeId);
		int st = baseSqlMapDAO.update("RoadBridgeCharge.insertRoadBridgeCharge", map);
		if (st == 0){
    		throw new Exception("������·���ŷ��õ���ʱ����");
    	}
		
		//�������񵥾�
    	map.put("sourceOrderType", "4");    	
		map.put("sourceOrderCode", roadBridgeChargeId);
		st=baseSqlMapDAO.update("FinanceManage.insertFinance", map);
		if (st == 0){
    		throw new Exception("�������񵥾�ʱ����");
    	}
		return st;
	}
	
	/**
	 * �޸Ĺ�·���ŷ���
	 * @param map
	 * @return
	 */
	public int updateRoadBridgeCharge(HashMap map) throws Exception{
		int st = baseSqlMapDAO.update("RoadBridgeCharge.updateRoadBridgeCharge", map);
		if (st == 0){
    		throw new Exception("�޸Ĺ�·���ŷ��õ���ʱ����");
    	}
		
		//�޸Ĳ��񵥾�
		map.put("sourceOrderCode", map.get("roadBridgeChargeId"));
		map.put("sourceOrderType", "4");
		st = baseSqlMapDAO.update("FinanceManage.updateFinance", map);
		if (st == 0){
    		throw new Exception("�޸Ĳ��񵥾�ʱ����");
    	}
		return st;
	}
	/**
	 * ɾ����·���ŷ���
	 * @param map
	 * @return
	 */
	public int deleteRoadBridgeCharge(HashMap map) throws Exception{
		int st = baseSqlMapDAO.update("RoadBridgeCharge.deleteRoadBridgeCharge", map);
		if (st == 0){
    		throw new Exception("ɾ����·���ŷ��õ���ʱ����");
    	}
		
		//ɾ�����񵥾�
		map.put("sourceOrderCode", map.get("roadBridgeChargeId"));
		map.put("sourceOrderType", "4");
		st = baseSqlMapDAO.update("FinanceManage.deleteFinance",map);
		if (st == 0){
    		throw new Exception("ɾ�����񵥾�ʱ����");
    	}
		return st;
	}
}
