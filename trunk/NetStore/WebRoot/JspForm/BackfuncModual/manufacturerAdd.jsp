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
	<title>������Ϣ���</title>
        <link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/css.css" />
</head>

<body background="<%=request.getContextPath()%>/images/bg.gif">
	<form
		action="<%=request.getContextPath()%>/JspForm/BackfuncModual/manufacturer.do"
		method="post">
		<center>
			<table class="tbl" width="80%"  cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="4"  bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">
						������Ϣ���
					</td>
				</tr>
				<tr>
					<td class="main" align="right">
						��������
					</td>
					<td class="main" align="left">
						<input type="text" name="manufacturerName" />
					</td>
					<td class="main" align="right">
						������վ
					</td>
					<td class="main" align="left">
						<input type="text" name="producerHomePage" />
					</td>
				</tr>
				<tr>
					<td class="main" align="right">
						��ϵ��
					</td>
					<td class="main" align="left">
						<input type="text" name="contactMan" />
					</td>
					<td class="main" align="right">
						�绰
					</td>
					<td class="main" align="left">
						<input type="text" name="phone" />
					</td>
				</tr>

				<tr>
					<td class="main" align="right">
						�ֻ�����
					</td>
					<td class="main" align="left">
						<input type="text" name="cellPhone" />
					</td>
					<td class="main" align="right">
						��ϵ��ַ
					</td>
					<td class="main" align="left">
						<input type="text" name="contactAddress" />
					</td>
				</tr>
				<tr>
					<td class="main" align="right">
						�ʱ�
					</td>
					<td class="main" align="left">
						<input type="text" name="postCode" />
					</td>
					<td class="main" align="right">
					    &nbsp;
					</td>
					<td class="main" align="left"> 
					    &nbsp;
					</td>
				</tr>
				<tr>
					<td class="main" align="right">
						���Ҽ��
					</td>
					<td  class="main"  colspan="3">
						<%
			// ���������·��
			String path = request.getContextPath();
			FCKeditor oFCKeditor;
			// ����һ��������ʹActionͨ��request�����FCKeditor�༭���е�ֵ
			oFCKeditor = new FCKeditor(request, "manufacturerInfo");
			oFCKeditor.setBasePath(path + "/fckeditor/");
			// ����FCKeditor�༭����ʱ��Ĭ��ֵ
			oFCKeditor.setValue("");
			out.println(oFCKeditor.create());
%>
					</td>
				</tr>
				<tr align="center">
					<td colspan="4" class="main" align="center">
						<input type="hidden" name="status" value="addManufacturer"/>
						<input type="submit" value="���" class="button"/>
						<input type="button" value="����" class="button" />
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
