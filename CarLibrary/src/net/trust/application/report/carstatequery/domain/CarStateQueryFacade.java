package net.trust.application.report.carstatequery.domain;

import java.util.HashMap;
import java.util.List;

/**
 * �ۺϱ��� -�� ����״̬��ѯ
 * @author chenqf
 *
 */
public interface CarStateQueryFacade {
	/**
	 * ��ѯ����״̬��¼����
	 * @param map
	 * @return
	 */
	public int findCarStateQueryCount(HashMap map);
	/**
	 * ��ѯ����״̬��¼
	 * @param map
	 * @return
	 */
	public List findCarStateQuery(HashMap map);
}
