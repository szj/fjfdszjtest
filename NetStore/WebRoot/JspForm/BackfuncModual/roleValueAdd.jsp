<%@ page language="java" import="com.fredck.FCKeditor.*"
	pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
	<html:base />
	<title>��ɫȨ��ֵ���</title>
    
</head>

<body background="<%=request.getContextPath()%>/images/bg.gif">
	<form
		action="<%=request.getContextPath()%>/JspForm/BackfuncModual/roleValue.do"
		method="post">
		<center>
			<table border=1 width="60%">
				<tr>
					<td colspan="2" align="center">
						��ɫȨ������
					</td>
				</tr>
				<tr>
					<td>
						��ɫ���
					</td>
					<td>
						<input type="text" name="roleId" />
					</td>
				</tr>
				<tr>
					<td>
						�˵����
					</td>
					<td>
						<input type="text" name="menuCode"/>
					</td>
				</tr>
				<tr>
					<td>
						�Ƿ���ʾ
					</td>
					<td>
						<input type="text" name="funisShow" />
					</td>
				</tr>
				<tr>
					<td>
						Ȩ��ֵ
					</td>
					<td>
						<input type="text" name="powerValue"/>
					</td>
				</tr>
								<tr>
					<td>
						��ע
					</td>
					<td>
						<input type="text" name="remark"/>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="hidden" name="status" value="addRoleValue"/>
						<input type="submit" value="����" />
						<input type="button" value="����" onclick="javascript:self.history.back(); "/>
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html:html>
<logic:present name="xgResult">
   <script type="text/javascript">
       alert("${xgResult}");
   </script>
</logic:present>
