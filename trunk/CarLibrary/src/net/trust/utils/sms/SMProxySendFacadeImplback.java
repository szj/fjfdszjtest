/**
 * ˵�������ض��Ŵ������ࡣ
 * 		 ���� 
 * 			ProcessRecvDeliverMsg��CMPPMessage msg�����ն���
 * 		 ���� 
 * 			SendMessage��SmsBean sms��		��������ŵķ���
 * 			CarLibrarySendSms��SmsBean sms����������ר��
 * ʱ�䣺2008-12-16
 */
package net.trust.utils.sms;

// ������ķ�������
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List; // ��Ϊ�����
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.huawei.insa2.comm.cmpp.message.*;
import com.huawei.insa2.util.*; // ��־
import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory; // ���ݿ������
import net.trust.IbatisDaoTools.BaseSqlMapDAO;

public class SMProxySendFacadeImplback implements SMProxySendFacade {
	// ��xml�ж�ȡ������Ϣ
	private  Args argsconn; // ��ȡ������Ϣ
	private  Args argssumbit; // ��ȡ�ύ��Ϣ
	// �����ύ��Ϣ����˵��
	private  int pk_Total = 1;
	private  int pk_Number = 1;
	private  int registered_Delivery = 1;
	private  int msg_Level = 1;
	private  String service_Id = "04545";
	private  int fee_UserType = 2;
	private  String fee_Terminal_Id = "1065730495561";
	private  int tp_Pid = 0;
	private  int tp_Udhi = 0;
	private  int msg_Fmt = 8;
	private  String msg_Src = "913841";
	private  String fee_Type = "02";
	private  String fee_Code = "000";
	private  Date valid_Time = null;
	private  Date at_Time = null;
	private  String src_Terminal_Id = "1065730495561";
	private  String[] dest_Terminal_Id = { "13599204724" };
	private  byte[] msg_Content = null;
	private  String reserve = "";//������

	/** �����շ��ӿ� */
	public static SMProxyRec myProxy = null;

