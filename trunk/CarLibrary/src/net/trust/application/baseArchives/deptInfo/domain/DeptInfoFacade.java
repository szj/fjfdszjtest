package net.trust.application.baseArchives.deptInfo.domain;

import java.util.HashMap;
import java.util.List;

public interface DeptInfoFacade {
	/**
	 * ��ѯ������Ϣ�ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findDeptInfoCount(HashMap map);
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findDeptInfo(HashMap map);
    /**
	 * ��Ӳ�����Ϣ
	 * @param map
	 * @return
	 */
    public int insertDeptInfo(HashMap map);
    /**
	 * �޸Ĳ�����Ϣ
	 * @param map
	 * @return
	 */
	public int updateDeptInfo(HashMap map);
	
	/**
	 * ɾ��������Ϣ
	 * @param map
	 * @return
	 */
	public int deleteDeptInfo(HashMap map);
}
