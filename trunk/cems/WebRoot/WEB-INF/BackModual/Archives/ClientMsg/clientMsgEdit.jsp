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
<form  method='POST' name='form1' action='/archives/clientMsg.do'  id="form1">
  <table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" height="78%" id="table14">
									<tr>
										<td background="<%=basePath%>/images/frontlogin05.jpg" width="740" height="45" STYLE="background-repeat: no-repeat;">��</td>
									</tr>
									<tr>
										<td background="<%=basePath%>/images/frontlogin06.jpg" STYLE="background-repeat:  repeat-y;">
										<div align="center">
											<table  border="0" cellpadding="0" style="border-collapse: collapse" width="80%" height="100%" id="table15">
												<tr >
													<td width="98" height="37">
													<strong>
													<span style="font-size: 9pt">
													ȡ����ϵ��</span></strong></td>
													<td height="37">��</td>
												</tr>
												<tr align="left">
													<td width="98" height="16">
													<s:actionerror theme="ems" />
													&nbsp;<s:actionmessage theme="ems" />
													</td>
													<td height="16"></td>
												</tr>
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													��ϵ��</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														<s:textfield id="pname"  name="search.pname" value="%{clientMsg.NAME}"></s:textfield>
												</span> <div id="pnameTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													�̶��绰</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														<s:textfield id="ptel"  name="search.ptel" value="%{clientMsg.TEL}" title="(��:059512345678)" ></s:textfield>
												</span> <div id="ptelTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													�ֻ�</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														 <s:textfield id="pmobile"  name="search.pmobile" value="%{clientMsg.MOBILE}"></s:textfield>
												</span><div id="pmobileTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													��λ����</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														 <s:textfield id="punit"  name="search.punit" value="%{clientMsg.UNIT}"></s:textfield>
												</span><div id="punitTip" style="display: inline "></div></td>
												</tr>
												<tr>
													<td width="98">��</td>
													<td>��</td>
												</tr>
												<tr>
													<td width="98">
													      <s:hidden value="%{clientMsg.ID}" name="search.pid" id="pid"></s:hidden>
													      <s:hidden value="%{action}" name="action" id="action"></s:hidden>
													��</td>
													<td align="left">
													<input type="button" onclick="javascript:save()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
													<input type="button" onclick="javascript:reset()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
												    <input type="button" onclick="javascript:history.go(-1)" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
													</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td background="<%=basePath%>/images/frontlogin07.jpg" width="740" height="15" STYLE="background-repeat: no-repeat;">��</td>
									</tr>
	</table>
</form>
</center>
 <script type="text/javascript">
 
   	//��������
	function save(){
	    if($.formValidator.pageIsValid()){
			document.forms[0].submit();
		}else
		{
		  return false;
		}
	}
	
	 //��������
	function reset(){
			document.forms[0].reset();
			return true;
	}
 
    //��֤
    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
		$("#pname").formValidator({onfocus:"���20���ַ�",oncorrect:"��"}).inputValidator({min:1,max:20,onerror:"�����Ƿ�,��ȷ��"});
		$("#ptel").formValidator({onfocus:"�绰�����С��ͨ,��059512345678",oncorrect:"��"}).regexValidator({regexp:"^$|^\\d{10,12}$",onerror:"�绰�����ʽ����ȷ"});
		$("#pmobile").formValidator({onfocus:"�ֻ���",oncorrect:"��"}).regexValidator({regexp:"^$|^(13|15|18)[0-9]{9}$",onerror:"�ֻ������ʽ����ȷ"});
	});
	</script>
</body>
</html>