<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" " 
http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 

<%
	//����ȫ�ֱ���
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<title>��ͨ���ƶ�����ƽ̨</title>
	<script type="text/javascript" src="/js/defValidator.js"></script>
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
						</span>
						<div id="pcodeTip" style="display: inline "></div>
						</td>
					</tr>
					<tr align="left">
						<td width="58" height="35"><font style="font-size: 9pt">���룺</font></td>
						<td width="245" height="35">
						<span style="font-size: 9pt"><s:password name="search.ppasswd" id="ppasswd" size="15" required="true" maxlength="20" value="admini"></s:password>
						</span>
						<div id="ppasswdTip" style="display: inline "></div>
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
						</font>
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


	function getLength(val){
				   var len = 0;
					for (var i = 0; i < val.length; i++) 
					{
						if (val.charCodeAt(i) >= 0x4e00 && val.charCodeAt(i) <= 0x9fa5){ 
							len += 2;
						}else {
							len++;
						}
					}
					return len;
	}
	
	//��֤
    function checkmsg(){
    	result=false;
    	var pcode=document.getElementById("pcode").value;
    	var ppasswd=document.getElementById("ppasswd").value;
    	var pverifycode=document.getElementById("pverifycode").value;
    	if(!(getLength(pcode)>=3&&getLength(pcode)<=40))
    	{
    		alert('�û���������3��40���ַ�֮��');
    		return result;
    	}
    	if(!(ppasswd.length>=6&&ppasswd.length<=20))
    	{
    		alert('���������6��20���ַ�֮��');
    		return result;
    	}
    	if(!(pverifycode.length==4))
    	{
    		alert('��֤�����4���ַ�');
    		return result;
    	}
		return true;
    }	
	
 //��������
    /*
	function save(){
			 if(checkmsg()==true){
	    		    var url = '<%=path%>/frontlogin.do?search.pcode='+encodeURIComponent(encodeURIComponent($("#pcode").val()))+'&search.ppasswd='+$("#ppasswd").val()+'&search.pverifycode='+$("#pverifycode").val();
					try{
						var oXMLDom	= new ActiveXObject("Msxml.DOMDocument");
						oXMLDom.async = false ;
						oXMLDom.load(url);  
						var root;
						if (oXMLDom.parseError.errorCode != 0) {
							var myErr = oXMLDom.parseError;
							return;
						} else {
							root = oXMLDom.documentElement;
						}
						
						if (null != root){
							var rowSet = root.selectNodes("//result");
							var value=rowSet.item(0).selectSingleNode("value").text;
							if(0==value){//��֤�����
							   jAlert("��֤�벻��ȷ,����������!","��ʾ");  
							}else if(1==value){//�ɹ�
							   window.open("<%=path%>/adminFrame.jsp");
							}else if(3==value){//�û���,�����쳣
							   jAlert("�û��������벻��ȷ,��˶Ժ�����!","��ʾ"); 
							}
							else{//��¼�쳣
							   jAlert("���ݲ���ȷ,�������Ա��ϵ!","��ʾ");  
							}
						}	
					}catch(e){ 
						jAlert(e,"�������ݿⲻ��ȷ,�������Ա��ϵ!","��ʾ");
					}	
				}
	}	
 	*/
 	
 	
 		function save(){
			 if(checkmsg()==true){
															 $.ajax({
																    url:  '<%=path%>/frontlogin.do?search.pcode='+encodeURIComponent(encodeURIComponent($("#pcode").val()))+'&search.ppasswd='+$("#ppasswd").val()+'&search.pverifycode='+$("#pverifycode").val(),
																	type: "POST",
												 					success: function(data) {
													                    //ʹ��eval����
													                    //jAlert(eval(data));
																		var value = $(data).find("value").text();
																		if(0==value){//��֤�����
																		   jAlert("��֤�벻��ȷ,����������!","��ʾ");  
																		}else if(1==value){//�ɹ�
																		   window.open("<%=path%>/adminFrame.jsp");
																		}else if(3==value){//�û���,�����쳣
																		   jAlert("�û��������벻��ȷ,��˶Ժ�����!","��ʾ"); 
																		}else{//��¼�쳣
																		   jAlert("���ݲ���ȷ,�������Ա��ϵ!","��ʾ");  
																		}
												               		 },
												                	 error : function(){
																     	jAlert("�������ݿⲻ��ȷ,�������Ա��ϵ!","��ʾ");
																	 }					               
															});	
			}													
	    }	
	
 	//������֤
	$(document).ready(function(){
	//���ñ���
	//$("body").css("background-img","url('images/bg.jpg')");
			$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
			$("#pcode").formValidator({onshow:" ",onfocus:def_Showthecode,oncorrect:" "}).inputValidator({min:3,max:40,onerror:def_Errorthecode});
			$("#ppasswd").formValidator({onshow:" ",onfocus:"����������",oncorrect:" "}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"����������"},onerror:def_Errorpasswdex});
			$("#pverifycode").formValidator({onshow:" ",onfocus:def_Showverifycode,oncorrect:" "}).inputValidator({min:1,max:4,onerror:def_Errorverifycode});
		});
	</script>		
	</body>
</html>
