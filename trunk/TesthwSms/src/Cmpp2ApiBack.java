

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import net.trust.application.baseArchives.carInfo.action.CarInfoAction;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;

import SMEPClient.SMEPClient;


public class Cmpp2ApiBack {
	//��־����
	Log log = LogFactory.getLog(CarInfoAction.class);
	
	//��ȡ������Ϣ
	String IN_pServerIP = "211.143.170.161"; // ������ IP
	int IN_ServerPort =8855;			 // �������˿�
	String IN_pECode = "91384";		     // ��ҵ�̺� 5λ����
	String IN_pUserName = "913841";      // �û���  6λ
	String IN_pPassword = "pkswd904";        // ����
	String IN_pZoneID = "0594";          // ��������
	int IN_OverTime = 10;               // ��ʱ��ʱ�䣨�룩
	StringBuffer OUT_pServerIP = new StringBuffer(); // ���ڷ��ؿ����ӵķ�����IP��ַ
	StringBuffer OUT_pPort = new StringBuffer();     // ���ڷ��ؿ����ӵķ������˿�
	//���ڴ�����ʱ�޷�ʹ��
	int IN_ProxyType = 0;			                  				 
	String IN_pProxyIP = "";
	int IN_ProxyPort = 0;
	int IN_ProxyAuth = 0;
	String IN_pProxyUserID = "";
	String IN_pProxyPassword = "";
	//���������
	String IN_pQueryIP = "211.143.170.161";	//��ѯ������IP��ַ
	int IN_QueryPort = 8855;			//��ѯ�������˿�
	
