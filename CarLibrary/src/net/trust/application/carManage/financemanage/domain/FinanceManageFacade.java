package net.trust.application.carManage.financemanage.domain;

import java.util.HashMap;
import java.util.List;
/**
 * �������
 * @author chenqf
 *
 */
public interface FinanceManageFacade {
	/**
	 * ��ѯ���񵥾�����
	 * @param map
	 * @return
	 */
	public int findFinanceCount(HashMap map);
	/**
	 * ��ѯ���񵥾�
	 * @param map
	 * @return
	 */
	public List findFinance(HashMap map);
	/**
	 * ��������������� 
	 * @param map
	 * @return
	 */
	public int insertFinance(HashMap map);
	/**
	 * �޸Ĳ��񵥾�
	 * @param map
	 * @return
	 */
	public int updateFinance(HashMap map);
	/**
	 * ɾ�����񵥾�
	 * @param map
	 * @return
	 */
	public int deleteFinance(HashMap map);
}
