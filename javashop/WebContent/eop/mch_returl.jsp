<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
 
<%@ page import="com.tenpay.util.TenpayUtil" %>
<%@ page import="com.tenpay.MediPayResponseHandler"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

//---------------------------------------------------------
//�Ƹ�ͨ�н鵣��֧��Ӧ�𣨴���ص���ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------

//ƽ̨����Կ
String key = "123456";

//����MediPayResponseHandlerʵ��
MediPayResponseHandler resHandler = new MediPayResponseHandler(request, response);

resHandler.setKey(key);

//�ж�ǩ��
if(resHandler.isTenpaySign()) {
	//���׵���
	String cft_tid = resHandler.getParameter("cft_tid");
	
	//�����,�Է�Ϊ��λ
	String total_fee = resHandler.getParameter("total_fee");
	
	//֧�����
	String retcode = resHandler.getParameter("retcode");
	
	//״̬��
	String status = resHandler.getParameter("status");
	
	if( "0".equals(retcode) ) {
		//------------------------------
		//����ҵ��ʼ
		//------------------------------ 
		
		//ע�⽻�׵���Ҫ�ظ�����
		//ע���жϷ��ؽ��
		
		int iStatus = TenpayUtil.toInt(status);
		switch(iStatus) {
			case 1:		//���״���
				
				break;
			case 2:		//�ջ��ַ��д���
			
				break;
			case 3:		//��Ҹ���ɹ���ע���ж϶����Ƿ��ظ����߼�
			
				break;
			case 4:		//���ҷ����ɹ�
			
				break;
			case 5:		//����ջ�ȷ�ϣ����׳ɹ�
				
				break;
			case 6:		//���׹رգ�δ��ɳ�ʱ�ر�
			
				break;
			case 7:		//�޸Ľ��׼۸�ɹ�
			
				break;
			case 8:		//��ҷ����˿�
			
				break;
			case 9:		//�˿�ɹ�
			
				break;
			case 10:	//�˿�ر�
			
				break;
			default:
				//nothing to do
			
		}
		
		//------------------------------
		//����ҵ�����
		//------------------------------
			
		//����doShow, ��ӡmetaֵ,���߲Ƹ�ͨ����ɹ�.
		resHandler.doShow();
	} else {
		//�������ɹ�����
		out.println("֧��ʧ��");
	}
	
} else {
	out.println("��֤ǩ��ʧ��");
	//String debugInfo = resHandler.getDebugInfo();
	//System.out.println("debugInfo:" + debugInfo);
}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>�Ƹ�֧ͨ���ص�����</title>
</head>
<body>

</body>
</html>