	// ���ݿ������
	public BaseSqlMapDAO baseSqlMapDAO;
	// ��־��¼
	private static Log log = LogFactory.getLog(SMProxySendFacadeImplback.class);
    //�Ƿ�������
	//private boolean flowerswitch;
	// ������������
	private void ProBaseConf() {
		try {
			log.debug("��ʼ��������Ϣ");
			// ����������Ϣ
			argsconn = new Cfg("Smproxy.xml", false).getArgs("CMPPConnect");
			// argsconn.set("source-addr", "913841");
			// argsconn.set("shared-secret", "pkswd904");
			// ��ʼ�������շ��ӿ�
			myProxy = new SMProxyRec(this, argsconn);
			// �ύ��������
			argssumbit = new Cfg("Smproxy.xml", false)
					.getArgs("CMPPSubmitMessage");
			pk_Total = argssumbit.get("pk_Total", 1);
			pk_Number = argssumbit.get("pk_Number", 1);
			registered_Delivery = argssumbit.get("registered_Delivery", 1);
			msg_Level = argssumbit.get("msg_Level", 1);
			service_Id = argssumbit.get("service_Id", "04545");
			fee_UserType = argssumbit.get("fee_UserType", 2);
			fee_Terminal_Id = argssumbit
					.get("fee_Terminal_Id", "1065730495561");
			tp_Pid = argssumbit.get("tp_Pid", 1);
			tp_Udhi = argssumbit.get("tp_Udhi", 1);
			msg_Fmt = argssumbit.get("msg_Fmt", 8);
			msg_Src = argssumbit.get("msg_Src", "913841");
			fee_Type = argssumbit.get("fee_Type", "02");
			fee_Code = argssumbit.get("fee_Code", "000");
			src_Terminal_Id = argssumbit
					.get("src_Terminal_Id", "1065730495561");
			reserve = argssumbit.get("reserve", "");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * ���췽��
	 */
	public SMProxySendFacadeImplback() {
		// ���������������Ϣ
		ProBaseConf();
	}  
	
	 /** *//***
	  * * ���ܣ�
	  *     ��src����ֽ���add��Ĵ�start��ʼ��end����������end��λ��)���ֽڴ�����һ�𷵻�
	  * @param src
	  * @param add
	  * @param start    add ��ʼλ��
	  * @param end      add �Ľ���λ��(������endλ��)
	  * @return Ҳ��ʵ������String���͵�src+add.subString(start,end)����
	  */
	    public static byte[]byteAdd(byte[]src, byte[]add, int start, int end) 
	    {
	        byte[]dst = new byte[src.length + end - start];
	        for (int i = 0; i < src.length; i ++ ) 
	        {
	            dst[i] = src[i];
	        }
	        for (int i = 0; i < end - start; i ++ ) 
	        {
	            dst[src.length + i] = add[start + i];
	        }
	        return dst;
	    }
	    //�������ֽ��������ϴ���2009-04-10
	    public static byte[]byteAddStr(byte[]src, byte[]add, int start, int end) 
	    {

	    	  byte[] finbyte=new byte[src.length+start-end];
	    	  System.arraycopy(src,0,finbyte,0,src.length);   
	    	  System.arraycopy(add,start,finbyte,src.length,end); 
	    	  return finbyte;
	    }

	/**
	 * ��Ϊ���ŷ����ദ�������ࣩ
	 * 
	 * @param �����࣬�����ֻ��ţ����ݣ����
	 */
	public int SendMessage(SmsBean sms) {
		// �������շ��ӿ�Ϊ��ʱ���³�ʼ��
		
		if (myProxy == null) {
			System.out.println("myProxy==null");
			ProBaseConf();
			System.out.println("myProxy��Ϣ��" + myProxy.toString());
		}
		// System.out.println("myProxy.getConnState():"+myProxy.getConnState().toString());
		// ���ؽ��
		int result = 0;

		// ���ͺ���
		ArrayList telList = sms.getMobileNoList();
		dest_Terminal_Id = new String[telList.size()];
		for (int i = 0; i < telList.size(); i++) {
			dest_Terminal_Id[i] = telList.get(i).toString();
		}
		// �����Ч��
		valid_Time = new Date(System.currentTimeMillis() + (long) 0xa4cb800); // new
		// Date();//
		// ��ʱ����ʱ��
		at_Time = null;// new Date(System.currentTimeMillis() + (long)
		// 0xa4cb800); //new Date();
		// �û��ֻ�����ʾΪ����Ϣ�����к���
		// src_Terminal_Id=src_Terminal_Id+"001";
		//��װ��ִ���Ŵ������
		String src_TerminalTmp=src_Terminal_Id;
		if(sms.getSn().length()==8){
			src_TerminalTmp=src_TerminalTmp+sms.getSn();//��װԭ���ͺ�
		}
		try {
			
			byte[]messageUCS2;
            messageUCS2 = sms.getSmsContent().getBytes("UnicodeBigUnmarked");
           
            int messageUCS2Len = messageUCS2.length;
            //�����ų���
            int maxMessageLen = 120;//��Ϊ�����[��ͨ�Ƽ�]ռ10������.

                //�����ŷ���
                tp_Udhi= 1;
                msg_Fmt = 0x08;
                
                int messageUCS2Count=0;
                if(messageUCS2Len % (maxMessageLen - 6)==0)
                	messageUCS2Count = messageUCS2Len / (maxMessageLen - 6);
                else
                	messageUCS2Count = messageUCS2Len / (maxMessageLen - 6) + 1;
                //�����ŷ�Ϊ����������
                byte[]tp_udhiHead = new byte[6];
                tp_udhiHead[0] = 0x05;
                tp_udhiHead[1] = 0x00;
                tp_udhiHead[2] = 0x03;
                tp_udhiHead[3] = 0x0A;
                tp_udhiHead[4] = (byte)messageUCS2Count;
                tp_udhiHead[5] = 0x01;
                
    			pk_Total=messageUCS2Count;
                //Ĭ��Ϊ��һ��
                for (int i = 0; i < messageUCS2Count; i ++ ) 
                {
                    tp_udhiHead[5] = (byte)(i + 1);
                    pk_Number=i+1;
                    if (i != messageUCS2Count - 1) 
                    {
                        //��Ϊ���һ��
                    	msg_Content = byteAdd(tp_udhiHead, messageUCS2, i * (maxMessageLen - 6), (i + 1) * (maxMessageLen - 6));
                    }
                    else 
                    {
                    	msg_Content = byteAdd(tp_udhiHead, messageUCS2, i * (maxMessageLen - 6), messageUCS2Len);
                    }
                    // ��ʼ���ύ��Ϣ
    				CMPPSubmitMessage submitMsg = new CMPPSubmitMessage(pk_Total,
    						pk_Number, registered_Delivery, msg_Level, service_Id,
    						fee_UserType, fee_Terminal_Id, tp_Pid, tp_Udhi,
    						msg_Fmt, msg_Src, fee_Type, fee_Code, valid_Time,
    						at_Time, src_TerminalTmp, dest_Terminal_Id,
    						msg_Content, reserve);

    				CMPPSubmitRepMessage submitRepMsg = (CMPPSubmitRepMessage) myProxy.send(submitMsg);
    				
    				 if (submitRepMsg!= null) {
    					   result = 1;
    				   }
                }	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result;
		}
		return result;
	}

	/**
	 * ��������ר�ã��ݻ���
	 * 
	 * @param sms
	 */
	public int CarLibrarySendSms(SmsBean sms) {
		// ���Ͷ���
		int i = SendMessage(sms);
		// ���ݿ������Ӽ�¼
		try {
			String sendSmsId = baseSqlMapDAO.sequences("send_sms_id");// ���

			HashMap param = new HashMap();
			param.put("sendSmsId", sendSmsId); // ��ˮ��
			param.put("callPhone", sms.getMobileNoList().get(0).toString()); // �������ֻ�����
			param.put("sendContent", sms.getSmsContent().toString());// ��������
			param.put("sourceOrderType", "1"); // ԭ������
			baseSqlMapDAO.insert("SmsManage.insertSendSmsRecord", param);
		} catch (Exception e) {
			i = 0;
		}
		return i;
	}

	/**
	 * ����MyProxy�ַ����ŵĽ��� ���ն��ź�Ĵ���,���ڵ������ͨ�����ط�ʽ����������utf-8
	 * 
	 * @param msg
	 */
	public void ProcessRecvDeliverMsg(CMPPMessage msg) {
		String reqphoto = ""; // ��������˵��ֻ���
		String reqcontent = ""; // ��������


		String smsType="3";
		
		 String per="";
		
		String srcBillNoState="";//ԭ��״̬
		String srcBillNo="";//ԭ����
		CMPPDeliverMessage deliverMsg = (CMPPDeliverMessage) msg;
		if (deliverMsg.getRegisteredDeliver() == 0)
			try {
				log.debug("deliverMsg.getRegisteredDeliver() == 0");
				System.out.println("deliverMsg.getRegisteredDeliver() == 0");
				// ��ŷ�ʽ
     			if (deliverMsg.getMsgFmt() == 8) {
					log.debug("deliverMsg.getMsgFmt() == 8");
					log.debug(String.valueOf(String.valueOf((new StringBuffer(
							"������Ϣ: ���к���=")).append(
							deliverMsg.getSrcterminalId()).append(";����=")
							.append(
									new String(deliverMsg.getMsgContent(),
											"UTF-16BE")))));

					reqphoto = deliverMsg.getSrcterminalId();
					reqphoto = reqphoto.substring(0,11);
					reqcontent = new String(deliverMsg.getMsgContent(),
							"UTF-16BE");
				}
				// ��ŷ�ʽGBK
				else {
					log.debug("deliverMsg.getMsgFmt()<> 8");
					log.debug(String.valueOf(String.valueOf((new StringBuffer(
							"������Ϣ: ���к���=")).append(
							deliverMsg.getSrcterminalId()).append(";����=")
							.append(new String(deliverMsg.getMsgContent())))));

					reqphoto = deliverMsg.getSrcterminalId();
					reqphoto = reqphoto.substring(0,11);
					reqcontent = new String(deliverMsg.getMsgContent());
				}
     			//ȥ�����յĻس�,���пո����Ϣ.
    			Pattern p = Pattern.compile("\t|\r|\n");
    			Matcher mat = p.matcher(reqcontent.toString());
    			reqcontent=mat.replaceAll("");
				//��ԭ��Ϣ������װ��
			    String srcter = deliverMsg.getDestnationId();//�õ�Դ�ն˺š�
			    //System.out.println(srcter);
				if (srcter.length() ==20) {//���յ�����18λʱ && && (reqcontent.equals("1") || reqcontent.equals("2"))
                    per=srcter.substring(12,14);//ǰ׺
					String msisdnId= srcter.substring(12);//Msis����
					List auditMsg = baseSqlMapDAO.queryForList(
							"SmsManage.findAuditMsgbyMsisdn",msisdnId);
					if (auditMsg.size() > 0) {
						HashMap auditMsgHs = (HashMap) auditMsg.get(0);

						srcBillNo = auditMsgHs.get("expediteapply_id")
								.toString();
						if(per.equals("00")){//������ɳ���������
							Integer tmp = (Integer.parseInt(auditMsgHs.get(
									"use_state").toString()) - 4);
							srcBillNoState = tmp.toString();
						}
						reqcontent = srcBillNo + "|" + srcBillNoState + "||" + reqcontent;

					}
				    //System.out.println(srcBillNo+":"+srcBillNoState+":"+reqcontent);
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
				int smsFlag=0;
				// ת��洢���̴���(���յ�����)
				if (reqcontent.split("\\|").length>1) {
				   //��ѯ��Ҫ���͵���Ա   
				   List smsAudls=baseSqlMapDAO.queryForList("SmsManage.prosmsLongRec", param);
				   String smsAudcontent="";
				   ArrayList smsAudmobileList = new ArrayList();//�洢�绰����
				   HashMap smsAudhs =new HashMap();//�洢��ѯ���ص��û���Ϣ
				   int audsize=smsAudls.size();//��Listת��ΪHashMap
				   for (int m=0;m<audsize;m++)
				   {
					        //smsFlag=1;
							// ���÷��͵���Ա
							smsAudmobileList.clear();// ���ԭ�ж���
							smsAudhs.clear();
							smsAudhs = (HashMap) smsAudls.get(m);
							smsAudmobileList.add(smsAudhs.get("mobile").toString());
							smsAudcontent = smsAudhs.get("content").toString();
							String msisdnId="";
							if(smsAudhs.get("msistype").toString().equals("1"))
							{
								msisdnId=baseSqlMapDAO.sequencesmsisdn("msisdn_id");
							}
						    smsBeanAdmin.setSn(msisdnId);//��װ
							smsBeanAdmin.setMobileNoList(smsAudmobileList);
							smsBeanAdmin.setSmsContent(smsAudcontent);

							// 3.���͸�������Ա
							log.debug("2.�����������Ѹ������Ա");
							try{
								smsFlag = SendMessage(smsBeanAdmin);
							}catch(Exception e){
								System.out.println(e.toString());
							}
							// 4.���·��Ͷ����б�
							String sendSmsId = baseSqlMapDAO.sequences("send_sms_id");
							param.clear();

							smsType = smsAudhs.get("smstype").toString();// ��������
							
							param.put("sendSmsId", sendSmsId); //�������ֻ�����
							param.put("callPhone", smsAudhs.get("mobile").toString()); //�������ֻ�����
							param.put("callManName", smsAudhs.get("smsstaffname").toString()); //����Ա��
							param.put("sendContent", smsAudcontent); // ��������
							param.put("staffId", smsAudhs.get("staffId").toString()); //Ա����ϢId
							param.put("callStaffId", ""); // �������ֻ�����
							param.put("cityId", smsAudhs.get("cityid").toString()); // ��������
							param.put("sourceOrderType", smsType); //�������ͣ��������ѻ���
							param.put("sourceOrderCode", srcBillNo); //�������ͣ��������ѻ���
							param.put("msisdnId", msisdnId);//ԭ������
							baseSqlMapDAO.insert("SmsManage.insertSendSmsRecord", param); //���ݿ����
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
					   List transmitls=baseSqlMapDAO.queryForList("SmsManage.prosmsShortRec", param);
					   String transmitcontent="";
					   ArrayList transmitmobileList = new ArrayList();//�洢�绰����
					   HashMap transmiths =new HashMap();//�洢��ѯ���ص��û���Ϣ
					   int audsize=transmitls.size();//��Listת��ΪHashMap
					   for (int m=0;m<audsize;m++)
					   {
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
								try{
									smsFlag = SendMessage(smsBeanAdmin);
								}catch(Exception e){
									System.out.println(e.toString());
								}
								// 4.���·��Ͷ����б�
								String sendSmsId = baseSqlMapDAO.sequences("send_sms_id");
								param.clear();

								smsType = transmiths.get("smstype").toString();// ��������(ת������3)
								
								param.put("sendSmsId", sendSmsId); // �������ֻ�����
								param.put("callPhone", transmiths.get("mobile").toString()); // �������ֻ�����
								param.put("callManName", transmiths.get("smsstaffname").toString()); //����Ա��
								param.put("sendContent", transmitcontent); // ��������
								param.put("staffId", transmiths.get("staffId").toString()); //Ա����ϢId
								param.put("callStaffId", ""); // �������ֻ�����
								param.put("cityId", transmiths.get("cityid").toString()); //��������
								param.put("sourceOrderType", smsType); // �������ͣ��������ѻ���
								param.put("sourceOrderCode", ""); // �������ͣ��������ѻ���
								baseSqlMapDAO.insert("SmsManage.insertSendSmsRecord", param); // ���ݿ����
								//if (smsFlag == 1) {
									param.clear();
									param.put("sendSmsId", sendSmsId); // ����ʱ��
									baseSqlMapDAO.update("SmsManage.updateSendSmsState", param); // ���ݿ����
								//}
							}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		else {
			log.debug("deliverMsg.getRegisteredDeliver() <> 0");
			log.debug(String.valueOf(String.valueOf((new StringBuffer(
					"�յ�״̬������Ϣ�� stat="))
					.append(new String(deliverMsg.getStat())).append(
							"dest_termID=").append(
							new String(deliverMsg.getDestTerminalId())).append(
							";destterm=").append(
							new String(deliverMsg.getDestnationId())).append(
							";serviceid=").append(
							new String(deliverMsg.getServiceId())).append(
							";tppid=").append(deliverMsg.getTpPid()).append(
							";tpudhi=").append(deliverMsg.getTpUdhi()).append(
							";msgfmt").append(deliverMsg.getMsgFmt()).append(
					// ";����").append(new
					// String(deliverMsg.getMsgContent())).append(
							";srctermid=").append(
							new String(deliverMsg.getSrcterminalId())).append(
							";deliver=").append(
							deliverMsg.getRegisteredDeliver()))));
		}
	}




	/**
	 * �ն˽�������
	 */
	public void Terminate() {
		log.debug("SMC�·��ն���Ϣ");
		myProxy.close();
		myProxy = null;
	}



	/**
	 * �ر�����
	 */
	public void Close() {
		// ��ѯSMProxy��ISMG��TCP����״̬
		String stateDesc = myProxy.getConnState();
		log.debug("��������״̬��" + stateDesc);
		// �˳�
		myProxy.close();
		myProxy = null;
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
