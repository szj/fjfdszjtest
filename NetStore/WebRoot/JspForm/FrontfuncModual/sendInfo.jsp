<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base />
	<title>��������:��д�ջ���ַ</title>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/jquery.js"></script>
</head>

<body>
	<form action="<%=request.getContextPath()%>/JspForm/FrontfuncModual/cart.do" method="post">
		<table width="40%" border="1">
			<tr>
				<td>
					�޸�������Ϣ
				</td>
			</tr>
			<tr>
				<td>
					<table border="1" width="100%">
						<tr>
							<td align="right">
								�ջ�������:
							</td>
							<td>
								<input type="text" name="receiveUser"
									value="${receiveInfo.receiveName}" />
							</td>
						</tr>
						<tr>
							<td align="right">
								��������:
							</td>
							<td>
								<input type="text" name="receivePostCode"
									value="${receiveInfo.receivePostCode }" />
							</td>
						</tr>
						<tr>
							<td align="right">
								�绰:
							</td>
							<td>
								<input type="text" name="receivePhone"
									value="${receiveInfo.receivePhone }" />
							</td>
						</tr>
						<tr>
							<td align="right">
								�ֻ�:
							</td>
							<td>
								<input type="text" name="receiveCellPhone"
									value="${receiveInfo.receiveCellPhone }" />
								<font color="red">���ֻ��͵绰������һ����</font>
							</td>
						</tr>
						<tr>
							<td align="right">
								�ջ��˵�ַ:
							</td>
							<td>
								<input type="text" name="receiveAddress" size="50"
									value="${receiveInfo.receiveAddress }" />
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
								<input type="hidden" name="orderId"
									value="${receiveInfo.orderId}" />
								<input type="hidden" name="status" value="updateReceiveInfo" />
							</td>
							<td>
								<center>
									<input type="button" value="����" />
									&nbsp;&nbsp;&nbsp;
									<html:submit value="����޸�"></html:submit>
								</center>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html:html>

