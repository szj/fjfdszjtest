package net.trust.application.carManage.attempermanage.domain;

import java.util.HashMap;
import java.util.List;
/**
 * ���ȹ���
 *
 */
public interface AttemperManageFacade {
	/**
	 * ���ȹ����¼��
	 * @param map
	 * @return
	 */
	public int findAttemperCount(HashMap map);
	/**
	 * ���ȹ����¼
	 * @param map
	 * @return
	 */
	public List findAttemper(HashMap map);
	/**
	 * �������ȼ�¼
	 * @param map
	 * @return
	 */
	public HashMap insertAttemper(HashMap map);
	/**
	 * �޸ĵ��ȼ�¼
	 * @param map
	 * @return
	 */
	public int updateAttemper(HashMap map);
	/**
	 * ɾ�����ȼ�¼
	 * @param map
	 * @return
	 */
	public int deleteAttemper(HashMap map);
	/**
	 * ��ѯGPSϵͳ���봫��λ��ƥ��ĳ�������
	 * @param map
	 * @return
	 */
	public List getGPSCarLocus(HashMap map);
}
