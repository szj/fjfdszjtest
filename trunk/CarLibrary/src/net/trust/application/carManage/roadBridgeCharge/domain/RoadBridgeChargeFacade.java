package net.trust.application.carManage.roadBridgeCharge.domain;

import java.util.HashMap;
import java.util.List;

/**
 * ��·���ŷ��ù���
 *
 */
public interface RoadBridgeChargeFacade {
	/**
	 * ��ѯ��·���ŷ����ܼ�¼��
	 * @param map
	 * @return
	 */
	public int findRoadBridgeChargeCount(HashMap map);
	/**
	 * ��ѯ��·���ŷ���
	 * @param map
	 * @return
	 */
	public List findRoadBridgeCharge(HashMap map);
	/**
	 * ������·���ŷ���
	 * @param map
	 * @return
	 */
	public int insertRoadBridgeCharge(HashMap map) throws Exception;
	/**
	 * �޸Ĺ�·���ŷ���
	 * @param map
	 * @return
	 */
	public int updateRoadBridgeCharge(HashMap map) throws Exception;
	/**
	 * ɾ����·���ŷ���
	 * @param map
	 * @return
	 */
	public int deleteRoadBridgeCharge(HashMap map) throws Exception;
}
