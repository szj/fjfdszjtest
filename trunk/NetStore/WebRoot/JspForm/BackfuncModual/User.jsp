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
<title>��Ʒ��Ա����</title>


  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/css.css" type="text/css"/>


<script type="text/javascript">
function number()
{
var char = String.fromCharCode(event.keyCode)
var re = /[0-9]/g
event.returnValue = char.match(re) != null ? true : false
}

function setAction(action){
document.forms[0].action="../../user.do?status=select"; 
document.forms[0].submit();
}
</script>
</head>
<body background="<%=request.getContextPath()%>/images/bg.gif">

<form action="" method="post">
     <center>
      <table  class="tbl"  width="80%" cellspacing="0" cellpadding="0" border="0" >
    	   <tr>
    	   <td colspan="4" bgcolor="#009CD6"  background="../../images/newsystem/th2.gif" class="txt_b"  align="center">��Ʒ��Ա����</td>
    	   </tr>
                   <tr>
    					<td  class="main" align="center">
    					���û���
    					</td>
    					<td class="main" align="center">
    				     ����ʵ����
    					</td>
    					<td class="main" align="center">
    				     ע��ʱ��
    					</td>
    					<td class="main" align="center">
    				    �� ��
    					</td>
    				</tr> 
    		     <logic:present name="ppage" scope="request">
				<logic:present   name="ppage" property="resultList" scope="request">
				 <logic:iterate id="item" name="ppage" property="resultList" scope="request">
    			 
    			 <tr>
    			 <td class="main" align="center">
    			<input type="hidden" name="productId" value="${item.userId}"/>
    			 ${item.userId}&nbsp;
    			 </td>
    			 <td class="main" align="center">
    			 ${item.realName}&nbsp;
    			 </td>
    			 <td class="main" align="center">
    			 ${item.registerTime}&nbsp;
    			 </td>
    			 <td class="main" align="center">
    			<a href="<%=request.getContextPath()%>/user.do?status=detail&uId=${item.userId}&page=<%=request.getAttribute("page") %>">��ϸ</a>
    			 |<logic:equal  name="item" property="ifUsable" value="0">
    			  <a  href="<%=request.getContextPath()%>/user.do?status=used&id=${item.userId}&state=1&uPage=<%=request.getAttribute("page") %>">����</a>
    			</logic:equal>
    			 <logic:equal  name="item" property="ifUsable" value="1">
    			 <a  href="<%=request.getContextPath()%>/user.do?status=used&id=${item.userId}&state=0&uPage=<%=request.getAttribute("page") %>">����</a>
    			 </logic:equal>
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
									href="../../user.do?status=select&targetPage=1"
									class="pagenav">��ҳ</a>
								<%
								if (p.isHasPrevious()) {
								%>
								<a
									href="../../user.do?status=select&targetPage=<%=currentPage == 1 ? 1 : currentPage - 1%>"
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
									href="../../user.do?status=select&targetPage=<%=currentPage == p.getTotalPages() ? p.getTotalPages() : currentPage + 1%>"
									class="pagenav">��һҳ</a>
								<%
								} else {
								%>
								��һҳ
								<%
								}
								%>
								<a
									href="../../user.do?status=select&targetPage=<%=p.getTotalPages()%>"
									class="pagenav">ĩҳ</a>&nbsp;&nbsp;��<%=currentPage%>ҳ/ ��<%=p.getTotalPages()%>ҳ &nbsp;&nbsp;��<bean:write name="ppage" property="totalRecords"/>����¼
							</td>
    
    <td align="right" class="main">
    ת<input type="text" name="page" class="inp_page" value="" size="2"  onkeypress="number()"/>ҳ 
    <input type="button" value="Go" onclick="setAction('qry')" class="button"/>
    </td>
	</tr>
	</table>
     <input type="hidden" id="totalPages" name="totalPages" value="<bean:write name="ppage" property="totalPages"/>"/>
    <input type="hidden" id="tt" name="tt" value="<%=request.getAttribute("t") %>"/>
    	
    	
    	</center>
</form>

</body>
</html:html>