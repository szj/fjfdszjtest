package net.trust.application.carManage.putonsteam.domain;

import java.util.HashMap;
import java.util.List;
/**
 * ���͹���
 *
 */
public interface PutonsteamFacade {
	/**
	 * ��ѯ������Ϣ�ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findPutonsteamCount(HashMap map);
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findPutonsteam(HashMap map);
    /**
	 * ��Ӽ�����Ϣ
	 * @param map
	 * @return
	 */
    public int insertPutonsteam(HashMap map) throws Exception;
    /**
	 * �޸ļ�����Ϣ
	 * @param map
	 * @return
	 */
	public int updatePutonsteam(HashMap map) throws Exception;
	
	/**
	 * ɾ��������Ϣ
	 * @param map
	 * @return
	 */
	public int deletePutonsteam(HashMap map) throws Exception;
}
