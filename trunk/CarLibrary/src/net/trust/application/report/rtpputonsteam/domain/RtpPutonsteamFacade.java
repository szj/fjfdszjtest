package net.trust.application.report.rtpputonsteam.domain;

import java.util.HashMap;
import java.util.List;
/**
 * �ۺϱ���-->���͹���(�������������쳣)
 * @author zhemgmh
 *
 */
public interface RtpPutonsteamFacade {
	/**
	 * ��ѯ������Ϣ�ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findRtpPutonsteamCount(HashMap map);
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findRtpPutonsteam(HashMap map);
}
