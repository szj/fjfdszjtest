
import java.io.*;
import java.util.ArrayList;
import java.util.Date;

import javax.swing.JTextArea;

import com.huawei.insa2.comm.cmpp.message.*;
import com.huawei.insa2.util.*;

//ʱ�䣺20081213���Ͷ���
//
public class SMProxySend {
	// ��xml�ж�ȡ������Ϣ
	private static Args argsconn; // ��ȡ������Ϣ
	private static Args argssumbit; // ��ȡ�ύ��Ϣ
	// �����ύ��Ϣ����˵��
	private static int pk_Total = 1;
	private static int pk_Number = 1;
	private static int registered_Delivery = 1;
	private static int msg_Level = 1;
	private static String service_Id = "04545";
	private static int fee_UserType = 2;
	private static String fee_Terminal_Id = "1065730495561";
	private static int tp_Pid = 0;
	private static int tp_Udhi = 0;
	private static int msg_Fmt = 15;
	private static String msg_Src = "913841";
	private static String fee_Type = "02";
	private static String fee_Code = "000";
	private static Date valid_Time = null;
	private static Date at_Time = null;
	private static String src_Terminal_Id = "1065730495561";
	private static String[] dest_Terminal_Id = { "13599204724" };
	private static byte[] msg_Content = null;
	private static String reserve = "";

	/** �����շ��ӿ� */
	public static SMProxyRec myProxy = null;

	/** Ӧ�ó������ʾ��Ϣ���� * */
	JTextArea txtArea = null;

