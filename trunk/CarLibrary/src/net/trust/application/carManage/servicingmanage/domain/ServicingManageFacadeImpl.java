package net.trust.application.carManage.servicingmanage.domain;

import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;

public class ServicingManageFacadeImpl implements ServicingManageFacade {
	private BaseSqlMapDAO baseSqlMapDAO;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	
	/**
	 * ��ѯ����ά�޼�¼���� 
	 * @param map
	 * @return
	 */
	public int findServiceingCount(HashMap map){
		return ((Integer)baseSqlMapDAO.queryForObject("ServicingManage.findServiceingCount", map)).intValue();
	}
	/**
	 * ��ѯ����ά�޼�¼
	 * @param map
	 * @return
	 */
	public List findServiceing(HashMap map){
		return baseSqlMapDAO.queryForList("ServicingManage.findServiceing", map);
	}
	/**
	 * ����ά�޵Ǽ� 
	 * @param map
	 * @return
	 */
	public int insertServiceingApply(HashMap map) throws Exception{
		int st = 0;
		st = baseSqlMapDAO.update("ServicingManage.insertServiceingApply", map);
		if (st == 0){
			throw new Exception("����ά������ʱ����");
		}
		
		HashMap carInfoMap = new HashMap();
		//���ó���״̬Ϊ 3������
		carInfoMap.put("carState", "3");
		carInfoMap.put("carNoId", map.get("carNoId"));
		st = baseSqlMapDAO.update("CarManage.updateCar", carInfoMap);
		if (st == 0){
			throw new Exception("�޸ĳ���״̬ʱ����");
		}
		return st;
	}
	/**
	 * �޸ĳ���ά����Ϣ 
	 * @param map
	 * @return
	 */
	public int updateServiceingApply(HashMap map) throws Exception{
		int st = 0;
		
		HashMap servicingMap = new HashMap();
		servicingMap.put("carNoId", map.get("carNoId"));
		servicingMap.put("maintainId", map.get("maintainId"));
		
		//�жϵ�ǰ�޸ĵ�ά�����룬�Ƿ��иı�ά�޵ĳ������
		int ifAlteration = ((Integer)baseSqlMapDAO.queryForObject("ServicingManage.findServiceingCount", servicingMap)).intValue();
		//�ı���ά�޳�����ţ��轫ԭ���ĳ���״̬�Ļؿ��У��ٽ��µĳ���״̬��Ϊ����
		if (ifAlteration == 0){
			servicingMap.remove("carNoId");
			servicingMap = (HashMap)baseSqlMapDAO.queryForObject("ServicingManage.findServiceing", servicingMap);
			
			HashMap carInfoMap = new HashMap();
			//��ԭ���ĳ���״̬�Ļؿ���
			carInfoMap.put("carNoId", servicingMap.get("car_no_id"));	//ȡ��ԭ���ĳ���ID
			carInfoMap.put("carState", "1");							//�趨״̬Ϊ����
			st = baseSqlMapDAO.update("CarManage.updateCar", carInfoMap);
			if (st == 0){
				throw new Exception("�޸�ԭ����״̬ʱ����");
			}
			
			//���µĳ���״̬��Ϊ����
			carInfoMap.put("carNoId", map.get("carNoId"));	//ȡ���µĳ���ID
			carInfoMap.put("carState", "3");							//�趨״̬Ϊ����
			st = baseSqlMapDAO.update("CarManage.updateCar", carInfoMap);
			if (st == 0){
				throw new Exception("�޸�ԭ����״̬ʱ����");
			}
		}
		
		st = baseSqlMapDAO.update("ServicingManage.updateServiceing", map);
		if (st == 0){
			throw new Exception("�޸�ά������ʱ����");
		}
		return st;
	}
	/**
	 * ɾ������ά�޼�¼ 
	 * @param map
	 * @return
	 */
	public int deleteServiceingApply(HashMap map) throws Exception{
		int st = 0;
		
		//���ó���״̬Ϊ 1������
		HashMap servicingMap = (HashMap)baseSqlMapDAO.queryForObject("ServicingManage.findServiceing", map);
		HashMap carInfoMap = new HashMap();
		carInfoMap.put("carNoId", servicingMap.get("car_no_id"));	//ȡ�ó���ID
		carInfoMap.put("carState", "1");							//�趨״̬Ϊ����
		st = baseSqlMapDAO.update("CarManage.updateCar", carInfoMap);
		if (st == 0){
			throw new Exception("�޸ĳ���״̬ʱ����");
		}
		
		st = baseSqlMapDAO.update("ServicingManage.deleteServiceing", map);
		if (st == 0){
			throw new Exception("ɾ��ά������ʱ����");
		}
		
		return st;
	}
	/**
	 * ����ά����ϸ��¼ 
	 * @param map
	 * @return
	 */
	public List findServiceingDetail(HashMap map){
		return baseSqlMapDAO.queryForList("ServicingManage.findServiceingDetail", map);
	}
	/**
	 * ��ӳ���ά����ϸ 
	 * @param map
	 * @return
	 */
	public int insertServiceingBooking(HashMap servicingMap, HashMap detail) throws Exception{
		servicingMap.put("maintainState", "2");
		int st = baseSqlMapDAO.update("ServicingManage.updateServiceing", servicingMap);
		if (st == 0){
			throw new Exception("��������ά�޵Ǽ�ʱ����");
		}
		
		//�޸ĳ���״̬
		HashMap carInfoMap = new HashMap();
		carInfoMap.put("carNoId", servicingMap.get("carNoId"));	//ȡ�ó���ID
		carInfoMap.put("carState", "1");							//�趨״̬Ϊ����
		st = baseSqlMapDAO.update("CarManage.updateCar", carInfoMap);
		if (st == 0){
			throw new Exception("�޸ĳ���״̬ʱ����");
		}

		//������ϸ
		String maintainId = servicingMap.get("maintainId").toString();
		String cityId = servicingMap.get("cityId").toString();
		int detailRowNum = Integer.valueOf(servicingMap.get("detailRowNum").toString());
		
		try{
			String[] maintainItem = (String[])detail.get("maintainItem");
			String[] unit = (String[])detail.get("unit");
			String[] num = (String[])detail.get("num");
			String[] price = (String[])detail.get("price");
			String[] charge = (String[])detail.get("charge");
			String[] memo = (String[])detail.get("memo");
			
			HashMap detailMap = null;
			for (int i=0; i<detailRowNum; i++){
				if (null != maintainItem[i] && !"".equals(maintainItem[i])){
					detailMap = new HashMap();
					detailMap.put("maintainItem", maintainItem[i]);
					detailMap.put("unit", unit[i]);
					detailMap.put("num", num[i]);
					detailMap.put("price", price[i]);
					detailMap.put("charge", charge[i]);
					detailMap.put("memo", memo[i]);
					detailMap.put("maintainId", maintainId);
					detailMap.put("cityId", cityId);
					
					baseSqlMapDAO.update("ServicingManage.insertServiceingDetail", detailMap);
				}
			}
		}catch (Exception e){
			if (null != detail.get("maintainItem") && !"".equals(detail.get("maintainItem"))){
				detail.put("maintainId", maintainId);
				detail.put("cityId", cityId);
				baseSqlMapDAO.update("ServicingManage.insertServiceingDetail", detail);
			}
		}
		
		
		//�������񵥾�
		HashMap financemap = new HashMap();
		financemap.put("sourceOrderType", 2);    	
		financemap.put("sourceOrderCode", maintainId);
		financemap.put("charge", servicingMap.get("charge"));
		financemap.put("carNoId", servicingMap.get("carNoId"));
		financemap.put("createMan", servicingMap.get("editorMan"));
		financemap.put("cityId", servicingMap.get("cityId"));
		st = baseSqlMapDAO.update("FinanceManage.insertFinance", financemap);
		if (st == 0){
			throw new Exception("�������񵥾�ʱ����");
		}
		
		return st;
	}
	/**
	 * �޸�ά����ϸ��¼
	 * @param map
	 * @return
	 */
	public int updateServiceingBooking(HashMap servicingMap, HashMap detail) throws Exception{
		int st = 0;
		st = baseSqlMapDAO.update("ServicingManage.updateServiceing", servicingMap);
		if (st == 0){
			throw new Exception("�޸�ά����ϸʱ����");
		}
		
		//�޸Ĳ��񵥾�
		servicingMap.put("sourceOrderCode", servicingMap.get("maintainId"));
		servicingMap.put("sourceOrderType", "2");
		st = baseSqlMapDAO.update("FinanceManage.updateFinance", servicingMap);
		if (st == 0){
			throw new Exception("�޸Ĳ��񵥾�ʱ����");
		}
		
		//��ɾ����ǰ����ϸ��¼
		baseSqlMapDAO.update("ServicingManage.deleteServiceingDetail", servicingMap);
		
		//���´�����ϸ
		String maintainId = servicingMap.get("maintainId").toString();
		String cityId = servicingMap.get("cityId").toString();
		int detailRowNum = Integer.valueOf(servicingMap.get("detailRowNum").toString());
		
		try{
			String[] maintainItem = (String[])detail.get("maintainItem");
			String[] unit = (String[])detail.get("unit");
			String[] num = (String[])detail.get("num");
			String[] price = (String[])detail.get("price");
			String[] charge = (String[])detail.get("charge");
			String[] memo = (String[])detail.get("memo");
			
			HashMap detailMap = null;
			for (int i=0; i<detailRowNum; i++){
				if (null != maintainItem[i] && !"".equals(maintainItem[i])){
					detailMap = new HashMap();
					detailMap.put("maintainItem", maintainItem[i]);
					detailMap.put("unit", unit[i]);
					detailMap.put("num", num[i]);
					detailMap.put("price", price[i]);
					detailMap.put("charge", charge[i]);
					detailMap.put("memo", memo[i]);
					detailMap.put("maintainId", maintainId);
					detailMap.put("cityId", cityId);
					
					baseSqlMapDAO.update("ServicingManage.insertServiceingDetail", detailMap);
				}
			}
		}catch (Exception e){
			if (null != detail.get("maintainItem") && !"".equals(detail.get("maintainItem"))){
				detail.put("maintainId", maintainId);
				detail.put("cityId", cityId);
				baseSqlMapDAO.update("ServicingManage.insertServiceingDetail", detail);
			}
		}
		
		return st;
	}
	/**
	 * ɾ������ά����ϸ 
	 * @param map
	 * @return
	 */
	public int deleteServiceingBooking(HashMap map) throws Exception{
		int st = 0;
		
		//ɾ��ά����ϸ��
		baseSqlMapDAO.update("ServicingManage.deleteServiceingDetail", map);
		
		//���ó���״̬Ϊ 1������
		HashMap servicingMap = (HashMap)baseSqlMapDAO.queryForObject("ServicingManage.findServiceing", map);
		HashMap carInfoMap = new HashMap();
		carInfoMap.put("carNoId", servicingMap.get("car_no_id"));	//ȡ�ó���ID
		carInfoMap.put("carState", "1");							//�趨״̬Ϊ����
		st = baseSqlMapDAO.update("CarManage.updateCar", carInfoMap);
		if (st == 0){
			throw new Exception("�޸ĳ���״̬ʱ����");
		}
		
		st = baseSqlMapDAO.update("ServicingManage.deleteServiceing", map);
		if (st == 0){
			throw new Exception("ɾ��ά�޵Ǽ�ʱ����");
		}
		
		//ɾ�����񵥾�
		map.put("sourceOrderCode", map.get("putonsteamId"));
		map.put("sourceOrderType", "1");
		st = baseSqlMapDAO.update("FinanceManage.deleteFinance",map);
		if (st == 0){
			throw new Exception("ɾ�����񵥾�ʱ����");
		}
		
		return st;
	}

	/**
	 * ɾ��ά����ϸ
	 * @param map
	 * @return
	 */
	public int deleteServiceingDetail(HashMap map){
		return baseSqlMapDAO.update("ServicingManage.deleteServiceingDetail", map);
	}
}
