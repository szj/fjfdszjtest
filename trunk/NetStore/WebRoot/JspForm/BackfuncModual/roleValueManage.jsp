<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display-el"%>
<%@ taglib uri="/WEB-INF/extremecomponents.tld" prefix="ec"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<head>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jslib/treeRes/XMLSelTree.js"></script>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/jslib/treeRes/XMLSelTree.css" />
</head>

<body background="<%=request.getContextPath()%>/images/bg.gif">
<center>
		<form
		action="<%=request.getContextPath()%>/JspForm/BackfuncModual/roleValue.do"
		method="post">
		<table class="tbl" width="80%"  cellspacing="0" cellpadding="0">
		    <TBODY>
		    <tr >
		   		<td class="main">�û����ţ�
				<logic:present name="rid">${rid}</logic:present>
				&nbsp;&nbsp;&nbsp;�û������ƣ�
				<logic:present name="rname">${rname}</logic:present>
				</td>
			</tr>
			<tr >
				<td >
					<DIV id="SrcDiv" onselectstart="selectstart()"></DIV>
				</td>
			</tr>
			<tr>
				<td class="main">
         <input type="hidden" name="status" value="addRoleValue"/>
         <input type="hidden" name="rid" value="<logic:present name="rid">${rid}</logic:present>"/>
         <input type="submit" value="����" class="button" />
         <input type="button" value="����" class="button" onclick="javascript:self.history.back(); " />
				</td>
			</tr>
			</TBODY>
		</table>
	</form>
	
	<SCRIPT LANGUAGE=javascript>
		<!--
		var m_sXMLFile	= "<%=request.getContextPath()%>/JspForm/BackfuncModual/roleValue.do?status=getTree&root=Root&roleId=<logic:present name="rid">${rid}</logic:present>";	// ���˵����ļ�(�ɸ�ΪTreeNode.asp)
		var m_sXSLPath	= "<%=request.getContextPath()%>/jslib/treeRes/";						// xsl�ļ����·��
		var m_oSrcDiv	= SrcDiv;								// HTML���(�˵��������˵��ڴ�������ʾ)
		
		
		function window.onload()
		{
			InitTree(m_sXMLFile, m_sXSLPath, m_oSrcDiv,false,true,true);
		}
		
		/************************************************
		** GoLink(p_sHref, p_sTarget)
		************************************************/
		function GoLink(p_sHref, p_sTarget)
		{
			var sHref	= p_sHref;
			var sTarget	= p_sTarget;
			window.open(sHref, sTarget);
		}
		//-->
	</SCRIPT>
	</center>
</body>