/**
 * ˵�������ض��Ŵ������ࡣ
 * 		 ���� 
 * 			ProcessRecvDeliverMsg��CMPPMessage msg�����ն���
 * 		 ���� 
 * 			SendMessage��SmsBean sms��		��������ŵķ���
 * 			CarLibrarySendSms��SmsBean sms����������ר��
 * ʱ�䣺2008-12-16
 * �޸�ʱ��:2009-12-25
 * ˵��:����API��ʽ���Ͷ���
 *      
 */
package net.trust.utils.sms;

// ������ķ�������
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TimerTask;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.trust.IbatisDaoTools.BaseSqlMapDAO;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;
import com.jasson.im.api.APIClient;
import com.jasson.im.api.MOItem;

public class SMProxySendFacadeImplTimeTask implements SMProxySendFacade {
	private String mobileStr = "13599204724";//�ֻ��ſ��ö��ŷֿ�
	private String content = "���ŷ��Ͳ������� via  IM JAVA API ";//���ԵĶ�������
	private long smId = 1;										  //�ֻ���ʾ�����β��
	private int smType = 0;									  //0:Ĭ��Ϊ����,1:wap��ʽ��
	private String url = "wap.myself.com";//"wap.sohu.com";      wap��ʽ�õ�����ַ
	private String host = "113.18.101.88";//������Ϣ����ip
	private String dbName = "mas";        //���ݿ�����
	//��ʽ
//	private String apiId = "car";         //��Ϣ���ж����API�ӿ�,�ؼ���
//	private String name = "car";          //��Ϣ����API�ӿڵ��û���
//	private String pwd = "gtcar";		   //��Ϣ����API�ӿڵ�����
	//����
	private String apiId = "debugcar";         //��Ϣ���ж����API�ӿ�,�ؼ���
	private String name = "debugcar";          //��Ϣ����API�ӿڵ��û���
	private String pwd = "debugcar";		   //��Ϣ����API�ӿڵ�����
	
	private APIClient handler = new APIClient();//�͵��ü���api������

	// ���ݿ������
	public BaseSqlMapDAO baseSqlMapDAO;
	// ��־��¼
	private static Log log = LogFactory.getLog(SMProxySendFacadeImplTimeTask.class);

	//�߳��������ڽ��ն���2009-12-28
	java.util.Timer timer;//
	RecTask rt=new RecTask();
	//�Ƿ�������
	//private boolean flowerswitch;
	// ������������
	private void ProBaseConf() {
		System.out.println("��ʼ��������Ϣ");
		log.debug("��ʼ��������Ϣ\n");
		// ����������Ϣ
		int connectRe = handler.init(host, name, pwd, apiId, dbName);
		if (connectRe == APIClient.IMAPI_SUCC)
		{
			System.out.println("��ʼ���ɹ�");
			log.debug("��ʼ���ɹ�\n");
		}
		else if (connectRe == APIClient.IMAPI_CONN_ERR)
			log.debug("����ʧ��\n");
		else if (connectRe == APIClient.IMAPI_API_ERR)
			log.debug("apiID������\n");
	}

	/**
	 * ���췽��
	 */
	public SMProxySendFacadeImplTimeTask() {
		// ���������������Ϣ
		ProBaseConf();
		//�������ն����߳�
		//rt=new RecTask();
		timer = new java.util.Timer(true);
		//�ӳ�0����,����10����
		timer.schedule(rt, 0, 10 * 1000);
	}

	/**
	 * �ͷ�����
	 */
	public void release() {
		handler.release();
		Thread.currentThread().interrupt();
	}

	//2009-12-24����ֵ���жϴ���
	public int getInt(String str) {
		int ret = Integer.MIN_VALUE;
		try {
			ret = Integer.parseInt(str);
		} catch (NumberFormatException e) {
			ret = Integer.MIN_VALUE;
		}
		return ret;
	}

