<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>����ʡ183�ٵݹٷ���վ</title>
	</head>
	<body>

<div align="center">
	��</div>
<div align="center">
	��</div>
<div align="center">
	��</div>
<div align="center">
	��</div>
<div align="center">
	��</div>
<div align="center">
	��</div>
<div align="center">
	��</div>
<div align="center">
	��</div>
<div align="center">
<form id="frontlogin" name="frontlogin" onsubmit="return true;" action="/frontlogin.do"  method="post">
	<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" height="351" id="table1" background="images/denglu01.jpg">
		<tr>
			<td>
			<div align="center">
				<table border="0" cellpadding="0" style="border-collapse: collapse" width="541" height="241" id="table2" background="images/denglu02.jpg">
					<tr>
						<td height="73" width="541" colspan="3">��</td>
					</tr>
					<tr align="left">
						<td width="238" rowspan="4">��</td>
						<td width="58" height="35"><font style="font-size: 9pt">�û�����</font></td>
						<td width="245" height="35">
						<span style="font-size: 9pt">
						<s:textfield name="search.pcode" id="pcode" required="true" size="15"  maxlength="40" value="admini"></s:textfield>
						<div id="pcodeTip" style="display: inline "></div>
						</span>
						</td>
					</tr>
					<tr align="left">
						<td width="58" height="35"><font style="font-size: 9pt">���룺</font></td>
						<td width="245" height="35">
						<span style="font-size: 9pt"><s:password name="search.ppasswd" id="ppasswd" size="15" required="true" maxlength="20" value="admini"></s:password>
						<div id="ppasswdTip" style="display: inline "></div>
						</span>
						</td>
					</tr>
					<tr align="left">
						<td width="58" height="36"><font style="font-size: 9pt">
						��֤�룺</font></td>
						<td width="245" height="36">
						<span style="font-size: 9pt">
						<s:textfield id="pverifycode" name="search.pverifycode"  size="6" maxlength="4"></s:textfield>
						</span><font style="font-size: 9pt"> 
						<IMG id="imgcode" title="�����壿����һ��" style="CURSOR: pointer"  onclick="document.getElementById('imgcode').src='/authimg?action='+Math.random();"  alt="�����壿����һ��" src="/authimg" border="0"/> 
						<FONT  color=red>*</FONT> </font>
						<div id="pverifycodeTip" style="display: inline "></div> 
						</td>
					</tr>
					<tr>
						<td width="303" colspan="2" height="62">
						<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" height="100%" id="table3">
							<tr>
							<td width="100%">
							<input type="button" onclick="javascript:save()" value="��¼" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
							<input type="button" onclick="javascript:reset()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
								<font style="font-size: 9pt">&nbsp;
								<A href='javascript:fun_forget("clientcancel","")'><span style="text-decoration: none">��������</span></A>
								<A href="/regedit.jsp"> <span style="text-decoration: none; font-weight: 700">ע��</span></A></font>
							</td>
								<td>
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
			</div>
			</td>
		</tr>
	</table>
</form>	
</div>
 	<script type="text/javascript">
 	document.body.style.backgroundImage="url(images/bg.jpg)";
 		//�������뵽�ֻ�,����==�ֻ�.��������
		function fun_forget(action,pid){
			//jConfirm('��ȷ��ִ�иò���!', 'ȷ�Ͽ�', function(r) {	
			jPrompt('��������:', ' ', '��ʾ��', function(r) {
	    		if (r){
	    		  jAlert('��������:'+r+'�Ѿ��ύ��������,�����ֻ�����õ����ú������!','��ʾ');
	    		}
			});
		}
 
 //��������
	function reset(){
			document.forms[0].reset();
			return true;
	}
	
 //��������
	function save(){
	    if($.formValidator.pageIsValid()){
	    	var url ='/frontlogin.do';
			document.forms[0].action=url;
			document.forms[0].submit();
		}else
		{
		  return false;
		}
	}	
 	
 	    //������֤
	    $(document).ready(function(){
	    	//���ñ���
	//$("body").css("background-img","url('images/bg.jpg')");

			$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
			$("#pcode").formValidator({onfocus:"�������û���",oncorrect:"��"}).inputValidator({min:6,max:40,onerror:"�û�������!"});
			$("#ppasswd").formValidator({onfocus:"����������",oncorrect:"��"}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"���벻���пո�"},onerror:"��������!"});
			$("#pverifycode").formValidator({onfocus:"��֤��",oncorrect:"��"}).inputValidator({min:1,max:4,onerror:"��֤������!"});
		});
		<s:if test="${param.error != null}">
				 alert('��ʾ', '���Ż����벻��ȷ������������!', clear_input);
				 function clear_input(){
				 	$('#search.pcode').value = '';
				 	$('#search.ppasswd').value= '';
				 }
		</s:if>
	</script>		
	</body>
</html>
