package net.trust.application.report.rtpmaintain.domain;

import java.util.HashMap;
import java.util.List;
/**
 * ��������
 * @author zhengmh
 *
 */
public interface RtpMaintainFacade {
	/**
	 * ��ѯ���������ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findRtpMaintainCount(HashMap map);
    /**
	 * ��ѯ����������Ϣ
	 * @param map
	 * @return
	 */
    public List findRtpMaintain(HashMap map);
}
