<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base />
	<title>��Ʒ�޸�</title>



	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/include/ext/resources/css/ext-all.css" />
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/include/ext/adapter/ext/ext-base.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/include/ext/ext-all.js"></script>

	<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/css.css" type="text/css">
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/jslib/setday.js"></script>



	<script type="text/javascript">
	function uploadSmallPic(object){
	
		document.forms[0].action='../../productModify.do?status=uploadSmallPic';
		document.forms[0].submit();
	}
	
	
function KeyPress(objTR)
{
   var txtval = objTR.value;
   var key = event.keyCode;
   if((key <48 || key >57)&&key !=46)
   {
         event.keyCode = 0;
   }
   else
   {
         if(key == 46)
         {
               if(txtval.indexOf(".") != -1 || txtval.length == 0)
                     event.keyCode = 0;
         }
   }
} 
</script>

	<script type="text/javascript">
var dWin=null;
function uploadSmallPic(str){			
var feather="dialogWidth=416px;scrollbars=yes;dialogHeight=187px";
dWin=showModelessDialog('JspForm/BackfuncModual/modifyUpSmall.jsp',window,feather);			
		}
		
		/////////////�ϴ���ͼƬ
var dwinBig=null;	
function uploadBig(str){
var feather="dialogWidth=416px;scrollbars=yes;dialogHeight=187px";
dwinBig=showModelessDialog('JspForm/BackfuncModual/modifyUpBig.jsp',window,feather);
		}
</script>
	<script type="text/javascript"> 	
function go() 
{ 
document.getElementById("UnitId").value="<bean:write name="UnitId"/>";
document.getElementById("shopIntroId").value="<bean:write name="productIntro"/>";
document.getElementById("ManufacturerId").value="<bean:write name="ManufacturerId"/>";
} 
</script>
	<script type="text/javascript"> 
 		function BackAction(obj)
 		{
		document.forms[0].action='../../productModify.do?status=modifyBack';
		document.forms[0].submit();
		}
				
function smallPicDetail(str){
			var url="productModify.do?status=showSmallPicture&picPath="+document.getElementById("smallPathId").value;
			var arg=document;
			var feather="dialogWidth=220px;scrollbars=yes;dialogHeight=220px";
			var sonvalue=window.showModalDialog(url,arg,feather);	
		
	}
	
	function bigPicDetail(str){
			var url="productModify.do?status=showBigPicture&picPath="+document.getElementById("bigPathId").value;
			var arg=document;
			var feather="dialogWidth=270px;scrollbars=yes;dialogHeight=270px";
			var sonvalue=window.showModalDialog(url,arg,feather);	
	}
		
 </script>

	<SCRIPT type="text/javascript">
	function cataValue(obj)
{

 var comboStr=document.getElementById("id").value;
 if(comboStr=="0")
 {
 alert("��ѡ��һ���������Ʒ����...");
 return false;
 }
  var productname=document.getElementById("productname").value;
 if(productname.trim()=="")
 {
 alert("����д��Ʒ����.");
 return false;
 }
 var brandNowID=document.getElementById("brandNowID").value;
 if(brandNowID.trim()=="")
 {
 alert("����д��ѡ��Ʒ��.");
 return false;
 }
 
 var UnitId=document.getElementById("UnitId").value;
 if(UnitId.trim()=="")
 {
 alert("��ʱû�е�λ,���ڵ�λ�������.");
 return false;
 }
 
 
 
   var marketPrice=document.getElementById("marketPrice").value;
 if(marketPrice.trim()=="")
 {
 alert("����д�г���.");
 return false;
 }
 
var memberPrice=document.getElementById("memberPrice").value;
 if(memberPrice.trim()=="")
 {
 alert("����д��Ա��.");
 return false;
 }
 var stock=document.getElementById("stock").value;
 if(stock.trim()=="")
 {
 alert("����д�������.");
 return false;
 }
 var ManufacturerId=document.getElementById("ManufacturerId").value;
 if(ManufacturerId.trim()=="")
 {
 alert("���޹�Ӧ��,�����������ҹ������.");
 return false;
 }

 return true;
}

