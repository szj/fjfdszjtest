<!--
config.jsp
����:�����ļ�
����:qsy
��������:2005-04-28
�޸�����:2005-04-28
--------------------------
�޸�����:2008-05-28 szj
-->
<%@page contentType="text/html; charset=GB2312" %>
<%
	/* ȫ��session �����������£���������;���뼰ʱ�����:
	 *----------------------------------------------------------------------------
	 * SystemURL        webϵͳURL
	 * UseRemoteEJB     �Ƿ�ʹ��Զ��EJB(EJB��������web����������ͬһ̨����)
	 * EJBURL           ʹ��Զ��EJBʱ�򣬱���ָ����URL
	 * utilEJB2Local    EJB���õ����ص��õĽӿڶ���
	 * context          ʹ�õ�EJB naming�ռ�������
	 * userTrades       �û���Ȩ�޵����ν����б�
	 * userInfo         �û���Ϣ
	 */
	String SystemURL = "http://" + request.getHeader("host")
			+ "/EleWork/";
	String SystemTitle = "�ڷ����ӹ���ϵͳ";
	String RowCount = "10";
	String DetailEditRow = "3";
%>

