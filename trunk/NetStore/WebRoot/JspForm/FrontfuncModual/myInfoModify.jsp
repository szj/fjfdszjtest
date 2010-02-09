<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html:html lang="true">
<head>
	<html:base />
	<title>�޸��û�����ϵ��Ϣ</title>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/jquery.js"></script>
		<link href="<%=request.getContextPath()%>/css/header01.css"
		rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/index.css"
		type="text/css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/catalog.css"
		type="text/css" rel="stylesheet" />
</head>

<body>
	<center>
		<jsp:include page="top.jsp" />
		<table width="98%" align="center" cellspacing="1" cellpadding="2"
			bgcolor="#e1e1e1" border="0">
			<tr>
				<td bgcolor="#ffffff" align="left">
					<a
						href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do?status=queryOrderByCondition">�ҵ��˻�</a>
					> �޸��ҵ���ϵ��Ϣ
				</td>
			</tr>
			<tr>
				<td bgcolor="#ffffff">
					<form
						action="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do"
						method="post">
						<table  width="100%">
							<tr>
								<td align="left">
									�޸��ҵ���ϵ��Ϣ
								</td>
							</tr>
							<tr>
								<td>
									<table  width="100%">
										<tr>
											<td align="right" width="30%">
												�ҵ�����:
											</td>
											<td align="left">
												<input type="text" name="realName"
													value="${userInfoMap.realName}" />
											</td>
										</tr>
										<tr>
											<td align="right">
												�Ա�:
											</td>
											<td align="left">
												<input type="radio" name="sex" value="1"
													${userInfoMap.sex==1? 'checked':'' }/>
												��
												<input type="radio" name="sex" value="0"
													${userInfoMap.sex==0? 'checked':'' }/>
												Ů
											</td>
										</tr>
										<tr>
											<td align="right">
												�����ʼ�:
											</td>
											<td align="left">
												<input type="text" name="email" value="${userInfoMap.email}" />
											</td>
										</tr>
										<tr>
											<td align="right">
												��������:
											</td>
											<td align="left">
												<input type="text" name="postCode"
													value="${userInfoMap.postCode }" />
											</td>
										</tr>
										<tr>
											<td align="right">
												�绰:
											</td>
											<td align="left">
												<input type="text" name="phone"
													value="${userInfoMap.phone }" />
											</td>
										</tr>
										<tr>
											<td align="right">
												�ֻ�:
											</td>
											<td align="left">
												<input type="text" name="cellPhone"
													value="${userInfoMap.cellPhone }" />
												<font color="red">���ֻ��͵绰������һ����</font>
											</td>
										</tr>
										<tr>
											<td align="right">
												�ҵ���ϵ��ַ:
											</td>
											<td align="left">
												<input type="text" name="address" size="50"
													value="${userInfoMap.address}" />
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<center>
													<input type="button" value="����" />
													&nbsp;&nbsp;&nbsp;
													<html:submit value="����޸�"></html:submit>
													<input type="hidden" name="orderId"
													value="${receiveInfo.orderId}" />
												<input type="hidden" name="status" value="updateMyInfo" />
												</center>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
		<jsp:include flush="true" page="bottom.jsp" />
	</center>
</body>
</html:html>