function fnChange(){
var brandId=document.getElementById("brandId");

if(brandId.selectedIndex!=0)
{
document.getElementById("brandNowId").innerText=brandId.options[brandId.selectedIndex].text;
document.getElementById("brandNowId").value=brandId.options[brandId.selectedIndex].text;
}
}
</SCRIPT>
	<script type="text/javascript">
 <logic:present name="xgResult">
 	alert('${xgResult}');
 </logic:present>
 </script>



</head>

<body onload="go()" background="<%=request.getContextPath()%>/images/bg.gif">
	<html:form action="/productModify.do?status=save" method="post">
		<center>
			<logic:present name="productModifyList">
				<logic:iterate id="item" name="productModifyList">
					<table class="tbl" width="780" cellspacing="0" cellpadding="0"
						border="0" height="619">
						<tr>
							<td colspan="2" bgcolor="#009CD6"
								background="../../images/newsystem/th2.gif" class="txt_b"
								align="center">
								��Ʒ�鿴���޸�
							</td>
						</tr>
						<tr>
							<td class="main" align="left">
								��Ʒ���ࣺ
							</td>
							<td class="main" align="left">
								<%=request.getAttribute("catalogName") %>
								<input type="hidden" name="id" id="id"
									value="<%=request.getAttribute("id") %>" />
								<input type="hidden" name="catalogName" id="catalogName"
									value="<%=request.getAttribute("catalogName") %>" />
							</td>
						</tr>

						<tr>
							<td class="main" align="left">
								��Ʒ����:
							</td>
							<td class="main" align="left">
								<input type="text" name="productname"
									value="${item.productname}" /><font color="#ff0000">*</font>
							</td>
						</tr>

						<tr>
							<td class="main" align="left">
								Ʒ��:
							</td>
							<td class="main" align="left">
								<input id="brandNowID" type="text" name="brand"
									value="${item.brand}" />
								<select id="brandId" name="brandName" onchange="fnChange()">
									<logic:present name="brandList">
										<logic:iterate id="bitem" name="brandList" scope="request">
											<option value="${bitem.specificationId}">
												${bitem.specificationName}
											</option>
										</logic:iterate>
									</logic:present>
								</select><font color="#ff0000">*</font>
							</td>
						</tr>

						<tr>
							<td class="main" align="left">
								���:
							</td>
							<td class="main" align="left">
								<input type="text" name="specification"
									value="${item.specification}" />
							</td>
						</tr>

						<tr>
							<td class="main" align="left">
								��λ:
							</td>
							<td class="main" align="left">
								<select id="UnitId" name="UnitName">
									<logic:present name="unitList">
										<logic:iterate id="unitem" name="unitList" scope="request">
											<option value="${unitem.unitId}">
												${unitem.unitName}
											</option>
										</logic:iterate>
									</logic:present>
								</select>
							</td>
						</tr>
						<tr>
							<td class="main" align="left">
								�۸�:
							</td>
							<td class="main" align="left">
								<table>
									<tr>
										<td class="main">
											�г��ۣ�
										</td>
										<td class="main">
											<input type="text" name="marketPrice" size="12"
												onkeypress="KeyPress(this)" value="${item.marketPrice}" />
											Ԫ<font color="#ff0000">*</font>
										</td>
										<td class="main">
											&nbsp;��Ա�ۣ�
										</td>
										<td class="main">
											<input type="text" name="memberPrice" size="12"
												onkeypress="KeyPress(this)" value="${item.memberPrice}" />
											Ԫ<font color="#ff0000">*</font>
										</td>
									</tr>
								</table>

							</td>
						</tr>
						<tr>
							<td class="main" align="left">
								��������:
							</td>
							<td class="main" align="left">
								<table>
									<tr>
										<td class="main">
											���:
										</td>
										<td>
											<input type="text" name="stock" size="12"
												onkeypress="KeyPress(this)" value="${item.stock}" /><font color="#ff0000">*</font>
										</td>
									</tr>
								</table>

							</td>
						</tr>
						<tr>
							<td class="main" align="left">
								��ƷСͼ:
							</td>
							<td class="main" align="left">
								<input type="text" id="smallPathId" name="smallPath"
									value="${item.smallPath}" readOnly />
								<input type="button" value="�ϴ�Сͼ"
									onclick="uploadSmallPic('small')" class="button" />
								<input type="button" name="smallSee" value="�鿴ͼƬ"
									onclick="smallPicDetail('null')" class="button" />
							</td>
						</tr>
						<tr>
							<td class="main" align="left">
								��Ʒ��ͼ:
							</td>
							<td class="main" align="left">
								<input type="text" id="bigPathId" name="bigPath"
									value="${item.bigPath}" readOnly />
								<input type="button" value="�ϴ���ͼ"
									onclick="uploadBig('uploadBigPic')" class="button" />
								<input type="button" name="bigSee" value="�鿴ͼƬ"
									onclick="bigPicDetail('null')" class="button" />
							</td>

						</tr>
						<tr>
							<td class="main" align="left">
								��Ӧ��:
							</td>
							<td class="main" align="left">
								<select id="ManufacturerId" name="ManufacturerName">
									<logic:present name="ManufacturerList">
										<logic:iterate id="mitem" name="ManufacturerList"
											scope="request">
											<option value="${mitem.manufacturerId}">
												${mitem.manufacturerName}
											</option>
										</logic:iterate>
									</logic:present>
								</select>
							</td>
						</tr>
						<tr>
							<td class="main" align="left">
								�ϼ�ʱ��:
							</td>
							<td class="main" align="left">
								<%=request.getAttribute("displayDate")%>
							</td>
						</tr>
						<tr>
							<td class="main" align="left">
								����ʱ��:
							</td>
							<td class="main" align="left">
								<input type="text" name="productDate"
									value="<%=request.getAttribute("productDate")%>"
									onclick="setday(this)" readonly size="12" />
							</td>
						</tr>

						<tr>
							<td height="150" class="main" align="left">
								��Ʒ˵��:
							</td>
							<td class="main" align="left">
								<textarea id="shopIntroId" name="productIntro"
									style="width: 260; height: 150; overflow-x: visible; overflow-y: visible;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="main" align="left">
								�Ƿ񷢲�:
							</td>
							<td class="main" align="left">
								<input type="checkbox" name="chkIsRelease"
									<bean:write name="checkRelease"/> />
							</td>

						</tr>
						<tr>
							<td class="main" align="left">
								&nbsp;
							</td>
							<td class="main" align="left">
								<table>
									<tr>
										<td class="main">
											<input type="checkbox" name="chkIsNewGoods"
												<%=request.getAttribute("checkNewGoods")%> />
											��Ʒ
										</td>
										<td class="main">
											<input type="checkbox" name="chkIsCommend"
												<%=request.getAttribute("checkCommend")%> />
											�Ƽ�
										</td>
										<td class="main">
											<input type="checkbox" name="chkIsSpecialPrice"
												<%=request.getAttribute("checkSpecialPrice")%> />
											�ؼ�
										</td>
									</tr>
								</table>


							</td>
						</tr>
						<tr>
							<td colspan="2" class="main" align="center">
								<html:submit property="Save" value="�� ��" styleClass="button"  onclick="javascript:return cataValue(this);"/>
								<html:reset property="backValue" value="����" styleClass="button" />
								<html:cancel property="cancel" value="����"
									onclick="BackAction('back')" styleClass="button" />

							</td>
						</tr>
				<tr>
				<td colspan="2" class="main" align="left">
					��ע:<font color="#ff0000">* ��ʾΪ������</font>.
					</td>
				</tr>
					</table>
				</logic:iterate>
			</logic:present>
		</center>
		<input type="hidden" id="pId" name="pId"
			value="<%=request.getAttribute("pId") %>" />
		<input type="hidden" id="page" name="page"
			value="<%=request.getAttribute("page") %>" />
		<input type="hidden" id="selType" name="selType"
			value="<%=request.getAttribute("selTypeUrl") %>" />

	</html:form>
</body>
</html:html>
<script type="text/javascript">
	<c:if test="${xgResult!=null}">
   			 	alert('${xgResult}');
 	</c:if>
</script>
