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
<form  method='POST' name='form1' action='/net/printConfig.do?action=update'  id="form1">
   <table width="90%" height="190" border="1">
   <tr> 
   <td> 
       <strong>�޸Ĵ�ӡ������Ϣ</strong>
   </td>
   </tr>
    <tr>
	<td>
		<s:actionerror theme="ems" />
		<s:actionmessage theme="ems" />
	</td>

  </tr>
   <tr>
      <td>�û��� 
      		<s:property value="%{search.CODE}" />
     </td>
   </tr>
   <tr> 
   <td>��߾�:
   <s:textfield name="search.pleft_margin" id="pleft_margin" value="%{search.LEFT_MARGIN}"></s:textfield>
   <div id="pleft_marginTip" style="width:250px"></div></td>
   </tr>
   <tr> 
   <td>�ϱ߾�:
   	<s:textfield id="ptop_margin"  name="search.ptop_margin" value="%{search.TOP_MARGIN}"></s:textfield>
   <div id="ptop_marginTip" style="width:250px"></div></td>
   </tr>
   
   <tr>
   <s:hidden name="search.pid" id="pid" value="%{search.ID}"></s:hidden>
   <td colspan="3" align="center">
   		<s:submit id="saveId" value="�� ��"></s:submit> &nbsp;<s:reset id="setId" value="�� ��"></s:reset>
   </td>
   </tr>
 </table>
</form>
</center>
 <script type="text/javascript">
    //��֤
    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
		$("#pleft_margin").formValidator({onfocus:"��߾�",oncorrect:"��"}).regexValidator({regexp:"^[1-9]\\d*|0$",onerror:"��߾��ʽ����ȷ"});
		$("#ptop_margin").formValidator({onfocus:"�ϱ߾�",oncorrect:"��"}).regexValidator({regexp:"^[1-9]\\d*|0$",onerror:"�ϱ߾��ʽ����ȷ"});
	});
</script>
</body>
</html>