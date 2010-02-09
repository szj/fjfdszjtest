<%@ page language="java"  pageEncoding="gbk"%>
<jsp:directive.page import="com.qzgf.NetStore.pub.*" />
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html >
<head>
	<html:base />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css" />
	<script type="text/javascript">
	    function checkAll(){
	        if(document.getElementsByName("selectAll")[0].checked){
	            for(i=0;i<document.getElementsByName("newsIds").length;i++){
	                document.getElementsByName("newsIds")[i].checked=true;
	            }
	        }
	        else{
	            for(i=0;i<document.getElementsByName("newsIds").length;i++){
	                document.getElementsByName("newsIds")[i].checked=false;
	            }
	        }
	    }
	    function delId(){
	        document.forms[0].action="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do";
	        document.getElementById("status").value="deleteNews";
		    document.forms[0].submit();
	    }
	</script>
	<title>��ҳ���Ź���</title>
</head>

<body background="<%=request.getContextPath()%>/images/bg.gif">
	<center>
	<table width="80%">
       <tr>
           <td colspan="2" align="right">
           <a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do?status=to_addNews">���</a>
           </td>
       </tr>
    </table>
    <form action="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do">
	<table class="tbl" width="80%"  cellspacing="0" cellpadding="0">
	    <tr>
	        <th>
	            ��������
	        </th>
	        <th>
	           ������
	        </th>
	        <th>
	          ����ʱ��
	        </th>
	        <th>
	           ѡ��
	        </th>
	    </tr>
	    
	    <logic:present name="ppage" scope="request">
			<logic:present name="ppage" property="resultList" scope="request">
				<logic:iterate id="item" name="ppage" property="resultList"
					scope="request">
					<tr>
						<td class="main">
							<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/news.do?status=queryNewsById&id=${item.newsId }">
							${item.newsTitle}</a>
						</td>
						<td class="main">
							${item.releaseMan }
						</td>
						<td class="main">
							${item.releaseTime }
						</td>
						<td class="main">
						   <input type="checkbox" id="newsIds" name="newsIds" value="${item.newsId}"  />
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
		<tr>
		    <td colspan="4" class="main">
		        <input type="hidden" name="status" />
		        <input type="submit" value="ɾ����ѡ����" onclick="delId()" class="button0000"  />
                <input type="checkbox" id="selectAll" name="selectAll" value="1" onclick='checkAll();' />ȫѡ
		    </td>
		</tr>
	</table>
	</form>
	</center>
</body>
</html:html>