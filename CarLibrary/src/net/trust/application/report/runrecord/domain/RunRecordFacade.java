package net.trust.application.report.runrecord.domain;

import java.util.HashMap;
import java.util.List;
/**
 * �ۺϱ��� -�� �г���¼
 * @author chenqf
 *
 */
public interface RunRecordFacade {
	/**
	 * ��ѯ�г���¼����
	 * @param map
	 * @return
	 */
	public int findRunRecordCount(HashMap map);
	/**
	 * ��ѯ�г���¼
	 * @param map
	 * @return
	 */
	public List findRunRecord(HashMap map);
}
