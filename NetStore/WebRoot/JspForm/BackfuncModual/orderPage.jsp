<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base /> 
    <title>����</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css" />

  <style type="text/css">
    <!--

td {
	padding: 6px 11px;
	border-bottom: 1px solid #95bce2;
	vertical-align: left;
}

td * {
	padding: 6px 11px;
}

tr.alt td {
	background: #ecf6fc; /*���н������е�tr���ϱ���ɫ*/
}

tr.over td {
	background: #bcd4ec; /*��������������еı���ɫ*/
}
//-->
</style>
    <script type="text/javascript">
    	$(document).ready(function(){
    	//�����ʽ
    		$(".stripe tr").mouseover(function(){
    			$(this).addClass("over");
    		}).mouseout(function(){
    			$(this).removeClass("over");
    		});
    		$(".stripe tr:even").addClass("alt");
    		$("#myTable").tablesorter(); 
    	});
    </script>
  </head>
  
  <body background="<%=request.getContextPath()%>/images/bg.gif">
  <center>
  	   
    	<table class="tbl" width="80%"  cellspacing="0" cellpadding="0">
			<thead>
    		<tr>
    			<th align="center">������</th><th align="center">�û�</th><th align="center">�ܽ��</th><th align="center">���ͷ�</th>
    			<th align="center">����״̬</th><th align="center">֧����ʽ</th><th align="center">���ͷ�ʽ</th><th align="center">֧��״̬</th>
    			<th align="center">�µ�����</th><th>&nbsp;&nbsp;&nbsp;</th>
    		</tr>
    		</thead>
    		<tbody>
    		<logic:present name="listOrders">
    			<logic:iterate id="item" name="listOrders">
    				<tr>
    					<td class="main">
    					${item.OrderId }
    					</td>
    					<td class="main">
    					${item.UserId }
    					</td>
    					<td class="main"> 
    					��${item.AllSum }
    					</td>
    					<td class="main">
    					��${item.SendFee }
    					</td>
    					<td class="main">
    					${item.OrderStatusName }
    					</td>
    					<td class="main">
    					${item.PayTypeName }
    					</td>
    					<td class="main">
    					${item.SendModeName }
    					</td>
    					<td class="main">
    					${item.PayStatus }
    					</td>
    					<td class="main">
    					${item.DownOrderTime }
    					</td>
    					<td class="main">
    					<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=getOrderDetails&orderId=${item.OrderId}&orderStatus=${item.orderStatus }">����</a>
    					</td> 
    				</tr>  
    			</logic:iterate>
    		</logic:present>
    		</tbody>
    		
    	</table>
    </center>
  </body>
</html:html>
