<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.qzgf.NetStore.pub.WebEndServiceLocator"%>
<%@page import="com.qzgf.NetStore.dao.ICommonDAO"%>
<%@page import="com.cownew.ctk.common.StringUtils"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<!-- ÿ��60��ˢ��һ�� -->
		<meta http-equiv="refresh" content="60">
		<title>HeartBeat</title>
	</head>
	<body>
		<%
			ICommonDAO cd = (ICommonDAO) WebEndServiceLocator.getService(
					request, ICommonDAO.class);
			try {
				cd.nop();
			} catch (Throwable t) {
				//������������ͣ
				out.println(StringUtils.stackToString(t));
			}
		%>
	</body>
</html>
