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
<form  method='POST' name='form1' action='/archives/recMsg.do'  id="form1">
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
													�ռ�����Ϣ</span></strong></td>
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
														<s:textfield id="prec_name"  name="search.prec_name" value="%{recMsg.REC_NAME}"></s:textfield>
												</span> <div id="prec_nameTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													�绰</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														<s:textfield id="prec_tel"  name="search.prec_tel" value="%{recMsg.REC_TEL}" title="(��:059512345678)" ></s:textfield>
												</span> <div id="prec_telTip" style="display: inline "></div></td>
												</tr>
												<!--  
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													�ֻ�</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														 <s:textfield id="prec_mobile"  name="search.prec_mobile" value="%{recMsg.REC_MOBILE}"></s:textfield>
												</span><div id="prec_mobileTip" style="display: inline "></div></td>
												</tr>
												-->
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													��λ����</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														 <s:textfield id="prec_unit"  name="search.prec_unit" value="%{recMsg.REC_UNIT}"></s:textfield>
												</span><div id="prec_unitTip" style="display: inline "></div></td>
												</tr>
												<tr align="left">
													<td width="98" align="left">
													<span style="FONT-SIZE: 9pt">
													�ʱ�</span><span style="font-size: 9pt">��</span></td>
													<td align="left">
													<span style="font-size: 9pt">
														 <s:textfield id="prec_post"  name="search.prec_post" value="%{recMsg.REC_POST}"></s:textfield>
												</span><div id="prec_postTip" style="display: inline "></div></td>
												</tr>
												<TR align="left">
														<td width="98" align="left">
															<span style="FONT-SIZE: 9pt">
															��ϸ��ַ:</span></td>
													    <td align="left"><span style="font-size: 9pt">
													    <s:textfield id="prec_address"  name="search.prec_address"  size="40" value="%{recMsg.REC_ADDRESS}" > </s:textfield>
														<font size="2"><FONT color=red>*</FONT> </font></span>
													    <div id="paddressTip" style="display: inline "></div>	
													</TD>
												</TR>
												<!--
												<TR align="left">
													    <TD rowSpan=2 width="95"><font size="2">��ַ:</font></TD>
													    <TD width="524"><font size="2">ʡ��: </font>
														<select id="prec_province" name="search.prec_province" onchange="changeCombo('prec_city','prec_province','cityvalue')"></select>
														<font size="2"> ���У�</font>
														<select id="prec_city" name="search.prec_city" onchange="changeCombo('prec_county','prec_city','countyvalue')"></select>
														<font size="2"> �ء�����</font>
														<select id="prec_county" name="search.prec_county"></select>
														<font size="2"> </font> </TD>
												</TR>
												<TR align="left">
													    <TD width="524"><font size="2">��ϸ��ַ: </font> 
													    <s:textfield id="prec_address"  name="search.prec_address"  size="40" value="%{recMsg.REC_ADDRESS}" > </s:textfield>
														<font size="2"><FONT color=red>*</FONT> </font>
													<div id="paddressTip" style="display: inline "></div>	
													</TD>
												</TR>
												  -->
												<tr>
													<td width="98">��</td>
													<td>��</td>
												</tr>
												<tr>
													<td width="98">
													      <s:hidden value="%{recMsg.ID}" name="search.pid" id="pid"></s:hidden>
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
		$("#prec_name").formValidator({onfocus:"���20���ַ�",oncorrect:"��"}).inputValidator({min:1,max:20,onerror:"�����Ƿ�,��ȷ��"});
		$("#prec_tel").formValidator({onfocus:"�绰�����С��ͨ,��059512345678",oncorrect:"��"}).regexValidator({regexp:"^$|^\\d{10,12}$|^(13|15|18)[0-9]{9}$",onerror:"�绰�����ʽ����ȷ"});
		//$("#prec_mobile").formValidator({onfocus:"�ֻ���",oncorrect:"��"}).regexValidator({regexp:"^$|^(13|15|18)[0-9]{9}$",onerror:"�ֻ������ʽ����ȷ"});
		$("#prec_address").formValidator({tipid:"paddressTip",onfocus:"ȡ����ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ȡ����ַ����Ϊ��"});
		$("#prec_post").formValidator({onfocus:"�ʱ�",oncorrect:"��"}).regexValidator({regexp:"zipcode",datatype:"enum",onerror:"�ʱ��ʽ����ȷ"});
		//$("#prec_province").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
		//$("#prec_city").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��"});
		//$("#prec_county").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��"});
		
		
	});
	
	//2009-12-01
//ʡ,��,������
//����˵��:chCombo�仯�ؼ���id
//		  srcCombo����仯�Ŀؼ�id
//		  action�¼�����
function changeCombo(chCombo,srcCombo,action)
{
	var cdsales=new ActiveXObject("Microsoft.XMLDOM"); //����XmlDom����
    cdsales.async=false; //ʹ���첽����
    var parmid='';
    if(srcCombo!='')
    {
      parmid=document.getElementById(srcCombo).value
    }
    cdsales.load("<%=path%>/archives/area.do?action="+action+"&search.pid="+parmid);
     var bi;
     if(cdsales.documentElement!=null)
         bi=cdsales.documentElement.selectNodes("NODE");
    if(bi!=null&&bi.length>0)
    {
       //Ĭ����
       document.getElementById(chCombo).options.length = bi.length+1;   
       document.getElementById(chCombo).options[0].value ="0";//����ֵ
	   document.getElementById(chCombo).options[0].text = "��ѡ��";//��ʾֵ
       for(var i=1;i<bi.length+1;i++){     
	   			document.getElementById(chCombo).options[i].value = bi[i-1].selectSingleNode("THE_CODE").text;//����ֵ
	   			document.getElementById(chCombo).options[i].text =  bi[i-1].selectSingleNode("THE_NAME").text;//��ʾֵ
       }
    }else{
       document.getElementById(chCombo).options.length = 1;   
       document.getElementById(chCombo).options[0].value ="0";//����ֵ
	   document.getElementById(chCombo).options[0].text = "��ѡ��";//��ʾֵ
    }
}
/*
//��ʼ����Ϣ
changeCombo('prec_province','','provincevalue');
//document.getElementById('pprovince').options[12].selected;
//Ĭ�ϸ���ʡ
document.getElementById('prec_province').value="350000";
<s:if test="%{action=='update'}">
document.getElementById('prec_province').value=<s:property value="%{recMsg.REC_PROVINCE}"/>;
</s:if>
changeCombo('prec_city','prec_province','cityvalue');
<s:if test="%{action=='update'}">
document.getElementById('prec_city').value=<s:property value="%{recMsg.REC_CITY}"/>;
</s:if>
changeCombo('prec_county','prec_city','countyvalue');
<s:if test="%{action=='update'}">
document.getElementById('prec_county').value=<s:property value="%{recMsg.REC_COUNTY}"/>;
</s:if>
*/
	</script>
</body>
</html>