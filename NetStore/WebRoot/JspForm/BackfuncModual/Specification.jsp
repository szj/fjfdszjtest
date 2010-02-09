<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base /> 
<title>Ʒ������</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css" type="text/css"/>

</head>
<script type="text/javascript">
	function addSpec(obj){
	     var context=document.getElementById("addSpecNameID").value;
	    if(context!="")
	    {
		document.forms[0].action='../../specification.do?status=add';
		document.forms[0].submit();
		}
		else
		{
		alert('��ӵ�Ʒ�Ʋ���Ϊ��.');
		}
	}
	
	function saveSpec(obj){
		document.forms[0].action='../../specification.do?status=save';
		document.forms[0].submit();
		alert('�����޸ĳɹ�.');
	}
 </script>
<script type="text/javascript">
  <logic:present name="xgResult">
 	alert('${xgResult}');
</logic:present>
 </script>

 
 
<body background="<%=request.getContextPath()%>/images/bg.gif">
  <form  action="/specification.do?status=save"  method="post" >
  <center>
       <table class="tbl" width="780"  cellspacing="0" cellpadding="0"  >
    	   <tr>
    	   <td colspan="3"   background="../../images/newsystem/th2.gif" class="txt_b"  align="center">Ʒ������</td></tr>
    				<tr>
    					<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    					���
    					</td>
    					<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    				     Ʒ������
    					</td>
    					<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    				      ����
    					</td>
    				</tr> 
    		    <logic:present name="specList">
    			 <logic:iterate id="item" name="specList">
    			 <tr>
    			 <td class="main">
    			 ${item.specificationId}
    			 <input type="hidden" name="specId" value="${item.specificationId}"/>
    			 </td>
    			 <td class="main">
    			 <input type="text" name="specName" value="${item.specificationName}"/>
    			 </td>
    			 <td class="main"><a onclick='return confirm("ȷ��Ҫɾ����ǰ��¼��?")' 
    			 href="<%=request.getContextPath()%>/specification.do?status=delete&specId=${item.specificationId}">ɾ��</a></td>
    			 </tr>
    			 </logic:iterate>
    			</logic:present>
    			
    			<tr>
    			<td colspan="3" class="main" align="center">
    			<input type="button" name="save1" value="�����޸�"  onclick="saveSpec(this)" class="button" />
    			<input type="reset" name="reWrite" value="����" class="button" />
    			</td>
    			</tr>
    		</table>
    	<div>
        <br>
    	<table class="tbl" width="780"  cellspacing="0" cellpadding="0" >
    	<tr>
    	<td  bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">���Ʒ��</td>
    	</tr>
    	<tr>
    	<td class="main"  align="center">
    	���Ʒ��
    	<input type="text" id="addSpecNameID" name="addSpecName" />
    	<input type="button" name="save" value="�� ��"  onclick="addSpec(this)" class="button" />
    	</td>
    	</tr>
    	</table>
  
  </center>
  </form>
</body>
</html:html>





