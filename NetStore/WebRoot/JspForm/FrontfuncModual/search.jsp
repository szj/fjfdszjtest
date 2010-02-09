<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<jsp:directive.page import="com.qzgf.NetStore.pub.*" />
<%
  //ServletContext   servletContext   =   pageContext.getServletContext();   
 // String   realPath   =   servletContext.getRealPath("/");

  String name2=request.getContextPath()+"/upload/smallPic"; 
        %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>��Ʒ����</title>
		<link href="<%=request.getContextPath()%>/css/header01.css"
			rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/css/index.css"
			type="text/css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/catalog.css"
			type="text/css" rel="stylesheet" />


		<script type="text/javascript">
function setAction(action){
document.forms[0].action="search.do?page="+document.getElementById("pageId").value+"&totalPages="+document.getElementById("totalPages").value+"&catalogName="+<%=request.getAttribute("catalogName")%>+"&searchContent=<%=request.getAttribute("searchStr")%>"; 
document.forms[0].submit();
}
</script>
	</head>
	<body>
		<center>
			<jsp:include flush="true" page="top.jsp" />
			<form action="" method="post">
					<table width="98%" cellspacing="1" cellpadding="2" bgcolor="#e1e1e1" border="0">
						<tr>
							<td>
								��ƷԤ��
							</td>
							<td>
								��Ʒ����
							</td>
							<td>
								��Ʒ�۸�
							</td>
						</tr>
						<logic:present name="ppage" scope="request">
							<logic:present name="ppage" property="resultList" scope="request">
								<logic:iterate id="item" name="ppage" property="resultList"
									scope="request">
									<tr>
										<td align="center" bgcolor="#ffffff">

											<table onmouseover="this.style.backgroundColor='#FF4FAE'"
												onmouseout="this.style.backgroundColor=''" width="100"
												cellspacing="1" cellpadding="2" bgcolor="#e1e1e1" border="0">
												<tr>
													<td bgcolor="#ffffff" height="100" align="center">
														<a
															href="indexFirst.do?status=onlyGoodsShow&productId=${item.productId}">
															<img
																src="<%=name2 %>\<bean:write name="item" property="smallPath"/>"
																width="100" height="100" border="0" /></a>
													</td>
												</tr>
											</table>

										</td>
										<td align="left" bgcolor="#ffffff">
											<a
												href="indexFirst.do?status=onlyGoodsShow&productId=${item.productId}">
												<font color="#ff6600">${item.productName}</font> </a>
											<br />
											<br />
											${item.productIntro}
											<br />
											<br />
											�ϼ�ʱ��:${item.displayDate}

										</td>
										<td bgcolor="#ffffff">

											<table>
												<tr>
													<td>
														�г���:
													</td>
													<td>
														${item.marketPrice}
													</td>
												</tr>
												<tr>
													<td>
														��Ա��:
													</td>
													<td>
														${item.memberPrice}
													</td>
												</tr>
												<tr>
													<td>
														<a
															href="indexFirst.do?status=onlyGoodsShow&productId=${item.productId}"><img
																src="images/goumai.gif"></img> </a>
													</td>
													<td>
														<img src="images/shoucang1.gif"></img>
													</td>
												</tr>
											</table>

										</td>
									</tr>
								</logic:iterate>
							</logic:present>
						</logic:present>
					</table>
					<table class="tbl" width="98%" cellspacing="0" cellpadding="0">
						<tr>
							<td class="main" align="left">
								<%
										Page p = (Page) request.getAttribute("ppage");
										int currentPage = p.getCurrentPage();
									%>
								<a
									href="search.do?targetPage=1&catalogName=<%=request.getAttribute("catalogName")%>&searchContent=<%=request.getAttribute("searchStr")%>"
									class="pagenav">��ҳ</a>
								<%
										if (p.isHasPrevious()) {
									%>
								<a
									href="search.do?targetPage=<%=currentPage == 1 ? 1 : currentPage - 1%>&catalogName=<%=request.getAttribute("catalogName")%>&searchContent=<%=request.getAttribute("searchStr")%>"
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
									href="search.do?&targetPage=<%=currentPage == p.getTotalPages() ? p
						.getTotalPages() : currentPage + 1%>&catalogName=<%=request.getAttribute("catalogName")%>&searchContent=<%=request.getAttribute("searchStr")%>"
									class="pagenav">��һҳ</a>
								<%
										} else {
									%>
								��һҳ
								<%
										}
									%>
								<a
									href="search.do?targetPage=<%=p.getTotalPages()%>&catalogName=<%=request.getAttribute("catalogName")%>&searchContent=<%=request.getAttribute("searchStr")%>"
									class="pagenav">ĩҳ</a>&nbsp;&nbsp;��<%=currentPage%>ҳ/ ��<%=p.getTotalPages()%>ҳ
								&nbsp;&nbsp;��
								<bean:write name="ppage" property="totalRecords" />
								����¼
							</td>

							<td align="right" class="main">
								ת
								<input type="text" name="page" id="pageId" class="inp_page"
									value="" size="2" onkeypress="number()" />
								ҳ
								<input type="button" value="Go" onclick="setAction('qry')"
									class="button" />
								<input type="hidden" id="totalPages" name="totalPages"
									value="<bean:write name="ppage" property="totalPages"/>" />
							</td>
						</tr>
					</table>
				


				<div align="center">
					<input type="hidden" name="catalogName" id="catalogName"
						value="<%=request.getAttribute("catalogName")%>" />
					<jsp:include flush="true" page="bottom.jsp" />
				</div>

			</form>
		</center>
	</body>
</html>