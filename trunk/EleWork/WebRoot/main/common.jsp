
<%--
  main/common.jsp
  ����:Ȩ����֤-����ģ��
  ����:qsy
  ��������:2005-04-28
  �޸�����:2005-04-28
--%>
<%@include file="../config.jsp"%>
<%
  // �ж��Ƿ��е�½
  if (session.getAttribute("userInfo") == null) {
    /*
       // ��֯���汣��.
     response.setHeader("Cache-Control","no-store"); //HTTP 1.1
     response.setHeader("Pragma","no-cache"); //HTTP 1.0
     response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
     */
%>
<!-- ��λ��û�е�½��ҳ��-->
<html>
<head>
<script language="JavaScript" type="text/JavaScript">
     parent.location="../m_system/nologin.faces";

      </script>
</head>
</html>
<%
  // �ύresponse,��ֹ�쳣
  return;
  }
%>
