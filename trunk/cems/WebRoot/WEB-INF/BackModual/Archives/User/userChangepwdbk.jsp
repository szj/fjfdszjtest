<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/util.tld" prefix="qzgf"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
  //����ȫ�ֱ���
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<body>
<center>
<form  method='POST' name='form1' action='/archives/user.do?action=changepwd'  id="form1">
   <table width="90%" height="190" border="1">
   <tr> 
   <td> 
       <strong>�޸�����</strong>
   </td>
   </tr>
    <tr>
	<td>
		<s:actionerror theme="ems" />
		&nbsp;<s:actionmessage theme="ems" />
	</td>
  </tr>
   <tr>
      <td>�����룺
      <s:password id="ppasswd"  name="search.ppasswd"></s:password>
      <div id="ppasswdTip" style="display: inline "></div></td>
   </tr>

   <tr>
   <td>������:
       <s:password id="pnewpasswd"  name="search.pnewpasswd"></s:password>
  <div id="pnewpasswdTip" style="display: inline "></div></td>
   </tr>
   
   <tr>
   <td>����ȷ��:
     <s:password  id="prepasswd"  name="search.prepasswd"  ></s:password>
   <div id="prepasswdTip" style="display: inline "></div></td>
   </tr>
   <tr>
   <s:hidden name="search.pid" id="pid" value="%{search.ID}"></s:hidden>
   <td align="center">
     <s:submit id="saveId" value="�� ��"></s:submit> &nbsp;<s:reset id="setId" value="�� ��"></s:reset>
   </td>
   </tr>
 </table>
</form>
</center>
 <script type="text/javascript">
    //��֤
    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){alert('ȷ���޸�');return true;}});
		$("#ppasswd").formValidator({onshow:"�����������",onfocus:"�����벻��Ϊ��",oncorrect:"��"}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"�������߲����пշ���"},onerror:"����������"});
		$("#pnewpasswd").formValidator({onfocus:"���볤��Ϊ6~20���ַ�",oncorrect:"��"}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"�������߲����пշ���"},onerror:"����������"});
		$("#prepasswd").formValidator({onfocus:"�����������һ��",oncorrect:"��"}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"�ظ��������߲����пշ���"},onerror:"�ظ����벻��Ϊ��,��ȷ��"}).compareValidator({desid:"pnewpasswd",operateor:"=",onerror:"�������벻һ��,��ȷ��"});
	});
</script>
</body>
</html>