<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Ŀ¼</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
  <form action="/NetStore/uploadTest.do"  enctype="multipart/form-data">
    <div align="center">
    	<h2>��������</h2>
    	<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=listOrderByStatus">����˶���</a>
    	<br>
    	<a href="<%=request.getContextPath()%>/product.do">��Ʒ����</a>
    	<br>
    	<a href="<%=request.getContextPath()%>/unit.do?status=select">��λ����</a>
    	<br>
    	<a href="<%=request.getContextPath()%>/specification.do?status=select">Ʒ������</a>
    	<br>
    	<a href="<%=request.getContextPath()%>/productManage.do?status=select">��Ʒ�������</a>
    	<br>
    	<a href="<%=request.getContextPath()%>/productManage.do?status=selectChild">��ƷС�����</a>
    	<br/>
    	<a href="<%=request.getContextPath()%>/review.do?status=select">��Ʒ���۹���</a>
    	<hr>
    	�û�����
    	<hr>
        <a href="<%=request.getContextPath()%>/user.do?status=select">�̳ǻ�Ա����</a>	
        <hr>
        <a href="<%=request.getContextPath()%>/friendLink.do?status=exec">����������</a>	
        
    </div>
    
    
    
    
    
   <table>
<tr>
<td>
 �����ļ�: 
			
			<input type="file" name="wjm" />
			
			<input type="submit" value="ȷ ��" onclick="setAction('upload')" />
			
			<input type="button" value="�� ��" onclick="setAction('cancel')" />
			<%=request.getAttribute("errmsg") %>
</td>
</tr>
</table>

</form>
  </body>
</html>
