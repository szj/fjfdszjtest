<%@ page language="java" pageEncoding="gbk"%>
<jsp:directive.page import="com.qzgf.NetStore.pub.*" />
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
	<html:base />
	<title>����Աά��</title>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/css.css" />
		<script type="text/javascript">
        function setAction(){
            var page=document.getElementById("page").value;
            window.location.href="<%=request.getContextPath()%>/JspForm/BackfuncModual/manager.do?status=queryManagers&page="+page;
        }
    </script>
</head>

<body background="<%=request.getContextPath()%>/images/bg.gif">
<center>
    <table width="80%">
       <tr>
           <td colspan="8" align="right">
           <a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/manager.do?status=to_addPage">���</a>
           </td>
       </tr>
    </table>
<table class="tbl" width="80%"  cellspacing="0" cellpadding="0">
	    <tr >
	        <td colspan="7"  bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">����Ա�б�</td></tr>
		<tr>
			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
				����ԱID
			</td>
			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
				��ʵ����
			</td>
			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
				�Ա�
			</td>
			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
				Email
			</td>
			
			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
				Ȩ��
			</td>
			<td background="../../images/newsystem/th2.gif" valign="middle" class="main" bgcolor="#ECF2FF" nowrap="nowrap">
				����
			</td>
		</tr>
        <logic:present name="ppage" scope="request">
			<logic:present name="ppage" property="resultList" scope="request">
				<logic:iterate id="item" name="ppage" property="resultList"
					scope="request">
					<tr>
						<td class="main">
							${item.adminId}
						</td>
						<td class="main">
							${item.realName }
						</td>
						<td class="main">
							${item.sex }
						</td>
						<td class="main">
							${item.email }
						</td>
						<td class="main">
							${item.roleName }
						</td>
						<td class="main">
							<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/manager.do?status=queryAdminById&id=${item.adminId }">�޸�</a> &nbsp;&nbsp;
							<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/manager.do?status=deleteManagerById&id=${item.adminId }">ɾ��</a>
						</td>
					</tr>
				</logic:iterate>
			</logic:present>
		</logic:present>
		<tr>
			<td class="main" align="left" colspan="5">
				<%
									Page p = (Page) request.getAttribute("ppage");
									int currentPage = p.getCurrentPage();
								%>
				<a
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/manager.do?status=queryManagers&targetPage=1"
					class="pagenav">��ҳ</a>
				<%
								if (p.isHasPrevious()) {
								%>
				<a
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/manager.do?status=queryManagers&targetPage=<%=currentPage == 1 ? 1 : currentPage - 1%>"
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
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/manager.do?status=queryManagers&targetPage=<%=currentPage == p.getTotalPages() ? p.getTotalPages() : currentPage + 1%>"
					class="pagenav">��һҳ</a>
				<%
								} else {
								%>
				��һҳ
				<%
								}
								%>
				<a
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/manager.do?status=queryManagers&targetPage=<%=p.getTotalPages()%>"
					class="pagenav">ĩҳ</a>&nbsp;&nbsp;��<%=currentPage%>ҳ/ ��<%=p.getTotalPages()%>ҳ
				&nbsp;&nbsp;��
				<bean:write name="ppage" property="totalRecords" />
				����¼

			</td>
			<td class="main" align="right" colspan="2">
				ת
				<input type="text" name="page" class="inp_page" value="" size="4"
					onkeyup="value=value.replace(/[^\d]/g,'')" />
				ҳ
				<input type="button" value="Go" onclick="setAction()" class="button" />
				<input type="hidden" id="totalPages" name="totalPages"
					value="<bean:write name="ppage" property="totalPages"/>" />
			</td>
		</tr>
        </table>
		</center>
	
</body>
</html:html>
<logic:present name="xgResult">
   <script type="text/javascript">
       alert("${xgResult}");
   </script>
</logic:present>
