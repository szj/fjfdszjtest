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
<form  method='POST' name='form1' action='/archives/user.do?action=changeuser'  id="form1">
   <table width="90%" height="190" border="1">
   <tr> 
   <td> 
       <strong>�޸��û���Ϣ</strong>
   </td>
   </tr>
    <tr>
	<td>
		<s:actionerror theme="ems" />
		<s:actionmessage theme="ems" />
	</td>
  </tr>
   <tr>
      <td>�û�����
      		<s:property value="%{search.CODE}" />
     </td>
   </tr>
   <tr>
      <td>�ͻ����룺
      		<s:property value="%{search.CLIENTCODE}" />
      </td>
   </tr> 
   <tr> 
   <td>����:
   	<s:textfield id="pname"  name="search.pname" value="%{search.NAME}"></s:textfield>
   <div id="pnameTip" style="display: inline "></div></td>
   </tr>
   <tr> 
   <td>�̶��绰:
   <s:textfield name="search.ptel" id="ptel" value="%{search.TEL}"></s:textfield>
   <div id="ptelTip" style="display: inline "></div></td>
   </tr>
   
   
   
   <tr> 
   <td>�ֻ�:
   	<s:textfield id="pmobile"  name="search.pmobile" value="%{search.MOBILE}"></s:textfield>
   <div id="pmobileTip" style="display: inline "></div></td>
   </tr>
   
   <tr> 
   <td align="left">
		<font color="red">ѡ��</font>
   </td>
   </tr>
   <tr> 
   <td>��λ����:
   	<s:textfield name="search.punit" id="punit" value="%{search.UNIT}" ></s:textfield>
   <div id="punitTip" style="display: inline "></div></td>
   </tr>
   
   <tr> 
   <td>��������:
   <s:textfield name="search.pemail" id="pemail"  value="%{search.EMAIL}"></s:textfield>
   <div id="pemailTip" style="display: inline "></div></td>
   </tr>

   <tr>
   <s:hidden name="search.pid" id="pid" value="%{search.ID}"></s:hidden>
   <td  align="center">
     <s:submit id="saveId" value="�� ��"></s:submit> &nbsp;<s:reset id="setId" value="�� ��"></s:reset>
   </td>
   </tr>
 </table>
</form>
</center>
 <script type="text/javascript">
    //��֤
    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){
			   if($("#ptel").val()==""&&$("#pmobile").val()=="")
			   {
				   alert('�绰���ֻ�����һ��');
				   return false;	   
			   }else
			   {
				   alert('ȷ�ϱ���!');
				   return true;
			   }
		}});
		$("#pname").formValidator({onfocus:"���20���ַ�",oncorrect:"��"}).inputValidator({min:1,max:20,onerror:"�����Ƿ�,��ȷ��"});
		$("#ptel").formValidator({onfocus:"�绰�����С��ͨ,��059512345678",oncorrect:"��"}).regexValidator({regexp:"^\\d{10,12}$",onerror:"�绰�����ʽ����ȷ"});
		$("#pmobile").formValidator({onfocus:"�ֻ���",oncorrect:"��"}).regexValidator({regexp:"mobile",datatype:"enum",onerror:"�ֻ������ʽ����ȷ"});
		$("#pprovince").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
	
		$("#paddress").formValidator({onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
		$("#pverifycode").formValidator({onfocus:"��֤��",oncorrect:"��"}).inputValidator({min:1,max:4,onerror:"��֤��Ϊ4λ"});
		$("#pemail").formValidator({onfocus:"��������",oncorrect:"��"}).regexValidator({regexp:"emailex",datatype:"enum",onerror:"���������ʽ����ȷ"});
	});	
</script>
</body>
</html>