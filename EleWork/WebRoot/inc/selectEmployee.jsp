<%/*
inc/selectProject.jsp
����:������Ŀ
����:qsy
��������:2005-04-28
�޸�����:2005-04-28
*/%>
<%@include file="../main/common.jsp"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@page contentType="text/html; charset=GB2312" import="YzSystem.JMain.*"%>
<%@page errorPage="../main/error.faces"%>
<%
	// ��ʼ��������
FrmFunctionBase frmFunctionBase = (FrmSelectEmployee) UtilWebTools.getValueBinding("frmSelectEmployee");
%>
<script language="javascript" for="document" event="onkeydown">

<!--

  if(event.keyCode==13 && event.srcElement.type!='href' && event.srcElement.type!='button' && event.srcElement.type!='submit' && event.srcElement.type!='reset' && event.srcElement.type!='textarea' && event.srcElement.type!='')
  {
    if (event.srcElement.name=='EmployeeCode')
    {
      doFind();
    }
    else
    {
      event.keyCode=9;
    }
  }

-->

</script>


<%@include file="../main/findBase.jsp"%>
