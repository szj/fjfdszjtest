
<!--
  m_sys/nologin.jsp
  ����:δ��½����
  ����:qsy
  ��������:2005-04-28
  �޸�����:2005-04-28
-->
<%@page contentType="text/html; charset=GB2312" import="java.io.*"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/mm.css" type="text/css">
<script language="JavaScript" type="text/JavaScript">
����������// ���µ�½
	function relogin() {
          window.location="../m_system/login.faces";

	}
</script>
</head>
<BODY oncontextmenu=self.event.returnValue=false>
<table width="100%" border="0" height="100%">
  <tr align="center">
    <td>
    <form method="post" action="" name="theform">
      <table border="1" bordercolorlight="000000" bordercolordark="FFFFFF" cellspacing="0" class="btd">
        <tr>
          <td>
            <table width="100%" border="0" class="btd3" cellspacing="0" cellpadding="2">
              <tr align="right">
                <td width="90%" align="left">δ��½</td>
                <td width="10%">
                  <table border="1" class="btd2" bordercolorlight="666666" bordercolordark="FFFFFF" cellpadding="0" cellspacing="0" width="18">
                    <tr>
                      <td width="16">
                        <b>
                          <font color="000000">��</font>
                        </b>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <table border="0" width="350" cellpadding="4">
              <tr>
                <td width="59" align="center" valign="top">&nbsp;</td>
                <td width="269">
                  <font color="red">���ӳ�ʱ���������Ѿ�ǩ�ˣ������µ�½ϵͳ!</font>
                </td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="top">
                  <input type="button" name="ok" value="�����µ�½��" onclick="javascript:relogin();">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </form>
    </td>
  </tr>
</table>
</body>
</html>

