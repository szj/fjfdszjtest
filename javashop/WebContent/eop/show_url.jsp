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
		
		if("3".equals(status)) {
			
			out.println("֧���ɹ�");
		} else {
			//֧��ʧ��
			out.println("֧��ʧ��");
		}
		
		//------------------------------
		//����ҵ�����
		//------------------------------
		
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