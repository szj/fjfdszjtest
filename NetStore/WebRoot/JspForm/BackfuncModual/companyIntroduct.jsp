<%@ page language="java" import="com.fredck.FCKeditor.*" pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head> 
	<html:base />
	<title>��˾���</title>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/css.css" />
    <script type="text/javascript">
        function clearValue(){
            var oEditor = FCKeditorAPI.GetInstance("companyContent"); 
			oEditor.SetHTML("");
        } 
    </script>
</head>
      
<body background="<%=request.getContextPath()%>/images/bg.gif">
	<center>
		<form id="treatyForm" action="<%=request.getContextPath()%>/companyIntroduct.do?status=update"
			method="post">
			<table class="tbl" width="100%"  cellspacing="0" cellpadding="0">
			    <tr>
			        <td colspan="8"  bgcolor="#009CD6" background="../../images/newsystem/th2.gif" class="txt_b"  align="center">
			           ��˾���
			        </td>
			    </tr> 
				<tr>
					<td width="100%" >
						<%
			// ���������·�� 
			String path = request.getContextPath();
			FCKeditor oFCKeditor;
			// ����һ��������ʹActionͨ��request�����FCKeditor�༭���е�ֵ
			oFCKeditor = new FCKeditor(request, "companyContent");
			oFCKeditor.setBasePath(path + "/fckeditor/");
			String companyContent=(String)request.getAttribute("companyContent");
			// ����FCKeditor�༭����ʱ��Ĭ��ֵ
			oFCKeditor.setValue(companyContent);
			out.println(oFCKeditor.create());
			oFCKeditor.setHeight("400");
%>          
				</td>
				</tr>
				<tr>
					<td class="main" align="left">
					
						<input type="submit" value="����" class="button"/>
		                <input type="reset" value="����" class="button" onclick="clearValue()"/>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html:html>
<logic:present name="xgResult">
    <script type="text/javascript">
       alert('${xgResult}');
    </script>
</logic:present>
