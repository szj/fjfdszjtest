package net.trust.application.datacollection.interfetchconfig.domain;

import java.util.HashMap;
import java.util.List;
/**
 * GPS�ӿ����ݲɼ��������� 
 *
 */
public interface InterFatchConfigFacade {
	/**
	 * �ӿ����ݲɼ������¼�� 
	 * @param map
	 * @return
	 */
	public int findInterFatchConfigCount(HashMap map);
	/**
	 * �ӿ����ݲɼ������¼
	 * @param map
	 * @return
	 */
	public List findInterFatchConfig(HashMap map);
	/**
	 * �����ӿ����ݲɼ�����
	 * @param map
	 * @return
	 */
	public int insertInterFatchConfig(HashMap map);
	/**
	 * �޸Ľӿ����ݲɼ�����
	 * @param map
	 * @return
	 */
	public int updateInterFatchConfig(HashMap map);
	/**
	 * ɾ���ӿ����ݲɼ�����
	 * @param map
	 * @return
	 */
	public int deleteInterFatchConfig(HashMap map);
}
