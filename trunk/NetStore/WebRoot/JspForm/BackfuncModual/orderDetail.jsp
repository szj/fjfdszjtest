<%@ page language="java"  pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base /> 
    <title>������ϸ</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jslib/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css" />
    <script type="text/javascript">
    	function check(orderId,nextOrderStatus){
    	    var orderStatus=nextOrderStatus-1;
    	    var info;
    	    if(orderStatus==2){
    	       info="��ȷ���ö�����ȫ����������?";
    	       toConfirm(orderId,nextOrderStatus,info);
    	    }
    	    else if(orderStatus==3){
    	       info="��ȷ��������������?";
    	       toConfirm(orderId,nextOrderStatus,info);
    	    }
    	    else if(orderStatus==4){
    	       info="��ȷ���ö����ѷ�������?";
    	       toConfirm(orderId,nextOrderStatus,info);
    	    }
    	    else if(orderStatus==5){
    	       info="��ȷ��������յ���������?";
    	       toConfirm(orderId,nextOrderStatus,info);
    	    }
    	}
    	
    	function toConfirm(orderId,nextOrderStatus,info){
    	  if(confirm(info)){
    	  var url="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=changeOrderStatus&orderId="+
    	      orderId+"&nextOrderStatus="+nextOrderStatus;
		      window.location.href=url;
		  }
		  else 
		    return false;
    	}
    	
    	function toOperateHistory(orderId){
    	    var url="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=queryOperateHistory&orderId="+orderId;
    	    window.location.href=url;
    	}
    </script>
  </head>
  
  <body background="<%=request.getContextPath()%>/images/bg.gif"> 
  <center>
    	<table width="80%" class="tbl">
		   	<tr>
			    <td align="left" width="40%" class="main">������:${mapAllUserInfo.orderId }<font color="red">(${mapAllUserInfo.orderStatus })</font></td>
			    <td align="right" width="60%" class="main">����ʱ��:${mapAllUserInfo.downOrderTime }</td>   
			</tr>
			<tr>
			    <td colspan="3" >
			        <table class="tbl" width="100%"  cellspacing="0" cellpadding="0" >
			            <tr>
			                <td colspan="4" class="main"  align="left" >��������Ϣ</td><td class="main"  align="center">֧����ʽ</td><td class="main"  align="left" >${mapAllUserInfo.payTypeName}&nbsp;
			            </tr>
			            <tr>
			                <td class="main"  align="center">����</td><td class="main" align="left">${mapAllUserInfo.sendUserName }&nbsp;</td><td class="main"  align="center">��ϵ�绰</td>
			                <td align="left" class="main" >${mapAllUserInfo.sendPhone }&nbsp;</td><td class="main" align="center">��ϵ�ֻ�</td>
			                <td align="left" class="main"  >${mapAllUserInfo.sendCellPhone }&nbsp;</td>
			            </tr>
			            <tr>
			                <td align="center" class="main" >��ַ</td><td colspan="3" class="main"  align="left">${mapAllUserInfo.sendAddress }&nbsp;</td><td class="main"  align="center">�ʱ�</td><td class="main" align="left">${mapAllUserInfo.sendPostCode }</td>
			            </tr>
			            <tr>
			                <td align="center" class="main" >����Ҫ��</td><td colspan="5" class="main" align="left" >Ь��Ҫ40���,��ɫ��ɫ�ȵ�</td>
			            </tr>
			            <tr>
			                <td colspan="4" class="main"  align="left">�ջ�����Ϣ</td><td align="center" class="main" >�ͻ���ʽ</td><td class="main" align="left">${mapAllUserInfo.sendModeName}</td>
			            </tr>
			            <tr>
			                <td align="center" class="main" >����</td><td align="left" class="main" >${mapAllUserInfo.receiveName }&nbsp;</td><td align="center" class="main" >��ϵ�绰</td>
			                <td align="left" class="main" >${mapAllUserInfo.receivePhone }&nbsp;</td><td align="center" class="main" >��ϵ�ֻ�</td>
			                <td align="left" class="main" >${mapAllUserInfo.receiveCellPhone }&nbsp;</td>   
			            </tr>
			            <tr>
			                <td align="center" class="main" >��ַ</td><td colspan="3" class="main" align="left">${mapAllUserInfo.receiveAddress }&nbsp;</td><td align="center" class="main" >�ʱ�</td>
			                <td class="main" align="left">${mapAllUserInfo.receivePostCode }&nbsp;</td>
			            </tr>
			            <tr>
			                <td align="center" class="main" >ʱ��Ҫ��</td><td colspan="5" class="main" align="left">ֻ˫���ա������ͻ�</td>
			            </tr>
			            <tr>
			                <td colspan="4" class="main" >��������Ʒ</td><td align="center" class="main" >��Ʊ</td><td class="main" >${mapAllUserInfo.ifInvoice }&nbsp;</td>
			            </tr>
			            <tr>
			                <th align="center" class="main" >��Ʒ���</th><th colspan="3" class="main"  align="center">��Ʒ����</th><th align="center" class="main" >����</th><th align="center" class="main" >����</th>
			            </tr>
			            <logic:present name="listOrderDetail">
		                    <logic:iterate id="item" name="listOrderDetail">
		                         <tr>
			                        <td align="center" class="main">${item.productId }&nbsp;</td><td colspan="3" class="main" align="center">${item.productName }&nbsp;</td>
			                        <td align="center" class="main">��${item.memberPrice }/${item.unitName}&nbsp;</td><td align="center" class="main" align="center" >${item.quantity}&nbsp;</td>
			                     </tr>
		                    </logic:iterate>
		                </logic:present>
		                <tr>
		                    <td colspan="6" class="main" align="right">�ϼ�:��${mapAllUserInfo.allSum }Ԫ</td>
		                </tr>
			        </table>
			    </td>
			</tr>
			<tr>
			    <td colspan="7" nowrap="nowrap" class="main" align="left">
			        <logic:equal value="1" name="orderStatus" >
			            <input type="button" value="���ͨ��" class="button0000"  />&nbsp;&nbsp;
			        </logic:equal>
			        <logic:equal value="2" name="orderStatus">
			            <input type="button" value="����ȷ���Ѹ���" class="button0000" onclick="check('${mapAllUserInfo.orderId }','3' )"/>&nbsp;&nbsp;
			            <input type="button" value="��ӡ����"  class="button0000"/>&nbsp;&nbsp;
			        </logic:equal>
			        <logic:equal value="3" name="orderStatus">
			            <input type="button" value="������" class="button" onclick="check('${mapAllUserInfo.orderId }','4' )"/>&nbsp;&nbsp;
			            <input type="button" value="��ӡ����" class="button0000"/>&nbsp;&nbsp;
			        </logic:equal>
			        <logic:equal value="4" name="orderStatus">
			            <input type="button" value="ȷ���ѷ���"  class="button0000" onclick="check('${mapAllUserInfo.orderId }','5' )"/>&nbsp;&nbsp;
			            <input type="button" value="��ӡ���͵�" class="button0000"/>&nbsp;&nbsp;
			        </logic:equal>
			        <logic:equal value="5" name="orderStatus">
			            <input type="button" value="ȷ���û����ջ�" class="button0000" onclick="check('${mapAllUserInfo.orderId }','6' )"/>&nbsp;&nbsp;
			        </logic:equal>
			        <input type="button" value="������ʷ" onclick="toOperateHistory('${mapAllUserInfo.orderId}')" class="button"/>
                        &nbsp;&nbsp;
			        <input type="button" value="����" onClick="history.back();" class="button"/>
			       
			    </td>
			</tr>
    	</table>
    </center>
  </body>
</html:html>
