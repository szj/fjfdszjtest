package net.trust.application.systemManage.warninglog.domain;

import java.util.HashMap;
import java.util.List;
/**
 * Ԥ������
 * @author chenqf
 *
 */
public interface WarningLogManageFacade {
	/**
	 * Ԥ����¼������
	 * @param map
	 * @return
	 */
	public int findWarningLogCount(HashMap map);
	/**
	 * Ԥ����¼
	 * @param map
	 * @return
	 */
	public List findWarningLog(HashMap map);
	/**
	 * �޸�Ԥ����Ϣ
	 * @param map
	 * @return
	 */
	public int updateWarningLog(HashMap map);
}
