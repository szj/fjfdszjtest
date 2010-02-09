package net.trust.application.carManage.servicingmanage.domain;

import java.util.HashMap;
import java.util.List;

/**
 * ����ά�޹���
 *
 */
public interface ServicingManageFacade {
	/**
	 * ��ѯ����ά�޼�¼���� 
	 * @param map
	 * @return
	 */
	public int findServiceingCount(HashMap map);
	/**
	 * ��ѯ����ά�޼�¼
	 * @param map
	 * @return
	 */
	public List findServiceing(HashMap map);
	/**
	 * ����ά�޵Ǽ� 
	 * @param map
	 * @return
	 */
	public int insertServiceingApply(HashMap map) throws Exception;
	/**
	 * �޸ĳ���ά����Ϣ 
	 * @param map
	 * @return
	 */
	public int updateServiceingApply(HashMap map) throws Exception;
	/**
	 * ɾ������ά�޼�¼ 
	 * @param map
	 * @return
	 */
	public int deleteServiceingApply(HashMap map) throws Exception;
	/**
	 * ����ά����ϸ��¼ 
	 * @param map
	 * @return
	 */
	public List findServiceingDetail(HashMap map);
	/**
	 * ��ӳ���ά����ϸ 
	 * @param map
	 * @return
	 */
	public int insertServiceingBooking(HashMap servicingMap, HashMap detail) throws Exception;
	/**
	 * �޸�ά����ϸ��¼
	 * @param map
	 * @return
	 */
	public int updateServiceingBooking(HashMap servicingMap, HashMap detail) throws Exception;
	/**
	 * ɾ������ά����ϸ 
	 * @param map
	 * @return
	 */
	public int deleteServiceingBooking(HashMap map) throws Exception;
	
	/**
	 * ɾ��ά����ϸ
	 * @param map
	 * @return
	 */
	public int deleteServiceingDetail(HashMap map);
}
