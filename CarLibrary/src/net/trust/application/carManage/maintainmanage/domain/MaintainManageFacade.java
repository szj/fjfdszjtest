package net.trust.application.carManage.maintainmanage.domain;

import java.util.HashMap;
import java.util.List;
/**
 * ��������
 *
 */
public interface MaintainManageFacade {
	/**
	 * ��ѯ���������ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findMaintainManageCount(HashMap map);
    /**
	 * ��ѯ����������Ϣ
	 * @param map
	 * @return
	 */
    public List findMaintainManage(HashMap map);
    /**
	 * ��ӱ���������Ϣ
	 * @param map
	 * @return
	 */
    public int insertMaintainManage(HashMap map) throws Exception;
    /**
	 * �޸ı���������Ϣ
	 * @param map
	 * @return
	 */
	public int updateMaintainManage(HashMap map) throws Exception;
	
	/**
	 * ɾ������������Ϣ
	 * @param map
	 * @return
	 */
	public int deleteMaintainManage(HashMap map) throws Exception;
}
