<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base /> 
<title>��Ʒ�������</title>

     <link rel="stylesheet" href="<%=request.getContextPath() %>/css/css.css" type="text/css">

 <script type="text/javascript">
	function addProductManage(obj){
		document.forms[0].action='../NetStore/productManage.do?status=add';
		document.forms[0].submit();
		alert('�ɹ��������Ʒ����.');
	}
	
	function saveProduct(obj){
		document.forms[0].action='../NetStore/productManage.do?status=save';
		document.forms[0].submit();
		alert('�����޸ĳɹ�.');
	}
 </script>
  <script type="text/javascript">
   function checkname(str){
  // var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
  // xmlDoc.load("productManage.do?status=isDelete&id="+str);
  // objLst = xmlDoc.getElementsByTagName("list"); 
 //if (objLst.item(0).childNodes(0).text == "exist")
 //{
  //alert("����Ʒ������������,����ɾ��.");
  //return false;
 //}
  
  if(confirm("ȷ��Ҫɾ����ǰ��¼��"))
  {
  return true;
  }
   
   
 }
   </script>
</head>
<body background="<%=request.getContextPath()%>/images/bg.gif"> 
  <form action="/productManage.do" method="post">
  <center>
      <table class="tbl" width="780"  cellspacing="0" cellpadding="0" border="1" >
    	   <tr>
    	   <td colspan="3" bgcolor="#009CD6"  background="../../images/newsystem/th2.gif" class="txt_b"  align="center">��Ʒ����鿴���޸�</td>
    	   </tr>
    				<tr>
    					<td class="main" align="left">
    					��������
    					</td>
    					<td class="main" align="left">
    				      ����
    					</td>
    				</tr> 
    		    <logic:present name="productBigList">
    			 <logic:iterate id="item" name="productBigList">
    			 <tr>
    			 <td>
    			 <input type="hidden" name="productId" value="${item.id}"/>
    			 <input type="text" name="productName" value="${item.catalogName}"/>
    			 </td>
    			 <td>
    			 <a onclick='javascript:return checkname(${item.id});' 
    			 href="/NetStore/productManage.do?status=delete&uId=${item.id}">ɾ��</a>
    			 </td>
    			 </tr>
    			 </logic:iterate>
    			</logic:present>
    			
    			<tr>
    			<td colspan="3" align="center">
    			<input type="button" name="save" value="�����޸�"  onclick="saveProduct(this)"/>
    			<input type="reset" name="reWrite" value="����"  />
    			</td>
    			</tr>
    		</table>
    	
    	
    	
    	
    	
    		
    	<br/>	
    	<div>
    	<table border="1">
    	<tr>
    	<td colspan="3" align="center">�����Ʒ����</td>
    	</tr>
    	<tr>
    	<td>�����Ʒ����</td>
    	<td>
    	<input type="text" name="addProductName" />
    	</td>
    	<td>
    	<input type="button" name="save" value="�� ��"  onclick="addProductManage(this)" />
    	</td>
    	</tr>
    	</table>
    	</div>
  </center>
  </form>
</body>
</html:html>