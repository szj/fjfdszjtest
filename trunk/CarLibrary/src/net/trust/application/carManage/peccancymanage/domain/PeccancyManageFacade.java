package net.trust.application.carManage.peccancymanage.domain;

import java.util.HashMap;
import java.util.List;
/**
 * Υ�¹���
 *
 */
public interface PeccancyManageFacade {
	/**
	 * ��ѯΥ����Ϣ�ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findPeccancyCount(HashMap map);
    /**
	 * ��ѯΥ����Ϣ
	 * @param map
	 * @return
	 */
    public List findPeccancy(HashMap map);
    /**
	 * ���Υ����Ϣ
	 * @param map
	 * @return
	 */
    public int insertPeccancy(HashMap map);
    /**
	 * �޸�Υ����Ϣ
	 * @param map
	 * @return
	 */
	public int updatePeccancy(HashMap map);
	
	/**
	 * ɾ��Υ����Ϣ
	 * @param map
	 * @return
	 */
	public int deletePeccancy(HashMap map);
}
