<%@ page contentType="text/html; charset=GBK"%>
<%
    com.apricot.app.eating.LoginData ld = (com.apricot.app.eating.LoginData) session
		    .getAttribute(com.apricot.app.eating.LoginData.LOGIN_SESSION_KEY);
%>

<table width="100%" height="33" class="x-panel-header" cellspacing="0"
	cellpadding="0">
	<tr>
		<td width="100%">&nbsp;&nbsp;��ǰ��¼Ա��: <%=ld.getStaffName()%>&nbsp;&nbsp;&nbsp;���棺<%=ld.getShopName()%>
		</td>
		<td width="30">
		<table border="0">
			<tr>
				<td nowrap><a id="main_banner_safe_logout" href="javascript:" style="font-size:9pt;">��ȫ�˳�</a></td>
				<td nowrap><a id="main_banner_safe_changepassword" href="javascript:" style="font-size:9pt;">�޸�����</a></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<script language="javascript">

document.getElementById("main_banner_safe_logout").onclick=function(){
	window.location.href=currentPageBaseHREF+'/logout.jsp';
};

document.getElementById("main_banner_safe_changepassword").onclick=function(){
	alert('�����޸������¼�banner.jsp');
}

</script>

