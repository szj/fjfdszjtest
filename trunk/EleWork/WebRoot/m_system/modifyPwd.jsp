<%@include file="../main/common.jsp"%>
<%@page contentType="text/html; charset=GB2312" import="YzSystem.J_System.*,YzSystem.JMain.*" errorPage="../main/error.faces"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%FrmGroupUserManage frmGroupUserManage = (FrmGroupUserManage) UtilWebTools.getValueBinding("frmGroupUserManage");%>
<html>
<head>
<title>�޸�Ա������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/mm.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="javascript:theForm.oldpwd.focus();">
<f:view>
<form name="theForm" method="post" action="">
  <table width="100%" border="0" cellspacing="10" cellpadding="0">
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bborder">
        <%out.println(frmGroupUserManage.genHtmlPos());        %>
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="bborder">
            <tr>
              <td colspan="8" class="btd">
                <table border="0" cellspacing="1" cellpadding="3" width="100%">
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="right" width="38%">ԭ����</td>
                    <td>
                      <input type="password" name="oldpwd" size="20" maxlength="20">
                    </td>
                  </tr>
                  <tr>
                    <td align="right">������</td>
                    <td>
                      <div id="divBuilding" name="divBuilding">
                        <input type="password" name="newpwd" size="20" maxlength="20">
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td align="right">ȷ��������</td>
                    <td>
                      <div id="divFinace" name="divFinace">
                        <input type="password" name="confirmnewpwd" size="20" maxlength="20">
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2" height="35" valign="bottom">
                      <hr size=1 color="#C1DA90">
                    </td>
                  </tr>
                  <tr>
                    <td colspan="8" class="btd">
                      <table border="0" cellspacing="0" cellpadding="5" width="100%">
                        <tr>
                          <td height="36" align="right">
                            <h:commandButton value="ȷ ��" action="#{frmGroupUserManage.doModifyPwd}" onclick="javascript:return modifypwd();"/>
                            <input type="button" name="Submit2" value="ȡ ��" onclick="Javascript:history.back();">
                          </td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </table>
      </td>
    </tr>
  </table>
  <c:if test="${frmGroupUserManage.modifyPwdCode == 'true'}">
<script language="javascript">
    alert("�����޸ĳɹ�");
    self.location.href="modifyPwd.faces?tseqn="+<%=request.getParameter("tseqn")%>;
    </script>  </c:if>
  <c:if test="${frmGroupUserManage.modifyPwdCode == 'error'}">
<script language="javascript">
    alert("ԭ�������,��ȷ��!");
    theForm.oldpwd.focus();
    </script>  </c:if>
</form>
</f:view>
</body>
</html>
<script language="javascript">
var params="?tseqn="+"<%=request.getParameter("tseqn")%>";
function modifypwd(){
   if ((document.theForm.newpwd.value=="") || (document.theForm.confirmnewpwd.value=="")){
    alert("���벻��Ϊ��");
    theForm.newpwd.focus();
    return false;
    }
   if(document.theForm.newpwd.value.length<6){
     alert("Ϊ�˱�֤������İ�ȫ����������λ�����ϵ�����!");
     theForm.newpwd.focus();
     return false;
   }
   if(!(document.theForm.newpwd.value==document.theForm.confirmnewpwd.value)){
     alert("��ȷ�����������룡");
     theForm.newpwd.focus();
     return false;
   }
 }
</script>
