<%@page language="java" isErrorPage="true" pageEncoding="GB2312" contentType="text/html;charset=gb2312" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="themes/default/style/newcss.css">
<title></title>
</head>
<body topmargin="0" leftmargin="0">
<table width="100%" height="100%" cellspacing='0' cellpadding='0' border='0'>
	<tr>
		<td valign="middle">
			<table width="400" height="157" cellspacing='0' cellpadding='0' border='0' align="center" style="background-image: url(images/bg.gif);background-position:0% 0%;background-repeat: no-repeat;">
				<tr height=30>
					<td colspan=4></td>
				</tr>
				<tr>
					<td width=30></td>
					<td ><img src="/themes/default/images/error.gif"></td>

					<td valign="top">
						<table cellspacing='0' cellpadding='0' border='0'>
							<tr height=10 colspan=2>
								<td></td>
							</tr>
							<tr>
								<td style="PADDING-left:12px;">
									<html:errors/>
									<br>
								</td>
							</tr>
							<tr height=7 colspan=2>
								<td></td>
							</tr>
							<tr>
								<td colspan=2 align=right> </td>
							</tr>
						</table>
						<ww:iterator value="actionMessages">
							<ww:property />
						</ww:iterator>
						<% if(exception!=null){%>
						<table cellspacing='0' cellpadding='0' border='0'>
							<tr height=10 colspan=2>
								<td><font color='red'>������1!</font></td>
							</tr>
							<tr>
								<td align="right">
									<hr size="1" style="width:200px"/>
									<div> 
										<font color="red">
										<%
			                        		exception.printStackTrace();
				                        %>
				                        <%
				                        	String errormsg = exception.getMessage();
				                        	String error = "δ���������Ϣ,�������ϸ������Ϣ�������Ա��ϵ!";
				                        	if (errormsg == null){
				                        		
				                        	}else if (errormsg.indexOf("There is no Action mapped for action name")!=-1){
				                        		error = "��Ǹ������ҳ�����ڣ�";
				                        	}else if(errormsg.indexOf("403")!=-1){
												error = "��Ǹ,Ȩ�޲���ϵͳ�޷������Ĳ���!";
											}else if(errormsg.indexOf("Access is denied")!=-1){
												error = "�ܾ�����!";
											}else if(errormsg.indexOf("ORA-00001")!=-1){
												error = "�ظ���ӹؼ��ֶ�!";
											}else if(errormsg.indexOf("ORA-01401")!=-1){
												error = "�����ֵ�����й���!";
											}else if(errormsg.indexOf("ORA-02292")!=-1){
												error = "��Ǹ,�ü�¼���ڼ�����ϵ,�޷�ɾ��!";
											}else if (errormsg.indexOf("ORA-03114") != -1){
												error = "�޷��������ݿ⣬���ڹ���Ա��ϵ";
											}
											//.........
											//else if(cause.equals(""))
											
				                        %>
				                          <%=error%>
				                        </font>
				                        <br>
				                        <br>
										<font color="Blue"> 
											<a style="cursor:hand" onclick="err_msg();">�鿴������Ϣ</a> 
										</font> 
									</div>
									<br>
								</td>
							</tr>
							<tr>
								<td style="word-break:normal;">
									<div id="err_msg" style="display:none" >
										<%=errormsg%>
									</div>
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="button" value="����" onclick="javascript:history.go(-1);">
								</td>
							</tr>
						</table>
						<%}else{%>
							<font color="red">
								�Բ�����û����Ӧ��Ȩ�޽��в�����<br>
								�������Ա��ϵ��<br></br>
								<a href="/logout.jsp">�˳�ϵͳ</a>
							</font>
						<%}%>
					</td>
				</tr>
			</table>
			<br>
		</td>
	</tr>
</table>
<script type="text/javascript">
	function err_msg(){
		if(document.all.err_msg.style.display==""){
			document.all.err_msg.style.display="none";
		}else{
			document.all.err_msg.style.display="";
		}
	}
</script>
</body>
</html>
