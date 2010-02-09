<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base />
	<title>֧����ʽά��</title>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/css.css" />
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/jquery.js"></script>
	<script type="text/javascript">
	    function addPayType(){
	       var payTypeName=document.getElementById("payTypeName").value;  
	       if(payTypeName==null||payTypeName==""){
	           alert("���ʽ���Ʋ���Ϊ��!");
	           document.getElementById("payTypeName").focus;
	           return false;
	       }  
	    
	       if(confirm("ȷ�������֧����ʽ��")){
	           document.forms[0].action="<%=request.getContextPath()%>/JspForm/BackfuncModual/payType.do";
		       document.forms[0].submit();
		   }
		   else{
		       return false;
		   }
	    }
	    function modify(ind){
	       var payTypeName=document.getElementById("payTypeName"+ind).value; 
	       if(payTypeName==null||payTypeName==""){
	           document.getElementById("payTypeName"+ind).focus();
	           return false;
	       }
	       if(confirm("ȷ���޸���?")){
	           alert(document.getElementById("companyName"+ind).value);
	           document.forms[0].action="<%=request.getContextPath()%>/JspForm/BackfuncModual/payType.do";
	           document.getElementById("status").value="updatePayType";
		       document.getElementById("ind").value=ind;
		       document.forms[0].submit();
	       }
	       else{
	           return false;
	       } 
	   }
	   
	   function del(payTypeId){
	      if(!confirm("ȷ��ɾ����ǰ��¼")){
	         return false;
	      }
	      else{
	      $.ajax({
	 	    type: "POST",
	 		url: "<%=request.getContextPath()%>/JspForm/BackfuncModual/payType.do?status=deletePayType",
            data:"&payTypeId="+payTypeId+"&day1=new Date()",
	 		success: function(msg){
	 		  if(msg){
	 		      $("#tr"+payTypeId).remove();
	 		      alert("���ͱ��:"+payTypeId+"����ɾ���ɹ�");
	 		  }
	 		  else{
	 		      alert("���ͱ��:"+payTypeId+"����ɾ��ʧ��");
	 		  } 
	 		}
		  });
		  }
	   }
	   
    </script>
</head>

<body background="<%=request.getContextPath()%>/images/bg.gif">
    <%
	response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
    %>
	<center>
		<form action="<%=request.getContextPath()%>/JspForm/BackfuncModual/payType.do">
		<table  class="tbl" width="80%"  cellspacing="0" cellpadding="0" >
		    <tr>
		        <td colspan="7"  bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">
						֧����ʽά��
					</td>
		    </tr>
			<tr >
			    <td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
					���غ�
				</td>
				<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
					���ʽ����
				</td>
				<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
					��˾����
				</td>
				<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
					����������
				</td>
				<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
				    �����ʺ�
				</td>
				<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
				   ��ע
				</td>
				<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
					����
				</td>
			</tr>
			<tr>
			    <td class="main">
			       &nbsp;
			    </td>
			    <td class="main">
			       <input type="text" name="payTypeName" />
			    </td>
			    <td class="main">
			       <input type="text" name="companyName"/>
			    </td>
			    <td class="main">
			       <input type="text" name="openAccountName" />
			    </td>
			    <td class="main">
			       <input type="text" name="bankAccount" />
			    </td>
			    <td class="main">
			       <input type="text" name="remark" />
			    </td>
			    <td class="main">
			       <input type="hidden" name="status" value="addPayType" />
			       <input type="button" value="���" onclick="addPayType()" class="button" />&nbsp;
			       <input type="reset" value="����" class="button"/>
			    </td>
			</tr>
			<tr>
			    <td colspan="7" class="main">
			    &nbsp;
			    </td>
			</tr>
			<logic:present name="payTypeList">
				<logic:iterate id="item" name="payTypeList" indexId="ind">
					<tr id="tr${item.payTypeId }">
					    <td class="main" valign="top">
                            ${item.payTypeId }<input type="hidden" name="payTypeId<%=ind%>" value="${item.payTypeId}" />
						</td>
						<td class="main">
							<input type="text" name="payTypeName<%=ind%>"
								value="${item.payTypeName }" />
							<input type="hidden" name="payTypeName<%=ind%>" value="${item.payTypeName}" />
						</td>
						<td class="main">
							<input type="text" name="companyName<%=ind%>"
								value="${item.companyName }" />
							<input type="hidden" name="companyName<%=ind%>" value="${item.companyName}" />
						</td>
						<td class="main">
							<input type="text" name="openAccountName<%=ind%>"
								value="${item.openAccountName }" />
							<input type="hidden" name="openAccountName<%=ind%>" value="${item.openAccountName}" />
						</td>
						<td class="main">
							<input type="text" name="bankAccount<%=ind%>"
								value="${item.bankAccount }" />
							<input type="hidden" name="bankAccount<%=ind%>" value="${item.bankAccount}" />
						</td>
						<td class="main">
							<input type="text" name="remark<%=ind%>"
								value="${item.remark }" />
							<input type="hidden" name="remark<%=ind%>" value="${item.remark}" />
						</td>
						<td class="main" valign="top">
							<input type="button" value="�޸�" class="button" onclick="modify(${ind})" />&nbsp;
							<input type="hidden" name="ind" value=""/>
							<input type="button" value="ɾ��" class="button"
								onclick="del(${item.payTypeId })" />&nbsp;
						    <input type="reset" value="����" class="button" />
						</td>
					</tr>
				</logic:iterate>
			</logic:present>
		</table>
		</form>
	</center>
</body>
</html:html>

<script type="text/javascript">
   	<logic:present name="xgResult">
   	    alert("${xgResult}");
   	</logic:present>
</script>

