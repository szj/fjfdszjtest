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
		<td width="12%">
			<strong>�ʼ���</strong>
		</td>
		<td width="10%">
			<strong>�ļ�������</strong>
		</td>
		<td width="20%">
			<strong>�ļ��˵�ַ</strong>
		</td>
		<td width="10%">
			<strong>�ռ�������</strong>
		</td>
		<td width="20%">
			<strong>�ռ��˵�ַ</strong>
		</td>
		<!-- 
		<td>
			<strong>����ӡʱ��</strong>
		</td>
		 -->
		<td>
			<strong>��ӡ����</strong>
		</td>
		<td align="center">
			<strong>����</strong>
		</td>
	</tr>
	<s:iterator id="g" value="%{pageList.objectList}">
		<tr>
			<td>
			<input type='checkbox' name='searchpid' id='searchpid' value='<s:property value="#g.ID"/>'/>
				<s:property value="#g.MAILNO" />
			</td>
			<!-- 
			<td>
				<s:property value="#g.MAIL_SENDOFFICE" />
			</td>
			 -->
			<td>
			   <s:label value="%{#g.SENDNAME}" title="%{#g.SENDTEL}"></s:label>
			</td>
			<td>
				<s:property value="#g.SENDADDRESS"/>
			</td>
			<td>
				<s:label value="%{#g.RECNAME}" title="%{#g.RECTEL}"></s:label>
			</td>
			<td>
				<s:property value="#g.RECADDRESS"/>
			</td>
			<!-- 
			<td>
				<s:property value="#g.PRINTTIME" />
			</td>
			 -->
			<td>
			   <s:label value="%{#g.PRINTCOUNT}" title="%{#g.PRINTTIME}"></s:label>
			</td>
			<td align="left">	
			<a href='<%=path%>/net/print.do?action=view&search.pid=<s:property value="#g.ID" />'  target='_self'>�鿴</a>			
		    <a href='<%=path%>/net/print.do?action=new' target='_self'>����</a>
		    <a href='<%=path%>/net/ocxprint.do?action=ocxprint&search.pid=<s:property value="#g.ID" />'>��ӡ</a>
			<a href='<%=path%>/net/print.do?action=edit&search.pid=<s:property value="#g.ID" />'>�޸�</a>
			<a href="javascript:fun_delete(<s:property value="#g.ID"/>)">ɾ��</a>
			</td>
		</tr>
	</s:iterator>
	<tr class="bgColor3">
	    <td>
	    	<a href="javascript:chk_all(true);">ȫѡ</a>&nbsp;<a href="javascript:chk_all(false);">ȡ��</a>&nbsp;<a href="javascript:allprint();">��ӡ</a>
	    </td>
		<td align="center" colspan="8" >
			<center>
			��ҳ:<qzgf:pages value="%{pageList.pages}" javaScript="loadDefaultList" styleClass="text-align:left;"/>
			</center>
		</td>
	</tr>
</table>
<script type="text/javascript">
        //ȫѡ��ѡ��
    	function chk_all(flag){
			var obj = $(searchpid);
			if (obj != null){
				if (obj.length > 1){
					for (var i=0; i<obj.length; i++){
						obj[i].checked = flag;
					}
				}else{
					obj.chekced = flag;
				}
			}
		}
		
        function allprint(){
        			var obj = $(searchpid);
		            var value="";
		            var flag=0;
		            //��ϴ�ӡ���ݵ��ַ���
		            if (obj != null){
						if (obj.length > 1){
							for (var i=0; i<obj.length; i++){
								if(obj[i].checked == true)
								{
								  flag=1;
								  value=value+obj[i].value+',';
								}
							}
						}else{
						    if(obj.chekced == true)
						    {
						      flag=1;
						      value=obj;
						    }
						}
					}
					if(flag==1)
					{
					   if(value.charAt(value.length-1)==',')
					   {
					      value=value.substr(0,value.length-1);
					   }
					   window.location.href='<%=path%>/net/ocxprint.do?action=ocxprint&search.pid='+value;
					}else{
					  jAlert( '����ѡ��һ���ӡ��','��ʾ');
					}
        }

		function fun_delete(pid){
			jConfirm('��ȷ��ɾ������Ϣ!', 'ȷ�Ͽ�', function(r) {
	    		if (r){
					var url = '<%=path%>/net/print.do?action=delete&search.pid='+pid
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
							   window.location.href='<%=path%>/net/print.do';
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
 </script>
