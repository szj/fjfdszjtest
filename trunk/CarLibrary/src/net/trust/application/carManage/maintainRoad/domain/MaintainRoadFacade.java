package net.trust.application.carManage.maintainRoad.domain;

import java.util.HashMap;
import java.util.List;
/**
 * ��·�ѹ���
 *
 */
public interface MaintainRoadFacade {
	/**
	 * ��ѯ��·����Ϣ�ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findMaintainRoadCount(HashMap map);
    /**
	 * ��ѯ��·����Ϣ
	 * @param map
	 * @return
	 */
    public List findMaintainRoad(HashMap map);
    /**
	 * �����·����Ϣ
	 * @param map
	 * @return
	 */
    public int insertMaintainRoad(HashMap map);
    /**
	 * �޸���·����Ϣ
	 * @param map
	 * @return
	 */
	public int updateMaintainRoad(HashMap map);
	
	/**
	 * ɾ����·����Ϣ
	 * @param map
	 * @return
	 */
	public int deleteMaintainRoad(HashMap map);
}
