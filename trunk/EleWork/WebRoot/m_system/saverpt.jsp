<%
/**
* ��ʾ�ļ��ϴ��Ĵ���
* @author <a href=��mailto:winter.lau@163.com��>Winter Lau</a>
* @version $Id: save.jsp,v 1.00 2003/03/01 10:10:15
*/
%>
<%@page language="java" contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<html>
<head>
<title>�����ϴ��ļ�</title>
<link rel="stylesheet" href="../css/mm.css" type="text/css">
</head>
<%
String msg = "";
DiskFileUpload fu = new DiskFileUpload();
// ���������û��ϴ��ļ���С,��λ:�ֽ�
fu.setSizeMax(10000000);
// maximum size that will be stored in memory?
//��ʼ��ȡ�ϴ���Ϣ
List fileItems = fu.parseRequest(request);
%>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<font size="6">�ļ��б�</font>
<center>
<table class="btd" cellpadding=0 cellspacing=1 border=1 width="100%">
<tr class="btd1">
<td class="btd">�ļ���</td>
<td class="btd">��С</td>
</tr>
<%
// ���δ���ÿ���ϴ����ļ�
Iterator iter = fileItems.iterator();
while (iter.hasNext()) {
  FileItem item = (FileItem) iter.next();
  //�������������ļ�������б���Ϣ
  if (!item.isFormField()) {
   String name = item.getName();
   long size = item.getSize();
   if((name==null||name.equals("")) && size==0)
   continue;
%>
<tr class="btd1">
<td class="btd2"><%=item.getName()%></td>
<td class="btd2"><%=item.getSize()%></td>
</tr>
<%
   //�����ϴ����ļ���ָ����Ŀ¼
   name=name.substring(name.lastIndexOf('\\')+1);
   name = name.replace(':','_');
   name = name.replace('\\','_');

   File f=new File("EleWork"+File.separator+"rpt"+File.separator+name);
   item.write(f);
  }
}
%>
</table>

<br/><br/>
<a href="rptManage.faces?tseqn=001999020">���ر������ҳ��</a>
</center>
</body>
</html>
