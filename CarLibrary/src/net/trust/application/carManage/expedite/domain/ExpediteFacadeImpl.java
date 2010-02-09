package net.trust.application.carManage.expedite.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import net.trust.IbatisDaoTools.BaseSqlMapDAO;
import net.trust.utils.sms.SMProxySendFacade;
import net.trust.utils.sms.SmsBean;

/**
 * �ɳ��Ǽ�
 * 
 */
public class ExpediteFacadeImpl implements ExpediteFacade {
	private BaseSqlMapDAO baseSqlMapDAO;

	private SMProxySendFacade smproxySendFacade;

	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}

	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
	/**
	 * �ɳ���Ϣ
	 * 
	 * @param map
	 * @return
	 */
	public int findExpediteCount(HashMap map) {
		return ((Integer) baseSqlMapDAO.queryForObject(
				"Expedite.findExpediteCount", map)).intValue();
	}

	public List findExpedite(HashMap map) {
		return baseSqlMapDAO.queryForList("Expedite.findExpedite", map);
	}

	/**
	 * ���ŷ���
	 * 
	 * @param smsManId
	 *            �����߶�ӦԱ����ID
	 * @param callManName
	 *            ����������
	 * @param smsMobileNo
	 *            �������ֻ�����
	 * @param smsContext
	 *            ��������
	 * @param staffId
	 *            ������ID
	 * @param sourceOrderCode
	 *            ԭ���ţ���Ϊ�ɳ����ĵ��ݺ�
	 */
	private void sendSms(String[] smsManId, String[] callManName,
			String[] smsMobileNo, String[] smsContext, String staffId,
			String sourceOrderCode, String cityId, String sourceOrderType,String[] msistype,String per) {
		int st = 0;
		List list = null;
		SmsBean smsBean = null;
		HashMap param = null;
		String sendSmsId = "";// ���Ͷ�������
		String msisdnId = "";// �Ѿ����Ͷ�������(-Դ�ն�MSISDN����)

		for (int i = 0; i < smsManId.length; i++) {
			if (null != smsMobileNo[i] && !"".equals(smsMobileNo[i])) {
				sendSmsId = baseSqlMapDAO.sequences("send_sms_id");
				if(msistype!=null)//�ǿ�
				{
					if(msistype[i].equals("1"))//��Ҫ�ظ��Ĵ���
					{
						msisdnId =per+ baseSqlMapDAO.sequencesmsisdn("msisdn_id");
					}
				}

				param = new HashMap();
				param.put("sendSmsId", sendSmsId); // ��ˮ��
				param.put("callStaffId", smsManId[i]); // �����߶�ӦԱ����ID
				param.put("callManName", callManName[i]); // ����������
				param.put("callPhone", smsMobileNo[i]); // �������ֻ�����
				param.put("sendContent", smsContext[i]);// ��������
				param.put("staffId", staffId); // ��������
				param.put("sourceOrderType", sourceOrderType); // ԭ������
				param.put("sourceOrderCode", sourceOrderCode);// ԭ����
				param.put("msisdnId", msisdnId);// ���ų���
				param.put("cityId", cityId);// ԭ������

				baseSqlMapDAO.insert("SmsManage.insertSendSmsRecord", param);
				smsBean = new SmsBean();
				ArrayList mobileList = new ArrayList();
				mobileList.add(smsMobileNo[i]);
				smsBean.setMobileNoList(mobileList);
				smsBean.setSmsContent(smsContext[i]);
				smsBean.setSn(msisdnId);
				try {
					st = smproxySendFacade.SendMessage(smsBean);
				} catch (Exception e) {
					System.out.println(e.toString());
				}

				if (st == 1) {
					param.clear();
					param.put("sendSmsId", sendSmsId); // ��ˮ��
					baseSqlMapDAO.update("SmsManage.updateSendSmsState", param);
				}
			}
		}
	}

	/**
	 * �����ɳ���¼
	 */
	public HashMap insertExpedite(HashMap map, HashMap roldInfo)
			throws Exception {

		String expediteCarId = baseSqlMapDAO.sequences("expedite_car_id");
		map.put("expediteCarId", expediteCarId);
		// �����ɳ���Ϣ��
		int st = baseSqlMapDAO.update("Expedite.insertExpedite", map);
		if (st == 0) {
			throw new Exception("����ɳ���Ϣʧ��.");
		}
		// ������תվ��Ϣ��������¼
		if (null != roldInfo && roldInfo.size() > 0) {
			this.addRoldInfo(roldInfo, Integer.valueOf(
					roldInfo.get("num").toString()).intValue(), expediteCarId,
					"1");
		}

		// ���Ͷ���
		sendSms((String[]) map.get("smsManId"), (String[]) map
				.get("smsManName"), (String[]) map.get("smsMobileNo"),
				(String[]) map.get("smsContext"), map.get("createMan")
						.toString(), expediteCarId, map.get("cityId")
						.toString(), "1",null,"");
		//2009.6.10 ����(0:�����ɳ���ģ��)��Ҫ�޸ĳ���״̬�����뵥״̬
		if (map.get("billType").toString().equals("0")) {
//			HashMap carInfoMap = new HashMap();
//			// ���ó���״̬Ϊ 2������
//			carInfoMap.put("carState", "2");
//			carInfoMap.put("carNoId", map.get("carNoId"));
//			st = baseSqlMapDAO.update("CarManage.updateCar", carInfoMap);
//			if (st == 0) {
//				throw new Exception("�޸ĳ���״̬ʱ����");
//			}

			// �������굥�ݺ��޸�ԭ�ɳ����뵥�ı�ʶλ��ʹ��Ϊ����������
			HashMap hm = new HashMap();
			hm.put("expediteapplyId", map.get("expediteapplyId").toString());
			hm.put("useState", 1);
			st = baseSqlMapDAO.update("Expedite.updateApplyer", hm);
			if (st == 0) {
				throw new Exception("�޸��ɳ����뵥״̬����");
			}
		}
		map.clear();
		map.put("st", st);
		map.put("expediteCarId", expediteCarId);
		return map;
	}

	/**
	 * �޸ĳ�����Ϣ
	 */
	public HashMap updateExpedite(HashMap map, HashMap roldInfo)
			throws Exception {
		int st = 0;
		String expediteCarId = map.get("expediteCarId").toString();

//		HashMap expediteMap = new HashMap();
//		expediteMap.put("carNoId", map.get("carNoId"));
//		expediteMap.put("expediteCarId", expediteCarId);
		
		//2009-06-10�����ɳ���ģ��,�޸ĳ���״̬�仯�Ĵ���
//		if (map.get("billType").toString().equals("0")) {
//			// �жϵ�ǰ�޸ĵĳ�����Ϣ���Ƿ��иı�����ĳ������
//			int ifAlteration = ((Integer) baseSqlMapDAO.queryForObject(
//					"Expedite.findExpediteCount", expediteMap));
//
//			if (ifAlteration == 0) {
//				expediteMap.remove("carNoId");
//				expediteMap = (HashMap) baseSqlMapDAO.queryForObject(
//						"Expedite.findExpedite", expediteMap);
//
//				HashMap carInfoMap = new HashMap();
//				// ��ԭ���ĳ���״̬�Ļؿ���
//				carInfoMap.put("carNoId", expediteMap.get("car_no_id")); // ȡ��ԭ���ĳ���ID
//				carInfoMap.put("carState", "1"); // �趨״̬Ϊ����
//				st = baseSqlMapDAO.update("CarManage.updateCar", carInfoMap);
//				if (st == 0) {
//					throw new Exception("�޸�ԭ����״̬ʱ����");
//				}
//
//				// ���µĳ���״̬��Ϊ����
//				carInfoMap.put("carNoId", map.get("carNoId")); // ȡ���µĳ���ID
//				carInfoMap.put("carState", "2"); // �趨״̬Ϊ����
//				st = baseSqlMapDAO.update("CarManage.updateCar", carInfoMap);
//				if (st == 0) {
//					throw new Exception("�޸�ԭ����״̬ʱ����");
//				}
//			}
//		}
		
		st = baseSqlMapDAO.update("Expedite.updateExpedite", map);
		if (st == 0) {
			throw new Exception("�޸ĳ�����Ϣʱ����");
		}
		// ������תվ��Ϣ��������¼
		map.put("roadType", "1");
		this.deleteRoldInfo(map);// ����תվ��Ϣȫ��Ϊ�鵵������������´����µ���תվ��Ϣ
		if (st == 0) {
			throw new Exception("�����תվ��Ϣ����");
		}

		// ���Ͷ���
		sendSms((String[]) map.get("smsManId"), (String[]) map
				.get("smsManName"), (String[]) map.get("smsMobileNo"),
				(String[]) map.get("smsContext"), map.get("editorMan")
						.toString(), expediteCarId, map.get("cityId")
						.toString(), "1",null,"");

		// ������תվ��Ϣ��������¼
		if (null != roldInfo && roldInfo.size() > 0) {
			this.addRoldInfo(roldInfo, Integer.valueOf(
					roldInfo.get("num").toString()).intValue(), expediteCarId,
					"1");
		}

		map.clear();
		map.put("st", st);
		map.put("expediteCarId", expediteCarId);

		return map;
	}

	/**
	 * ɾ��������Ϣ
	 */
	public int deleteExpedite(HashMap map) throws Exception {
		int st = 0;
		
		// 2009-06-10�����ɳ���ģ��,�޸ĳ���״̬�仯�Ĵ���
//		if (map.get("billType").toString().equals("0")) {
//			// ���ó���״̬Ϊ 1������
//			HashMap expediteMap = (HashMap) baseSqlMapDAO.queryForObject(
//					"Expedite.findExpedite", map);
//			HashMap carInfoMap = new HashMap();
//			carInfoMap.put("carNoId", expediteMap.get("car_no_id")); // ȡ�ó���ID
//			carInfoMap.put("carState", "1"); // �趨״̬Ϊ����
//			st = baseSqlMapDAO.update("CarManage.updateCar", carInfoMap);
//			if (st == 0) {
//				throw new Exception("�޸ĳ���״̬ʱ����");
//			}
//		}
		
		st = baseSqlMapDAO.update("Expedite.deleteExpedite", map);
		if (st == 0) {
			throw new Exception("ɾ��������Ϣʱ����");
		}

		return st;

	}

	/**
	 * ��ѯ�ɳ���س���ϵ
	 * 
	 * @param map
	 * @return
	 */
	public int findExpediteAndGobackCount(HashMap map) {
		return ((Integer) baseSqlMapDAO.queryForObject(
				"Expedite.findExpediteAndGobackCount", map)).intValue();
	}

	/**
	 * ��ѯ�ɳ���س���ϵ����
	 * 
	 * @param map
	 * @return
	 */
	public List findExpediteAndGoback(HashMap map) {
		return baseSqlMapDAO
				.queryForList("Expedite.findExpediteAndGoback", map);
	}

	/**
	 * �س���Ϣ
	 * 
	 * @param map
	 * @return
	 */
	public int findGobackCount(HashMap map) {
		return ((Integer) baseSqlMapDAO.queryForObject(
				"Expedite.findGobackCount", map)).intValue();
	}

	public List findGoback(HashMap map) {
		return baseSqlMapDAO.queryForList("Expedite.findGoback", map);
	}

	public int insertGoBack(HashMap map, HashMap roldInfo) throws Exception {
		String expediteCarId = map.get("expediteCarId").toString();
		// ����س���Ϣ��
		int st = baseSqlMapDAO.update("Expedite.insertGoBack", map);
		if (st == 0) {
			throw new Exception("��ӻس���Ϣʧ��.");
		}

		HashMap param = new HashMap();
		param.put("expediteState", "2");
		param.put("expediteCarId", map.get("expediteCarId"));
		st = baseSqlMapDAO.update("Expedite.updateExpedite", param);
		if (st == 0) {
			throw new Exception("�޸��ɳ�״̬����.");
		}

		//2009-06-10�����ɳ���ģ��,�޸ĳ���״̬�仯�Ĵ���
//		if (map.get("billType").toString().equals("0")) {
//			param = new HashMap();
//			param.put("carNoId", map.get("carNoId")); // ȡ�ó���ID
//			param.put("carState", "1"); // �趨״̬Ϊ����
//			st = baseSqlMapDAO.update("CarManage.updateCar", param);
//			if (st == 0) {
//				throw new Exception("�޸ĳ���״̬ʱ����");
//			}
//		}

		if (null != roldInfo && roldInfo.size() > 0){
			this.addRoldInfo(roldInfo, Integer.valueOf(roldInfo.get("num").toString()).intValue(), expediteCarId,"2");
		}
		return st;
	}

	public int updateGoBack(HashMap map, HashMap roldInfo) throws Exception {

		String expediteCarId = map.get("expediteCarId").toString();
		// ����س���Ϣ��
		int st = baseSqlMapDAO.update("Expedite.updateGoBack", map);
		if (st == 0) {
			throw new Exception("���»س���Ϣʧ��.");
		}

		// ������תվ��Ϣ��������¼
		map.put("roadType", "2");
		this.deleteRoldInfo(map);// ����תվ��Ϣȫ��Ϊ�鵵������������´����µ���תվ��Ϣ
		// ������תվ��Ϣ��������¼
		if (null != roldInfo && roldInfo.size() > 0) {
			this.addRoldInfo(roldInfo, Integer.valueOf(
					roldInfo.get("num").toString()).intValue(), expediteCarId,
					"2");
		}
		return st;

	}

	public int deleteGoback(HashMap map) {
		return baseSqlMapDAO.update("Expedite.deleteGoback", map);

	}

	/**
	 * ��ת��Ϣ
	 * 
	 * @param map
	 * @return
	 */
	public List findRoldInfo(HashMap map) {
		return baseSqlMapDAO.queryForList("Expedite.findRoldInfo", map);
	}

	public int insertRoldInfo(HashMap map) {
		return baseSqlMapDAO.update("Expedite.insertRoldInfo", map);
	}

	public int updateRoldInfo(HashMap map) {
		return baseSqlMapDAO.update("Expedite.updateRoldInfo", map);
	}

	public int deleteRoldInfo(HashMap map) {
		return baseSqlMapDAO.update("Expedite.deleteRoldInfo", map);

	}

	public void addRoldInfo(HashMap roldInfo, int num, String expediteCarId,
			String roadType) throws Exception {
		int st = 0;
		HashMap map;
		if (num == 1) {
			roldInfo.put("expediteCarId", expediteCarId);
			roldInfo.put("roadType", roadType);
			st = baseSqlMapDAO.update("Expedite.insertRoldInfo", roldInfo);// �����תվ�����
			if (st < 1) {
				throw new Exception("�����תվ�����.");
			}
		} else if (num > 1) {
			String[] firstLocus = (String[]) roldInfo.get("firstLocus");
			String[] firstDate = (String[]) roldInfo.get("firstDate");
			String[] transferLocur = (String[]) roldInfo.get("transferLocur");
			String[] transferDate = (String[]) roldInfo.get("transferDate");

			String[] runMileage = {};
			String[] useOilNum = {};
			String[] useOilCharge = {};
			String[] firstMileage = {};
			String[] transferMileage = {};
			String[] roadCharge = {};
			String[] runTime = {};
			//String[] beiZhu = {};

			if (roldInfo.get("runMileage") != null) {
				runMileage = (String[]) roldInfo.get("runMileage");
				useOilNum = (String[]) roldInfo.get("useOilNum");
				useOilCharge = (String[]) roldInfo.get("useOilCharge");
				firstMileage = (String[]) roldInfo.get("firstMileage");
				transferMileage = (String[]) roldInfo.get("transferMileage");
				roadCharge = (String[]) roldInfo.get("roadCharge");
				runTime = (String[]) roldInfo.get("runTime");
				//beiZhu = (String[]) roldInfo.get("beiZhu");
			}

			for (int i = 0; i < num; i++) {
				map = new HashMap();
				map.put("firstLocus", firstLocus[i]);
				map.put("firstDate", firstDate[i]);
				map.put("transferLocur", transferLocur[i]);
				map.put("transferDate", transferDate[i]);

				if (roldInfo.get("runMileage") != null) {
					map.put("runMileage", runMileage[i]);
					map.put("useOilNum", useOilNum[i]);
					map.put("useOilCharge", useOilCharge[i]);
					map.put("firstMileage", firstMileage[i]);
					map.put("transferMileage", transferMileage[i]);
					map.put("roadCharge", roadCharge[i]);
					map.put("runTime", runTime[i]);
					//map.put("beiZhu", beiZhu[i]);
				}
				// map.put("useOilCharge", useOilCharge[i]);
				// map.put("firstManager", firstManager[i]);
				// map.put("transferManager", transferManager[i]);
				map.put("expediteCarId", expediteCarId);
				map.put("roadType", roadType); // ·;����1������ 2���س�
				st = baseSqlMapDAO.update("Expedite.insertRoldInfo", map);// �����תվ�����
				if (st < 1) {
					throw new Exception("�����תվ�����ʧ��.");
				}
			}
		}
	}

	/**
	 * 2009-02-25 �ɳ�����
	 * 
	 * @param map
	 * @return
	 */
	public int findApplyerCount(HashMap map) {
		return ((Integer) baseSqlMapDAO.queryForObject(
				"Expedite.findApplyerCount", map)).intValue();
	}

	public List findApplyer(HashMap map) {
		return baseSqlMapDAO.queryForList("Expedite.findApplyer", map);
	}

	public int insertApplyer(HashMap map) throws Exception {
		return baseSqlMapDAO.update("Expedite.insertApplyer", map);
	}

	public int updateApplyer(HashMap map) throws Exception {
		return baseSqlMapDAO.update("Expedite.updateApplyer", map);
	}

	public int deleteApplyer(HashMap map) throws Exception {
		return baseSqlMapDAO.update("Expedite.deleteApplyer", map);
	}

	/**
	 * 2009-02-26 �ɳ�������־
	 * 
	 * @param map
	 * @return
	 */
	public int findFlowerTaskCount(HashMap map) {
		return ((Integer) baseSqlMapDAO.queryForObject(
				"Expedite.findFlowerTaskCount", map)).intValue();
	}

	public List findFlowerTask(HashMap map) {
		return baseSqlMapDAO.queryForList("Expedite.findFlowerTask", map);
	}

	public int updateFlowerTask(HashMap map) throws Exception {
		return baseSqlMapDAO.update("Expedite.updateFlowerTask", map);
	}

	/**
	 * 2009-02-28 ������־���Զ�����
	 * 
	 * @param map
	 * @return
	 */
	public void execProFlowerTask(HashMap map) {
		baseSqlMapDAO.update("Expedite.proFlowerTask", map);
	}

	/**
	 * 2009-03-01 ȡ����Ҫ����������
	 * 
	 * @param map
	 * @return
	 */
	public List getProFlowerTask(HashMap map) {
		return baseSqlMapDAO.queryForList("Expedite.getFlowerTask", map);
	}

	public List getAttempermsg(HashMap map) {
		return baseSqlMapDAO.queryForList("Expedite.getAttempermsg", map);
	}
	/**
	 * �������뵥���ֱ�Ϊ"����"��"�����ύ"������
	 * 2009-03-21 �޸�Ϊ���ż���
	 * @param map
	 */
	public int saveApplyer(HashMap map) throws Exception {
		int i = 0;// Ĭ�ϸ�������
		if (map.get("expediteapplyId").toString().equals("")) {
			// �ж�Ϊ��������,��Ϊ������ʱ������������������������̱�����������
			map.put("expediteapplyId", baseSqlMapDAO.sequences("expediteapply_id"));
			i = 1;
		}
		// ��Ϊ���沢�ύʱ����
		if (map.get("cmdFlag").toString().trim().equals("1")) {
			// ����������־
			map.put("flowerdefineCode", "Exp_apply");
			execProFlowerTask(map);
			// �޸ı�ʶλ
			map.put("promptcontent", map.get("useMan").toString()+";"
					+ map.get("useMobile").toString()+";"
					+ map.get("useExcuse").toString());
			List ls = getProFlowerTask(map);
			int count = ls.size();
			if (count > 0) {
				// ������һ��Ҫ������ԱsendsmsAuditing(List ls,String staffId,String
				// cityId,String srcNo)
				sendsmsAuditing(ls, map.get("editorMan").toString(), map.get(
						"cityId").toString(), map.get("expediteapplyId")
						.toString());
				map.put("useState", 4);
			} else {
				// ���Ͷ��Ÿ�������Ա
				HashMap atths = new HashMap();
				atths.put("extdeptId", map.get("extdeptId").toString());
				atths.put("srcnoContent", map.get("expediteapplyId").toString()+ "(" 
					+ map.get("useMan").toString()+";"
					+ map.get("useMobile").toString()+";"
					+ map.get("useExcuse").toString() + ")");
				List attemperls = getAttempermsg(atths);
				sendsmsAuditing(attemperls, map.get("editorMan").toString(),map.get("cityId").toString(), map.get("expediteapplyId").toString());
				map.put("useState", 2);
			}
		}
		// �������
		else {
			map.put("useState", 3);
		}
		// �����ӣ����޸�
		if (i == 1)
			i = insertApplyer(map);
		else
			i = updateApplyer(map);
		return i;
	}

	/**
	 * ����������Ϊͬ��/��ͬ��
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int proAgent(HashMap map) throws Exception {
		
		String expediteapplyId = map.get("expediteapplyId").toString();
		// �õ�����״̬
		HashMap tmpid = new HashMap();
		tmpid.put("expediteapplyId", expediteapplyId);
		HashMap applyDate = (HashMap) (findApplyer(tmpid).get(0));
		String cityId = applyDate.get("city_id").toString();
		if (!applyDate.get("use_state").toString().equalsIgnoreCase(
				map.get("useState").toString())) {
			return -1;
		}

		int i = 0;

		// ��ѯ��Ҫ���͵���Ա
		HashMap param = new HashMap();
		param.put("staffId", map.get("editorMan").toString());
		param.put("extdeptId", map.get("extdeptId").toString());
		param.put("content", expediteapplyId + "|"
				+ map.get("useState").toString() + "||"
				+ map.get("agentFlag").toString());

		List proAudls = baseSqlMapDAO.queryForList("Expedite.proAuditing",param);
		if (proAudls==null ||(proAudls.size()==1 && ((HashMap)(proAudls.get(0))).get("msistype").toString().equals("0"))) {
			i=0;
		}else
		{
			// ���Ͷ���֪ͨ�����ˣ�ͨ�����
			sendsmsAuditing(proAudls, map.get("approveCode").toString(),cityId, expediteapplyId);
			i = 1;//�ɹ�
		}
		return i;
	}


	/**
	 * 2008-03-03 ˵��:������Ϣ�������û�
	 * 
	 * @param ls
	 *            ����
	 * @param staffId
	 *            Ա����
	 * @param cityId
	 *            ����ID
	 * @param srcNo
	 *            Դ����
	 */
	private void sendsmsAuditing(List ls, String staffId, String cityId,
			String srcNo) {
		int size = ls.size();
		ArrayList moblies = new ArrayList();
		HashMap flowertask = new HashMap();
		String[] mobile = new String[size];
		String[] content = new String[size];
		String[] smsstaffid = new String[size];
		String[] smsstaffname = new String[size];
		String[] msistype=new String[size];
		for (int i = 0; i < size; i++) {
			flowertask = (HashMap) ls.get(i);
			mobile[i] = flowertask.get("mobile").toString();
			content[i] = flowertask.get("content").toString();
			smsstaffid[i] = "";
			smsstaffname[i] = flowertask.get("smsstaffname").toString();
			msistype[i]=flowertask.get("msistype").toString();
		}
		// ���Ͷ���
		sendSms(smsstaffid, smsstaffname, mobile, content, staffId, srcNo,
				cityId, "8",msistype,"1");
		//ԭ����00,�ĳ�1��������
	}
	/**
	 * ������ķ������ƣ��������˸÷�����
	 * ����:��������¼,���Ͷ���,ͬʱд�����ݿ�,�ͻ�����
	 * @param flowertask
	 * @param staffId
	 * @param cityId
	 * @param srcNo
	 */
	private void sendsmsAuditing(HashMap flowertask, String staffId,
			String cityId, String srcNo) {
        String[] msistype={flowertask.get("msistype").toString()};
		String[] mobile = { flowertask.get("mobile").toString() };
		String[] content = { flowertask.get("content").toString() };
		String[] smsstaffid = { flowertask.get("smsstaffid").toString() };
		String[] smsstaffname = { flowertask.get("smsstaffname").toString() };
		// ���Ͷ���
		sendSms(smsstaffid, smsstaffname, mobile, content, staffId, srcNo,
				cityId, "9",msistype,"2");
		//ԭ����01,�ĳ�2�ͻ�����
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
	/**
	 * ����˵��:���»س���Ϣ�����,feedback_state״̬.
	 */
	public int updateGoBackMain(HashMap map)  {
		return baseSqlMapDAO.update("Expedite.updateGoBack", map);
	}
	/**
	 * �ͻ�����
	 * @param map
	 * @return
	 */
	public int sendFeedback(HashMap map){
		int result=0;
        HashMap hsfeedback=new HashMap();
        //1.���»س���Ϣ�ı�ʶλ,�Ӷ���δ����תΪ�ѷ���
        hsfeedback.put("feedbackState", 1);
        hsfeedback.put("gobackCarId",map.get("gobackCarId").toString());
        result=updateGoBackMain(hsfeedback);
        //2.�ж���ԭ�ɳ���������,0:�ɳ���,1:��ʱ�ɳ�
		//3.���÷��Ͷ���
        hsfeedback.clear();
        hsfeedback.put("msistype","1");//��������
        hsfeedback.put("mobile", map.get("useCarManmobile"));//�ó�������
        hsfeedback.put("content", "�𾴵�"+map.get("useCarManName").toString()+"����(С��),����!��ӭ���Դ˴α�˾"
        		+map.get("drivername").toString()+"��ʻԱ�ķ����������,����ֱ�ӻظ���A�ǳ�����;B����;C������,��л���Թ�ͨ���������������޹�˾��֧��!(ע:����ظ�A,B��C)");
        hsfeedback.put("smsstaffid", "");//���ն�����Ա����	
        hsfeedback.put("smsstaffname", map.get("useCarManName"));//���ն�����Ա����
        //3.���ù��÷��Ͷ��ŷ���
	    sendsmsAuditing(hsfeedback,map.get("editorMan").toString(),map.get("cityid").toString(), map.get("gobackCarId").toString());
	    return result;
	}
	
	
	/**
	 * 2009-04-14
	 * ˾���г��Ǽ�
	 * 2009-06-22
	 * �޸�˵��:��Ϊ�ͻ���������,�Խ���ͳ�ƴ���,
	 * ���ԭ����ģ��Ĵ���ʽ,�����޸�����:
	 * @param map
	 * @return
	 */
    public int findDriversmsCount(HashMap map){
		return ((Integer) baseSqlMapDAO.queryForObject(
				"Expedite.findDriversmsCount", map)).intValue();
    }
    
    public List findDriversms(HashMap map){
    	return baseSqlMapDAO.queryForList("Expedite.findDriversms", map);
    }
    
    public int insertDriversms(HashMap map) throws Exception{
    	String pb_seq = baseSqlMapDAO.sequences("driversms_id");
    	map.put("driversmsId",pb_seq);
    	int st=baseSqlMapDAO.update("Expedite.insertDriversms", map);
    	if (st == 0){
    		throw new Exception("����˾���г��Ǽ�ʱ����");
    	}
    	//�������񵥾�
    	map.put("sourceOrderType", "1");    	
		map.put("sourceOrderCode",pb_seq);
		map.put("charge",pb_seq);
		map.put("memo","");
		map.put("carNoId","");
		map.put("createMan","");
		map.put("cityId","");
		st=baseSqlMapDAO.update("FinanceManage.insertFinance", map);
		if (st == 0){
    		throw new Exception("�������񵥾�ʱ����");
    	}
    	return st;
    }
    
	public int updateDriversms(HashMap map)throws Exception{
		int st= baseSqlMapDAO.update("Expedite.updateDriversms", map);
		if (st == 0){
    		throw new Exception("�޸�˾���г��Ǽ�ʱ����");
    	}
		//�޸Ĳ��񵥾�
		map.put("sourceOrderCode", map.get("driversmsId"));
		map.put("sourceOrderType", "1");
		st = baseSqlMapDAO.update("FinanceManage.updateFinance", map);
		if (st == 0){
    		throw new Exception("�޸Ĳ��񵥾�ʱ����");
    	}
		return st;
	}
	
	public int deleteDriversms(HashMap map) throws Exception{
		int st=baseSqlMapDAO.update("Expedite.deleteDriversms", map);
		if (st == 0){
    		throw new Exception("ɾ��˾���г��Ǽ�ʱ����");
    	}
		//ɾ�����񵥾�
		map.put("sourceOrderCode", map.get("driversmsId"));
		map.put("sourceOrderType", "1");
		st = baseSqlMapDAO.update("FinanceManage.deleteFinance",map);
		if (st == 0){
    		throw new Exception("ɾ�����񵥾�ʱ����");
    	}
		return st;
	}

	/**
	 * �����س���Ϣ��excel
	 */
	public int findRoldInfoExcelCount(HashMap map){
		return ((Integer) baseSqlMapDAO.queryForObject(
				"Expedite.findRoldInfoExcelCount", map)).intValue();		
	}
    
    public List findRoldInfoExcel(HashMap map){
    	return baseSqlMapDAO.queryForList("Expedite.findRoldInfoExcel", map);
    }
}
