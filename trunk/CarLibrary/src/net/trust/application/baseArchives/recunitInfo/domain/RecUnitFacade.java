package net.trust.application.baseArchives.recunitInfo.domain;

import java.util.HashMap;
import java.util.List;
/**
 * ������λ��Ϣ����
 * @author zhengmh
 *
 */
public interface RecUnitFacade {
	/**
	 * ��ѯ������λ��Ϣ�ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findRecUnitInfoCount(HashMap map);
    /**
	 * ��ѯ������λ��Ϣ
	 * @param map
	 * @return
	 */
    public List findRecUnitInfo(HashMap map);
    /**
	 * ���������λ��Ϣ
	 * @param map
	 * @return
	 */
    public int insertRecUnitInfo(HashMap map);
    /**
	 * �޸�������λ��Ϣ
	 * @param map
	 * @return
	 */
	public int updateRecUnitInfo(HashMap map);
	
	/**
	 * ɾ��������λ��Ϣ
	 * @param map
	 * @return
	 */
	
	public int deleteRecUnitInfo(HashMap map);
}
