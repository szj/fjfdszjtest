<%@ page language="java"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  

  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>��վ�̳�</title>
		<link href="<%=request.getContextPath()%>/css/header01.css"
			rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/css/index.css"
			type="text/css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/catalog.css"
			type="text/css" rel="stylesheet" />
		<script type="text/javascript">
		    function deleteProduct(productId)
            {
                document.forms[0].action='<%=request.getContextPath()%>/JspForm/FrontfuncModual/cart.do?status=deleteProduct&goods='+productId+"&goFlag=${goFlag}";
                document.forms[0].submit();
            }	
            function modifyNumber(thisForm){
                thisForm.action='<%=request.getContextPath()%>/JspForm/FrontfuncModual/cart.do?status=modifyProductNum'+"&goFlag=${goFlag}";
                thisForm.submit();
            }
            function entryCounterCenter(){
                document.forms[0].action='<%=request.getContextPath()%>/JspForm/FrontfuncModual/cart.do?status=toModifyReceiver&goFlag=${goFlag }';
                document.forms[0].submit();
            }
            
            function clearCart(){
                document.forms[0].action='<%=request.getContextPath()%>/JspForm/FrontfuncModual/cart.do?status=clearCart';
                document.forms[0].submit();
            }
            function goshopping(){
                document.forms[0].action='<%=request.getContextPath()%>/indexFirst.do?status=exec';
                document.forms[0].submit();
            }
		</script>
	</head>
	<body>
		<center>
			<jsp:include flush="true" page="top.jsp" />
			<form action="" method="post">
				<table width="98%" align="center" cellspacing="1" cellpadding="2" bgcolor="#e1e1e1" border="0">
					<tr>
						<td bgcolor="#ffffff">
							<h3>
								�ҵĹ��ﳵ
							</h3>
						</td>
						<td bgcolor="#ffffff">
							������޸�����Ʒ����,����
							<input type="button" value="����" onclick="modifyNumber(this.form)" />
						</td>
						<td bgcolor="#ffffff">
							<input type="button" value="��չ��ﳵ" onclick="clearCart()" />
						</td>
						<td bgcolor="#ffffff">
							<input type="button" value="������ѡ��Ʒ" onclick="goshopping()" />
						</td>
						<td bgcolor="#ffffff">
							<input type="button" value="�����������"
								onclick="entryCounterCenter()" />
						</td>
					</tr>
				</table>
				<table width="98%" align="center" cellspacing="1" cellpadding="2" bgcolor="#e1e1e1" border="0">
					<tr>
						<td bgcolor="#ffffff">
							�ҵĹ��ﳵ�����Ʒ--���Ϲ���
						</td>
						<td bgcolor="#ffffff">
							�г���
						</td>
						<td bgcolor="#ffffff">
							��Ա��
						</td>
						<td bgcolor="#ffffff">
							��λ
						</td>
						<td bgcolor="#ffffff">
							����
						</td>
						<td bgcolor="#ffffff">
							&nbsp;
						</td>
					</tr>
					<logic:present name="cart">
						<logic:iterate id="item" name="cart" property="items">
							<input type="hidden" name="productId" value="${item.key}" />
							<tr>
								<td bgcolor="#ffffff">
									${item.value.product.productname}
								</td>
								<td style="text-decoration: line-through;" bgcolor="#ffffff">
									��${item.value.product.marketPrice}Ԫ
								</td>
								<td bgcolor="#ffffff">
									��${item.value.product.memberPrice}Ԫ
								</td>
							
								<td bgcolor="#ffffff">
									${item.value.product.unitName }
								</td>
								<td bgcolor="#ffffff">
									<input maxLength="10" size="10"  value="${item.value.number}"
										name="${item.key}"
										onkeyup="this.value=this.value.replace(/\D/g,'')" />

									<fmt:formatNumber var="total"   value= "${total+item.value.product.memberPrice *item.value.number }" type="currency"/> 
				
									<fmt:formatNumber var="save"
										value="${save+(item.value.product.marketPrice-item.value.product.memberPrice)*item.value.number}" type="currency" />
								</td>
								<td bgcolor="#ffffff">
									<input type="button" value="ɾ��"
										onclick="deleteProduct('${item.value.product.productId}')" />
								</td>
							</tr>
						</logic:iterate>
					</logic:present>
					
				</table>
				<table width="90%">
					<tr>
						<td>
							������޸�����Ʒ����,����
							<input type="button" value="����" onclick="modifyNumber(this.form)" />
						</td>
						<td>
							����:${total }Ԫ &nbsp;&nbsp;&nbsp;��ʡ:${save }Ԫ
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="button" value="�����������"
								onclick="entryCounterCenter()" />
						</td>
					</tr>
				</table>
			</form>
			<jsp:include flush="true" page="bottom.jsp" />
		</center>
	</body>
</html>
<script type="text/javascript">
   	<logic:present name="xgResult">
   	    alert("${xgResult}");
   	</logic:present>
</script>