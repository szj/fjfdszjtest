<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<jsp:directive.page import="com.qzgf.NetStore.pub.*"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base /> 
    <title>��Ʒ����</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css" type="text/css"/>
  

    <script type="text/javascript">
	function AddAction(object){
	   
		document.forms[0].action='../../productModify.do?status=add';
		document.forms[0].submit();
	}
	function delete(object){
	   
		document.forms[0].action='../../productModify.do?status=deletePic';
		document.forms[0].submit();
	}
	
    </script>
    
<script type="text/javascript">
function number()
{
var char = String.fromCharCode(event.keyCode)
var re = /[0-9]/g
event.returnValue = char.match(re) != null ? true : false
}

function setAction(action){

document.forms[0].action="../../product.do?GoQry="+action;

document.forms[0].submit();
}
</script>
  </head>
  
  <body background="<%=request.getContextPath()%>/images/bg.gif">
  <form action="../../product.do" method="post">
  <center>
        
    
         <table width="80%">
         <tr>
         <td  align="right">
          <a href="<%=request.getContextPath()%>/productModify.do?status=add&selTypeUrl=<%=request.getAttribute("selType") %>&page=<%=request.getAttribute("page") %>">���</a>
         </td>
         </tr>
         </table>

    	<table class="tbl" width="80%"  cellspacing="0" cellpadding="0" >
    	   <tr><td colspan="5"  bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">��Ʒ�鿴���޸�</td></tr>
    		<tr>
    			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    			���
    			</td>
    			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    			��Ʒ����
    			</td>
    			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    			����ʱ��
    			</td>
    			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    			�Ƿ񷢲�
    			</td>
    			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    			����
    			</td>
    			
    		
    		</tr>
    		<logic:present name="ppage" scope="request">
				<logic:present   name="ppage" property="resultList" scope="request">
				 <logic:iterate id="item" name="ppage" property="resultList" scope="request">
    				<tr>
    					<td class="main">
    					${item.productId}&nbsp;
    					</td>
    					<td class="main">
    					${item.productName}&nbsp;
    					</td>
    					<td class="main">
    					${item.displayDate}&nbsp;
    					</td>
    					<td class="main">
    					<logic:equal name="item" property="isRelease" value="true">����</logic:equal>
    					<logic:equal name="item" property="isRelease" value="false">������</logic:equal>
    					&nbsp;
    					</td>
    					<td class="main">
    					<div class="txt_td_normal">
    					<a href="<%=request.getContextPath()%>/productModify.do?status=onlyShow&pId=${item.productId}&selTypeUrl=<%=request.getAttribute("selType") %>&page=<%=request.getAttribute("page") %>">�޸�</a>
    				    |<a onclick='return confirm("ȷ��Ҫɾ����ǰ��¼��?")' href="<%=request.getContextPath()%>/product.do?action=del&selTypeUrl=<%=request.getAttribute("selType") %>&pId=${item.productId}&sPic=${item.smallPath}&bPic=${item.bigPath}">ɾ��</a>
    				    </div>
    					</td>
    				</tr>  
    	</logic:iterate>
    	</logic:present>
    	</logic:present>
    	</table>
    	
    	    	
   <table class="tbl" width="80%"  cellspacing="0" cellpadding="0"  >
	<tr>
	<td class="main" align="left">
								<%
									Page p = (Page) request.getAttribute("ppage");
									int currentPage = p.getCurrentPage();
								%>
								<a
									href="../../product.do?targetPage=1&selTypeUrl=<%=request.getAttribute("selType") %>"
									class="pagenav">��ҳ</a>
								<%
								if (p.isHasPrevious()) {
								%>
								<a
									href="../../product.do?targetPage=<%=currentPage == 1 ? 1 : currentPage - 1%>&selTypeUrl=<%=request.getAttribute("selType") %>"
									class="pagenav">��һҳ</a>
								<%
								} else {
								%>
								��һҳ
								<%
									}
									if (p.isHasNext()) {
								%>
								<a
									href="../../product.do?targetPage=<%=currentPage == p.getTotalPages() ? p.getTotalPages() : currentPage + 1%>&selTypeUrl=<%=request.getAttribute("selType") %>"
									class="pagenav">��һҳ</a>
								<%
								} else {
								%>
								��һҳ
								<%
								}
								%>
								<a
									href="../../product.do?targetPage=<%=p.getTotalPages()%>&selTypeUrl=<%=request.getAttribute("selType") %>"
									class="pagenav">ĩҳ</a>&nbsp;&nbsp;��<%=currentPage%>ҳ/ ��<%=p.getTotalPages()%>ҳ &nbsp;&nbsp;��<bean:write name="ppage" property="totalRecords"/>����¼
							</td>
    
    <td align="right" class="main">
    ת<input type="text" name="page" class="inp_page" value="" size="2"  onkeypress="number()"/>ҳ 
    <input type="button" value="Go" onclick="setAction('<%=request.getAttribute("selType") %>')" class="button"/>
    </td>
	</tr>
	</table>
     <input type="hidden" id="totalPages" name="totalPages" value="<bean:write name="ppage" property="totalPages"/>"/>
     <input type="hidden" id="tt" name="tt" value="<%=request.getAttribute("t") %>"/>
     <input type="hidden" id="selTypeGo" name="selTypeGo" value="<%=request.getAttribute("selType") %>"/>
    
    <br/>
    <table class="tbl" width="80%"  cellspacing="0" cellpadding="0">
    	<tr>
    	<td colspan="3" bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">��ѯĳһ��Ʒ</td>
    	</tr>
    	<tr>
    	<td class="main" colspan="3" align="center">
    	<input name="searchContent" type="text"  value="�����ѯ�ؼ���... " 
    	onfocus="if(this.value==this.defaultValue){this.value='';}" 
    	onblur="if(this.value==''){this.value=this.defaultValue;}" 
    	onKeyDown="if (event.keyCode==13)return PageBar.submitSearchForm();"/>
    	
    	<select name="selType">
    	<option value="1">����Ʒ����</option>
    	<option value="2">����Ʒ˵��</option>
    	<option value="3">����Ʒ���</option>
    	<option value="4">ȫ����Ʒ</option>
    	<option value="5">����Ʒ</option>
    	<option value="6">���ؼ�</option>
    	<option value="7">���Ƽ�</option>
    	</select>
    	<input type="submit" name="sel" value="�� ѯ"  class="button"/>
    	</td>
    	</tr>
    	</table>

    	<input type="hidden" name="selss" value="�� ѯ"  onclick="delete(this)" class="button"/>
    </center>
    </form>
  </body>
</html:html>
