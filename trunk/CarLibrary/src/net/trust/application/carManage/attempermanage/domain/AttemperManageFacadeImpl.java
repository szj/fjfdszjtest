package net.trust.application.carManage.attempermanage.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.utils.sms.SMProxySendFacade;
import net.trust.utils.sms.SMProxySendFacadeImplTimeTask;
import net.trust.utils.sms.SmsBean;
/**
 * ���ȹ���
 *
 */
public class AttemperManageFacadeImpl implements AttemperManageFacade {
	public BaseSqlMapDAO baseSqlMapDAO;
	public BaseSqlMapDAO sqlServerBaseSqlMapDAO;
	
	private SMProxySendFacade smproxySendFacade;
	
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	public BaseSqlMapDAO getSqlServerBaseSqlMapDAO() {
		return sqlServerBaseSqlMapDAO;
	}
	public void setSqlServerBaseSqlMapDAO(BaseSqlMapDAO sqlServerBaseSqlMapDAO) {
		this.sqlServerBaseSqlMapDAO = sqlServerBaseSqlMapDAO;
	}

	/**
	 * ���ȹ����¼��
	 * @param map
	 * @return
	 */
	public int findAttemperCount(HashMap map){
		return ((Integer)baseSqlMapDAO.queryForObject("AttemperManage.findAttemperCount", map));
	}
	/**
	 * ���ȹ����¼
	 * @param map
	 * @return
	 */
	public List findAttemper(HashMap map){
		return baseSqlMapDAO.queryForList("AttemperManage.findAttemper", map);
	}
	/**
	 * �������ȼ�¼
	 * @param map
	 * @return	1:�ɹ�
	 * 			0��ʧ��
	 * 			-100���������Ϊ��
	 * 			-101����ϵͳ���޸ó�����Ϣ
	 * 			-200��˾����Ϊ��
	 * 			-201����ϵͳ����˾����Ϣ
	 */
	public HashMap insertAttemper(HashMap map){
		if (null == map.get("carNoCode") || "".equals(map.get("carNoCode"))){
			map.clear();
			map.put("st", -100);//�������Ϊ��
			map.put("attemperManageId", "");
			return map;	
		}
//		if (null == map.get("motorman") || "".equals(map.get("motorman"))){
//			map.clear();
//			map.put("st", -200);//˾����Ϊ��
//			map.put("attemperManageId", "");
//			return map;
//		}
		
		//ͨ��Ҫ���ȵ�GPS���ƺ�ȡ��ϵͳ�г���ID
		
		HashMap Ctmp=new HashMap();
		Ctmp.put("carNoCode", map.get("carNoCode").toString());
		List list = baseSqlMapDAO.queryForList("CarManage.findCarInfo",Ctmp);
		if (null == list || list.size() == 0){
			map.clear();
			map.put("st", -101);//��ϵͳ���޸ó�����Ϣ
			map.put("attemperManageId", "");
			return map;
		}
		
		HashMap tmp = (HashMap)list.get(0);
		if (null == tmp.get("car_no_id") || "".equals(tmp.get("car_no_id"))){
			map.clear();
			map.put("st", -101);//��ϵͳ���޸ó�����Ϣ
			map.put("attemperManageId", "");
			return map;
		}
		
		map.put("carNoId", tmp.get("car_no_id"));
		map.put("carPhone", tmp.get("car_phone"));
		
		//ͨ��Ҫ����GPS������˾����ȡ��ϵͳ��Ա��ID
//		map.put("staffCode", map.get("motorman"));
//		list = baseSqlMapDAO.queryForList("EmployeeInfoManage.findEmployeeInfo", map);
//		if (null == list || list.size() == 0){
//			map.clear();
//			map.put("st", -201);//��ϵͳ����˾����Ϣ
//			map.put("attemperManageId", "");
//			return map;
//		}
//		
//		tmp = (HashMap)list.get(0);
//		if (null == tmp.get("staff_info_id") || "".equals(tmp.get("staff_info_id"))){
//			map.clear();
//			map.put("st", -201);//��ϵͳ����˾����Ϣ
//			map.put("attemperManageId", "");
//			return map;
//		}
		
		map.put("motorId", tmp.get("staff_info_id"));
		
		//����������Ϣ��¼
		String attemperManageId = baseSqlMapDAO.sequences("attemper_manage_id");
		map.put("attemperManageId", attemperManageId);
		int st = baseSqlMapDAO.update("AttemperManage.insertAttemper", map);
		//���ȳɹ�����ж��ŷ���
		if (st > 0){
			if (null != map.get("carPhone") && !"".equals(map.get("carPhone"))){
				String sendSmsId = baseSqlMapDAO.sequences("send_sms_id");
				HashMap param = new HashMap();
				param.put("sendSmsId", sendSmsId);		//��ˮ��
				param.put("callStaffId", "");	//�����߶�ӦԱ����ID
				param.put("callManName", "");	//����������
				param.put("callPhone", map.get("carPhone"));	//�������ֻ�����
				param.put("sendContent", map.get("smsContext"));//��������
				param.put("staffId", map.get("createMan"));			//��������
				param.put("sourceOrderType", "2");		//ԭ������
				param.put("sourceOrderCode", attemperManageId);//ԭ������
				param.put("cityId", map.get("cityId"));//ԭ������
				
				baseSqlMapDAO.insert("SmsManage.insertSendSmsRecord", param);
				
				
				ArrayList mobileList=new ArrayList();
				mobileList.add((String)map.get("carPhone"));
				SmsBean smsBean = new SmsBean();
				smsBean.setMobileNoList(mobileList);
				smsBean.setSmsContent((String)map.get("smsContext"));
				smsBean.setSn("");
				int res=0;
				try{
				res = smproxySendFacade.SendMessage(smsBean);
				}catch(Exception e){
					System.out.println(e.toString());
				}
				if (res == 1){
					param.clear();
					param.put("sendSmsId", sendSmsId);		//��ˮ��
					baseSqlMapDAO.update("SmsManage.updateSendSmsState", param);
				}
			}
		}
		
		map.clear();
		map.put("st", st);
		map.put("attemperManageId", attemperManageId);
		
		return map;
	}
	/**
	 * �޸ĵ��ȼ�¼
	 * @param map
	 * @return
	 */
	public int updateAttemper(HashMap map){
		return baseSqlMapDAO.update("AttemperManage.updateAttemper", map);
	}
	/**
	 * ɾ�����ȼ�¼
	 * @param map
	 * @return
	 */
	public int deleteAttemper(HashMap map){
		return baseSqlMapDAO.update("AttemperManage.deleteAttemper", map);
	}
	
	/**
	 * ��ѯGPSϵͳ���봫��λ��ƥ��ĳ�������
	 * @param map
	 * @return
	 */
	public List getGPSCarLocus(HashMap map){
		return sqlServerBaseSqlMapDAO.queryForList("AttemperManage.findGPSCarLocus", map);
	}
	/**
	 * @return the smproxySendFacade
	 */
	public SMProxySendFacade getSmproxySendFacade() {
		return smproxySendFacade;
	}
	/**
	 * @param smproxySendFacade the smproxySendFacade to set
	 */
	public void setSmproxySendFacade(SMProxySendFacade smproxySendFacade) {
		this.smproxySendFacade = smproxySendFacade;
	}

}
