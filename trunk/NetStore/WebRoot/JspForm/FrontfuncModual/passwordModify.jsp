<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>�����ҵ�����</title>
		<link href="<%=request.getContextPath()%>/css/header01.css"
			rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/css/index.css"
			type="text/css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/catalog.css"
			type="text/css" rel="stylesheet" />
		<script type="text/javascript">
   	    <logic:present name="xgResult">
   	        alert("${xgResult}");
   	    </logic:present>
    </script>
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
						> �����ҵ�����
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff">
						<form
							action="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do"
							method="post">
							<table width="100%" >
								<tr>
									<td align="left">
										�����ҵ�����
									</td>
								</tr>
								<tr>
									<td valign="middle" align="center">
										<span style="text-align: left">������6-12���ַ���ɣ���ʹ��Ӣ����ĸ�����ֻ���ŵ��������</span>
										<br />
										<table>
											<tr>
												<td align="right" width="30%">
													��������ľ�����:
												</td>
												<td align="left">
													<input type="password" name="old_password"
														value="${old_password}" />
												</td>
											</tr>
											<tr>
												<td align="right">
													������:
												</td>
												<td align="left">
													<input type="password" name="new_password1" />
													����Ϊ6-12λ�ַ�
												</td>
											</tr>
											<tr>
												<td align="right">
													������һ��������:
												</td>
												<td align="left">
													<input type="password" name="new_password2" />
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<input type="hidden" name="status" value="updateUserPwd" />
										<input type="button" value="����" />
										<input type="submit" value="����޸�" />
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
</html>

