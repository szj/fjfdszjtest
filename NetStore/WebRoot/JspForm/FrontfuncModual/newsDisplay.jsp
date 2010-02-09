<%@ page language="java"  pageEncoding="gbk"%>
<jsp:directive.page import="com.qzgf.NetStore.pub.*" />
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html:html >
<head>
	<html:base />
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/css.css" />
	<title>�̳�����</title>
</head>

<body style="margin:25px;">
	<center>
	<table class="tbl" width="80%"  cellspacing="0" cellpadding="0">
	    <tr>
	        <td colspan="2">
	            �̳�����
	        </td>
	    </tr>
	    <tr>
	        <th>
	            ��������
	        </th>
	        <th>
	            ����ʱ��
	        </th>
	    </tr>
	    
	    <logic:present name="ppage" scope="request">
			<logic:present name="ppage" property="resultList" scope="request">
				<logic:iterate id="item" name="ppage" property="resultList"
					scope="request">
					<tr>
						<td class="main" width="70%">
							<a href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/newsDisplay.do?status=queryNewsById&id=${item.newsId }">${item.newsTitle}</a>
						</td>
						<td class="main" width="30%">
							${item.releaseTime }
						</td>
					</tr>
				</logic:iterate>
			</logic:present>
		</logic:present>
		<tr>
			<td class="main" align="left" colspan="2">
				<%
									Page p = (Page) request.getAttribute("ppage");
									int currentPage = p.getCurrentPage();
								%>
				<a
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do?status=queryAllNews&targetPage=1"
					class="pagenav">��ҳ</a>
				<%
								if (p.isHasPrevious()) {
								%>
				<a
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do?status=queryAllNews&targetPage=<%=currentPage == 1 ? 1 : currentPage - 1%>"
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
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do?status=queryAllNews&targetPage=<%=currentPage == p.getTotalPages() ? p.getTotalPages() : currentPage + 1%>"
					class="pagenav">��һҳ</a>
				<%
								} else {
								%>
				��һҳ
				<%
								}
								%>
				<a
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do?status=queryAllNews&targetPage=<%=p.getTotalPages()%>"
					class="pagenav">ĩҳ</a>&nbsp;&nbsp;��<%=currentPage%>ҳ/ ��<%=p.getTotalPages()%>ҳ
				&nbsp;&nbsp;��
				<bean:write name="ppage" property="totalRecords" />
				����¼
                &nbsp;&nbsp;
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