<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<%@taglib uri="/WEB-INF/util.tld" prefix="qzgf"%>
<%
request.setAttribute("decorator", "none");
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%
	//����ȫ�ֱ���
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<table width="100%" border="0" cellpadding="4" cellspacing="0">
	<tr class="trClass">
		<td>
			<strong>��ϵ��</strong>
		</td>
		<td>
			<strong>�µ�ʱ��</strong>
		</td>
		<td>
			<strong>�ֻ�</strong>
		</td>
		<td>
			<strong>ȡ����ַ</strong>
		</td>
		<td>
			<strong>�ʼ�����</strong>
		</td>
		<td>
			<strong>�ͻ�Ҫ��</strong>
		</td>
		<td>
			<strong>����״̬</strong>
		</td>
		<td align="center">
			<strong>����</strong>
		</td>
		<!-- 
		<td>
			<a href='<%=path%>/net/order.do?action=new' target='_self'>����</a>
			<a href='javascript:fun_submit("clientmodify",<s:property value="#g.ID"/>)' target='_self'>�޸�</a>
		</td>
		 -->
	</tr>
	<s:iterator id="g" value="%{pageList.objectList}">
		<tr>
			<td>
			    <s:label value="%{#g.NAME}" title="%{#g.PLORDERID}"></s:label>
			</td>
			<td>
				<s:property value="#g.CREATE_DATE" />
			</td>
			<td>
				<s:property value="#g.MOBILE" />
			</td>
			<td>
				<s:property value="#g.ADDRESS" />
			</td>
			<td>
				<s:property value="#g.MAILTYPENAME" />
			</td>
			<td>
				<s:property value="#g.CLIENTREMARK" />
			</td>
			<td>
				<s:property value="#g.ORDERINGSTATE" />
			</td>
			<td align="left">	
			<a href='<%=path%>/net/order.do?action=view&search.pid=<s:property value="#g.ID" />'  target='_self'>�鿴</a>			
			<s:if test="%{#g.ORDERINGVALUE.substring(0,1)==1}">
				<a href='<%=path%>/net/order.do?action=edit&search.pid=<s:property value="#g.ID" />' target='_self'>�޸�</a>
			</s:if>
			<s:if test="%{#g.ORDERINGVALUE.substring(1,2)==1}">
			    <a href='<%=path%>/net/order.do?action=perclientmodify&search.pid=<s:property value="#g.ID" />' target='_self'>�޸�</a>
			</s:if>
			<s:if test="%{#g.ORDERINGVALUE.substring(2,3)==1}">
				<a href='javascript:fun_submitex("clientadd",<s:property value="#g.ID"/>)'>�ļ�</a>
			</s:if>	
			<s:if test="%{#g.ORDERINGVALUE.substring(3,4)==1}">
				<a href='javascript:fun_submit("clientcancel",<s:property value="#g.ID"/>)'>����</a>
			</s:if>	
			<s:if test="%{#g.ORDERINGVALUE.substring(4,5)==1}">
				<a href='javascript:fun_submit("clienthurry",<s:property value="#g.ID"/>)'>����</a>
			</s:if>	
			<!-- 
			<s:if test="%{#g.ORDERINGVALUE.substring(5,6)==1}">
				<a href='<%=path%>/net/order.do?action=print&search.pid=<s:property value="#g.ID" />' target='_self'>�ʼ�����</a>
			</s:if>	
			 -->
			<s:if test="%{#g.ORDERINGVALUE.substring(6,7)==1}">
				<a href="javascript:fun_delete(<s:property value="#g.ID"/>)">ɾ��</a>
			</s:if>	
			</td>
		</tr>
	</s:iterator>
	<tr class="bgColor3">
		<td colspan="8">
		    <center>
			��ҳ:                                                     
			<qzgf:pages value="%{pageList.pages}" javaScript="loadDefaultList"/>
			</center>
		</td>
	</tr>
</table>
<script type="text/javascript">
		function fun_delete(pid){
			jConfirm('��ȷ��ɾ������Ϣ!', 'ȷ�Ͽ�', function(r) {
	    		if (r){
					var url = '<%=path%>/net/order.do?action=delete&search.pid='+pid
					try{
						var oXMLDom	= new ActiveXObject("Msxml.DOMDocument");
						oXMLDom.async = false ;
						oXMLDom.load(url);  
						var root;
						if (oXMLDom.parseError.errorCode != 0) {
							var myErr = oXMLDom.parseError;
							return;
						} else {
							root = oXMLDom.documentElement;
						}
						
						if (null != root){
							var rowSet = root.selectNodes("//delete");
						
							if(0<rowSet.item(0).selectSingleNode("value").text){
							    //jAlert("ɾ���ɹ�!",fuction(r){
							   window.location.href='<%=path%>/net/order.do';
							    //});
							}
							else{
							    jAlert('ɾ��ʧ��!','��ʾ');  
							}
						}	
					}catch(e){ 
						jAlert(e,"��ʾ");
					}	
				}
			});
		}
		//2010-01-05�û��ύ��Ϣ������ϵͳ
		function fun_submit(action,pid){
			//jConfirm('��ȷ��ִ�иò���!', 'ȷ�Ͽ�', function(r) {	
			jPrompt('�ͻ�Ҫ��:', ' ', '��ʾ��', function(r) {
	    		if (r){
	    		var url = '<%=path%>/net/order.do?action='+action+'&search.pid='+pid+'&search.pclientremark='+r
					try{
						var oXMLDom	= new ActiveXObject("Msxml.DOMDocument");
						oXMLDom.async = false ;
						oXMLDom.load(url);  
						var root;
						if (oXMLDom.parseError.errorCode != 0) {
							var myErr = oXMLDom.parseError;
							return;
						} else {
							root = oXMLDom.documentElement;
						}
						
						if (null != root){
							var rowSet = root.selectNodes("//result");
							var remark=rowSet.item(0).selectSingleNode("remark").text;
							if(0<rowSet.item(0).selectSingleNode("value").text){
							    // jAlert("�����ɹ�!",fuction(r){
							   window.location.href='<%=path%>/net/order.do';
							   // });
							}
							else{
							    jAlert(remark);  
							}
						}	
					}catch(e){ 
						jAlert(e,"��ʾ�쳣");
					}	
				}
			});
		}
        //2010-01-05�û��ύ��Ϣ������ϵͳ
		function fun_submitex(action,pid){
			jConfirm('��ȷ��ִ�иò���!', 'ȷ�Ͽ�', function(r) {	
			//jPrompt('�ͻ�Ҫ��:', '', '��ʾ��', function(r) {
	    		if (r){
	    		    var url = '<%=path%>/net/order.do?action='+action+'&search.pid='+pid+'&search.pclientremark=';
					try{
						var oXMLDom	= new ActiveXObject("Msxml.DOMDocument");
						oXMLDom.async = false ;
						oXMLDom.load(url);  
						var root;
						if (oXMLDom.parseError.errorCode != 0) {
							var myErr = oXMLDom.parseError;
							return;
						} else {
							root = oXMLDom.documentElement;
						}
						
						if (null != root){
							var rowSet = root.selectNodes("//result");
							var remark=rowSet.item(0).selectSingleNode("remark").text;
							if(0<rowSet.item(0).selectSingleNode("value").text){
							    // jAlert("�����ɹ�!",fuction(r){
							   window.location.href='<%=path%>/net/order.do';
							   // });
							}
							else{
							   jAlert(remark);  
							}
						}	
					}catch(e){ 
						jAlert(e,"��ʾ�쳣");
					}	
				}
			});
		}
 </script>
