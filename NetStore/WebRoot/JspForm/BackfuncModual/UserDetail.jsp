<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base /> 
<title>�û���ϸ����</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/css.css" type="text/css"/>
<script type="text/javascript">
function BackAction(obj)
{
document.forms[0].action="../../user.do?status=select&page="+<%=request.getAttribute("page") %>; 
document.forms[0].submit();
}
</script>
</head>
<body background="<%=request.getContextPath()%>/images/bg.gif">

<form action="" method="post">
     <center>
        <logic:present name="userOnlyList">
    	��<logic:iterate id="item" name="userOnlyList">
      <table  class="tbl"  width="600" cellspacing="0" cellpadding="0" border="0" >
    	   <tr>
    	   <td colspan="4" bgcolor="#009CD6"  background="../../images/newsystem/th2.gif" class="txt_b"  align="center">�û���ϸ����</td>
    	   </tr>
                     <tr>
    					<td class="main" align="left">
    					���û�����:
    					</td> 
    					<td class="main" align="left">
    				 <input type="text" id="userId" name="userId"  value="${item.userId}"/>
    					</td> 
    				</tr> 
    		         <tr>
    					<td class="main" align="left">
    					����¼����:
    					</td> 
    					<td class="main" align="left">
    					<input type="password" id="psdNameId" name="psdName" />
    					</td> 
    				</tr> 
    				<tr>
    					<td class="main" align="left">
    					��ȷ������:
    					</td> 
    					<td class="main" align="left">
    					<input type="password" id="QRpsdNameId" name="QRpsdName" />
    					</td> 
    				</tr> 
    	
    				<tr>
    					<td class="main" align="left">
    					�������ʼ���
    					</td> 
    					<td class="main" align="left">
    					<input type="text" id="emailId" name="email"  value="${item.email}"/>
    					</td> 
    				</tr> 
    				<tr>
    					<td class="main" align="left">
    					�����֤����:
    					</td> 
    					<td class="main" align="left">
    					<input type="text" id="idCardId" name="idCard"  value="${item.idCard}"/>
    					</td> 
    				</tr>
    				<tr>
    					<td class="main" align="left">
    					���� ��
    					</td> 
    					<td class="main" align="left">
    					<input type="text" id="sexId" name="sex"  value="${item.sex}"/>
    					</td> 
    				</tr>
    				<tr>
    					<td class="main" align="left">
    					���� ��:
    					</td> 
    					<td class="main" align="left">
    					<input type="text" id="ageId" name="age"  value="${item.age}"/>
    					</td> 
    				</tr>
    				<tr>
    					<td class="main" align="left">
    					����ϸ��ַ��
    					</td> 
    					<td class="main" align="left">
    					<input type="text" id="addressId" name="address" value="${item.address}"/>
    					</td> 
    				</tr>
    				<tr>
    					<td class="main" align="left">
    					���� �ࣺ
    					</td> 
    					<td class="main" align="left">
    					<input type="text" id="postCodeId" name="postCode"  value="${item.postCode}"/>
    					</td> 
    				</tr>
    				<tr>
    					<td class="main" align="left">
    					����ϵ�绰��
    					</td> 
    					<td class="main" align="left">
    					<table>
    					<tr>
    					<td class="main" align="left">
    					�̶��绰
    					</td>
    					<td class="main" align="left"><input type="text" id="phoneId" name="phone"  value="${item.phone}"/></td>
    					<td class="main" align="left">
    					�ֻ�
    					</td>
    					<td class="main" align="left">
    					<input type="text" id="phoneId" name="cellPhone" value="${item.cellPhone}"/>
    					</td>
    					</tr>
    					</table>
    					
    					
    					</td> 
    				</tr>
    				<tr>
    					<td class="main" align="left">
    					���� �飺
    					</td> 
    					<td class="main" align="left">
    					<textarea id="IntroduceId" name="Introduce"  cols="30" rows="5"><%=request.getAttribute("Introduce") %></textarea>
    					</td> 	
    				</tr>
    				<tr>
    					<td class="main" align="left">
    					 ע��ʱ�䣺
    					</td> 
    					<td class="main" align="left">
    					<%=request.getAttribute("registerTime") %>
    					</td> 
    				</tr>
    				<tr>
    					<td colspan="2" class="main" align="center">
                        <input type="button" name="cancel"  value="�� ��"  onclick="BackAction('back')" class="button"/>
    					</td> 
    				</tr>
    				
    		</table>
    	</logic:iterate>
    	</logic:present>
    	
    	</center>
</form>
</body>
</html:html>