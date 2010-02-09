package net.trust.application.carManage.expedite.domain;

import java.util.HashMap;
import java.util.List;
/**
 * �ɳ��Ǽ�
 *
 */
public interface ExpediteFacade {
	/**
	 * �ɳ���Ϣ
	 * @param map
	 * @return
	 */
    public int findExpediteCount(HashMap map);
    
    public List findExpedite(HashMap map);
    
    public HashMap insertExpedite(HashMap map,HashMap roldInfo) throws Exception;
    
	public HashMap updateExpedite(HashMap map,HashMap roldInfo)throws Exception;
	
	public int deleteExpedite(HashMap map) throws Exception;
	
	/**
	 * ��ѯ�ɳ���س���ϵ
	 * @param map
	 * @return
	 */
	public int findExpediteAndGobackCount(HashMap map);
	/**
	 * ��ѯ�ɳ���س���ϵ����
	 * @param map
	 * @return
	 */
	public List findExpediteAndGoback(HashMap map);
	
	/**
	 * �س���Ϣ
	 * @param map
	 * @return
	 */
	public int findGobackCount(HashMap map);
    
    public List findGoback(HashMap map);
    
    public int insertGoBack(HashMap map,HashMap roldInfo) throws Exception;
    
    public int updateGoBack(HashMap map,HashMap roldInfo) throws Exception;
  
	public int deleteGoback(HashMap map);
	
	
	/**
	 * ��ת��Ϣ
	 * @param map
	 * @return
	 */
    public List findRoldInfo(HashMap map);
    
    public int insertRoldInfo(HashMap map);
    
	public int updateRoldInfo(HashMap map);
	
	public int deleteRoldInfo(HashMap map);
	
	
	/**
	 * 2009-02-25
	 * �ɳ�����
	 * @param map
	 * @return
	 */
    public int findApplyerCount(HashMap map);
    
    public List findApplyer(HashMap map);
    
    public int insertApplyer(HashMap map) throws Exception;
    
	public int updateApplyer(HashMap map)throws Exception;
	
	public int deleteApplyer(HashMap map) throws Exception;
	/**
	 * 2009-02-26
	 * �ɳ�������־
	 * @param map
	 * @return
	 */
    public int findFlowerTaskCount(HashMap map);
    
    public List findFlowerTask(HashMap map);
    
	public int updateFlowerTask(HashMap map)throws Exception;
	/**
	 * 2009-02-28
	 * ������־���Զ����� 
	 * @param map
	 * @return
	 */
	public void execProFlowerTask(HashMap map);
	/**
	 * �������뵥���ֱ�Ϊ"����"��"�����ύ"������
	 * @param map
	 */
	public int saveApplyer(HashMap map)throws Exception;
	/**
	 * ����������Ϊͬ��/��ͬ��
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int proAgent(HashMap map) throws Exception;
	
	/**
	 * �ͻ�����
	 * @param map
	 * @return
	 */
	public int sendFeedback(HashMap map);
	
	
	
	/**
	 * 2009-04-14
	 * ˾���г��Ǽ�
	 * @param map
	 * @return
	 */
    public int findDriversmsCount(HashMap map);
    
    public List findDriversms(HashMap map);
    
    public int insertDriversms(HashMap map) throws Exception;
    
	public int updateDriversms(HashMap map)throws Exception;
	
	public int deleteDriversms(HashMap map) throws Exception;
	
	/**
	 * �����س���Ϣ��excel
	 */
	public int findRoldInfoExcelCount(HashMap map);
    
    public List findRoldInfoExcel(HashMap map);
		
}
