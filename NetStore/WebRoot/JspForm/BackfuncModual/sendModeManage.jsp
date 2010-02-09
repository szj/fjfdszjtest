<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base />
	<title>�ʼķ�ʽά��</title>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/css.css" />
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/jquery.js"></script>
	<script type="text/javascript">
	    function addSendMode(){
	       var sendModeName=document.getElementById("sendModeName").value;  
	       if(sendModeName==null||sendModeName==""){
	           alert("�ʼķ�ʽ���Ʋ���Ϊ��!");
	           document.getElementById("sendModeName").focus;
	           return false;
	       }  
	       var sendFee=document.getElementById("sendFee").value;  
	       if(sendFee==null||sendFee==""){
	           document.getElementById("sendFee").value=0;
	       }  
	       else{
	           //�ж��������Ƿ�Ϸ�
	               if(isNaN(sendFee)){
	                   alert("��Ҫ�޸ĵ��ʼķ��ò���,������!");
	                   document.getElementById("sendFee").focus();
	                   return false;
	               }
	       }
	    
	       if(confirm("ȷ��������ʼķ�ʽ��")){
	           document.forms[0].action="<%=request.getContextPath()%>/JspForm/BackfuncModual/sendMode.do";
		       document.getElementById("status").value="addSendMode";
		       document.forms[0].submit();
		   }
		   else{
		       return false;
		   }
	    }
	    function modify(ind){
	    
	           //�ж�Ҫ�޸ĵ������Ƿ���ȷ
	           var sendModeName=document.getElementById("sendModeName"+ind).value;
	           if(sendModeName==null||sendModeName==""){
	               alert("��Ҫ�޸ĵ��ʼķ�ʽ���Ʋ���,������!");
	               document.getElementById("sendModeName"+ind).focus();
	               return false;
	           }
	           var sendFee=document.getElementById("sendFee"+ind).value;
	           
	           if(sendFee==null||sendFee==""){
	               document.getElementById("sendFee"+ind).value=0;
	           }
	           else{
	               //�ж��������Ƿ�Ϸ�
	               if(isNaN(sendFee)){
	                   alert("��Ҫ�޸ĵ��ʼķ��ò���,������!");
	                   document.getElementById("sendFee"+ind).focus();
	                   return false;
	               }
	           }
	       if(confirm("ȷ���޸���?")){
			   document.forms[0].action="<%=request.getContextPath()%>/JspForm/BackfuncModual/sendMode.do";
		       document.getElementById("status").value="updateSendMode";
		       document.getElementById("ind").value=ind;
		       document.forms[0].submit();
		   }
	       else{
	           return false;
	       } 
	   }
	   
	   function del(sendModeId){
	      if(confirm("ȷ��ɾ�������ͷ�ʽ��?")){
	      $.ajax({
	 	    type: "POST",
	 		url: "<%=request.getContextPath()%>/JspForm/BackfuncModual/sendMode.do?status=deleteSendMode",
            data:"&sendModeId="+sendModeId+"&day1=new Date()",
	 		success: function(msg){
	 		  if(msg){
	 		      $("#tr"+sendModeId).remove();
	 		      alert("���ͱ��:"+sendModeId+"����ɾ���ɹ�");
	 		  }
	 		  else{
	 		      alert("���ͱ��:"+sendModeId+"����ɾ��ʧ��");
	 		  } 
	 		}
		  });
		  }
		  else{
		      return false;
		  }
	   }
	   
    </script>
</head>

<body background="<%=request.getContextPath()%>/images/bg.gif">
	<center>

		<form action="<%=request.getContextPath()%>/JspForm/BackfuncModual/sendMode.do">
		<table   class="tbl" width="80%"  cellspacing="0" cellpadding="0" >
		    <tr>
		        <td colspan="5"  bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">
						�ʼķ�ʽά��
					</td>
		    </tr>
			<tr>
			    <td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
					���
				</td>
				<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
					�ʼķ�ʽ����
				</td>
				<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
					�ʼķ���
				</td>
				<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
					�ʼ�ʱ��
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
			       <input type="text" name="sendModeName" />
			    </td>
			    <td class="main">
			       <input type="text" name="sendFee"/>
			    </td>
			    <td class="main">
			       <input type="text" name="sendTime" />
			    </td>
			    <td class="main">
			       <input type="hidden" name="status" value=""/>
			       <input type="button" value="���" onclick="addSendMode()" class="button" />&nbsp;
			       <input type="reset" value="����" class="button"/>
			    </td>
			</tr>
			<tr>
			    <td colspan="5" class="main">
			    &nbsp;
			    </td>
			</tr>
			<logic:present name="sendModeList">
				<logic:iterate id="item" name="sendModeList" indexId="ind">
					<tr id="tr${item.sendModeId }">
					    <td class="main">
							${item.sendModeId }	
							<input type="hidden" name="sendModeId<%=ind%>" value="${item.sendModeId}" />&nbsp;
						</td>
						<td class="main">
							<input type="text" name="sendModeName<%=ind%>"
								value="${item.sendModeName }" />
							<input type="hidden" name="sendModeName<%=ind%>" value="${item.sendModeName}" />&nbsp;
						</td>
						<td class="main">
							<input type="text" name="sendFee<%=ind%>"
								value="${item.sendFee }" />
							<input type="hidden" name="sendFee<%=ind%>" value="${item.sendFee }" />&nbsp;
						</td>
						<td class="main">
							<input type="text" name="sendTime<%=ind%>"
								value="${item.sendTime }" />
						    <input type="hidden" name="sendTime<%=ind%>" value="${item.sendTime}" />&nbsp;
						</td>
						<td class="main">
							<input type="button" value="�޸�" class="button"
								onclick="modify(${ind})" />&nbsp;
							<input type="hidden" name="ind" value=""/>
							<input type="button" value="ɾ��"
								onclick="del(${item.sendModeId })" class="button" />&nbsp;
						    <input type="reset" value="����"class="button" />
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

