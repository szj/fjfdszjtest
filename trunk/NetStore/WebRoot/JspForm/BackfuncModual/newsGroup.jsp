<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display-el"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
	<html:base />
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/screen.css">
	<script type="text/javascript">
	    function goto(){
	         window.location.href="<%=request.getContextPath()%>/JspForm/BackfuncModual/addGroup.jsp";
	    }
	</script>
	<title>�������</title>
</head>

<body background="<%=request.getContextPath()%>/images/bg.gif">
	<center>
		<table width="80%">
			<tr>
				<td align="right" width="100%">
					<input type="button" value="����������" onclick="goto()"/>
				</td>
			</tr>
			<tr>
				<td width="100%">
					<display:table name="groupInfo" id="item" pagesize="3"
						requestURI="/JspForm/BackfuncModual/news.do"> 
						<display:caption></display:caption>
						<display:column property="groupName" title="�������" sortable="true" />
						<display:column property="description" title="����" />
						<display:column title="����">
							<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do?status=queryGroupByGroupId&groupId=${item.groupId }"}>�޸�</a>&nbsp;
							<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do?status=deleteGroupByGroupId&groupId=${item.groupId }">ɾ��</a>&nbsp;
							<a href="#">���</a>&nbsp;
							<a href="#">����</a>
						</display:column> 
					</display:table>
				</td>
			</tr>
		</table>
	</center>
</body>
</html:html>
