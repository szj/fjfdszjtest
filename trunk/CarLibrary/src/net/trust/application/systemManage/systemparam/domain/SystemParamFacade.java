package net.trust.application.systemManage.systemparam.domain;

import java.util.HashMap;
import java.util.List;
/**
 * ϵͳ����
 * @author chenqf
 *
 */
public interface SystemParamFacade {
	/**
	 * ϵͳ���������¼��
	 * @param map
	 * @return
	 */
	public int findSystemParamTypeCount(HashMap map);
	/**
	 * ϵͳ��������
	 * @param map
	 * @return
	 */
	public List findSystemParamType(HashMap map);
	/**
	 * ϵͳ������ϸ��Ϣ 
	 * @param map
	 * @return
	 */
	public List findSystemParam(HashMap map);
	/**
	 * ���ϵͳ����
	 * @param map
	 * @return
	 */
	public int insertSystemParam(HashMap map);
	/**
	 * �޸�ϵͳ����
	 * @param map
	 * @return
	 */
	public int updateSystemParam(HashMap map);
	
	/**
	 * ɾ��ϵͳ����
	 * @param map
	 * @return
	 */
	public int deleteSystemParam(HashMap map);
}
