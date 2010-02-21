import java.io.*;
import java.util.ArrayList;
import java.util.Date;

import com.huawei.smproxy.*;
import com.huawei.insa2.comm.PMessage;
import com.huawei.insa2.comm.cmpp.message.*;
import com.huawei.insa2.util.*;

//ʱ�䣺20081205���޸Ķ��Ų�������
public class TestSendMsg extends   Thread   {
	private static Args args;
	
	private static Args argsother;


	/** �����շ��ӿ� */
	private SMProxyRec myProxy = null;

	/**
	 * ���췽��
	 */
	public TestSendMsg() {
//		try {
//			argsother = new Cfg("ProxConf.xml", false).getArgs("ismg");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		argsother.set("source-addr", "913841");
//		argsother.set("shared-secret", "pkswd904");
//		myProxy = new SMProxyRec(this,argsother);
	}

	public void SendMessage() {
		try {
			argsother = new Cfg("ProxConf.xml", false).getArgs("CMPPConnect");
			//argsother.set("source-addr", "913841");
			//argsother.set("shared-secret", "pkswd904");
			myProxy = new SMProxyRec(this,argsother);

			//��������
			String content="���ڿ��Ժú�˯һ���ˣ�����";
			//������Ų��Գɹ�!�û� 444504�ɹ����û� 913841ʧ�ܣ�����ֵΪResult=10
			
			
			byte[] contentbyte=content.getBytes("GBK");
			
			//���ͺ���
			String[] dest_Terminal_IdArray={"13599204724"};//,"13599416694"
			
			Date valid_Time =new Date(System.currentTimeMillis() + (long) 0xa4cb800); //new Date();// 
			Date at_Time =null;//new Date(System.currentTimeMillis() + (long) 0xa4cb800);   //new Date(); 
			
			args = new Cfg("ProxConf.xml", false).getArgs("CMPPSubmitMessage");
			
						 CMPPSubmitMessage submitMsg = 
							 	new CMPPSubmitMessage(
							 		args.get("pk_Total", 1),
							      	args.get("pk_Number", 1),
							      	args.get("registered_Delivery", 1),
							      	args.get("msg_Level", 1),
							     	args.get("service_Id", "04545"),
							      	args.get("fee_UserType", 2),
							    	args.get("fee_Terminal_Id", "1065730495561"),
							    	args.get("tp_Pid", 1),
							    	args.get("tp_Udhi", 1),
							    	args.get("msg_Fmt", 15),
								  	args.get("msg_Src", "913841"),
							     	args.get("fee_Type", "02"),
							     	args.get("fee_Code", "000"),
							     	valid_Time,
							     	at_Time,
							     	args.get("src_Terminal_Id", "1065730495561"),
							     	dest_Terminal_IdArray,
							     	contentbyte,
							      	args.get("reserve", ""));
			
						 CMPPSubmitRepMessage submitRepMsg =(CMPPSubmitRepMessage) myProxy.send(submitMsg);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	   /**
	    * ����Proxy�ַ����ŵĽ���
	    * @param msg
	    */ 
		public void ProcessRecvDeliverMsg(CMPPMessage msg) {
			CMPPDeliverMessage deliverMsg = (CMPPDeliverMessage) msg;
			System.out.println("onDeliver");
			System.out.println("" + deliverMsg.getSrcterminalId());
			System.out.println("" + deliverMsg.getRegisteredDeliver());
			if (deliverMsg.getRegisteredDeliver() == 0)
			try 
			{
				//��ŷ�ʽ
				if (deliverMsg.getMsgFmt() == 8)
					System.out.println(String.valueOf(String.valueOf((new StringBuffer("������Ϣ: ���к���=")).append(
				deliverMsg.getSrcterminalId()).append(";����=").append(
				new String(deliverMsg.getMsgContent(),"UTF-16BE")))));
				//��ŷ�ʽGBK
				else
				{
					System.out.println(String.valueOf(String.valueOf((new StringBuffer("������Ϣ: ���к���=")).append(
				deliverMsg.getSrcterminalId()).append(";����=").append(
				new String(deliverMsg.getMsgContent())).append(";destterm=").append(
				new String(deliverMsg.getDestnationId())).append(";serviceid=").append(
				new String(deliverMsg.getServiceId())).append(";tppid=").append(
				deliverMsg.getTpPid()).append(";tpudhi=").append(
				deliverMsg.getTpUdhi()).append(";msgfmt").append(
				deliverMsg.getMsgFmt()).append(";srctermid=").append(
				new String(deliverMsg.getSrcterminalId())).append(";deliver=").append(
				deliverMsg.getRegisteredDeliver()).append(";msgcontent=").append(
				new String(deliverMsg.getMsgContent())))));
				//�ݲ��������ݵĵ���
				//���յ��ֻ���Ϣ
//				SmsBean sms=new SmsBean();
//				sms.setSmsContent(deliverMsg.getMsgContent().toString());
//				ArrayList mobileList=new ArrayList();
//				mobileList.add(deliverMsg.getSrcterminalId());
//				sms.setMobileNoList(mobileList);
//				HashMap param = new HashMap();
//				param.put("phoneCode", deliverMsg.getSrcterminalId());	//�������ֻ�����
//				param.put("inceptDate", deliverMsg.getDoneTime());//��������
//				param.put("smsContent",deliverMsg.getMsgContent().toString());			//��������
//				baseSqlMapDAO.insert("SmsManage.insertInceptSms", param);
				}
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			else
				System.out.println(String.valueOf(String.valueOf((new StringBuffer("�յ�״̬������Ϣ�� stat="))
				.append(new String(deliverMsg.getStat())).append("dest_termID=").append(
				new String(deliverMsg.getDestTerminalId())).append(";destterm=").append(
				new String(deliverMsg.getDestnationId())).append(";serviceid=").append(
				new String(deliverMsg.getServiceId())).append(";tppid=").append(
				deliverMsg.getTpPid()).append(";tpudhi=").append(
				deliverMsg.getTpUdhi()).append(";msgfmt").append(
				deliverMsg.getMsgFmt()).append(";srctermid=").append(
				new String(deliverMsg.getSrcterminalId())).append(";deliver=").append(
				deliverMsg.getRegisteredDeliver()))));
		}

		public void Terminate() {
			myProxy=null;
		}
		
		
		public   void  run(){ 
			String  connstate   =   null; 
			try   { 
			do   { 
			connstate   =   myProxy.getConnState();
			Thread.sleep(1001);
			}while(true);
			}   catch (Exception   e) {
			e.printStackTrace();
			return; 
			} 
			} 

		
	// ���Է���
	public static void main(String[] args) {
		TestSendMsg api = new TestSendMsg();
		ArrayList arraylist = new ArrayList();
		arraylist.add("13599204724");
		//api.SendMessage("HelloWorld!", arraylist);
		api.SendMessage();
		//api.start();
	}
}
