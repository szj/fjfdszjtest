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
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/jquery.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/jquery.js"></script>
	<script type="text/javascript">
    	function ifShow(){
    	    var ifSame=document.getElementById("ifSame");
    	    if(document.all.ifSame[0].checked){
    	        $("#tr1").hide();
    	    }
    	    else if(document.all.ifSame[1].checked){
    	        $("#tr1").show();
    	    }
    	}
    	
    	function CheckValue(){
    	    
    	}
    	
    	function hide(){
    	    document.all.ifSame[0].checked=true;
    	}
    	
	</script>
</head>

<body onload="hide()">
<jsp:include page="top.jsp" />
	<form action="<%=request.getContextPath()%>/JspForm/FrontfuncModual/cart.do"
		method="post">
		<center>
			
			<table width="98%" align="center" cellspacing="1" cellpadding="2"
				bgcolor="#e1e1e1" border="0">
				<tr>
					<td bgcolor="#ffffff" align="left">
						���������͵�ַ
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff">
						<table border="0" width="100%">
							<tr>
								<td align="right" width="35%" bgcolor="#ffffff">
									�ջ�������:
								</td>
								<td width="65%" bgcolor="#ffffff" align="left">
									<input type="text" name="receiveUserName"
										value="${infoMap.receiveUserName}" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="#ffffff">
									��������:
								</td>
								<td bgcolor="#ffffff" align="left">
									<input type="text" name="receivePostCode"
										value="${infoMap.receivePostCode }" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="#ffffff">
									�绰:
								</td>
								<td bgcolor="#ffffff" align="left">
									<input type="text" name="receivePhone"
										value="${infoMap.receivePhone }" />
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="#ffffff">
									�ֻ�:
								</td>
								<td bgcolor="#ffffff" align="left">
									<input type="text" name="receiveCellPhone"
										value="${infoMap.receiveCellPhone }" />
									<font color="red">���ֻ��͵绰������һ����</font>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="#ffffff">
									�ջ��˵�ַ:
								</td>
								<td bgcolor="#ffffff" align="left">
									<input type="text" name="receiveAddress" size="50"
										value="${infoMap.receiveAddress }" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="#ffffff">
									���������ջ����Ƿ���ͬ
									<font color="red">*</font>:
								</td>
								<td bgcolor="#ffffff" align="left">
									<input type="radio" name="ifSame" value="1" checked="checked"
										onclick="ifShow();" />
									��ͬ
									<input type="radio" name="ifSame" value="0" onclick="ifShow();" />
									����ͬ
								</td>
							</tr>
							<tr id="tr1" style="display: none">
								<td bgcolor="#ffffff">
									&nbsp;
								</td>
								<td >
									<table width="69%" align="center" cellspacing="1"
										cellpadding="2" bgcolor="#e1e1e1" border="0">
										<tr>
											<td align="right" bgcolor="#ffffff">
												<font color="red">*</font>����������:
											</td>
											<td bgcolor="#ffffff" align="left">
												<input type="text" name="sendUser"
													value="${infoMap.realName}" />
											</td>
										</tr>
										<tr>
											<td align="right" bgcolor="#ffffff">
												<font color="red">*</font>��������:
											</td>
											<td bgcolor="#ffffff" align="left">
												<input type="text" name="sendPostCode"
													value="${infoMap.postCode }" />
											</td>
										</tr>
										<tr>
											<td align="right" bgcolor="#ffffff">
												�绰:
											</td>
											<td bgcolor="#ffffff" align="left">
												<input type="text" name="sendPhone"
													value="${infoMap.phone }" />
											</td>
										</tr>
										<tr>
											<td align="right" bgcolor="#ffffff">
												�ֻ�:
											</td>
											<td bgcolor="#ffffff" align="left">
												<input type="text" name="sendCellPhone"
													value="${infoMap.cellPhone }" />
												<font color="red">���ֻ��͵绰������һ����</font>
											</td>
										</tr>
										<tr>
											<td align="right" bgcolor="#ffffff">
												<font color="red">*</font>��ϸ��ַ:
											</td>
											<td bgcolor="#ffffff" align="left">
												<input type="text" name="sendAddress" size="50"
													value="${infoMap.address }" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" bgcolor="#ffffff">
						<input type="submit" value="��һ��" onclick="CheckValue()" />
						<input type="hidden" name="goFlag" value="${goFlag }" />
						<input type="hidden" name="status" value="updateReceiverInfo" />
					</td>
				</tr>
			</table>
			<div align="center">
				<jsp:include flush="true" page="bottom.jsp" />
			</div>
		</center>
	</form>
</body>
</html:html>

