package net.trust.application.report.rtpmotorman.domain;

import java.util.HashMap;
import java.util.List;
/**
 * �ۺϱ��� -�� ������ѯ
 * @author chenqf
 *
 */
public interface RtpMotormanFacade {
	/**
	 * ��ѯ���������ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findRtpMotormanCount(HashMap map);
    /**
	 * ��ѯ����������Ϣ
	 * @param map
	 * @return
	 */
    public List findRtpMotorman(HashMap map);
}
