package net.trust.application.report.localitymanage.domain;

import java.util.HashMap;
import java.util.List;
/**
 * �ۺϱ��� -�� λ�ù���
 * @author chenqf
 *
 */
public interface LocalityManageFacade {
	
	public int findLocalityManageCount(HashMap map);
	
	public List findLocalityManage(HashMap map);
}
