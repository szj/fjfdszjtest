package net.trust.application.report.rtpdistance.domain;

import java.util.HashMap;
import java.util.List;
/**
 * �ۺϱ��� -�� �г���¼
 * @author chenqf
 *
 */
public interface RtpDistanceFacade {
	/**
	 * ��ѯ�г���¼����
	 * @param map
	 * @return
	 */
	public int findRtpDistanceCount(HashMap map);
	/**
	 * ��ѯ�г���¼
	 * @param map
	 * @return
	 */
	public List findRtpDistance(HashMap map);
}
