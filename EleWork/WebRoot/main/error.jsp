
<!--
  main/error.jsp
  ����:������
  ����:qsy
  ��������:2005-04-28
  �޸�����:2005-04-28
-->
<%@page contentType="text/html; charset=GB2312" isErrorPage="true"%>
<%@page import="java.io.*,YzSystem.JMain.*,java.util.*,YzSystem.J_System.*"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/mm.css" type="text/css">
</head><BODY oncontextmenu=self.event.returnValue=false>
<table width="100%" border="0" height="100%">
  <tr align="center">
    <td>
    <form method="post" action="" name="forms[0]">
      <table border="1" bordercolorlight="000000" bordercolordark="FFFFFF" cellspacing="0" class="btd">
        <tr>
          <td>
            <table width="100%" border="0" class="btd3" cellspacing="0" cellpadding="2">
              <tr align="right">
                <td width="90%" align="left">�쳣��Ϣ</td>
                <td width="10%">
                  <table border="1" class="btd2" bordercolorlight="666666" bordercolordark="FFFFFF" cellpadding="0" cellspacing="0" width="18">
                    <tr>
                      <td width="16">
                        <b>
                          <a href="javascript:history.go(-1)" onMouseOver="window.status='';return true" onMouseOut="window.status='';return true" title="�ر�">
                            <font color="000000">��</font>
                          </a>
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
                <%
                  String errorInfo = "";
                  // servlet�쳣����
                  if (exception != null) {
                    // if ((exception.getMessage() != null) && (!(exception.getMessage().equals("")))) {
                    // ��ϵͳ�쳣����
                    out.println("<P> ϵͳ����"+exception.getClass()+"�쳣������ϵά����Ա! </P>");
                    if (wlglException.class.isInstance(exception)) {
                      errorInfo = "�쳣Ϊyzapprove�쳣!��ջΪ:<br>" + exception.getMessage();
                    }
                    // ����servlet�쳣����
                    else {
                      StringWriter sw = new StringWriter();
                      PrintWriter ps = new PrintWriter(sw, true);
                      exception.printStackTrace(ps);
                      //                    out.println("<P>" + sw.getBuffer() + "</P>");
                      errorInfo = "�쳣Ϊ�����쳣!��ջΪ:<br>" + sw.getBuffer();
                    }
                  }
                  // webҳ�������
                  else {
                    Integer errorcode = (Integer) request.getAttribute("javax.servlet.error.status_code");
                    if (errorcode.intValue() == 404) {
                      out.println("�����ʵ�ҳ�治���ڣ���ȷ�������url��ȷ!</br>");
                      // errorInfo = "�����ʵ�ҳ�治���ڣ���ȷ�������url��ȷ!";
                    }
                    else {
                      out.println("<p>�����룺" + request.getAttribute("javax.servlet.error.status_code") + "<br>");
                      out.println("<p>ѶϢ��" + request.getAttribute("javax.servlet.error.message") + "<br>");
                      out.println("<p>���⣺" + request.getAttribute("javax.servlet.error.exception_type") + "<br>");
                      errorInfo = "�����룺" + request.getAttribute("javax.servlet.error.status_code") + "\n"
                          + "ѶϢ��" + request.getAttribute("javax.servlet.error.message") + "\n"
                          + "���⣺" + request.getAttribute("javax.servlet.error.exception_type");
                    }
                  }
                  // д�ļ�
                  if (!errorInfo.equals("")) {
                    String sSysPath="EleWork";
                    File sysd = new File(sSysPath); //��������SubĿ¼��File���󣬲��õ�����һ������
                    if (!sysd.exists()) { //���SubĿ¼�Ƿ����
                      sysd.mkdir(); //����SubĿ¼
                      System.out.println(sSysPath + "Ŀ¼�����ڣ��ѽ���!");
                    }

                    String sPath = sSysPath+File.separator+"log"; //��Ҫ������Ŀ¼·��
                    String sFile = UtilCommon.getDate() + ".log"; //��Ҫ��������־
                    File d = new File(sPath); //��������SubĿ¼��File���󣬲��õ�����һ������
                    if (!d.exists()) { //���SubĿ¼�Ƿ����
                      d.mkdir(); //����SubĿ¼
                      System.out.println(sPath + "Ŀ¼�����ڣ��ѽ���!");
                    }
                    File f = new File(sPath, sFile);
                    if (!f.exists()) { //���File.txt�Ƿ����
                      f.createNewFile(); //�ڵ�ǰĿ¼�½���һ����ΪFile.txt���ļ�
                      System.out.println(sPath + File.separator + sFile + " �����ڣ��ѽ�����"); //���Ŀǰ���ڵ�Ŀ¼·��
                    }
                    RandomAccessFile rf = new RandomAccessFile(sPath + File.separator + sFile, "rw"); //����һ����RandomAccessFile�Ķ��󣬲�ʵ����
                    rf.seek(rf.length()); //��ָ���ƶ����ļ�ĩβ
                    String sInfo = "";
                    //----��ӡʱ��
                    Date today = new Date();
                    sInfo = "ʱ��:" + today + "\n<br>";
                    rf.write(sInfo.getBytes());
                    //----��ӡ�ͻ���ַ
                    sInfo = "�ͻ���ַ:" + request.getRemoteAddr() + "(" + request.getRemoteHost() + ")" + "\n<br>";
                    rf.write(sInfo.getBytes());
                    //----��ӡ��½�û�
                    BeanLogin userinfo = ((BeanLogin) session.getAttribute(
                        "userInfo"));
                    if (userinfo != null) {
                      sInfo = "�û�:" + userinfo.getLoginSeqn() + "(" + userinfo.getLoginName() + ")\n<br>";
                      rf.write(sInfo.getBytes());
                    }
                    sInfo = "��������:" + "\n<br>";
                    rf.write(sInfo.getBytes());
                    rf.write(errorInfo.getBytes());
                    rf.writeBytes("\n==============================================================\n");
                    rf.close(); //�ر��ļ���}
                  }
                %>
                </td>
              </tr>
              <tr>
                <td colspan="2" align="center" valign="top">
                  <input type="button" name="ok" value="��ȷ ����" onclick=javascript:history.go(-1)>
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
