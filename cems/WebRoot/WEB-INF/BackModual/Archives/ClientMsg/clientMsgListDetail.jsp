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
			<strong>�ֻ�</strong>
		</td>
		<td>
			<strong>��λ����</strong>
		</td>
		<td>
			<strong>�̻�</strong>
		</td>
		<td align="center">
			<strong>����</strong>
		</td>
	</tr>
	<s:iterator id="g" value="%{pageList.objectList}">
		<tr>
			<td>
				<s:property value="#g.NAME" />
			</td>
			<td>
				<s:property value="#g.MOBILE" />
			</td>
			<td>
				<s:property value="#g.UNIT" />
			</td>
			<td>
				<s:property value="#g.TEL" />
			</td>
			<td align="center" colspan="2">
				<a href='<%=path%>/archives/clientMsg.do?action=new' target='_self'>����</a>
				<a href='<%=path%>/archives/clientMsg.do?action=edit&search.pid=<s:property value="#g.ID" />' target='_self'>�༭</a>
				<a href="javascript:fun_delete(<s:property value="#g.ID"/>)">ɾ��</a>
			</td>
		</tr>
	</s:iterator>
	<tr class="bgColor3">
		<td colspan="7" align="center">
		    <center>
			��ҳ:                                                     
			<qzgf:pages value="%{pageList.pages}"  javaScript="loadDefaultList"/>
			</center>
		</td>
	</tr>
</table>
<script type="text/javascript">
		function fun_delete(pid){
			jConfirm('��ȷ��ɾ������Ϣ!', 'ȷ�Ͽ�', function(r) {	
	    		if (r){
				   var url = '<%=path%>/archives/clientMsg.do?action=delete&search.pid='+pid
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
							   window.location.href='<%=path%>/archives/clientMsg.do';
							    //});
							}
							else{
							    jAlert('ɾ��ʧ��!');  
							}
						}	
					}catch(e){ 
						jAlert(e,"��ʾ");
					}	
				}
			});
		}
 </script>
