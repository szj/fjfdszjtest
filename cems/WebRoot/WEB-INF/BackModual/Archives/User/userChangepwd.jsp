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
 <table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" height="78%" id="table14">
									<tr>
										<td background="<%=basePath%>/images/frontlogin05.jpg" width="740" height="45" STYLE="background-repeat: no-repeat;" >��</td>
									</tr>
									<tr>
										<td background="<%=basePath%>/images/frontlogin06.jpg"  STYLE="background-repeat:  repeat-y;" >
										<div align="center">
											<table  border="0" cellpadding="0" style="border-collapse: collapse" width="80%" height="100%" id="table15">
												<tr >
													<td width="98" height="37">
													<strong>
													<span style="font-size: 9pt">
													�޸�����</span></strong></td>
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
													������</span><span style="font-size: 9pt">��</span></td>
													<td>
													<span style="font-size: 9pt">
													<s:password id="ppasswd"  name="search.ppasswd"></s:password></span>  <div id="ppasswdTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98">
													<span style="font-size: 9pt">
													�����룺</span></td>
													<td>
													<span style="font-size: 9pt">
													  <s:password id="pnewpasswd"  name="search.pnewpasswd"></s:password></span><div id="pnewpasswdTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													����ȷ��</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														<s:password  id="prepasswd"  name="search.prepasswd"  ></s:password></span><div id="prepasswdTip" style="display: inline "></div></td>
												</tr>
												<tr>
													<td width="98">��</td>
													<td>��</td>
												</tr>
												<tr>
													<td width="98">   <s:hidden name="search.pid" id="pid" value="%{search.ID}"></s:hidden>��</td>
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
										<td background="<%=basePath%>/images/frontlogin07.jpg" width="740" height="15" STYLE="background-repeat: no-repeat;" >��</td>
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
		$("#ppasswd").formValidator({onshow:"�����������",onfocus:"�����벻��Ϊ��",oncorrect:"��"}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"�������߲����пշ���"},onerror:"����������"});
		$("#pnewpasswd").formValidator({onfocus:"���볤��Ϊ6~20���ַ�",oncorrect:"��"}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"�������߲����пշ���"},onerror:"����������"});
		$("#prepasswd").formValidator({onfocus:"�����������һ��",oncorrect:"��"}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"�ظ��������߲����пշ���"},onerror:"�ظ����벻��Ϊ��,��ȷ��"}).compareValidator({desid:"pnewpasswd",operateor:"=",onerror:"�������벻һ��,��ȷ��"});
	});
</script>
</body>
</html>