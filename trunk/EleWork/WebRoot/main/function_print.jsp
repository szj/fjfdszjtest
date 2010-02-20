<!--
  m_storage/inStorage.jsp
  ����:��⴦��-����ģ��
  ����:qsy
  ��������:2005-04-28
  �޸�����:2005-04-28
-->
<%@include file="../main/common.jsp"%>
<%@page contentType="text/html; charset=GB2312" import="net.sf.jasperreports.engine.export.*,net.sf.jasperreports.engine.util.*,net.sf.jasperreports.engine.*,YzSystem.J_System.*,YzSystem.JMain.*,java.io.*,java.util.*" errorPage="../main/error.faces"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%
FrmFunction frmFunction=(FrmFunction) UtilWebTools.getValueBinding("frmFunction");
FrmFunctionBase frmFunctionBase = frmFunction.getFunctionBase();
%>
<%
  String sSysPath = "EleWork";
  String ReportName="";
  ReportName=UtilWebTools.getRequestParameter("ReportName");
  File reportFile = new File(sSysPath + File.separator + "rpt" + File.separator + ReportName);
  Map parameters = new HashMap();
  parameters.put("baiji", "c1");
  parameters.put("PDATE",UtilCommon.getDate("��ӡ����:yyyy��MM��dd��HH:mm"));
  UtilDB utilDB = frmFunctionBase.genDBQueryResult();
  response.reset();
  response.setContentType("application/pdf");
  byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, new JRResultSetDataSource(utilDB.myRs));
  response.setContentType("application/pdf");
  response.setHeader("Content-Disposition", "inline;filename=somepdf.pdf");
  response.setContentLength(bytes.length);
  ServletOutputStream ouputStream = response.getOutputStream();
  ouputStream.write(bytes, 0, bytes.length);
  ouputStream.flush();
  ouputStream.close();
  utilDB.closeCon();
%>
