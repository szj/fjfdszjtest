package net.trust.application.carManage.staffcheckin.domain;

import java.util.HashMap;
import java.util.List;

/**
 * ��Ա���ڹ���
 *
 */
public interface StaffCheckinManageFacade {
	/**
	 * ��Ա���ڼ�¼����
	 * @param map
	 * @return
	 */
	public int findStaffCheckinCount(HashMap map);
	/**
	 * ��Ա���ڼ�¼
	 * @param map
	 * @return
	 */
	public List findStaffCheckin(HashMap map);
}
