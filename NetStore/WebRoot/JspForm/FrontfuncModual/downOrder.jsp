<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html:html lang="true">
<head>
	<html:base />
	<title>��������:��д�ջ���ַ</title>
	<link href="<%=request.getContextPath()%>/css/header01.css"
		rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/index.css"
		type="text/css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/catalog.css"
		type="text/css" rel="stylesheet" />
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/jquery.js"></script>
	<script type="text/javascript">
	    function pay(){
	        
	    }
	</script>
</head>

<body>
	<center>
		<jsp:include page="top.jsp" />
		<form
			action="https://payment.chinapay.com/pay/TransGet"
			method="get">
			<table width="98%" align="center" cellspacing="1" cellpadding="2"
				bgcolor="#e1e1e1" border="0">
				<tr>
					<td valign="middle" bgcolor="#ffffff" align="left">
						<h3>
							��л���Ķ���
						</h3>
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" align="left">
						���Ķ������Ϊ${payTypeMap.orderId},�Ѿ��ͽ��������ģ��ܿ���Ϳ����յ������ˡ�
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" align="left">
						����Ҫ֧���Ľ��Ϊ${allSum}Ԫ��ף��������죡
						<input type="hidden" name="MerId" value="${MerId }" />
						<input type="hidden" name="OrdId" value="${OrdId }" />
						<input type="hidden" name="TransAmt" value="${TransAmt}" />
						<input type="hidden" name="CuryId" value="156" />
						<input type="hidden" name="TransDate" value="${TransDate }" />
						<input type="hidden" name="TransType" value="0001" />
						<input type="hidden" name="Version" value="20040916" />
						<input type="hidden" name="BgRetUrl"
							value="http://www.eeu8.com/pay.do?status=test" />
						<input type="hidden" name="PageRetUrl"
							value="localhost:8088/pay.do" />
						<input type="hidden" name="ChkValue"
							value="${ChkValue }" />
						<input type="hidden" name="GateId" value=""/>
						<input type="hidden" name="Priv1" value="Memo"/> 
						<input type="submit" value="����֧��" />
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" align="left">
						������ڸ���������������⣬�����Բ���ͷ�����15905094440Ѱ����������7��û��֧���ɹ������Ķ�������ȡ����
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" align="left">
						����������²���
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" align="left">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a
							href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do?status=getOrderDetails&orderId=${payTypeMap.orderId}">�鿴��༭�ҵĶ���</a>
						<br />
						���ҵ��ʻ��п��Բ�ѯ������ȡ�����������и��๦�ܣ��������ھ�ȥ
						<a
							href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do?status=queryOrderByCondition">�ҵ��˻�</a>������
					</td>
				</tr>
			</table>
		</form>
		<jsp:include flush="true" page="bottom.jsp" />
	</center>
</body>
</html:html>



