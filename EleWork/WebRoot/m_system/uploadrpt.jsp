
<!--
  m_sys/logManage.jsp
  ����:��־����-����ģ��
  ����:qsy
  ��������:2005-04-28
  �޸�����:2005-04-28
-->
<%@include file="../main/common.jsp"%>
<%@page contentType="text/html; charset=GB2312" import="YzSystem.J_System.*,YzSystem.JMain.*"  errorPage="../main/error.faces"%>
<%
//  ��ԭ����ҳ����,��ֹ����.
//  response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
//  response.setHeader("Pragma", "no-cache"); //HTTP 1.0
//  response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<html>
<head>
<title>
"�����ļ��ϴ�"
</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="../inc/public.js" type="text/JavaScript"></script><script language="javascript"  type="text/JavaScript">
</script><link rel="stylesheet" href="../css/mm.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="uploadform" method="POST" action="saverpt.jsp" ENCTYPE="multipart/form-data">
  <table width="100%" border="0" cellspacing="10" cellpadding="0">
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="btd3">
<tr><td width="100%" colspan="2" >
 �ļ�1��<input name="file1" size="40" type="file" >
 </td></tr>
 <tr><td width="100%" colspan="2">
 �ļ�2��<input name="file2" size="40" type="file">
 </td></tr>
 <tr><td width="100%" colspan="2">
 �ļ�3��<input name="file3" size="40" type="file">
 </td></tr>
        </table>
      </td>
    </tr>
  </table>
  <table>
 <tr><td align="center"><input name="upload" type="submit" value="��ʼ�ϴ�"/></td></tr>
 </table>

  <input type="hidden" name="hWhich" value="">
</form>
</body>
</html>

