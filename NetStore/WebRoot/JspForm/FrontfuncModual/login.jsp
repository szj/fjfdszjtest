<%@ page language="java"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<html:base />
	<title>�û���¼</title>
	<link href="<%=request.getContextPath()%>/css/header01.css"
		rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/index.css"
		type="text/css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/catalog.css"
		type="text/css" rel="stylesheet" />
	<script type="text/javascript">
        function checkValue(){
            var userId=document.getElementById("userid").value;
            var pwd=document.getElementById("userpwd").value;
            if(userId==""||userId==null){
               alert("���������û���");
               document.getElementById("userid").focus();
               return false;
            }
            if(pwd==""||pwd==null){
               alert("������������");
               document.getElementById("userpwd").focus();
               return false;
            }
            if(pwd.length<6){
               alert("����������벻��,������");
               document.getElementById("userpwd").value="";
               document.getElementById("userpwd").focus();
               return false;
            }
        }
    </script>
</head>
	<body>
			<center>
		<jsp:include flush="true" page="top.jsp" />
		<form action="<%=request.getContextPath()%>/JspForm/FrontfuncModual/user.do"
			method="post">
			<table width="98%" >
				<tr>
					<td colspan="2" align="center" >
						<h3>
							�û���¼
						</h3>
					</td>
				</tr>
				<tr>
					<td align="right" width="50%">
						�����û��˺�:
					</td>
					<td align="left">
						<input type="text" name="userid" value="${userId}" />
					</td>
				</tr>
				<tr>
					<td align="right">
						��������:
					</td>
					<td align="left">
						<input type="password" name="userpwd" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						ע�⣺����������ɵȹ��ڳ��ϵĻ����ϵ�¼�����������뿪����ǰ�˳��������˻�������ð����ɲ���Ҫ���鷳��
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="status" value="login" />
						<input type="submit" value="��¼" onclick="return checkValue();" />
						�������δע��,
						<a
							href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/register.jsp">�����ע��</a>!
					</td>
				</tr>
			</table>
		</form>
		<jsp:include flush="true" page="bottom.jsp" />
	</center>
	</body>
</html>