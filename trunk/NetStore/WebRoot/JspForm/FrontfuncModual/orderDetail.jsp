<%@ page language="java" import="java.util.Map" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html:html lang="true">
<head>
	<html:base />
	<title>������ϸ</title>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/jquery.js"></script>
	<link href="<%=request.getContextPath()%>/css/header01.css"
		rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/index.css"
		type="text/css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/catalog.css"
		type="text/css" rel="stylesheet" />

	<script type="text/javascript">
       function Modify(type){
          var url;
          if(type==1){
              url="<%=request.getContextPath()%>/JspForm/FrontfuncModual/sendInfoModify.jsp";
		  }else if(type==2){
		      url="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do?status=querySendMode&orderId=${mapAllUserInfo.orderId}";
		  }else if(type==3){
		      url="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do?status=queryPayType&orderId=${mapAllUserInfo.orderId}";
		  }else if(type==4){
		      url="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do?status=queryBuyInfo&orderId=${mapAllUserInfo.orderId}";
		  }
		  window.location.href=url;
       }
    </script>
</head>

<body>
	<div align="center">
		<jsp:include page="top.jsp" />

		<table width="98%">
			<tr>
				<td align="left">
					<a
						href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do?status=queryOrderByCondition">�ҵ��˻�</a>
					> ������Ϣ > ����#${mapAllUserInfo.orderId} > �鿴������ϸ
				</td>
			</tr>
			<tr>
				<td width="100%">
					<table width="100%" align="center" cellspacing="1" cellpadding="2"
						bgcolor="#e1e1e1" border="0">
						<tr>
							<td align="left" width="20%" bgcolor="#ffffff">
								������:${mapAllUserInfo.orderId }
							</td>
							<td width="50%" bgcolor="#ffffff">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td align="right" width="30%" bgcolor="#ffffff">
								����ʱ��:${mapAllUserInfo.downOrderTime }
							</td>
						</tr>
						<tr>
							<td colspan="3" bgcolor="#ffffff">
								<table width="100%" align="center" cellspacing="1"
									cellpadding="2" bgcolor="#e1e1e1" border="0">
									<tr>
										<td colspan="2" bgcolor="#ffffff" align="left">
											${mapAllUserInfo.orderStatus }
										</td>

										<%
											request.setAttribute("abc", new String("abcd"));
										%>

									</tr>
									<tr>
										<td colspan="2" bgcolor="#ffffff" align="left">
											���Ķ�������1������
										</td>
									</tr>
									<tr>
										<td nowrap="nowrap" align="left" bgcolor="#ffffff">
											���͵�ַ:
											<input type="button" value="�޸�" onclick="Modify('1')" />
											<br />
											�� ${mapAllUserInfo.receiveName }
											<br />
											�� ${mapAllUserInfo.receiveAddress }
											<br />
											�� �ʱ�:${mapAllUserInfo.receivePostCode }
											<br />
											�� �绰:${mapAllUserInfo.receivePhone }
											<br />
											�� �ֻ�:${mapAllUserInfo.receiveCellPhone }
											<br />
											�ͻ���ʽ:
											<input type="button" value="�޸�" onclick="Modify('2')" />
											<br/>
											�� ${mapAllUserInfo.sendModeName}
										</td>
										<td nowrap="nowrap" bgcolor="#ffffff" valign="top">
											<table width="100%" height="100%" align="center"
												cellspacing="1" cellpadding="2" bgcolor="#e1e1e1" border="0">
												<tr>
													<td bgcolor="#ffffff" align="center">
														��Ʒ���
													</td>
													<td bgcolor="#ffffff" align="center">
														��Ʒ����
													</td>
													<td bgcolor="#ffffff" align="center">
														����
													</td>
													<td bgcolor="#ffffff" align="center">
														����
													</td>
												</tr>
												<logic:present name="listOrderDetail">
													<logic:iterate id="item" name="listOrderDetail">
														<tr>
															<td align="center" bgcolor="#ffffff">
																${item.productId }&nbsp;
															</td>
															<td align="center" bgcolor="#ffffff">
																${item.productName }&nbsp;
															</td>
															<td align="center" bgcolor="#ffffff">
																${item.quantity}&nbsp;
															</td>
															<td align="center" bgcolor="#ffffff">
																��${item.memberPrice }/${item.unitName}&nbsp;
															</td>
														</tr>
													</logic:iterate>
												</logic:present>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>

					<table width="100%" align="center" cellspacing="1" cellpadding="2"
						bgcolor="#e1e1e1" border="0">
						<tr>
							<td colspan="2" bgcolor="#ffffff" align="left">
								����֧����Ϣ
							</td>
						</tr>
						<tr>
							<td align="left" bgcolor="#ffffff">
								���ʽ:
								<input type="button" value="�޸�" onclick="Modify('3')" />
								<br />
								�� ${mapAllUserInfo.payTypeName}
							</td>
							<td align="right" bgcolor="#ffffff">
								�ܽ��:��${mapAllUserInfo.allSum }Ԫ
							</td>
						</tr>
					</table>
					<table width="100%" align="center" cellspacing="1" cellpadding="2"
						bgcolor="#e1e1e1" border="0">
						<tr>
							<td width="100%" bgcolor="#ffffff" align="left">
								��������Ϣ:
								<input type="button" value="�޸�" onclick="Modify('4')" />
							</td>
						</tr>
						<tr>
							<td align="left" colspan="3" bgcolor="#ffffff">
								�� ������: ${mapAllUserInfo.sendUserName }&nbsp;
								<br />
								�� ��ַ: ${mapAllUserInfo.sendAddress }
								<br />
								�� �ʱ�: ${mapAllUserInfo.sendPostCode }
								<br />
								�� �绰: ${mapAllUserInfo.sendPhone }&nbsp;
								<br />
								�� �ֻ�: ${mapAllUserInfo.sendCellPhone}
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<%
				//�����޸�ҳ��
					Map map = (Map) request.getAttribute("mapAllUserInfo");
					session.setAttribute("receiveInfo", map);
			%>
		</table>
		<jsp:include flush="true" page="bottom.jsp" />
	</div>
</body>
</html:html>
