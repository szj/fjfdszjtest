package net.trust.application.baseArchives.carInfo.domain;

import java.util.HashMap;
import java.util.List;
/**
 * ������Ϣ
 * @author zhengmh
 *
 */
public interface CarFacade {
	/**
	 * ��ѯ�����ܼ�¼��Ϣ
	 * @param map
	 * @return
	 */
    public int findCarCount(HashMap map);
    /**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
    public List findCarInfo(HashMap map);
    /**
	 * ��ӳ�����Ϣ
	 * @param map
	 * @return
	 */
    public int insertCar(HashMap map);
    /**
	 * �޸ĳ�����Ϣ
	 * @param map
	 * @return
	 */
	public int updateCarInfo(HashMap map);
	
	/**
	 * ɾ��������Ϣ
	 * @param map
	 * @return
	 */
	public int deleteCarInfo(HashMap map);
	
	/**
	 * ��ѯ�������豸��ϵ
	 * @param map
	 * @return
	 */
	public List findCarFixing(HashMap map);
	/**
	 * ��ѯGPSϵͳ�ϳ�����ǰ���
	 */
	public String findGPSCarCurrMileage(HashMap map);
	/**
	 * ��ѯ��������������
	 * @param map
	 * @return
	 */
	public String findOilTotal(HashMap map);
	
	/**
	 * 2009-12-23������Ϣ,�ɳ��Ǽ���ʹ��
	 * @param map
	 * @return
	 */
    public List ajaxJsonCar(HashMap map);
}
