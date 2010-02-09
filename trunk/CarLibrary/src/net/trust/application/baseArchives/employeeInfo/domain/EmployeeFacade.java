package net.trust.application.baseArchives.employeeInfo.domain;

import java.util.HashMap;
import java.util.List;

/**
 * Ա����Ϣ����
 * @author chenqf
 *
 */
public interface EmployeeFacade {
	/**
	 * ��ѯԱ����Ϣ�ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findEmployeeInfoCount(HashMap map);
    /**
	 * ��ѯԱ����Ϣ
	 * @param map
	 * @return
	 */
    public List findEmployeeInfo(HashMap map);
    /**
	 * ���Ա����Ϣ
	 * @param map
	 * @return
	 */
    public int insertEmployeeInfo(HashMap map);
    /**
	 * �޸�Ա����Ϣ
	 * @param map
	 * @return
	 */
	public int updateEmployeeInfo(HashMap map);
	
	/**
	 * ɾ��Ա����Ϣ
	 * @param map
	 * @return
	 */
	public int deleteEmployeeInfo(HashMap map);
	
	/**
	 * Ա����Ϣ(��ʻԱ),ͨ�����Ź���
	 */
    public List ajaxJsonEmp(HashMap map);
}
