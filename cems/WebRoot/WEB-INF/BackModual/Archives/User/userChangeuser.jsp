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
<form  method='POST' name='form1' action='<%=basePath%>/archives/user.do?action=changeuser'  id="form1">
 <table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" height="78%" id="table14">
									<tr>
										<td background="<%=basePath%>/images/frontlogin05.jpg" width="100%" height="45" STYLE="background-repeat: no-repeat;" >��</td>
										<td>��</td>
									</tr>
									<tr>
										<td background="<%=basePath%>/images/frontlogin06.jpg"  STYLE="background-repeat:  repeat-y;" >
										<div align="center">
											<table  border="0" cellpadding="0" style="border-collapse: collapse" width="80%" height="100%" id="table15">
												<tr >
													<td width="98" height="37">
													<strong>
													<span style="font-size: 9pt">
													�޸��û���Ϣ</span></strong></td>
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
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													�û�����</span></td>
													<td><span style="font-size: 9pt"><s:property value="%{search.CODE}" /></span>��</td>
												</tr>
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													�ͻ����룺</span></td>
													<td><span style="font-size: 9pt"><s:property value="%{search.CLIENTCODE}" /></span>��</td>
												</tr>
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													����</span><span style="font-size: 9pt">��</span></td>
													<td>
													<span style="font-size: 9pt">
													<s:textfield id="pname"  name="search.pname" value="%{search.NAME}"></s:textfield></span><div id="pnameTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98">
													<span style="font-size: 9pt">
													�̶��绰��</span></td>
													<td>
													<span style="font-size: 9pt">
													 <s:textfield name="search.ptel" id="ptel" value="%{search.TEL}"></s:textfield></span><div id="ptelTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													�ֻ�</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														<s:textfield id="pmobile"  name="search.pmobile" value="%{search.MOBILE}"></s:textfield></span><div id="pmobileTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98">��</td>
													<td>��</td>
												</tr>
												<tr align="left">
													<td width="98">
													<font color="red">
													<span style="FONT-SIZE: 9pt">
													ѡ��</span></font></td>
													<td>��</td>
												</tr>
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													��λ���ƣ�</span></td>
													<td>
													<span style="font-size: 9pt">
													<s:textfield name="search.punit" id="punit" value="%{search.UNIT}" ></s:textfield></span><div id="punitTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98">
													<span style="FONT-SIZE: 9pt">
													�������䣺</span></td>
													<td>
													<span style="font-size: 9pt">
													 <s:textfield name="search.pemail" id="pemail"  value="%{search.EMAIL}"></s:textfield></span>
													  <div id="pemailTip" style="display: inline "></div>
													  </td>
												</tr>
												<tr>
													<td width="98">��</td>
													<td>��</td>
												</tr>
												<tr>
													<td width="98"> <s:hidden name="search.pid" id="pid" value="%{search.ID}"></s:hidden>
													��</td>
													<td align="left">
													<input type="button" onclick="javascript:save()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
													<input type="button" onclick="javascript:reset()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
													</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td background="<%=basePath%>/images/frontlogin07.jpg" width="100%" height="15" STYLE="background-repeat: no-repeat;" >��</td>
										<td></td>
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
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){
			   if($("#ptel").val()==""&&$("#pmobile").val()=="")
			   {
				   alert('�绰���ֻ�����һ��');
				   return false;	   
			   }else
			   {
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