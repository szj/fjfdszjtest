package net.trust.application.baseArchives.institutionManage.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.application.systemManage.manager.dto.UserInfo;
/**
 * �������
 * @author zhengmh
 *
 */
public interface InstitutionFacade {
	/**
	 * ��ѯ�����ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findInstitutionCount(HashMap map);
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findInstitutionInfo(HashMap map);
    /**
	 * ��ӻ�����Ϣ
	 * @param map
	 * @return
	 */
    public int insertInstitution(HashMap map);
    /**
	 * �޸Ļ�����Ϣ
	 * @param map
	 * @return
	 */
	public int updateInstitutionInfo(HashMap map);
	
	/**
	 * ɾ��������Ϣ
	 * @param map
	 * @return
	 */
	public int deleteInstitutionInfo(HashMap map);
	
}
