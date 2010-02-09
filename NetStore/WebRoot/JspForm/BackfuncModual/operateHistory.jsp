<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base /> 
    <title>������ʷ</title> 
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css" />
  </head>
  
  <body background="<%=request.getContextPath()%>/images/bg.gif">
  <center>
  	    <table width="80%" class="tbl">
  	        <tr>
  	            <td align="left" class="main">
  	             ������:${orderId }
  	            </td>
  	        </tr>
  	     <tr>
  	     <td>
    	<table class="tbl" width="100%"  cellspacing="0" cellpadding="0">

			<thead>
    		<tr>
    			<th align="center">��ˮ��</th><th align="center">����ʱ��</th><th align="center">����״̬</th><th align="center">��������</th>
    			<th align="center">�������û���</th><th align="center">ע��</th>
    		</tr>
    		</thead>
    		<tbody>
    		<logic:present name="operateHistoryList">
    			<logic:iterate id="item" name="operateHistoryList">
    				<tr>
    					<td align="center" class="main">
    					${item.sequenceNum }
    					</td>
    					<td align="center" class="main">
    					${item.occurTime }
    					</td>
    					<td align="center" class="main">
    					${item.orderStatusName}
    					</td>
    					<td align="center" class="main">
    					${item.operateObject }
    					</td>
    					<td align="center" class="main">
    					${item.operatePerson }
    					</td>
    					<td align="center" class="main">
    					${item.remark }
    					</td>
    				</tr>  
    			</logic:iterate>
    		</logic:present>
    		</tbody>
    		<tr>
    		    <td colspan="6" align="left" class="main">
    		        &nbsp;&nbsp;<input type="button" value="����" onClick="history.back();" class="button"/>
    		    </td>
    		</tr>
    	</table> 
    	   
    	</td>
    	</tr>
        </table>
         </center>
  </body>
</html:html>