	/**
	 * ��Ϊ���ŷ����ദ�������ࣩ
	 * 
	 * @param �����࣬�����ֻ��ţ����ݣ����
	 */
	public int SendMessage(SmsBean sms) {
		int resultcol = 0;
		// �������շ��ӿ�Ϊ��ʱ���³�ʼ��
		if (handler == null) {
			System.out.println("handler==null");
			ProBaseConf();
			System.out.println("handler��Ϣ��" + handler.toString());
		}

		// ���ͺ���,����
		ArrayList telList = sms.getMobileNoList();
		String[] dest_Terminal_Id = new String[telList.size()];
		for (int i = 0; i < telList.size(); i++) {
			dest_Terminal_Id[i] = telList.get(i).toString();
		}

		//��װԴ�ֻ���,��:���Ž����+ҵ���
		String tmpSrcID = null;
		if (sms.getSn().length() == 6) {
			//��װ��6λ,1λ������+5λ�Զ����ӵ�.
			tmpSrcID = sms.getSn();//��װԭ���ͺ�
		}
		if (tmpSrcID == null || tmpSrcID.trim().length() == 0
				|| getInt(tmpSrcID.trim()) == Integer.MIN_VALUE) {
			tmpSrcID = "" + smId;
			//tmpSrcID = "";
		}
		//��������
		String tmpContent = sms.getSmsContent();
		//��־��ʾ
		System.out.println("���ŷ���,�ֻ���:"+dest_Terminal_Id.toString()+"����β��Long:"+Long.parseLong(tmpSrcID)+"����:"+tmpContent);
		log.debug("���ŷ���,�ֻ���:"+dest_Terminal_Id.toString()+"����β��Long:"+Long.parseLong(tmpSrcID)+"����:"+tmpContent+"\n");
		//���Ͷ���,��push wap��ʽ
		int result = handler.sendSM(dest_Terminal_Id, tmpContent, smId, Long
				.parseLong(tmpSrcID));

		if (result == APIClient.IMAPI_SUCC) {
			System.out.println("���ͳɹ�");
			log.debug("���ͳɹ�\n");
			resultcol = 1;
		} else if (result == APIClient.IMAPI_INIT_ERR)
			log.debug("δ��ʼ��");
		else if (result == APIClient.IMAPI_CONN_ERR)
			log.debug("���ݿ�����ʧ��");
		else if (result == APIClient.IMAPI_DATA_ERR)
			log.debug("��������");
		else if (result == APIClient.IMAPI_DATA_TOOLONG)
			log.debug("��Ϣ����̫��");
		else if (result == APIClient.IMAPI_INS_ERR)
			log.debug("���ݿ�������");
		else
			log.debug("������������");
		return resultcol;
	}
	
	//���������߳�
	class RecTask extends TimerTask
	{
		long interval = 2000L;//ʱ����,ÿ��2����
		public RecTask()
		{
		}
		public void run()
		{
			//�ر��߳�
			timer.cancel();
			//���ն���
			recvSM();
			//�����߳��ӳ�10��,����10��.
			timer.schedule(rt, 10 * 1000, 10 * 1000);
		}
	}
	
	/**
	 * ���ն���
	 */
	public void recvSM() {
		// �������շ��ӿ�Ϊ��ʱ���³�ʼ��
		if (handler == null) {
			System.out.println("handler==null");
			ProBaseConf();
			System.out.println("handler��Ϣ��" + handler.toString());
		}
		MOItem[] mos = handler.receiveSM();
		if (mos == null) {
			log.debug("δ��ʼ�������ʧ��\n");
			return;
		} else if (mos.length != 0) {
			RecPro(mos);
		}
	}

