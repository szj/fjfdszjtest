<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<jsp:directive.page import="com.qzgf.NetStore.dao.IIndexFirstDAO"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.qzgf.NetStore.dao.impl.IndexFirstDAO"/>


<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>��ҳ�ײ�</title>
</head>
<body>
<center>
	
  <table width="98%" height="100" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" cellpadding="0" cellspacing="1" bgcolor="#F1F1F1">
        <tr bgcolor="#f1f1f1">
          <td align="middle" width="20%" height="22"><strong>��������</strong></td>
          <td align="middle" width="20%" height="22"><strong>����ָ��</strong></td>
          <td align="middle" width="20%" height="22"><strong>����֤</strong></td>
          <td align="middle" width="20%" height="22"><strong>�ͻ�����</strong></td>
          <td align="middle" width="20%" height="22"><strong>����˵��</strong></td>
        </tr>
        <tr bgcolor="#ffffff">
          <td align="middle" height="23">��������</td>
          <td align="middle" height="23">������·</td>
          <td align="middle" height="23">��˽����</td>
          <td align="middle" height="23">��Ա����</td>
          <td align="middle" height="23">ȱ���Ǽ�</td>
        </tr>
        <tr bgcolor="#ffffff">
          <td align="middle" height="23">��վ��̬</td>
          <td align="middle" height="23">������ʽ</td>
          <td align="middle" height="23">����֤</td>
          <td align="middle" height="23">������ѯ</td>
          <td align="middle" height="23">Ͷ�߽���</td>
        </tr>
        <tr bgcolor="#ffffff">
          <td align="middle" height="23"><a href="page.aspid=13"></a>��������<a href="page.aspid=13"></a></td>
          <td align="middle" height="23">��θ���</td>
          <td align="middle" height="23">�ۺ����</td>
          <td align="middle" height="23">���ȷ��</td>
          <td align="middle" height="23"><a href="<%=request.getContextPath()%>/JspForm/login.jsp">�����¼</a></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="950" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="1" colspan="2" bgcolor="#CCCCCC"></td>
    </tr>
    <tr>
      <td width="300" height="80">LOGO</td>
      <td valign="middle"><table width="100%" border="0" cellpadding="2" cellspacing="0">
        <tr>
          <td><div align="left">�̳���ҳ  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;��������  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;����֧��  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;��Ȩ����  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;���ʽ  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;�������  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;���߰���&nbsp;<a href="<%=request.getContextPath() %>/JspForm/login.jsp">����Ա��¼</a></div></td>
        </tr>
        <tr>
          <td><p align="left">��˾��ַ��</p>            </td>
        </tr>
        <tr>
          <td><div align="left">�ͷ����䣺</div></td>
        </tr>
        <tr>
          <td><div align="left">Copyright &copy; 2008</div></td>
        </tr>
      </table></td>
    </tr>
  </table>
</center>
</body>
</html>