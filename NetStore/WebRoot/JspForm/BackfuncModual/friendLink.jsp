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
<title>����������</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css" type="text/css"/>
<script type="text/javascript">
	function addFriendLink(obj){
	    var webSiteID=document.getElementById("webSiteID").value;
	    if(webSiteID=="")
		{
		alert('��վ���Ʋ���Ϊ��.');
		
		}

		var urlID=document.getElementById("urlID").value;
		if(urlID=="")
		{
		alert('��վ��ַ����Ϊ��.');
		return false;
		}

		
		var noID=document.getElementById("noID").value;
		if(noID=="")
		{
		alert('������Ϊ��.');
		return false;
		}
	document.forms[0].action='../../friendLink.do?status=add';
	document.forms[0].submit();
	return true;	
	
	}
	
	function saveFriendLink(obj){
		document.forms[0].action='../../friendLink.do?status=save&page='+obj;
		document.forms[0].submit();
		alert('�����޸ĳɹ�.');
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
document.forms[0].action="../../friendLink.do?status=exec";
document.forms[0].submit();
}
</script>
</head>
<body background="<%=request.getContextPath()%>/images/bg.gif">
<html:form action="/productModify.do?status=save"  method="post" >
  <center>

   
  <div>
    <table  class="tbl" width="80%"  cellspacing="0" cellpadding="0" >
    	   <tr>
    	   <td colspan="4" bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">����������</td>
    	   </tr>
    				<tr>
    					<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    					��վ����
    					</td>
    					<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    				      <div class="txt_tr">��վ��ַ</div>
    					</td>
    					
    					<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    				      <div class="txt_tr">����</div>
    					</td>
    					
    					<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
    				      <div class="txt_tr">����</div>
    					</td>
    				</tr>
    				 
    		   <logic:present name="ppage" scope="request">
				<logic:present   name="ppage" property="resultList" scope="request">
				 <logic:iterate id="item" name="ppage" property="resultList" scope="request">
    			 
    			 <tr>
    			 <td class="main" align="center">
    			 <input type="hidden" name="urlId" value="${item.urlId}"/>
    			 <input type="text" name="webSiteName" value="${item.urlTitle}"/> 
    			 </td>
    			 <td class="main" align="center">
    			 <input type="text" name="urlName" value="${item.url}"/>
    			 </td>
    			 
    			 <td class="main" align="center">
    			 <input type="text" name="noName" onkeypress="number()" value="${item.no}"/>
    			 </td>
    			 
    			 <td class="main" align="center">
    			 <a onclick='return confirm("ȷ��Ҫɾ����ǰ��¼��?")' 
    			 href="/NetStore/friendLink.do?status=delete&urlId=${item.urlId}&dpage=<%=request.getAttribute("page")%>">ɾ��</a>
    			 </td>
    			 
    			 </tr>
    			</logic:iterate>
    			</logic:present>
    			</logic:present>
    			
    			<tr>
    			<td colspan="4" class="main" align="center">
    			<input type="button" name="save" value="�����޸�"  onclick="saveFriendLink('<%=request.getAttribute("page")%>')" class="button"/>
    			<input type="reset" name="reWrite" value="����"  class="button" />
    			</td>
    			</tr>
    		</table>
    	</div>
    <div>		
 <table class="tbl" width="80%"  cellspacing="0" cellpadding="0"  >
	<tr>
	<td class="main" align="left">
								<%
									Page p = (Page) request.getAttribute("ppage");
									int currentPage = p.getCurrentPage();
								%>
								<a
									href="../../friendLink.do?targetPage=1&status=exec"
									class="pagenav">��ҳ</a>
								<%
								if (p.isHasPrevious()) {
								%>
								<a
									href="../../friendLink.do?status=exec&targetPage=<%=currentPage == 1 ? 1 : currentPage - 1%>"
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
									href="../../friendLink.do?status=exec&targetPage=<%=currentPage == p.getTotalPages() ? p.getTotalPages() : currentPage + 1%>"
									class="pagenav">��һҳ</a>
								<%
								} else {
								%>
								��һҳ
								<%
								}
								%>
								<a
									href="../../friendLink.do?status=exec&targetPage=<%=p.getTotalPages()%>"
									class="pagenav">ĩҳ</a>&nbsp;&nbsp;��<%=currentPage%>ҳ/ ��<%=p.getTotalPages()%>ҳ &nbsp;&nbsp;��<bean:write name="ppage" property="totalRecords"/>����¼
							</td>
    <td align="right" class="main">
    ת<input type="text" name="page" class="inp_page" value="" size="2"  onkeypress="number()"/>ҳ 
    <input type="button" value="Go" onclick="setAction(this)" class="button"/>
     <input type="hidden" id="totalPages" name="totalPages" value="<bean:write name="ppage" property="totalPages"/>"/>
    </td>
	</tr>
	</table>
	</div>
	<br/>
	<table class="tbl" width="80%"  cellspacing="0" cellpadding="0">
    	<tr>
    	<td colspan="4" bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">��Ӻ������</td>
    	</tr>
    	<tr>
    	<td class="main" align="center">��վ����</td>
    	<td class="main" align="center">��վ��ַ</td>
    	<td class="main" align="center">����</td>
    	<td class="main" align="center">����</td>
    	</tr>
    	
    	<tr>
    	<td class="main" align="center">
    	<input type="text" id="webSiteID" name="webSite" />
    	</td>
    	<td class="main" align="center">
    	<input type="text" id="urlID" name="url"  value="http://"/>
    	</td>
    	<td class="main" align="center">
    	<input type="text" id="noID" name="no"  onkeypress="number()"/>
    	</td>
    	<td class="main" align="center">
    	<input type="button" name="save" value="�� ��"  onclick="javascript:return addFriendLink(this);" class="button"/>
    	</td>
    	</tr>
    	
   </table>
   			
  </center>
  </html:form>
</body>
</html:html>