	public Cmpp2ApiBack()
	{
		//��ʼ��������Ϣ
		// GetConfig();
	}
	//=================================
	//�õ��������
	//=================================
    private void GetConfig()
    {
    	try {
    		Properties properties = new Properties();//�õ������ļ������Ϣ
    		properties.load(getClass().getResourceAsStream("Cmpp2Config.properties"));//����Properties�ļ���
    		IN_pServerIP = properties.getProperty("CMPP.IN_pServerIP"); 						// ������ IP
    		IN_ServerPort =Integer.parseInt(properties.getProperty("CMPP.IN_ServerPort"));		// �������˿�
    		IN_pECode = properties.getProperty("CMPP.IN_pECode");		    					// ��ҵ�̺�
    		IN_pUserName = properties.getProperty("CMPP.IN_pUserName");      					// �û���
    		IN_pPassword = properties.getProperty("CMPP.IN_pPassword");         				// ����
    		IN_pZoneID = properties.getProperty("CMPP.IN_pZoneID");           					// �������� 
    		IN_OverTime = Integer.parseInt(properties.getProperty("CMPP.IN_OverTime"));        // ��ʱ��ʱ�䣨�룩      					// �������� 
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    }
	
	//===============================================
	// ��ѯ����������ʾ��
	//===============================================
	/**
	 * ��ȡ���� MT ������
	 */
	public void GetServiceMT()
	{
		int nRet = 0;
		SMEPClient smep_clnt = new SMEPClient();
		System.out.println("��ȡ���еķ�������ַ*******************");
		nRet = smep_clnt.SMEP_GetServer(IN_pServerIP, // ������ IP
				IN_ServerPort, // �������˿�
				IN_ProxyType, // ��������(0-�޴���1-Socks4����2-Socks5����)
				IN_pProxyIP, // ����IP��ַ
				IN_ProxyPort, // ����˿�
				IN_ProxyAuth, //�Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ)
				IN_pProxyUserID, // �����û���
				IN_pProxyPassword, // ��������
				0, // Ҫ��ȡ�����������ͣ�0 MT, 1 MO
				IN_pECode, // ��ҵ�̺�
				IN_pUserName, // �û���
				IN_pPassword, // ����
				IN_pZoneID, // ��������
				IN_OverTime, // ��ʱ��ʱ�䣨�룩
				OUT_pServerIP, //���ڷ��ؿ����ӵķ�����IP��ַ
				OUT_pPort); // ���ڷ��ؿ����ӵķ������˿�
		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("��ȡ���� MT ������ʧ��:" + errInfo);
			return;
		}
		System.out.println("��ȡ���� MT �������ɹ�,���з�������Ϣ:" + OUT_pServerIP + ":"
				+ OUT_pPort);
	}
	/**
	 * ��ȡ����MO����
	 */
	public void GetServiceMO()
	{
		int nRet = 0;
		SMEPClient smep_clnt = new SMEPClient();
		nRet = smep_clnt.SMEP_GetServer(IN_pServerIP, // ������ IP
				IN_ServerPort, // �������˿�
				IN_ProxyType, // ��������(0-�޴���1-Socks4����2-Socks5����)
				IN_pProxyIP, // ����IP��ַ
				IN_ProxyPort, // ����˿�
				IN_ProxyAuth, //�Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ)
				IN_pProxyUserID, // �����û���
				IN_pProxyPassword, // ��������
				1, // Ҫ��ȡ�����������ͣ�0 MT, 1 MO
				IN_pECode, // ��ҵ�̺�
				IN_pUserName, // �û���
				IN_pPassword, // ����
				IN_pZoneID, // ��������
				IN_OverTime, // ��ʱ��ʱ�䣨�룩
				OUT_pServerIP, // ���ڷ��ؿ����ӵķ�����IP��ַ
				OUT_pPort); // ���ڷ��ؿ����ӵķ������˿�
		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("��ȡ���� MO ������ʧ��:" + errInfo);
			return;
		}
		System.out.println("��ȡ���� MO �������ɹ�,���з�������Ϣ:" + OUT_pServerIP + ":"
				+ OUT_pPort);
	}
	/**
	 * ��ȡ���зǷ��������ɹ�
	 */
	public void GetService() {
		int nRet = 0;
		SMEPClient smep_clnt = new SMEPClient();
		nRet = smep_clnt.SMEP_GetServer(IN_pServerIP, // ������ IP
				IN_ServerPort, // �������˿�
				IN_ProxyType, // ��������(0-�޴���1-Socks4����2-Socks5����)
				IN_pProxyIP, // ����IP��ַ
				IN_ProxyPort, // ����˿�
				IN_ProxyAuth, // �Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ)
				IN_pProxyUserID, // �����û���
				IN_pProxyPassword, // ��������
				2, // Ҫ��ȡ�����������ͣ�0 MT, 1 MO
				IN_pECode, // ��ҵ�̺�
				IN_pUserName, // �û���
				IN_pPassword, // ����
				IN_pZoneID, // ��������
				IN_OverTime, // ��ʱ��ʱ�䣨�룩
				OUT_pServerIP, // ���ڷ��ؿ����ӵķ�����IP��ַ
				OUT_pPort); // ���ڷ��ؿ����ӵķ������˿�
		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("��ȡ���зǷ�������ʧ��:" + errInfo);
		} else {
			System.out.println("��ȡ���зǷ��������ɹ�,���з�������Ϣ:" + OUT_pServerIP + ":"
					+ OUT_pPort);
		}
	}
	/**
	 * �޸�����
	 */
	public void ModifyServicePwd()
	{
		int nRet = 0;
		System.out.println("�޸�����*******************");
		String IN_NewPW1 = "newPass";
		String IN_NewPW2 = "newPass";
		
		SMEPClient smep_clnt = new SMEPClient();
		nRet = smep_clnt.SMEP_EditPW(IN_pServerIP, // ������ IP
				IN_ServerPort, // �������˿�
				IN_ProxyType, // ��������(0-�޴���1-Socks4����2-Socks5����)
				IN_pProxyIP, // ����IP��ַ
				IN_ProxyPort, // ����˿�
				IN_ProxyAuth, //�Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ,����Socks4������Ч��
				IN_pProxyUserID, // �����û���(����Socks4������Ч)
				IN_pProxyPassword, // ��������(����Socks4������Ч)
				IN_pECode, // ��ҵ�̺�
				IN_pUserName, // �û���
				IN_pPassword, // ����
				IN_pZoneID, // ��������
				IN_NewPW1, // ������
				IN_NewPW2, // �ظ�������
				IN_OverTime); // ��ʱʱ��
		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("�޸�����ʧ��:" + errInfo);
			return;
		}
		System.out.println("�޸�����ɹ�!");		
		
	}
	/**
	 * ��ѯ��ʷ��¼�ɹ�,MT������MO����
	 */
	public void GetServiceNum()
	{	
		System.out.println("��ѯ��ʷ��¼*******************");
		String IN_YearMonth = "200303";
		StringBuffer OUT_MTNum = new StringBuffer();
		StringBuffer OUT_MONum = new StringBuffer();
		
		int nRet = 0;		
		SMEPClient smep_clnt = new SMEPClient();
		nRet = smep_clnt.SMEP_QueryHistory(IN_pServerIP, // ������ IP
				IN_ServerPort, // �������˿�
				IN_ProxyType, // ��������(0-�޴���1-Socks4����2-Socks5����)
				IN_pProxyIP, // ����IP��ַ
				IN_ProxyPort, // ����˿�
				IN_ProxyAuth, // �Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ,����Socks4������Ч��
				IN_pProxyUserID, // �����û���(����Socks4������Ч)
				IN_pProxyPassword, // ��������(����Socks4������Ч)
				IN_pECode, // ��ҵ�̺�
				IN_pUserName, // �û���
				IN_pPassword, // ����
				IN_pZoneID, // ��������
				IN_YearMonth, // Ҫ��ѯ������
				OUT_MTNum, // ���ز�ѯ����MT������
				OUT_MONum, // ���ز�ѯ����MO������
				IN_OverTime); // ��ʱ��ʱ�䣨�룩
		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("��ѯ��ʷ��¼ʧ��:" + errInfo);
			return;
		}
		System.out.println("��ѯ��ʷ��¼�ɹ�,MT����:" + OUT_MTNum + "MO����:" + OUT_MONum);		
	}
	/**
	 * ��ѯMT����״̬
	 */
	public  void GetServiceMTState()
	{
		System.out.println("��ѯMT����״̬*******************");
		String IN_YearMonth = "200303";
		String IN_MsgID = "00000000000000000000000004115939";
		String IN_DestTermID = "13906096008";
		
		int nRet = 0;
		SMEPClient smep_clnt = new SMEPClient();
		nRet = smep_clnt.SMEP_QueryReport(IN_pServerIP, // ������ IP
				IN_ServerPort, // �������˿�
				IN_ProxyType, // ��������(0-�޴���1-Socks4����2-Socks5����)
				IN_pProxyIP, // ����IP��ַ
				IN_ProxyPort, // ����˿�
				IN_ProxyAuth, // �Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ,����Socks4������Ч��
				IN_pProxyUserID, // �����û���(����Socks4������Ч)
				IN_pProxyPassword, // ��������(����Socks4������Ч)
				IN_pECode, // ��ҵ�̺�
				IN_pUserName, // �û���
				IN_pPassword, // ����
				IN_pZoneID, // ��������
				IN_MsgID, // Ҫ��ѯ��MsgID��
				IN_DestTermID, // Ŀ���ֻ���
				IN_YearMonth, // Ҫ��ѯ�����¡�
				IN_OverTime); // ��ʱʱ��(��)

		StringBuffer errInfo = new StringBuffer(125);
		smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
		System.out.println("��ѯMT����״̬���:" + errInfo);
	}
	//===============================================
	// MT ����������ʾ��
	//===============================================
	/**
	 * ���ŷ���ʾ��
	 */
	public void CmppSend()
	{
		int nRet = -1; //�����ķ���ֵ

		int IN_ServerType = 0;//Ҫ��ѯ�ķ���������(0-MT,1-MO)
		int IN_ConnectType = 0;//Ҫ��ȡ������������(0 MT, 1 MO)
		StringBuffer OUT_pStatus = new StringBuffer();
		int nConnectID;
		
		StringBuffer OUT_pServerIP = new StringBuffer(); // ���ڷ��ؿ����ӵķ�����IP��ַ
		StringBuffer OUT_pPort = new StringBuffer();     // ���ڷ��ؿ����ӵķ������˿�

		SMEPClient smep_clnt = new SMEPClient();

		System.out.println("��ȡ���еķ�������ַ*******************");
		nRet = smep_clnt.SMEP_GetServer(IN_pQueryIP,//��ѯ������IP��ַ
				IN_QueryPort,//��ѯ�������˿�
				IN_ProxyType,//��������(0-�޴���,1-Socks4����,2-Socks5����)
				IN_pProxyIP,//����IP
				IN_ProxyPort,//����˿�
				IN_ProxyAuth,//������֤��־(0-����֤,1-��֤)
				IN_pProxyUserID,//�����û���
				IN_pProxyPassword,//��������
				IN_ServerType,//Ҫ��ȡ������������(0 MT, 1 MO)
				IN_pECode,//��ҵ�̺�
				IN_pUserName,//�û���
				IN_pPassword,//����
				IN_pZoneID,// ��������
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pServerIP,// ��ѯ���ķ�������IP��ַ
				OUT_pPort);// ��ѯ���ķ������Ķ˿�

		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("��ȡ���� MT ������ʧ��:" + errInfo);
			return;
		}

		System.out.println("��ȡ���е� MT ��������ַ�ɹ���IP��ַ:" + OUT_pServerIP + ",�˿�:"
				+ Integer.parseInt(OUT_pPort.toString()));

		System.out.println("����MT������:" + OUT_pServerIP.toString() + ":"
				+ Integer.parseInt(OUT_pPort.toString()));
		
		
		//============================================================================================
		nConnectID = smep_clnt.SMEP_Connect(OUT_pServerIP.toString(),//������IP��ַ
				Integer.parseInt(OUT_pPort.toString()),//�������˿�
				IN_ProxyType,//��������
				IN_pProxyIP,// ����IP��ַ
				IN_ProxyPort,// ����˿�
				IN_ProxyAuth,//�Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ)
				IN_pProxyUserID,// �����û���
				IN_pProxyPassword,// ��������
				IN_ConnectType,// ���ӷ�ʽ��0 MT, 1 MO
				IN_pECode,// ��ҵ�̺�
				IN_pUserName,// �û���
				IN_pPassword,// ����
				IN_pZoneID,// ��������
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pStatus);// ����״̬


		
		if (nConnectID < 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, Integer.parseInt(OUT_pStatus
					.toString().trim()), 124, errInfo);
			System.out.println("���� MT ����������:" + errInfo);
			return;
		}
		System.out.println("���ӳɹ������(" + nConnectID + ")");
		//============================================================================================
		int IN_Msg_Level = 0; // ��Ϣ����
		int IN_ReportFlag = 1;
		int IN_MTFlag = 0;
		String IN_MOMsgID = "";
		String IN_AtTime = "";
		String IN_Src_Terminal_ID = "1234";
		int IN_DestCount = 1;
		ArrayList Dest_Terminal_ID = new ArrayList();
		Dest_Terminal_ID.add(0, "13599204724");
		//Dest_Terminal_ID.add(1, "13805710002");
		//Dest_Terminal_ID.add(2, "13805710003");

		int IN_Msg_Fotmat = 0;
		String IN_pMsg_Content = "����teat123!";
		StringBuffer OUT_pMsgID = new StringBuffer();

		System.out.println("��·����*************************");
		int iReturn = smep_clnt.SMEP_Active_Test(nConnectID, IN_OverTime);
		if (iReturn == 0) {
			System.out.println("��·���Գɹ�!");
		} else {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, iReturn, 124, errInfo);
			System.out.println("��·����ʧ��:" + errInfo);

			System.out.println("�Ͽ�����***********************");
			smep_clnt.SMEP_Disconnection(nConnectID);
			return;
		}

		System.out.println("�ύ����Ϣ*************************");
		iReturn = smep_clnt.SMEP_Submit(nConnectID,// �� SMEP_Connect ���ص����ӱ�ʶ
				IN_Msg_Level,// ��Ϣ���� 0
				IN_ReportFlag,// ״̬������ 1
				IN_MTFlag,// ����MT��ԭ��
				IN_MOMsgID,// ����MT��MO��MsgID
				IN_AtTime,// ����ʱ������
				IN_Src_Terminal_ID,// Դ�ֻ�����
				IN_DestCount,// Ŀ���ֻ�����
				Dest_Terminal_ID,// Ŀ���ֻ��������
				IN_Msg_Fotmat,// ��Ϣ��ʽ
				IN_pMsg_Content,// ��Ϣ����
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pMsgID);
		if (iReturn == 0)// ���ͳɹ����صĸ�������Ϣ��ʶ
		{
			System.out.println("���Ͷ��ųɹ�,��Ϣ��Ϊ:" + OUT_pMsgID);
		} else {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, iReturn, 124, errInfo);
			System.out.println("errInfo:" + errInfo + " [" + OUT_pMsgID + "]");
		}

		System.out.println("�Ͽ�����***********************");
		smep_clnt.SMEP_Disconnection(nConnectID);		
	}
	
	
	/**
	 * ���ŷ���ʾ��
	 * Ⱥ������
	 */
	public int CmppSend(List<SmsBean> cmppList)
	{
		if (log.isDebugEnabled())
			log.debug("��ʼ���Ͷ���");
		
		int Result=0;  //���ͷ���ֵ
		
		int nRet = -1; //�����ķ���ֵ

		int IN_ServerType = 0;//Ҫ��ѯ�ķ���������(0-MT,1-MO)
		int IN_ConnectType = 0;//Ҫ��ȡ������������(0 MT, 1 MO)
		
		StringBuffer OUT_pStatus = new StringBuffer();
		
		int nConnectID;
		
		StringBuffer OUT_pServerIP = new StringBuffer(); // ���ڷ��ؿ����ӵķ�����IP��ַ
		StringBuffer OUT_pPort = new StringBuffer();     // ���ڷ��ؿ����ӵķ������˿�

		SMEPClient smep_clnt = new SMEPClient();

		System.out.println("��ȡ���еķ�������ַ*******************");
		nRet = smep_clnt.SMEP_GetServer(IN_pQueryIP,//��ѯ������IP��ַ
				IN_QueryPort,//��ѯ�������˿�
				IN_ProxyType,//��������(0-�޴���,1-Socks4����,2-Socks5����)
				IN_pProxyIP,//����IP
				IN_ProxyPort,//����˿�
				IN_ProxyAuth,//������֤��־(0-����֤,1-��֤)
				IN_pProxyUserID,//�����û���
				IN_pProxyPassword,//��������
				IN_ServerType,//Ҫ��ȡ������������(0 MT, 1 MO)
				IN_pECode,//��ҵ�̺�
				IN_pUserName,//�û���
				IN_pPassword,//����
				IN_pZoneID,// ��������
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pServerIP,// ��ѯ���ķ�������IP��ַ
				OUT_pPort);// ��ѯ���ķ������Ķ˿�

		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("��ȡ���� MT ������ʧ��:" + errInfo);
			
			if (log.isDebugEnabled())
				log.debug("��ȡ���� MT ������ʧ��:" + errInfo);			
			return Result;
		}

		System.out.println("��ȡ���е� MT ��������ַ�ɹ���IP��ַ:" + OUT_pServerIP + ",�˿�:"
				+ Integer.parseInt(OUT_pPort.toString()));

		System.out.println("����MT������:" + OUT_pServerIP.toString() + ":"
				+ Integer.parseInt(OUT_pPort.toString()));
		
		if (log.isDebugEnabled())
			log.debug("����MT������:" + OUT_pServerIP.toString() + ":"
					+ Integer.parseInt(OUT_pPort.toString()));
		
		
		//============================================================================================
		nConnectID = smep_clnt.SMEP_Connect(OUT_pServerIP.toString(),//������IP��ַ
				Integer.parseInt(OUT_pPort.toString()),//�������˿�
				IN_ProxyType,//��������
				IN_pProxyIP,// ����IP��ַ
				IN_ProxyPort,// ����˿�
				IN_ProxyAuth,//�Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ)
				IN_pProxyUserID,// �����û���
				IN_pProxyPassword,// ��������
				IN_ConnectType,// ���ӷ�ʽ��0 MT, 1 MO
				IN_pECode,// ��ҵ�̺�
				IN_pUserName,// �û���
				IN_pPassword,// ����
				IN_pZoneID,// ��������
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pStatus);// ����״̬
		if (nConnectID < 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, Integer.parseInt(OUT_pStatus
					.toString().trim()), 124, errInfo);
			System.out.println("���� MT ����������:" + errInfo);
			if (log.isDebugEnabled())
				log.debug("���� MT ����������:" + errInfo);
			return Result;
		}
		System.out.println("���ӳɹ������(" + nConnectID + ")");
		
		if (log.isDebugEnabled())
			log.debug("���ӳɹ������(" + nConnectID + ")");
		//============================================================================================
		int IN_Msg_Level = 0; // ��Ϣ����
		int IN_ReportFlag = 1;
		int IN_MTFlag = 0;
		String IN_MOMsgID = "";
		String IN_AtTime = (new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date());//ʱ���ʽ
		//�õ�������Ϣ
		String IN_Src_Terminal_ID =((SmsBean)cmppList.get(0)).getSn(); //��ʶID
		int IN_DestCount = cmppList.size();                            //�ֻ���
		ArrayList Dest_Terminal_ID = new ArrayList();                  //�ֻ����������
		for (int i=0; i<cmppList.size(); i++){
			SmsBean cmpp = (SmsBean)cmppList.get(i);
			Dest_Terminal_ID.add(i,cmpp.getMobileNo());
		}

		int IN_Msg_Fotmat = 0;
		String IN_pMsg_Content = ((SmsBean)cmppList.get(0)).getSmsContent();//��Ҫ���͵�����
		StringBuffer OUT_pMsgID = new StringBuffer();

		System.out.println("��·����*************************");
		int iReturn = smep_clnt.SMEP_Active_Test(nConnectID, IN_OverTime);
		if (iReturn == 0) {
			System.out.println("��·���Գɹ�!");
		} else {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, iReturn, 124, errInfo);
			smep_clnt.SMEP_Disconnection(nConnectID);
			
			if (log.isDebugEnabled())
				log.debug("��·����ʧ��:" + errInfo);
			return Result;
		}

		System.out.println("�ύ����Ϣ*************************");
		iReturn = smep_clnt.SMEP_Submit(nConnectID,// �� SMEP_Connect ���ص����ӱ�ʶ
				IN_Msg_Level,// ��Ϣ���� 0
				IN_ReportFlag,// ״̬������ 1
				IN_MTFlag,// ����MT��ԭ��
				IN_MOMsgID,// ����MT��MO��MsgID
				IN_AtTime,// ����ʱ������
				IN_Src_Terminal_ID,// Դ�ֻ�����
				IN_DestCount,// Ŀ���ֻ�����
				Dest_Terminal_ID,// Ŀ���ֻ��������
				IN_Msg_Fotmat,// ��Ϣ��ʽ
				IN_pMsg_Content,// ��Ϣ����
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pMsgID);
		if (iReturn == 0)// ���ͳɹ����صĸ�������Ϣ��ʶ
		{
			if (log.isDebugEnabled())
				log.debug("���Ͷ��ųɹ�,��Ϣ��Ϊ:" + OUT_pMsgID);
			Result=1;
		} else {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, iReturn, 124, errInfo);
			if (log.isDebugEnabled())
				log.debug("errInfo:" + errInfo + " [" + OUT_pMsgID + "]");
		}
		
		System.out.println("�Ͽ�����***********************");
		smep_clnt.SMEP_Disconnection(nConnectID);
		
		return Result;
	}
	
	/**
	 * ���ŷ���ʾ��
	 * Ⱥ������
	 */
	public int CmppSend(SmsBean cmpp)
	{
		if (log.isDebugEnabled())
			log.debug("��ʼ���Ͷ���");
		
		int Result=0;  //���ͷ���ֵ
		
		int nRet = -1; //�����ķ���ֵ

		int IN_ServerType = 0;//Ҫ��ѯ�ķ���������(0-MT,1-MO)
		int IN_ConnectType = 0;//Ҫ��ȡ������������(0 MT, 1 MO)
		
		StringBuffer OUT_pStatus = new StringBuffer();
		
		int nConnectID;
		
		StringBuffer OUT_pServerIP = new StringBuffer(); // ���ڷ��ؿ����ӵķ�����IP��ַ
		StringBuffer OUT_pPort = new StringBuffer();     // ���ڷ��ؿ����ӵķ������˿�

		SMEPClient smep_clnt = new SMEPClient();

		System.out.println("��ȡ���еķ�������ַ*******************");
		nRet = smep_clnt.SMEP_GetServer(IN_pQueryIP,//��ѯ������IP��ַ
				IN_QueryPort,//��ѯ�������˿�
				IN_ProxyType,//��������(0-�޴���,1-Socks4����,2-Socks5����)
				IN_pProxyIP,//����IP
				IN_ProxyPort,//����˿�
				IN_ProxyAuth,//������֤��־(0-����֤,1-��֤)
				IN_pProxyUserID,//�����û���
				IN_pProxyPassword,//��������
				IN_ServerType,//Ҫ��ȡ������������(0 MT, 1 MO)
				IN_pECode,//��ҵ�̺�
				IN_pUserName,//�û���
				IN_pPassword,//����
				IN_pZoneID,// ��������
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pServerIP,// ��ѯ���ķ�������IP��ַ
				OUT_pPort);// ��ѯ���ķ������Ķ˿�

		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("��ȡ���� MT ������ʧ��:" + errInfo);
			
			if (log.isDebugEnabled())
				log.debug("��ȡ���� MT ������ʧ��:" + errInfo);			
			return Result;
		}

		System.out.println("��ȡ���е� MT ��������ַ�ɹ���IP��ַ:" + OUT_pServerIP + ",�˿�:"
				+ Integer.parseInt(OUT_pPort.toString()));

		System.out.println("����MT������:" + OUT_pServerIP.toString() + ":"
				+ Integer.parseInt(OUT_pPort.toString()));
		
		if (log.isDebugEnabled())
			log.debug("����MT������:" + OUT_pServerIP.toString() + ":"
					+ Integer.parseInt(OUT_pPort.toString()));
		
		
		//============================================================================================
		nConnectID = smep_clnt.SMEP_Connect(OUT_pServerIP.toString(),//������IP��ַ
				Integer.parseInt(OUT_pPort.toString()),//�������˿�
				IN_ProxyType,//��������
				IN_pProxyIP,// ����IP��ַ
				IN_ProxyPort,// ����˿�
				IN_ProxyAuth,//�Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ)
				IN_pProxyUserID,// �����û���
				IN_pProxyPassword,// ��������
				IN_ConnectType,// ���ӷ�ʽ��0 MT, 1 MO
				IN_pECode,// ��ҵ�̺�
				IN_pUserName,// �û���
				IN_pPassword,// ����
				IN_pZoneID,// ��������
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pStatus);// ����״̬
		if (nConnectID < 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, Integer.parseInt(OUT_pStatus
					.toString().trim()), 124, errInfo);
			System.out.println("���� MT ����������:" + errInfo);
			if (log.isDebugEnabled())
				log.debug("���� MT ����������:" + errInfo);
			return Result;
		}
		System.out.println("���ӳɹ������(" + nConnectID + ")");
		
		if (log.isDebugEnabled())
			log.debug("���ӳɹ������(" + nConnectID + ")");
		//============================================================================================
		int IN_Msg_Level = 0; // ��Ϣ����
		int IN_ReportFlag = 1;
		int IN_MTFlag = 0;
		String IN_MOMsgID = "";
		String IN_AtTime = (new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date());//ʱ���ʽ
		//�õ�������Ϣ
		String IN_Src_Terminal_ID =cmpp.getSn(); //��ʶID
		int IN_DestCount = 1;                         //�ֻ���
		ArrayList Dest_Terminal_ID = new ArrayList();                  //�ֻ����������
		Dest_Terminal_ID.add(0,cmpp.getMobileNo());

		
		int IN_Msg_Fotmat = 0;
		String IN_pMsg_Content = cmpp.getSmsContent();//��Ҫ���͵�����
		StringBuffer OUT_pMsgID = new StringBuffer();

		
		System.out.println("��·����*************************");
		int iReturn = smep_clnt.SMEP_Active_Test(nConnectID, IN_OverTime);
		if (iReturn == 0) {
			System.out.println("��·���Գɹ�!");
		} else {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, iReturn, 124, errInfo);
			smep_clnt.SMEP_Disconnection(nConnectID);
			
			if (log.isDebugEnabled())
				log.debug("��·����ʧ��:" + errInfo);
			return Result;
		}

		
		System.out.println("�ύ����Ϣ*************************");
		iReturn = smep_clnt.SMEP_Submit(nConnectID,// �� SMEP_Connect ���ص����ӱ�ʶ
				IN_Msg_Level,// ��Ϣ���� 0
				IN_ReportFlag,// ״̬������ 1
				IN_MTFlag,// ����MT��ԭ��
				IN_MOMsgID,// ����MT��MO��MsgID
				IN_AtTime,// ����ʱ������
				IN_Src_Terminal_ID,// Դ�ֻ�����
				IN_DestCount,// Ŀ���ֻ�����
				Dest_Terminal_ID,// Ŀ���ֻ��������
				IN_Msg_Fotmat,// ��Ϣ��ʽ
				IN_pMsg_Content,// ��Ϣ����
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pMsgID);
		if (iReturn == 0)// ���ͳɹ����صĸ�������Ϣ��ʶ
		{
			if (log.isDebugEnabled())
				log.debug("���Ͷ��ųɹ�,��Ϣ��Ϊ:" + OUT_pMsgID);
			Result=1;
		} else {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, iReturn, 124, errInfo);
			if (log.isDebugEnabled())
				log.debug("errInfo:" + errInfo + " [" + OUT_pMsgID + "]");
		}
		
		System.out.println("�Ͽ�����***********************");
		smep_clnt.SMEP_Disconnection(nConnectID);
		
		return Result;
	}
	
	//===============================================
	// MO ����������ʾ��
	//===============================================
	/**
	 * ���Ž���
	 */
	public void CmppRecevie()
	{
		int nRet = -1; //�����ķ���ֵ
		int IN_ConnectType = 1;
		StringBuffer OUT_pStatus = new StringBuffer();
		int nConnectID;
		int IN_ServerType = 1;//Ҫ��ѯ�ķ���������(0-MT,1-MO)
		
		StringBuffer OUT_pServerIP = new StringBuffer(); // ���ڷ��ؿ����ӵķ�����IP��ַ
		StringBuffer OUT_pPort = new StringBuffer();     // ���ڷ��ؿ����ӵķ������˿�
		
		
		SMEPClient smep_clnt = new SMEPClient();

		System.out.println("��ȡ���е� MO ��������ַ*******************");
		nRet = smep_clnt.SMEP_GetServer(IN_pQueryIP,//��ѯ������IP��ַ
				IN_QueryPort,//��ѯ�������˿�
				IN_ProxyType,//��������(0-�޴���,1-Socks4����,2-Socks5����)
				IN_pProxyIP,//����IP
				IN_ProxyPort,//����˿�
				IN_ProxyAuth,//������֤��־(0-����֤,1-��֤)
				IN_pProxyUserID,//�����û���
				IN_pProxyPassword,//��������
				IN_ConnectType,//Ҫ��ȡ������������(0 MT, 1 MO)
				IN_pECode,//��ҵ�̺�
				IN_pUserName,//�û���
				IN_pPassword,//����
				IN_pZoneID,// ��������
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pServerIP,// ��ѯ���ķ�������IP��ַ
				OUT_pPort);// ��ѯ���ķ������Ķ˿�

		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("��ȡ���� MO ������ʧ��:" + errInfo);
			return;
		}

		System.out.println("��ȡ���е� MO ��������ַ�ɹ���IP��ַ:" + OUT_pServerIP + ",�˿�:"
				+ Integer.parseInt(OUT_pPort.toString()));

		System.out.println("����MO������:" + OUT_pServerIP.toString() + ":"
				+ Integer.parseInt(OUT_pPort.toString()));

		nConnectID = smep_clnt.SMEP_Connect(OUT_pServerIP.toString(),//������IP��ַ
				Integer.parseInt(OUT_pPort.toString()),//�������˿�
				IN_ProxyType,//��������
				IN_pProxyIP,// ����IP��ַ
				IN_ProxyPort,// ����˿�
				IN_ProxyAuth,//�Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ)
				IN_pProxyUserID,// �����û���
				IN_pProxyPassword,// ��������
				IN_ConnectType,// ���ӷ�ʽ��0 MT, 1 MO
				IN_pECode,// ��ҵ�̺�
				IN_pUserName,// �û���
				IN_pPassword,// ����
				IN_pZoneID,// ��������
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pStatus);// ����״̬
		if (nConnectID < 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, Integer.parseInt(OUT_pStatus
					.toString().trim()), 124, errInfo);
			System.out.println("���ӷ���������:" + errInfo);
			return;
		}
		System.out.println("���ӳɹ������(" + nConnectID + ")");

		System.out.println("����MO��Ϣ************************");
		StringBuffer OUT_Flag = new StringBuffer();
		StringBuffer OUT_pStat = new StringBuffer();
		StringBuffer OUT_pSrcTerminalID = new StringBuffer();
		StringBuffer OUT_pDestTerminalID = new StringBuffer();
		StringBuffer OUT_MsgID = new StringBuffer();
		StringBuffer OUT_pBuffer = new StringBuffer();

		nRet = smep_clnt.SMEP_GetRereport(nConnectID,// ���Ӿ��
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_Flag,// �ɹ��Ļ�������MO��״̬��0 �㲥��1 ״̬���棻2 ��·���ԣ�3 ������Ҫ��Ͽ�
				OUT_pStat,// �ɹ��Ļ������ OUT_Flag==1������״̬�����״̬��0 �ɹ�������ʧ��
				OUT_pSrcTerminalID,// �ɹ��Ļ�������Դ�ն˺���
				OUT_pDestTerminalID,// �ɹ��Ļ�������Ŀ���ն˺���
				OUT_MsgID,// �ɹ��Ļ�������MsgID
				OUT_pBuffer);// �ɹ��Ļ������ص㲥����

		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("��MO��Ϣ����:" + errInfo);
		} else {
			switch (Integer.parseInt(OUT_Flag.toString())) {
			case 0:
				System.out.println("�յ��㲥��Ϣ:Դ�ն˺���-" + OUT_pSrcTerminalID
						+ "Ŀ���ն˺���-" + OUT_pDestTerminalID + "MO��Ϣ��ʶ-"
						+ OUT_MsgID + "��Ϣ����-" + OUT_pBuffer);
				break;
			case 1:
				System.out.println("�յ�״̬����:Ŀ���ն˺���-" + OUT_pDestTerminalID
						+ "��Ϣ��ʶ-" + OUT_MsgID + "״̬-" + OUT_pStat);
				break;
			case 2:
				System.out.println("�յ���·����!");
				break;
			case 3:
				System.out.println("�������ر�����");
				break;
			default:
				System.out.println("����MO");
			}
		}

		System.out.println("�Ͽ�����*******************");
		smep_clnt.SMEP_Disconnection(nConnectID);
	}
	
	
	/**
	 * ���Ž���
	 */
	public List CmppDeliver()
	{
		List Result =new ArrayList();
		int nRet = -1; //�����ķ���ֵ
		int IN_ConnectType = 1;
		StringBuffer OUT_pStatus = new StringBuffer();
		int nConnectID;
		int IN_ServerType = 1;//Ҫ��ѯ�ķ���������(0-MT,1-MO)
		
		StringBuffer OUT_pServerIP = new StringBuffer(); // ���ڷ��ؿ����ӵķ�����IP��ַ
		StringBuffer OUT_pPort = new StringBuffer();     // ���ڷ��ؿ����ӵķ������˿�
		
		
		SMEPClient smep_clnt = new SMEPClient();

		System.out.println("��ȡ���е� MO ��������ַ*******************");
		nRet = smep_clnt.SMEP_GetServer(IN_pQueryIP,//��ѯ������IP��ַ
				IN_QueryPort,//��ѯ�������˿�
				IN_ProxyType,//��������(0-�޴���,1-Socks4����,2-Socks5����)
				IN_pProxyIP,//����IP
				IN_ProxyPort,//����˿�
				IN_ProxyAuth,//������֤��־(0-����֤,1-��֤)
				IN_pProxyUserID,//�����û���
				IN_pProxyPassword,//��������
				IN_ConnectType,//Ҫ��ȡ������������(0 MT, 1 MO)
				IN_pECode,//��ҵ�̺�
				IN_pUserName,//�û���
				IN_pPassword,//����
				IN_pZoneID,// ��������
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pServerIP,// ��ѯ���ķ�������IP��ַ
				OUT_pPort);// ��ѯ���ķ������Ķ˿�

		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			if (log.isDebugEnabled())
				log.debug("��ȡ���� MO ������ʧ��:" + errInfo);
			return Result;
		}
		
		if (log.isDebugEnabled())
			log.debug("����MO������:" + OUT_pServerIP.toString() + ":"
					+ Integer.parseInt(OUT_pPort.toString()));
		//===================================================================
		nConnectID = smep_clnt.SMEP_Connect(OUT_pServerIP.toString(),//������IP��ַ
				Integer.parseInt(OUT_pPort.toString()),//�������˿�
				IN_ProxyType,//��������
				IN_pProxyIP,// ����IP��ַ
				IN_ProxyPort,// ����˿�
				IN_ProxyAuth,//�Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ)
				IN_pProxyUserID,// �����û���
				IN_pProxyPassword,// ��������
				IN_ConnectType,// ���ӷ�ʽ��0 MT, 1 MO
				IN_pECode,// ��ҵ�̺�
				IN_pUserName,// �û���
				IN_pPassword,// ����
				IN_pZoneID,// ��������
				IN_OverTime,// ��ʱ��ʱ�䣨�룩
				OUT_pStatus);// ����״̬
		if (nConnectID < 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, Integer.parseInt(OUT_pStatus
					.toString().trim()), 124, errInfo);
			if (log.isDebugEnabled())
				log.debug("���ӷ���������:" + errInfo);
			return Result;
		}

		if (log.isDebugEnabled())
			log.debug("���ӳɹ������(" + nConnectID + ")");
		
		System.out.println("����MO��Ϣ************************");
		StringBuffer OUT_Flag = new StringBuffer();
		StringBuffer OUT_pStat = new StringBuffer();
		StringBuffer OUT_pSrcTerminalID = new StringBuffer();
		StringBuffer OUT_pDestTerminalID = new StringBuffer();
		StringBuffer OUT_MsgID = new StringBuffer();
		StringBuffer OUT_pBuffer = new StringBuffer();

		nRet = smep_clnt.SMEP_GetRereport(nConnectID,// ���Ӿ��
				IN_OverTime,			// ��ʱ��ʱ�䣨�룩
				OUT_Flag,				// �ɹ��Ļ�������MO��״̬��0 �㲥��1 ״̬���棻2 ��·���ԣ�3 ������Ҫ��Ͽ�
				OUT_pStat,				// �ɹ��Ļ������ OUT_Flag==1������״̬�����״̬��0 �ɹ�������ʧ��
				OUT_pSrcTerminalID,		// �ɹ��Ļ�������Դ�ն˺���
				OUT_pDestTerminalID,	// �ɹ��Ļ�������Ŀ���ն˺���
				OUT_MsgID,				// �ɹ��Ļ�������MsgID
				OUT_pBuffer);			// �ɹ��Ļ������ص㲥����

		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			if (log.isDebugEnabled())
				log.debug("��MO��Ϣ����:" + errInfo);
		} else {
			switch (Integer.parseInt(OUT_Flag.toString())) {
			case 0:
				if (log.isDebugEnabled())
					log.debug("�յ��㲥��Ϣ:Դ�ն˺���-" + OUT_pSrcTerminalID
							+ "Ŀ���ն˺���-" + OUT_pDestTerminalID + "MO��Ϣ��ʶ-"
							+ OUT_MsgID + "��Ϣ����-" + OUT_pBuffer);
				Result.add(OUT_pSrcTerminalID);
				Result.add(OUT_pDestTerminalID);
				Result.add(OUT_MsgID);
				Result.add(OUT_pBuffer);
				break;
			case 1:
				if (log.isDebugEnabled())
					log.debug("�յ�״̬����:Ŀ���ն˺���-" + OUT_pDestTerminalID
							+ "��Ϣ��ʶ-" + OUT_MsgID + "״̬-" + OUT_pStat);
				break;
			case 2:
				if (log.isDebugEnabled())
					log.debug("�յ���·����!");
				break;
			case 3:
				if (log.isDebugEnabled())
					log.debug("�������ر�����");
				break;
			default:
				if (log.isDebugEnabled())
					log.debug("����MO");
			}
		}
		System.out.println("�Ͽ�����*******************");
		smep_clnt.SMEP_Disconnection(nConnectID);
		return Result;
	}
	
	public static void main(String[] args)
	{
		Cmpp2ApiBack api=new Cmpp2ApiBack();
		api.CmppSend();
		//api.CmppSend();
	}
}
