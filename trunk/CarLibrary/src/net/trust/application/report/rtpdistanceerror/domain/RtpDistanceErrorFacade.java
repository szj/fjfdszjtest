package net.trust.application.report.rtpdistanceerror.domain;

import java.util.HashMap;
import java.util.List;
/**
 * �ۺϱ��� -�� �г���¼
 * @author chenqf
 *
 */
public interface RtpDistanceErrorFacade {
	/**
	 * ��ѯ�г���¼����
	 * @param map
	 * @return
	 */
	public int findRtpDistanceErrorCount(HashMap map);
	/**
	 * ��ѯ�г���¼
	 * @param map
	 * @return
	 */
	public List findRtpDistanceError(HashMap map);
}
