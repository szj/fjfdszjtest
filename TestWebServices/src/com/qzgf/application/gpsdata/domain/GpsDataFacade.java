package com.qzgf.application.gpsdata.domain;

import java.util.HashMap;
import java.util.List;
/**
 */
public interface GpsDataFacade {
	/**
	 * ��ѯ������¼
	 * @param map
	 * @return
	 */
	public List findGpsRecord(HashMap map);
	/**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
	public List findGpsCarMsg(HashMap map);
	/**
	 * ��ѯ������Ϣ
	 * @param map
	 * @return
	 */
	public List findGpsWarnMsg(HashMap map);
	
	/**
	 * ��ʱ����ѯ��������AreaId(103)�����г���������Ϣ
	 * @param map
	 * @return
	 */
	public List findTimeGpsRecord(HashMap map);
	/**
	 * ��̬sql��ѯ
	 * @param map
	 * @return
	 */
	public List DynamicSql(HashMap map);
	
}
