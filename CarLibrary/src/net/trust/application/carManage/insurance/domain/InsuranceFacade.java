package net.trust.application.carManage.insurance.domain;

import java.util.HashMap;
import java.util.List;
/**
 * ���չ���
 *
 */
public interface InsuranceFacade {
	/**
	 * ��ѯ������Ϣ�ܼ�¼��
	 * @param map
	 * @return
	 */
    public int findInsuranceCount(HashMap map);
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findInsurance(HashMap map);
    /**
	 * ��ӱ�����Ϣ
	 * @param map
	 * @return
	 */
    public int insertInsurance(HashMap map);
    /**
	 * �޸ı�����Ϣ
	 * @param map
	 * @return
	 */
	public int updateInsurance(HashMap map);
	
	/**
	 * ɾ��������Ϣ
	 * @param map
	 * @return
	 */
	public int deleteInsurance(HashMap map);
}
