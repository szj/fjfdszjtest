<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Ŀ¼</title>
   
  </head>
  
  <body>
    <div align="center">
        <a href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/register.jsp">�û�ע��</a>
        <hr>
    	<h2>��������</h2>
    	<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=listPayType" >������ѯ</a><br>
    	<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=listOrderByStatus&orderStatus=2">
    	�ȴ������</a><br>
    	<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=listOrderByStatus&orderStatus=3">
    	�����������</a><br>
    	<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=listOrderByStatus&orderStatus=4">
    	�ȴ���������</a><br>
    	<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=listOrderByStatus&orderStatus=5">
    	�Ѿ���������</a><br>
    	<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=listOrderByStatus&orderStatus=6">
    	�Ѿ��ջ�����</a><br>
    	<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=listOrderByStatus&orderStatus=7">
    	��ȡ������</a><br>
    	<hr>
    	<h2>�ҵ��˻�</h2>
    	<a href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do?status=queryOrderByCondition">������Ϣ</a>
    	
    	<hr>
    	<h2>ά��</h2>
    	<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/sendMode.do?status=querySendMode">���ͷ�ʽ</a><br>
    	<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/payType.do?status=queryPayType">֧����ʽ</a>
    	<hr>
        <h2>��ҳ���Ź���</h2>
        <a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do?status=queryGroupByApplicationType&applicationType=1">�������</a>
        <a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do?status=queryAllNews">��ҳ���Ź���</a>
        <a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/addNews.jsp">�������</a>
        <h2>ע����Լ����</h2>
        <a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/treaty.do?status=queryTreaty">ע����Լά��</a>
        <h2>�������̹���</h2>
        <a href="http://localhost:8080/NetStore/JspForm/BackfuncModual/manufacturer.do?status=queryAllManufacturers">�������̹���</a>
        <h2>������Ա</h2>
        <a href="http://localhost:8080/NetStore/JspForm/BackfuncModual/manager.do?status=queryManagers">����Ա�б�</a>
        <a></a>
        <h2>�������</h2>
        <a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/bulletin.do?status=queryBulletin">�������</a>
    </div>
  </body>
</html>
