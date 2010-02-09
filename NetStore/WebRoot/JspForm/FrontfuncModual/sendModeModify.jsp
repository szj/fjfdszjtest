<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html:html lang="true">
<head>
	<html:base />
	<title>�޸ĸ��ʽ</title>
	<link href="<%=request.getContextPath()%>/css/header01.css"
		rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/index.css"
		type="text/css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/catalog.css"
		type="text/css" rel="stylesheet" />
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/jquery.js"></script>
	<script type="text/javascript">
        function fillValue(fee){
            document.getElementById("sendFee").value=fee;
        }
    </script>
</head>

<body>
	<center>
		<jsp:include page="top.jsp" />
		<table width="98%" align="center" cellspacing="1" cellpadding="2" bgcolor="#e1e1e1" border="0">
			<tr>
				<td bgcolor="#ffffff" align="left">
					<a
						href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do?status=queryOrderByCondition">�ҵ��˻�</a>
					> ������Ϣ > ����#${orderId} > �޸��ͻ���ʽ
				</td>
			</tr>
			<tr>
				<td bgcolor="#ffffff">
					<form
						action="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do"
						method="post">
						<table width="100%">
							<tr>
								<td align="left">
									�޸ĸ��ʽ
								</td>
							</tr>
							<tr>
								<td align="left">
									<table width="100%">
										<tr>
											<td bgcolor="#ffffff">
												�ͻ���ʽ
											</td>
											<td bgcolor="#ffffff">
												�˷�
											</td>
											<td bgcolor="#ffffff">
												����ʱ��
											</td>
										</tr>
										<logic:present name="sendModeList">
											<logic:iterate id="item" name="sendModeList">
												<tr>
													<td>
														<input type="radio" name="sendModeId"
															${item.ifChecked} value="${item.sendModeId}"
															onclick="fillValue('${item.sendFee }')" />
														${item.sendModeName }
													</td>
													<td>
														${item.sendFee}Ԫ/��
														<logic:equal value="checked" name="item"
															property="ifChecked">
															<input type="hidden" name="oldSendFee"
																value='${item.sendFee}' />

														</logic:equal>
													</td>
													<td>
														${item.sendTime }
													</td>
												</tr>
											</logic:iterate>
										</logic:present>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<center>
										<input type="hidden" name="status" value="updateSendMode" />
										<input type="hidden" name="orderId" value="${orderId}" />
										<input type="hidden" name="sendFee" />
										<input type="button" value="����" />
										&nbsp;&nbsp;&nbsp;
										<html:submit value="����޸�"></html:submit>
									</center>
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