	/**
	 * ���Ŵ�����
	 * @param msg
	 * @param mos
	 */
	public void RecPro(MOItem[] mos) {
		String reqphoto = ""; // ��������˵��ֻ���
		String reqcontent = ""; // ��������

		String smsType = "3";

		String per = "";//1�ɳ�����,2,�ͻ�����

		String srcBillNoState = "";//ԭ��״̬
		String srcBillNo = "";//ԭ����

		int len = 0, i = 0;
		len = mos.length;
		while (i < len) {
			//������Ϣ����
			System.out.println("���Ž��յ�����"+mos[i].getContent()+"�ֻ�"+mos[i].getMobile()+"ʱ��"+mos[i].getMoTime()+"smid"+mos[i].getSmID());
			log.debug("���Ž��յ�����"+mos[i].getContent()+"�ֻ�"+mos[i].getMobile()+"ʱ��"+mos[i].getMoTime()+"smid"+mos[i].getSmID());
			//��������������
			reqphoto = mos[i].getMobile();
			//reqphoto = reqphoto.substring(0, 11);
			reqcontent = mos[i].getContent();
			//ȥ�����յĻس�,���пո����Ϣ.
			Pattern p = Pattern.compile("\t|\r|\n");
			Matcher mat = p.matcher(reqcontent.toString());
			reqcontent = mat.replaceAll("");
			//��ԭ��Ϣ������װ��
			String srcter = Long.toString(mos[i].getSmID());
			//System.out.println(srcter);
			if (srcter.length() == 6) {//���յ�����18λʱ && && (reqcontent.equals("1") || reqcontent.equals("2"))
				per = srcter.substring(0, 1);//ǰ׺,������λ
				String msisdnId = srcter;//Msis����
				List auditMsg = baseSqlMapDAO.queryForList(
						"SmsManage.findAuditMsgbyMsisdn", msisdnId);
				if (auditMsg.size() > 0) {
					HashMap auditMsgHs = (HashMap) auditMsg.get(0);

					srcBillNo = auditMsgHs.get("expediteapply_id").toString();
					if (per.equals("1")) {//������ɳ���������
						Integer tmp = (Integer.parseInt(auditMsgHs.get(
								"use_state").toString()) - 4);
						srcBillNoState = tmp.toString();
					}
					reqcontent = srcBillNo + "|" + srcBillNoState + "||"
							+ reqcontent;
				}
			}
			// 1.���յĶ��ţ�д�����ݿ�
			log.debug("1.���յĶ��ţ�д�����ݿ�");
			HashMap param = new HashMap();
			param.clear();
			param.put("phoneCode", reqphoto); // �������ֻ�����
			param.put("smsContent", reqcontent); // ��������
			param.put("prefix", per);
			baseSqlMapDAO.insert("SmsManage.insertInceptSms", param); // ���ݿ����
			//�û�����
			SmsBean smsBeanAdmin = new SmsBean();
			//���ŷ����Ƿ�ɹ���ʶ 
			int smsFlag = 0;
			// ת��洢���̴���(���յ�����)
			if (reqcontent.split("\\|").length > 1) {
				//��ѯ��Ҫ���͵���Ա   
				List smsAudls = baseSqlMapDAO.queryForList(
						"SmsManage.prosmsLongRec", param);
				String smsAudcontent = "";
				ArrayList smsAudmobileList = new ArrayList();//�洢�绰����
				HashMap smsAudhs = new HashMap();//�洢��ѯ���ص��û���Ϣ
				int audsize = smsAudls.size();//��Listת��ΪHashMap
				for (int m = 0; m < audsize; m++) {
					//smsFlag=1;
					// ���÷��͵���Ա
					smsAudmobileList.clear();// ���ԭ�ж���
					smsAudhs.clear();
					smsAudhs = (HashMap) smsAudls.get(m);
					smsAudmobileList.add(smsAudhs.get("mobile").toString());
					smsAudcontent = smsAudhs.get("content").toString();
					String msisdnId = "";
					if (smsAudhs.get("msistype").toString().equals("1")) {
						msisdnId = baseSqlMapDAO.sequencesmsisdn("msisdn_id");
					}
					smsBeanAdmin.setSn(msisdnId);//��װ
					smsBeanAdmin.setMobileNoList(smsAudmobileList);
					smsBeanAdmin.setSmsContent(smsAudcontent);

					// 3.���͸�������Ա
					log.debug("2.�����������Ѹ������Ա");
					try {
						smsFlag = SendMessage(smsBeanAdmin);
					} catch (Exception e) {
						System.out.println(e.toString());
					}
					// 4.���·��Ͷ����б�
					String sendSmsId = baseSqlMapDAO.sequences("send_sms_id");
					param.clear();

					smsType = smsAudhs.get("smstype").toString();// ��������

					param.put("sendSmsId", sendSmsId); //�������ֻ�����
					param.put("callPhone", smsAudhs.get("mobile").toString()); //�������ֻ�����
					param.put("callManName", smsAudhs.get("smsstaffname")
							.toString()); //����Ա��
					param.put("sendContent", smsAudcontent); // ��������
					param.put("staffId", smsAudhs.get("staffId").toString()); //Ա����ϢId
					param.put("callStaffId", ""); // �������ֻ�����
					param.put("cityId", smsAudhs.get("cityid").toString()); // ��������
					param.put("sourceOrderType", smsType); //�������ͣ��������ѻ���
					param.put("sourceOrderCode", srcBillNo); //�������ͣ��������ѻ���
					param.put("msisdnId", msisdnId);//ԭ������
					baseSqlMapDAO
							.insert("SmsManage.insertSendSmsRecord", param); //���ݿ����
					//if (smsFlag == 1) {
					param.clear();
					param.put("sendSmsId", sendSmsId); // ����ʱ��
					baseSqlMapDAO.update("SmsManage.updateSendSmsState", param); //���ݿ����
					//}
				}
			}
			//���ն��ţ������͸�������Ա(ת��ת���������)
			else {
				//����ת����
				List transmitls = baseSqlMapDAO.queryForList(
						"SmsManage.prosmsShortRec", param);
				String transmitcontent = "";
				ArrayList transmitmobileList = new ArrayList();//�洢�绰����
				HashMap transmiths = new HashMap();//�洢��ѯ���ص��û���Ϣ
				int audsize = transmitls.size();//��Listת��ΪHashMap
				for (int m = 0; m < audsize; m++) {
					//smsFlag=1;
					// ���÷��͵���Ա
					transmitmobileList.clear();// ���ԭ�ж���
					transmiths.clear();
					transmiths = (HashMap) transmitls.get(m);
					transmitmobileList.add(transmiths.get("mobile").toString());
					transmitcontent = transmiths.get("content").toString();
					smsBeanAdmin.setSn("");//��װ
					smsBeanAdmin.setMobileNoList(transmitmobileList);
					smsBeanAdmin.setSmsContent(transmitcontent);

					// 3.���͸�������Ա
					log.debug("2.�����������Ѹ������Ա");
					try {
						smsFlag = SendMessage(smsBeanAdmin);
					} catch (Exception e) {
						System.out.println(e.toString());
					}
					// 4.���·��Ͷ����б�
					String sendSmsId = baseSqlMapDAO.sequences("send_sms_id");
					param.clear();

					smsType = transmiths.get("smstype").toString();// ��������(ת������3)

					param.put("sendSmsId", sendSmsId); // �������ֻ�����
					param.put("callPhone", transmiths.get("mobile").toString()); // �������ֻ�����
					param.put("callManName", transmiths.get("smsstaffname")
							.toString()); //����Ա��
					param.put("sendContent", transmitcontent); // ��������
					param.put("staffId", transmiths.get("staffId").toString()); //Ա����ϢId
					param.put("callStaffId", ""); // �������ֻ�����
					param.put("cityId", transmiths.get("cityid").toString()); //��������
					param.put("sourceOrderType", smsType); // �������ͣ��������ѻ���
					param.put("sourceOrderCode", ""); // �������ͣ��������ѻ���
					baseSqlMapDAO
							.insert("SmsManage.insertSendSmsRecord", param); // ���ݿ����
					//if (smsFlag == 1) {
					param.clear();
					param.put("sendSmsId", sendSmsId); // ����ʱ��
					baseSqlMapDAO.update("SmsManage.updateSendSmsState", param); // ���ݿ����
					//}
				}
			}
			i++;
		}
	}

	/**
	 * @return the baseSqlMapDAO
	 */
	public BaseSqlMapDAO getBaseSqlMapDAO() {
		return baseSqlMapDAO;
	}

	/**
	 * @param baseSqlMapDAO
	 *            the baseSqlMapDAO to set
	 */
	public void setBaseSqlMapDAO(BaseSqlMapDAO baseSqlMapDAO) {
		this.baseSqlMapDAO = baseSqlMapDAO;
	}
}
