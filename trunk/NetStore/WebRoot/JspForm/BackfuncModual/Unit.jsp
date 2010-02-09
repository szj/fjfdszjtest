<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base /> 
<title>��λ����</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css" type="text/css"/>
 <script type="text/javascript">
	function addUnit(obj){
	      var context=document.getElementById("addUnitNameID").value;
	    if(context!="")
	    {
	   
		document.forms[0].action='../../unit.do?status=add';
		
		document.forms[0].submit();
		document.getElementById("addUnitNameID").value="";
		}
		else
		{
		alert('��ӵĵ�λ����Ϊ��.');
		}
	}
	
	function saveUnit(obj){
		document.forms[0].action='../../unit.do?status=save';
		document.forms[0].submit();
		alert('�����޸ĳɹ�.');
	}
 </script>
 
 <script type="text/javascript">
 <logic:present name="xgResult">
 	alert('${xgResult}');
 </logic:present>
 </script> 
</head>
<body background="<%=request.getContextPath()%>/images/bg.gif">
   <html:form  action="/productModify.do?status=save"  method="post" >
  <center>
    <table  class="tbl" width="780"  cellspacing="0" cellpadding="0" >
    	   <tr>
    	   <td colspan="3" bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">��λ����</td>
    	   </tr>
    				<tr>
    					<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    					���
    					</td>
    					<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    				      <div class="txt_tr">��λ����</div>
    					</td>
    					<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    				      <div class="txt_tr">����</div>
    					</td>
    				</tr> 
    		    <logic:present name="unitList">
    			 <logic:iterate id="item" name="unitList">
    			 <tr>
    			 <td class="main" align="center">
    			${item.unitId}
    			 <input type="hidden" name="unitId" value="${item.unitId}"/>
    			 </td>
    			 <td class="main" align="center">
    			 <input type="text" name="unitName" value="${item.unitName}"/>
    			 </td>
    			 <td class="main" align="center">
    			 <a onclick='return confirm("ȷ��Ҫɾ����ǰ��¼��?")' 
    			 href="<%=request.getContextPath()%>/unit.do?status=delete&uId=${item.unitId}">ɾ��</a>
    			 </td>
    			 </tr>
    			 </logic:iterate>
    			</logic:present>
    			<tr>
    			<td colspan="3" class="main" align="center">
    			<input type="button" name="save" value="�����޸�"  onclick="saveUnit(this)" class="button"/>
    			<input type="reset" name="reWrite" value="����"  class="button" />
    			</td>
    			</tr>
    		</table>
    		
    		
    	<div>
    	<br>
    	<table class="tbl" width="780"  cellspacing="0" cellpadding="0">
    	<tr>
    	<td colspan="3" bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">��ӵ�λ</td>
    	</tr>
    	<tr>
    	<td class="main" colspan="3" align="center">��ӵ�λ
    	<input type="text" id="addUnitNameID" name="addUnitName" />
    	<input type="button" name="save" value="�� ��"  onclick="addUnit(this)" class="button"/>
    	</td>
    	</tr>
    	</table>
    	</div>			
  </center>
  </html:form>
</body>
</html:html>