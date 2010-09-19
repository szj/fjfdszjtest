<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<%@taglib uri="/WEB-INF/util.tld" prefix="qzgf"%>
<%
request.setAttribute("decorator", "none");
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%
	//定义全局变量
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<table width="100%" border="0" cellpadding="4" cellspacing="0">
	<tr class="trClass">
		<td>
			<strong>联系人</strong>
		</td>
		<td>
			<strong>电话</strong>
		</td>
		<td>
			<strong>单位名称</strong>
		</td>
		<td>
			<strong>详细地址</strong>
		</td>
		<td align="center">
			<strong>操作</strong>
		</td>
	</tr>
	<s:iterator id="g" value="%{pageList.objectList}">
		<tr>
			<td>
				<s:property value="#g.REC_NAME" />
			</td>
			<td>
				<s:property value="#g.REC_TEL" />
			</td>
			<td>
				<s:property value="#g.REC_UNIT" />
			</td>
			<td>
				<s:property value="#g.REC_ADDRESS" />
			</td>
			<td align="center" >
				<a href='<%=path%>/archives/recMsg.do?action=new' target='_self'>增加</a>
				<a href='<%=path%>/archives/recMsg.do?action=edit&search.pid=<s:property value="#g.ID" />' target='_self'>编辑</a>
				<a href="javascript:fun_delete(<s:property value="#g.ID"/>)">删除</a>
			</td>
		</tr>
	</s:iterator>
	<tr class="bgColor3">
		<td colspan="7" align="center">
		    <center>
			分页:                                                     
			<qzgf:pages value="%{pageList.pages}"  javaScript="loadDefaultList"/>
			</center>
		</td>
	</tr>
</table>
<script type="text/javascript">
		function fun_delete(pid){
			jConfirm('您确定删除该信息!', '确认框', function(r) {	
	    		if (r){
				   var url = '<%=path%>/archives/recMsg.do?action=delete&search.pid='+pid
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
							    //jAlert("删除成功!",fuction(r){
							   window.location.href='<%=path%>/archives/recMsg.do';
							    //});
							}
							else{
							    jAlert('删除失败!');  
							}
						}	
					}catch(e){ 
						jAlert(e,"提示");
					}	
				}
			});
		}
 </script>
