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
<title>��Ʒ��������</title>
<link href="<%=request.getContextPath()%>/css/header01.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/index.css" type="text/css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/catalog.css" type="text/css" rel="stylesheet"/>


<script type="text/javascript"> 
function number()
{
var char = String.fromCharCode(event.keyCode)
var re = /[0-9]/g
event.returnValue = char.match(re) != null ? true : false
}
	
function checkValue(obj)
{

 var uId=document.getElementById("userNameId").value;
 if(uId=="")
 {
 alert("��������Ϊ��.");
 return false;
 }

  var tId=document.getElementById("titleNameId").value;
 if(tId=="")
 {
 alert("���ⲻ��Ϊ��.");
 return false;
 }

  
var revCon=document.getElementById("contentId").value;
 if(revCon=="")
 {
 alert("�������ݲ���Ϊ��.");
 return false;
 }

  
document.getElementById("contentHId").value=document.getElementById("contentId").value;


document.forms[0].action='../../indexFirst.do?status=allReviewAdd&productId='+document.getElementById("productId").value+"&userNameReview="+document.getElementById("userNameId").value+"&pingji="+document.getElementById("radioId").value+"&titleName="+document.getElementById("titleNameId").value+"&contentH="+document.getElementById("contentHId").value;         
document.forms[0].submit();

return true;
}		


function setAction(action){

document.forms[0].action="../../indexFirst.do?status=showAllReview&productId="+document.getElementById("productId").value+"&page="+document.getElementById("pageId").value; 

document.forms[0].submit();
}


</script>

</head>

<body>
<form action=""  method="post">
<center>
<jsp:include flush="true" page="top.jsp" />
<table width="98%" align=center class=table-shang border=0 cellpadding=0 cellspacing=0 bgcolor="#f1f1f1" height="35">
		<tr>
		<td bgcolor="#ffffff" colspan="3" height="1"></td>
		</tr>
		<tr>
		<td align=center width=20% height=30>�� ��</td>
		<td align=center width=60% height=30>�� ��</td>
		<td align=center width=20% height=30>�� ��</td>
		</tr>
		<tr>
		<td bgcolor="#cccccc" colspan="3" height="1"></td>
		</tr>
		<tr>
		<td  bgcolor="#f1f1f1" colspan="3" height="3"></td>
		</tr>
		</table>
	
        <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#cccc">   
        <tr><td>
        ��Ʒ����:<%=request.getAttribute("productName") %>
        <input type="hidden"  name="productName"  value="<%=request.getAttribute("productName") %>"/>
        </td></tr>
          <tr> 
            <td bgcolor="#ffffff"> 
             	<logic:present name="ppage" scope="request">
				<logic:present   name="ppage" property="resultList" scope="request">
				 <logic:iterate id="item" name="ppage" property="resultList" scope="request">
              <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#075f5c">
              <tr>
                <td colspan="2" colspan="1" align="left" bgcolor="#ffffff">�� ��:${item.title}</td>
                <td bgcolor="#ffffff"><img src="<%=request.getContextPath() %>/images/vote.gif"/></td>
              </tr>
              <tr> 
                <td colspan="2" align="left" bgcolor="#ffffff">�� ��:${item.userId}��(${item.releaseTime})</td>
                <td bgcolor="#ffffff" >${item.ip}</td>
              </tr>
              <tr> 
                <td colspan="3" align="left" bgcolor="#ffffff"><b>�� �ݣ�</b>${item.content}
                </td>
              </tr>
              <tr> 
                <td colspan="3" align="left" bgcolor="#ffffff"><b>���ۻظ���</b>${item.replyContent}
                </td>
              </tr>
              
              <tr background="images/bj_x1.gif" bgcolor="#ffffff"> 
                <td height="1" colspan="4">&nbsp;</td>
              </tr>
              
            </table>
            &nbsp;
            </logic:iterate>
            </logic:present>
            </logic:present>
            </td>
          </tr>
          </table>
          
     <table  width="98%"  cellspacing="0" cellpadding="0"  >
	<tr>
	<td class="main" align="left">
								<%
									Page p = (Page) request.getAttribute("ppage");
									int currentPage = p.getCurrentPage();
								%>
								<a
									href="../../indexFirst.do?status=showAllReview&targetPage=1&productId=<%=request.getAttribute("productId") %>"
									class="pagenav">��ҳ</a>
								<%
								if (p.isHasPrevious()) {
								%>
								<a
									href="../../indexFirst.do?status=showAllReview&targetPage=<%=currentPage == 1 ? 1 : currentPage - 1%>&productId=<%=request.getAttribute("productId") %>"
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
									href="../../indexFirst.do?status=showAllReview&targetPage=<%=currentPage == p.getTotalPages() ? p.getTotalPages() : currentPage + 1%>&productId=<%=request.getAttribute("productId") %>"
									class="pagenav">��һҳ</a>
								<%
								} else {
								%>
								��һҳ
								<%
								}
								%>
								<a
									href="../../indexFirst.do?status=showAllReview&targetPage=<%=p.getTotalPages()%>&productId=<%=request.getAttribute("productId") %>"
									class="pagenav">ĩҳ</a>&nbsp;&nbsp;��<%=currentPage%>ҳ/ ��<%=p.getTotalPages()%>ҳ &nbsp;&nbsp;��<bean:write name="ppage" property="totalRecords"/>����¼
							</td>
    
    <td align="right" class="main">
    ת<input type="text" name="page"  id="pageId" size="2"  onkeypress="number()"/>ҳ 
    <input type="button" value="Go" onclick="setAction('qry')" class="button"/>
    <input type="hidden" id="totalPages" name="totalPages" value="<bean:write name="ppage" property="totalPages"/>"/>
    </td>
	</tr>
	</table>
	
          
          
          
          
          
		
<table width="98%" align="center" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#cccc">
<tr> 
<td width="10%">�� ����</td>
<td width="90%">
<input type="text"  id="userNameId" name="userNameReview" value="����" maxlength="18"/>
<input type="radio" id="radioId" name="pingji" value="5" checked />��
<input type="radio" id="radioId" name="pingji" value="4"/>���
<input type="radio" id="radioId" name="pingji" value="3"/>����
<input type="radio" id="radioId" name="pingji" value="2"/>�����
<input type="radio" id="radioId" name="pingji" value="1"/>������
</td>
</tr>
<tr> 
<td width="10%">�� �⣺</td>
<td width="90%">
<input type="text"   id="titleNameId" name="titleName"  size="70"/>
</td>
</tr>
<tr> 
<td valign="top">�� �ݣ�</td>
<td>
<textarea  id="contentId" name="content" cols="70" rows="3"  style="BORDER-RIGHT: #ffffff 1px groove; BORDER-TOP: BORDER-LEFT: COLOR: #333333; BORDER-BOTTOM: HEIGHT: 18px; BACKGROUND-COLOR:"; ";";";"></textarea>
<input type="hidden" id="contentHId" name="contentH"/>
</td>
</tr>
<tr>
<td></td>
<td>
<input  name="submitds" value="�ύ����" type="button" onclick="javascript:return checkValue(this);"/>
<input  onclick="window.location='shangpintj.asp?id=961'" type="reset" value="�Ƽ�������" name="Submit2"/>
<input type="hidden" name="productId" id="productId" value="<%=request.getAttribute("productId") %>" /> 
</td>
</tr>
</table>
<jsp:include flush="true" page="bottom.jsp" />
</center>

</form>
</body>
</html:html>