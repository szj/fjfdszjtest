<!--
main/main.jsp
����:��ҳ��
����:qsy
��������:2005-04-28
�޸�����:2005-04-28
-->
<%@include file="common.jsp"%>
<%@page contentType="text/html; charset=GB2312"%>
<%@page import="YzSystem.JMain.*,YzSystem.J_System.*,java.util.*"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<script> 
<!-- 
window.defaultStatus="�ڷ��Ƽ� 2008"; 
//--> 
</script>
<html>
<head>
<title><%=SystemTitle%></title>
<%
  // ȡ���׸����ף���Ϊȱʡ������ʾ��mainframe�С�
  String firstFunctionSeqn="";
  BeanSystemFunctionCode afunction=UtilWebTools.getTradeInfoBySeqn("0");
  if (afunction.getChildSystemFunctionCode()!=null){
     ArrayList trades=afunction.getChildSystemFunctionCode();
     Iterator itx=trades.iterator();
     if (itx.hasNext()){
       firstFunctionSeqn=((BeanSystemFunctionCode)itx.next()).getTheCode();
     }
  }
%>
</head>
<frameset rows="75,*" frameborder="NO" border="0" framespacing="0" TOPMARGIN="0" LEFTMARGIN="0" MARGINHEIGHT="0" MARGINWIDTH="0">
  <frame
    name="topFrame"
    scrolling="no"
    noresize="noresize"
    src="<%=SystemURL%>main/top.faces"
    border="0"
    frameborder="no"
    TOPMARGIN="0"
    LEFTMARGIN="0"
    MARGINHEIGHT="0"
    MARGINWIDTH="0">
  <frameset cols="150,9,*" id="framsetmain" border="1" frameborder="1" FRAMESPACING="2" TOPMARGIN="0" LEFTMARGIN="0" MARGINHEIGHT="0" MARGINWIDTH="0" BORDERCOLOR="#78A327">
    <frame
      name="leftFrame"
      scrolling="auto"
      src="<%=SystemURL%>main/left.faces?tseqn=<%=firstFunctionSeqn%>"
      frameborder="NO"
      border="0"
      framespacing="0"
      TOPMARGIN="0"
      LEFTMARGIN="0"
      MARGINHEIGHT="0"
      MARGINWIDTH="0"
      noresize="noresize">
    <frame name="switchFrame"  scrolling="no" noresize="noresize" src="<%=SystemURL%>main/menuSwitch.faces" border="0" frameborder="no" TOPMARGIN="0" LEFTMARGIN="0" MARGINHEIGHT="0"  MARGINWIDTH="0"> 
    <frame name="mainFrame" src="<%=SystemURL%>main/blank.faces" border="0" frameborder="no" TOPMARGIN="0" LEFTMARGIN="0" MARGINHEIGHT="0" MARGINWIDTH="0">
  </frameset>
</frameset>
<noframes>
<body bgcolor="#FFFFFF"></body>
</noframes>
</html>