	// ������������
	public void ProBaseConf() {
		try {
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
			msg_Fmt = argssumbit.get("msg_Fmt", 15);
			msg_Src = argssumbit.get("msg_Src", "913841");
			fee_Type = argssumbit.get("fee_Type", "02");
			fee_Code = argssumbit.get("fee_Code", "000");
			src_Terminal_Id = argssumbit
					.get("src_Terminal_Id", "1065730495561");
			reserve = argssumbit.get("reserve", "");

			txtArea.append("�������ӳɹ�" + "\n");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * ���췽��
	 */
	public SMProxySend(JTextArea parm) {
		// ���������������Ϣ
		// ProBaseConf();
		txtArea = parm;
	}

	/**
	 * ��Ϊ���ŷ����ദ�������ࣩ
	 * 
	 * @param �����࣬�����ֻ��ţ����ݣ����
	 */
	public int SendMessage(String mobiles, String content) {
		// ���ؽ��
		int result = 0;
		// ��������
		try {
			msg_Content = content.getBytes("GBK");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// ���ͺ���
		ArrayList telList = new ArrayList();
		String[] mobileArray = mobiles.split(";");
		for (int i = 0; i < mobileArray.length; i++) {
			telList.add(mobileArray[i]);
		}
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

		// ��ʼ���ύ��Ϣ
		CMPPSubmitMessage submitMsg = new CMPPSubmitMessage(pk_Total,
				pk_Number, registered_Delivery, msg_Level, service_Id,
				fee_UserType, fee_Terminal_Id, tp_Pid, tp_Udhi, msg_Fmt,
				msg_Src, fee_Type, fee_Code, valid_Time, at_Time,
				src_Terminal_Id, dest_Terminal_Id, msg_Content, reserve);
		try {
			CMPPSubmitRepMessage submitRepMsg = (CMPPSubmitRepMessage) myProxy
					.send(submitMsg);
			if (submitRepMsg.getResult() == 0) {
				result = 1;
				System.out.println("���Ͷ��ųɹ�msgid:"
						+ submitRepMsg.getMsgId().toString() + "\t SequenceId:"
						+ submitRepMsg.getSequenceId());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * ����Proxy�ַ����ŵĽ���
	 * 
	 * @param msg
	 */
	public void ProcessRecvDeliverMsg(CMPPMessage msg) {
		CMPPDeliverMessage deliverMsg = (CMPPDeliverMessage) msg;

		if (deliverMsg.getRegisteredDeliver() == 0)
			try {
				// ��ŷ�ʽ
				if (deliverMsg.getMsgFmt() == 8) {
					System.out.println(String.valueOf(String
							.valueOf((new StringBuffer("1������Ϣ: ���к���=")).append(
									deliverMsg.getSrcterminalId()).append(
									";����=").append(
									new String(deliverMsg.getMsgContent(),
											"UTF-16BE")))));
					txtArea
							.append("��Դ�ֻ��ţ�"
									+ deliverMsg.getSrcterminalId()
									+ "\r\n"
									+ "��������"
									+ new String(deliverMsg.getMsgContent(),
											"UTF-16BE") + "\r\n");
				}
				// ��ŷ�ʽGBK
				else {
					System.out.println(String.valueOf(String
							.valueOf((new StringBuffer(
									"2�ҵĿͻ���fjfdszj������Ϣ: ���к���=")).append(
									deliverMsg.getSrcterminalId()).append(
									";����=").append(
									new String(deliverMsg.getMsgContent()))
									.append(";destterm=").append(
											new String(deliverMsg
													.getDestnationId()))
									.append(";serviceid=").append(
											new String(deliverMsg
													.getServiceId())).append(
											";tppid=").append(
											deliverMsg.getTpPid()).append(
											";tpudhi=").append(
											deliverMsg.getTpUdhi()).append(
											";msgfmt").append(
											deliverMsg.getMsgFmt()).append(
											";srctermid=").append(
											new String(deliverMsg
													.getSrcterminalId()))
									.append(";deliver=").append(
											deliverMsg.getRegisteredDeliver())
									.append(";msgcontent=").append(
											new String(deliverMsg
													.getMsgContent())))));
					txtArea
					.append("��Դ�ֻ��ţ�"
							+ deliverMsg.getSrcterminalId()
							+ "\r\n"
							+ "��������"
							+ new String(deliverMsg.getMsgContent()) + "\r\n");
					// �ݲ��������ݵĵ���
					// ���յ��ֻ���Ϣ
					// SmsBean sms=new SmsBean();
					// sms.setSmsContent(deliverMsg.getMsgContent().toString());
					// ArrayList mobileList=new ArrayList();
					// mobileList.add(deliverMsg.getSrcterminalId());
					// sms.setMobileNoList(mobileList);
					// HashMap param = new HashMap();
					// param.put("phoneCode", deliverMsg.getSrcterminalId());
					// //�������ֻ�����
					// param.put("inceptDate", deliverMsg.getDoneTime());//��������
					// param.put("smsContent",deliverMsg.getMsgContent().toString());
					// //��������
					// baseSqlMapDAO.insert("SmsManage.insertInceptSms", param);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		else
			System.out.println(String.valueOf(String.valueOf((new StringBuffer(
					"3�յ�״̬������Ϣ�� stat=")).append(
					new String(deliverMsg.getStat())).append("dest_termID=")
					.append(new String(deliverMsg.getDestTerminalId())).append(
							";destterm=").append(
							new String(deliverMsg.getDestnationId())).append(
							";serviceid=").append(
							new String(deliverMsg.getServiceId())).append(
							";tppid=").append(deliverMsg.getTpPid()).append(
							";tpudhi=").append(deliverMsg.getTpUdhi()).append(
							";msgfmt").append(deliverMsg.getMsgFmt()).append(
							";srctermid=").append(
							new String(deliverMsg.getSrcterminalId())).append(
							";deliver=").append(
							deliverMsg.getRegisteredDeliver()))));
	}

	public void Terminate() {
		System.out.println("SMC�·��ն���Ϣ");
		myProxy.close();
		myProxy = null;
	}

	public void SearchMsg() {
		// ɾ������
		byte[] msg_id = "2".getBytes();
		CMPPCancelMessage cancelMsg = new CMPPCancelMessage(msg_id);
		try {
			CMPPCancelRepMessage cancelRepMsg = (CMPPCancelRepMessage) myProxy
					.send(cancelMsg);
			System.out.println("getCommandId" + cancelRepMsg.getCommandId()
					+ "\t getSuccessId" + cancelRepMsg.getSuccessId()
					+ "\tgetSequenceId: " + cancelRepMsg.getSequenceId());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// �������Ӵ�����Ӧ��ϢcancelRepMsg�Ĵ���

		// ��ѯ����
		// String query_Code="";
		// Date time= new Date(System.currentTimeMillis() + (long) 0xa4cb800);

		// CMPPQueryMessage queryMsg = new
		// CMPPQueryMessage(time,0,query_Code,"");

		// try {
		// CMPPQueryRepMessage queryRepMsg =(CMPPQueryRepMessage)
		// myProxy.send(queryMsg);
		// log.debug(queryRepMsg.getQueryCode());
		// } catch (IOException e) {
		// TODO Auto-generated catch block
		//	e.printStackTrace();
		//}
		// �������Ӵ�����Ӧ��ϢqueryRepMsg�Ĵ��룬��ò�ѯ���

		//��ѯSMProxy��ISMG��TCP����״̬
		String stateDesc = myProxy.getConnState();
		System.out.println(stateDesc);
	}

	/**
	 * �ر�����
	 */
	public void Close() {
		//��ѯSMProxy��ISMG��TCP����״̬
		//String stateDesc = myProxy.getConnState();
		myProxy.close();
		myProxy = null;
	}

	// ���Է���
	public static void main(String[] args) {

	}
}
