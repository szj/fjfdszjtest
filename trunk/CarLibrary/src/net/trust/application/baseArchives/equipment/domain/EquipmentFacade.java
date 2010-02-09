package net.trust.application.baseArchives.equipment.domain;

import java.util.HashMap;
import java.util.List;
/**
 * �豸����
 * @author chenqf
 *
 */
public interface EquipmentFacade {
	/**
	 * ��ѯ�豸�ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findEquipmentCount(HashMap map);
    /**
	 * ��ѯ�豸��Ϣ
	 * @param map
	 * @return
	 */
    public List findEquipmentInfo(HashMap map);
    /**
	 * ����豸��Ϣ
	 * @param map
	 * @return
	 */
    public int insertEquipment(HashMap map);
    /**
	 * �޸��豸��Ϣ
	 * @param map
	 * @return
	 */
	public int updateEquipmentInfo(HashMap map);
	
	/**
	 * ɾ���豸��Ϣ
	 * @param map
	 * @return
	 */
	public int deleteEquipmentInfo(HashMap map);
	
	/**
	 * ��ȡ�豸��������
	 * @param map
	 * @return
	 */
	public List findEquipmentParam(HashMap map);
}
