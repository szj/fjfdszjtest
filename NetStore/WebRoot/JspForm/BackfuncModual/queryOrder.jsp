<%@ page language="java" pageEncoding="gbk"%>
<jsp:directive.page import="com.qzgf.NetStore.pub.*" />
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base /> 
    <title>������ѯ</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css" />
	<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/jslib/setday.js"></SCRIPT>
    <script type="text/javascript">
         function back(){
            window.location.href="<%=request.getContextPath()%>/JspForm/BackfuncModual/AdminIndex.jsp";
        }
        function setAction(){
            var page=document.getElementById("page").value;
            window.location.href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=queryOrders&page="+page;
        }
    </script>
  </head>
  
  <body background="<%=request.getContextPath()%>/images/bg.gif">
  <center>
      <form action="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do" method="get">
      <table class="tbl" width="80%"  cellspacing="0" cellpadding="0">
          <tr>
              <td colspan="2"  bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">  
                  ������ѯ
              </td>
          </tr>
          <tr>
              <td class="main" align="right" width="50%">
                ������
              </td>
              <td class="main" align="left">
                  <input type="text" name="orderId" id="orderId" value="${queryInfo.orderId }"/>
              </td>
          </tr>
          <tr>
              <td class="main" align="right">
                  ����״̬
              </td> 
              <td class="main" align="left">
                  <select id="orderStatus" name="orderStatus" style="width:150px">
                      <option value="0" >--��ѡ��--</option>
                      <option value="2" >�ȴ�����</option>
                      <option value="3" >�������</option>
                      <option value="4" >�ȴ�����</option>
                      <option value="5" >�Ѿ�����</option>
                      <option value="6" >�Ѿ��ջ�</option>
                      <option value="7" >��ȡ������</option>
                  </select>
              </td>
          </tr>
          <tr>
              <td class="main" align="right">
                  �û��ʺ�
              </td>
              <td class="main" align="left">
                <input type="text" name="userId" value="${queryInfo.userId}"/>
              </td>
          </tr>
          <tr>
              <td class="main" align="right">
                 �ܽ����ڵ���
              </td>
              <td class="main" align="left">
                <input type="text" name="allSum" value="${queryInfo.allSum }"/>Ԫ
              </td>
          </tr>
          <tr>
              <td class="main" align="right">
                 ֧����ʽ
              </td>
              <td class="main" align="left">
                  <select name="payTypeId" style="width:150px">
                      <option value="0">--��ѡ��--</option>
                      <logic:present name="listPayType">
                         <logic:iterate id="item" name="listPayType">
                            <option value="${item.PayTypeId }" ${queryInfo.payTypeId==item.PayTypeId?"selected":'' }>${item.PayTypeName }</option>
                         </logic:iterate> 
                      </logic:present>
                  </select> 
              </td>
           </tr>
           <tr>
              <td class="main" align="right" rowspan="2">
                 �µ����ڷ�Χ
              </td>
              <td class="main" align="left">
                  ��ʼ����(��)<input type="text" name="beginDay" onclick="setday(this)" size="8" value="${queryInfo.beginDay}"/><br>
                  ��������(��)<input type="text" name="endDay" onclick="setday(this)" size="8" value="${queryInfo.endDay}"/>
              </td>
                 
           </tr>
           <tr>
          </tr>
          <tr>
              <td colspan="2" class="main" align="center">
                  <input type="hidden" name="status" value="queryOrders" />
                  <input type="submit" value="��ѯ" class="button" /> <input type="reset" value="����" class="button" />
              </td>
          </tr>
      </table>
      </form>
  	<table class="tbl" width="80%"  cellspacing="0" cellpadding="0">
			
    		<tbody>
    		<logic:present name="ppage" scope="request"> 
			<logic:present name="ppage" property="resultList" scope="request">
				
    		    <thead>
    		<tr>
    		    <td colspan="10"  bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">
    		        �����б�
    		    </td>
    		</tr>
    		<tr>
    			<th>������</th><th>�û�</th><th>�ܽ��</th><th>���ͷ�</th>
    			<th>����״̬</th><th>֧����ʽ</th><th>���ͷ�ʽ</th><th>֧��״̬</th>
    			<th>�µ�����</th><th>&nbsp;&nbsp;&nbsp;</th>
    		</tr>
    		</thead>
    			<logic:iterate id="item" name="ppage" property="resultList"
					scope="request">
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
    					</td >
    					<td class="main">
    					<a href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=queryAndLoadOrder&orderId=${item.OrderId}">����</a>
    					</td> 
    				</tr>  
    			</logic:iterate>
			</logic:present>
		</logic:present>
		<logic:present name="ppage">
		<tr>
			<td class="main" align="left" colspan="8">
				<%
									Page p = (Page) request.getAttribute("ppage");
									int currentPage = p.getCurrentPage();
								%>
				<a
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=queryOrders&targetPage=1"
					class="pagenav">��ҳ</a>
				<%
								if (p.isHasPrevious()) {
								%>
				<a
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=queryOrders&targetPage=<%=currentPage == 1 ? 1 : currentPage - 1%>"
					class="pagenav">��һҳ</a>
				<%
								} else {
								%>
				��һҳ
				<%
									}
									if (p.isHasNext()) {
								%>
				<a
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=queryOrders&targetPage=<%=currentPage == p.getTotalPages() ? p.getTotalPages() : currentPage + 1%>"
					class="pagenav">��һҳ</a>
				<%
								} else {
								%>
				��һҳ
				<%
								}
								%>
				<a
					href="<%=request.getContextPath()%>/JspForm/BackfuncModual/order.do?status=queryOrders&targetPage=<%=p.getTotalPages()%>"
					class="pagenav">ĩҳ</a>&nbsp;&nbsp;��<%=currentPage%>ҳ/ ��<%=p.getTotalPages()%>ҳ
				&nbsp;&nbsp;��
				<bean:write name="ppage" property="totalRecords" />
				����¼

			</td>
			<td class="main" align="right" colspan="2">
				ת
				<input type="text" name="page" class="inp_page" value="" size="4"
					onkeyup="value=value.replace(/[^\d]/g,'')" />
				ҳ
				<input type="button" value="Go" onclick="setAction()" class="button" />
				<input type="hidden" id="totalPages" name="totalPages"
					value="<bean:write name="ppage" property="totalPages"/>" />
			</td>
		</tr>
		<tr>
    		    <td class="main" colspan="10"> 
    		        &nbsp;&nbsp;<input type="button" value="����" class="button" onclick="back()"/>
    		    </td>
    		</tr>
		</logic:present>
    		</tbody>
    		
    	</table>
  </center>
  </body>
</html:html>
