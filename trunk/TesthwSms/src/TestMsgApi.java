

import java.util.ArrayList;

import SMEPClient.SMEPClient;

public class TestMsgApi {

	// ��ѯ���з�����
	//	  public int SMEP_GetServer(
	//	    String IN_pServerIP,
	//	    int   IN_ServerPort,
	//	    int IN_ProxyType,	
	//	    String IN_pProxyIP, 
	//	    int IN_ProxyPort, 
	//	    int IN_ProxyAuth, 
	//	    String IN_pProxyUserID,
	//	    String IN_pProxyPassword,
	//	    int   IN_ServerType, 
	//	    String IN_pECode,
	//	    String IN_pUserName, 
	//	    String IN_pPassword,
	//	    String IN_pZoneID, 
	//	    int  IN_OverTime, 
	//	    StringBuffer  OUT_pServerIP,
	//	    StringBuffer  OUT_pPort
	//	  )
	//
	//	// ��ѯ��ʷ��¼
	//	  public int SMEP_QueryHistory(
	//	    String IN_pServerIP, 
	//	    int   IN_ServerPort, 
	//	    int IN_ProxyType,	
	//	    String IN_pProxyIP,
	//	    int IN_ProxyPort,	
	//	    int IN_ProxyAuth,	
	//	    String IN_pProxyUserID,	
	//	    String IN_pProxyPassword,	
	//	    String IN_pECode,
	//	    String IN_pUserName,
	//	    String IN_pPassword, 
	//	    String IN_pZoneID, 
	//	    String IN_YearMonth,
	//	    StringBuffer OUT_MTNum,
	//	    StringBuffer OUT_MONum, 
	//	    int  IN_OverTime) 
	//
	//	// ��ѯMT����״̬
	//	  public int SMEP_QueryReport(
	//	    String IN_pServerIP,
	//	    int   IN_ServerPort,
	//	    int IN_ProxyType,	 
	//	    String IN_pProxyIP,
	//	    int IN_ProxyPort,	
	//	    int IN_ProxyAuth,	
	//	    String IN_pProxyUserID,
	//	    String IN_pProxyPassword,	
	//	    String IN_pECode,      
	//	    String IN_pUserName,  
	//	    String IN_pPassword,  
	//	    String IN_pZoneID,  
	//	    String IN_MsgID, 
	//	    String IN_DestTermID, 
	//	    String IN_YearMonth,
	//	    int  IN_OverTime)
	//
	//	// �޸��û�����
	//	  public int SMEP_EditPW(
	//	    String IN_pServerIP,
	//	    int   IN_ServerPort, 
	//	    int IN_ProxyType,	 
	//	    String IN_pProxyIP, 
	//	    int IN_ProxyPort,	
	//	    int IN_ProxyAuth,	
	//	    String IN_pProxyUserID,
	//	    String IN_pProxyPassword,	
	//	    String IN_pECode, 
	//	    String IN_pUserName,
	//	    String IN_pPassword, 
	//	    String IN_pZoneID, 
	//	    String IN_NewPW1,
	//	    String IN_NewPW2,
	//	    int  IN_OverTime 
	//	  )
	//
	//
	//	//���ӷ�����
	//	  public int SMEP_Connect(
	//	    String IN_pServerIP,	
	//	    int  IN_Port, 
	//	    int IN_ProxyType,	
	//	    String IN_pProxyIP,
	//	    int IN_ProxyPort,	
	//	    int IN_ProxyAuth,	
	//	    String IN_pProxyUserID,	
	//	    String IN_pProxyPassword,	
	//	    int  IN_ConnectType, 
	//	    String IN_pECode, 
	//	    String IN_pUserName,
	//	    String IN_pPassword, 
	//	    String IN_pZoneID, 
	//	    int  IN_OverTime, 
	//	    StringBuffer  OUT_pStatus
	//	    )
	//
	//
	//	// �Ͽ��������������
	//	  public void SMEP_Disconnection(
	//	      int IN_ConnectID) 
	//
	//	// MT ����·����
	//	  public int SMEP_Active_Test(
	//	      int IN_ConnectID, 
	//	      int  IN_OverTime)
	//
	//	// �ύ����
	//	  public int SMEP_Submit(
	//	    int  IN_ConnectID, 
	//	    int   IN_Msg_Level,
	//	    int   IN_ReportFlag,
	//	    int   IN_MTFlag,
	//	    String IN_MOMsgID,
	//	    String IN_AtTime,
	//	    String  IN_Src_Terminal_ID, 
	//	    int   IN_DestCount, 
	//	    ArrayList  Dest_Terminal_ID, 
	//	    int   IN_Msg_Fotmat, 
	//	    String IN_pMsg_Content, 
	//	    int  IN_OverTime, 
	//	    StringBuffer OUT_pMsgID 
	//	  )
	//
	//	// ��ȡ MO ��Ϣ
	//	  public int SMEP_GetRereport(
	//	      int  IN_ConnectID, 
	//	      int  IN_OverTime, 
	//	      StringBuffer  OUT_Flag, 
	//	      StringBuffer  OUT_pStat, 
	//	      StringBuffer  OUT_pSrcTerminalID, 
	//	      StringBuffer  OUT_pDestTerminalID, 
	//	      StringBuffer  OUT_MsgID, 
	//	      StringBuffer  OUT_pBuffer
	//	      )
	//
	//	// ��ȡ�������ļ򵥽���
	//	  public void SMEP_GetErrorInfo(
	//	    int  IN_ErrorType, 
	//	int  IN_ErrorCode,
	//	int  IN_BufferLen, 
	//	StringBuffer OUT_Buffer) 

