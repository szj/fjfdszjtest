<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/msexcel;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%response.setHeader("Content-disposition","inline; filename=peccancyQuery.xls");%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	�ۺϱ��� -�� Υ�²�ѯ
 -->
<ww:action name="'select'" id="select"></ww:action>

<body>
	<ww:property value="table"/>
</body>