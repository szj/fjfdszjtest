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
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
.STYLE3 {color: #528311; font-size: 12px; }
.STYLE4 {
	color: #42870a;
	font-size: 12px;
}

-->
</style>	
</head>
	<body>

<form id="backlogin" name="backlogin" onsubmit="return true;" action="/backlogin.do"  method="post">	
<table  width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#E9F8D6">&nbsp;</td>
  </tr>	
  <tr>
    <td width="100%" height="706" background="images/login_01.gif">
    	<table width="634" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td colspan=2 height="67" background="images/login_03.gif">&nbsp;</td>
        </tr>
        <tr>
          <td width="221" height="155" background="images/login_05.gif">&nbsp;</td>
          <td width="413" height="155" background="images/login_06.gif">
             <table width="100%" border="0" height="155" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40px" align="left" height="18px"><div align="center"><span class="STYLE3">��&nbsp;&nbsp;��</span></div></td>
                <td align="left" height="18px"><s:textfield name="search.pcode" id="pcode" required="true" size="15"  maxlength="40" value="" cssStyle="height:18px; width:110px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></s:textfield><div id="pcodeTip" style="display: inline "></div></td>
              </tr>
              <tr>
                <td align="left" height="18px"><div align="center"><span class="STYLE3">��&nbsp;&nbsp;��</span></div></td>
                <td align="left" height="18px"><s:password name="search.ppasswd" id="ppasswd" required="true" maxlength="20" value="" cssStyle="height:18px; width:110px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></s:password><div id="ppasswdTip" style="display: inline "></div></td>
                             
              </tr>
              <tr>
                  <td align="left" height="18px" style="vertical-align:middle"><div style="vertical-align:middle"><span class="STYLE3">��֤��</span></div></td>
				  <td align="left" height="18px" style="vertical-align:middle">				
						<s:textfield id="pverifycode" name="search.pverifycode"  maxlength="4" cssStyle="height:18px; width:40px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></s:textfield>						
<IMG id="imgcode" title="�����壿����һ��" style="CURSOR: pointer;vertical-align:middle"  onclick="document.getElementById('imgcode').src='/authimg?action='+Math.random();"  alt="�����壿����һ��" src="/authimg"/>
						<div id="pverifycodeTip" style="display: inline "></div>						
					</td>	
              </tr>
              <tr>
                <td align="left" height="18">&nbsp;</td>
                <td align="left" height="18"><img src="images/dl.gif" width="81" height="22" border="0" style="cursor:hand" usemap="#Map"></td>               
              </tr>
            </table>         
          </td>
        </tr>
        <tr>
          <td width="221" height="144" background="images/login_07.gif">&nbsp;</td>
          <td width="413" height="144" background="images/login_08.gif" class="STYLE4" style="vertical-align:top"><div style="border:0px;vertical-align:middle;width:100px;height:30px;line-height:30px">�汾 2010V1.0</div></td>
        </tr>              
    </table> 	
    </td>
  </tr>
         <tr>
           <td bgcolor="#a2d962">&nbsp;</td>
        </tr>  
</table>	
</form>	
<map name="Map"><area shape="rect" coords="3,3,36,19" onclick="javascript:save()"><area shape="rect" coords="40,3,78,18" onclick="javascript:reset()"></map>
<script type="text/javascript"> 
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
 		function save(){
			 if(checkmsg()==true){
															 $.ajax({
																    url:  '<%=path%>/backlogin!login.do?username='+encodeURIComponent(encodeURIComponent($("#pcode").val()))+'&passwd='+$("#ppasswd").val()+'&authCode='+$("#pverifycode").val(),
																	type: "POST",
												 					success: function(data) {
													                    //ʹ��eval����
													                    //jAlert(eval(data));
																		var value = $(data).find("value").text();
																		if(0==value){//��֤�����
																		   jAlert("��֤�벻��ȷ,����������!","��ʾ");  
																		}else if(1==value){//�ɹ�
																		   window.location.replace("/main.do");
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
			$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
			$("#pcode").formValidator({onshow:" ",onfocus:def_Showthecode,oncorrect:" "}).inputValidator({min:3,max:40,onerror:def_Errorthecode});
			$("#ppasswd").formValidator({onshow:" ",onfocus:"����������",oncorrect:" "}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"����������"},onerror:def_Errorpasswdex});
			$("#pverifycode").formValidator({onshow:" ",onfocus:def_Showverifycode,oncorrect:" "}).inputValidator({min:1,max:4,onerror:def_Errorverifycode});
		});
	</script>		
	</body>
</html>