	//===============================================
	// ��ѯ����������ʾ��
	//===============================================
	public void Service() {
		String IN_pServerIP = "10.57.0.158";
		int IN_ServerPort = 6000;
		int IN_ServerType = 0;
		String IN_pECode = "00001";
		String IN_pUserName = "123456";
		String IN_pPassword = "1111";
		String IN_pZoneID = "0571";
		int IN_OverTime = 10;
		StringBuffer OUT_pServerIP = new StringBuffer();
		StringBuffer OUT_pPort = new StringBuffer();
		int IN_ProxyType = 0;
		String IN_pProxyIP = "";
		int IN_ProxyPort = 0;
		int IN_ProxyAuth = 0;
		String IN_pProxyUserID = "";
		String IN_pProxyPassword = "";
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
				OUT_pServerIP, // ���ڷ��ؿ����ӵķ�����IP��ַ
				OUT_pPort); // ���ڷ��ؿ����ӵķ������˿�
		if (nRet != 0) {
			StringBuffer errInfo = new StringBuffer(125);
			smep_clnt.SMEP_GetErrorInfo(2, nRet, 124, errInfo);
			System.out.println("��ȡ���� MT ������ʧ��:" + errInfo);
			return;
		}
		System.out.println("��ȡ���� MT �������ɹ�,���з�������Ϣ:" + OUT_pServerIP + ":"
				+ OUT_pPort);
//===========================================================================================
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
		//===========================================================================================
		nRet = smep_clnt.SMEP_GetServer(IN_pServerIP, // ������ IP
				IN_ServerPort, // �������˿�
				IN_ProxyType, // ��������(0-�޴���1-Socks4����2-Socks5����)
				IN_pProxyIP, // ����IP��ַ
				IN_ProxyPort, // ����˿�
				IN_ProxyAuth, //�Ƿ�����û�������У�飨0-����Ҫ��1-��Ҫ)
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
		//===========================================================================================
		System.out.println("�޸�����*******************");
		String IN_NewPW1 = "newPass";
		String IN_NewPW2 = "newPass";

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
//====================================================================================
		System.out.println("��ѯ��ʷ��¼*******************");
		String IN_YearMonth = "200303";
		StringBuffer OUT_MTNum = new StringBuffer();
		StringBuffer OUT_MONum = new StringBuffer();
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
//===========================================================================================
		System.out.println("��ѯMT����״̬*******************");
		String IN_MsgID = "00000000000000000000000004115939";
		String IN_DestTermID = "13906096008";
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
	public void MTExample() {
		int nRet = -1; //�����ķ���ֵ
		String IN_pQueryIP = "10.57.0.158";//��ѯ������IP��ַ
		int IN_QueryPort = 6000;//��ѯ�������˿�
		int IN_ConnectType = 0;//Ҫ��ȡ������������(0 MT, 1 MO)
		String IN_pECode = "00001";//��ҵ�̺�
		String IN_pUserName = "123456";//�û���
		String IN_pPassword = "1111";//����
		String IN_pZoneID = "0571";// ��������
		int IN_OverTime = 10;// ��ʱ��ʱ�䣨�룩
		StringBuffer OUT_pStatus = new StringBuffer();
		int nConnectID;
		int IN_ProxyType = 0;//��������(0-�޴���,1-Socks4����,2-Socks5����)
		String IN_pProxyIP = "192.168.0.1";//����IP
		int IN_ProxyPort = 1080;//����˿�
		int IN_ProxyAuth = 0;//������֤��־(0-����֤,1-��֤)
		String IN_pProxyUserID = "";//�����û���
		String IN_pProxyPassword = "";//��������
		int IN_ServerType = 0;//Ҫ��ѯ�ķ���������(0-MT,1-MO)
		StringBuffer OUT_pServerIP = new StringBuffer();// ��ѯ���ķ�������IP��ַ
		StringBuffer OUT_pPort = new StringBuffer();// ��ѯ���ķ������Ķ˿�

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

		int IN_Msg_Level = 0; // ��Ϣ����
		int IN_ReportFlag = 1;
		int IN_MTFlag = 0;
		String IN_MOMsgID = "";
		String IN_AtTime = "";
		String IN_Src_Terminal_ID = "1234";
		int IN_DestCount = 3;
		ArrayList Dest_Terminal_ID = new ArrayList();
		Dest_Terminal_ID.add(0, "13805710001");
		Dest_Terminal_ID.add(1, "13805710002");
		Dest_Terminal_ID.add(2, "13805710003");

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

	//===============================================
	// MO ����������ʾ��
	//===============================================
	public void MOExample() {
		int nRet = -1; //�����ķ���ֵ
		String IN_pQueryIP = "10.57.0.158";//��ѯ������IP��ַ
		int IN_QueryPort = 6000;//��ѯ�������˿�
		int IN_ConnectType = 1;
		String IN_pECode = "00001";//��ҵ�̺�
		String IN_pUserName = "123456";//�û���
		String IN_pPassword = "1111";//����
		String IN_pZoneID = "0571";// ��������
		int IN_OverTime = 10;// ��ʱ��ʱ�䣨�룩
		StringBuffer OUT_pStatus = new StringBuffer();
		int nConnectID;
		int IN_ProxyType = 0;//��������(0-�޴���,1-Socks4����,2-Socks5����)
		String IN_pProxyIP = "192.168.0.1";//����IP
		int IN_ProxyPort = 1080;//����˿�
		int IN_ProxyAuth = 0;//������֤��־(0-����֤,1-��֤)
		String IN_pProxyUserID = "";//�����û���
		String IN_pProxyPassword = "";//��������
		int IN_ServerType = 1;//Ҫ��ѯ�ķ���������(0-MT,1-MO)
		StringBuffer OUT_pServerIP = new StringBuffer();// ��ѯ���ķ�������IP��ַ
		StringBuffer OUT_pPort = new StringBuffer();// ��ѯ���ķ������Ķ˿�

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
}
